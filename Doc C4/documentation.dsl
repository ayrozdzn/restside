workspace "RestSide" "Systeme de simulation de restaurant"

    !identifiers hierarchical

    model {
        // Personnes
        client = person "Client" "Personne qui utilise l'interface de simulation"

        // Systèmes externes
        osrmService = softwareSystem "Service OSRM" "Service externe de routage Open Source Routing Machine" "External"
        webhookService = softwareSystem "Restaurant Order Webhook" "Webhook de génération de commande"
        database = softwareSystem "Base de données" "Stocke les informations sur les commandes, les simulations et les utilisateurs" {
            tags = "Database"
        }
        // Système principal
        restside = softwareSystem "RestSide" "Système de gestion de commandes et livraisons de restaurant" {
            clientApp = container "Application Client - Next.js" "Interface utilisateur pour visualiser les commandes, les livraisons et configurer la simulation" {
                simulation = component "Affiche l'avancée des commandes"
                parametres = component "Modifie les paramètres et le personnel"
                storeDeliverymen = component "Stocke les livreurs"
                storeCooks = component "Stocke les cuisiniers"
                storeSettings = component "Stocke les paramètres de simulation"
                historique = component "Affiche les statistiques des simulations"
                carte = component "Montre les emplacements des commandes"
                storeOrders = component "Stocke les commandes en cours"
                barreDeLecture = component "Gère la lecture/pause de la simulation"
                navBar = component "Navigation entre les pages"
                
            }

            crudService = container "Service CRUD" "Gère les opérations CRUD pour les commandes et simulations" {
                orderModel = component "Modèle de commande"
                simulationModel = component "Modèle de simulation"
                orderRoutes = component "Routes de commande"
                simulationRoutes = component "Routes de simulation"
                appConfig = component "Configuration de l'application"
            }

            notificationService = container "Service de Notification" "Gère les notifications en temps réel" {
                notificationController = component "Controlleur pour l'api"
                validationMiddleware = component "Middleware d'authentification des commandes"
                apiRoutes = component "Route pour l'API de callback"
                connexionService = component "Service de gestion des connexions au service"
                notificationService = component "Service de notification"
                simulationService = component "Service de gestions des simulations"
                socket = component "Socket d'envoie vers le client"
            }

            osrmProxy = container "Proxy OSRM" "Proxy pour interagir avec le service OSRM externe" {
                routeHandler = component "Gestionnaire d'itinéraires"
                nearestPointHandler = component "Gestionnaire de points proches"
            }
        }

        // Relations
        client -> restside.clientApp "Visualise la simulation"
        
        restside.clientApp.simulation -> restside.clientApp.storeOrders "Récupère les commandes"
        restside.clientApp.parametres -> restside.clientApp.storeDeliverymen "Modifie les livreurs"
        restside.clientApp.parametres -> restside.clientApp.storeCooks "Modifie les cuisiniers"
        restside.clientApp.parametres -> restside.clientApp.storeSettings "Modifie les paramètres"
        restside.clientApp.historique -> restside.crudService "Récupère les statistiques"
        restside.clientApp.carte -> restside.clientApp.storeOrders "Récupère les adresses"
        restside.clientApp.barreDeLecture -> restside.osrmProxy "Récupère le temps de livraison"
        restside.clientApp.barreDeLecture -> restside.notificationService.socket "Reçoit les notifications"
    
        restside.crudService.appConfig -> database "Se Connecte"
        restside.crudService.orderRoutes -> restside.crudService.orderModel "demande la création, modification, suppression ou la liste des commandes"
        restside.crudService.orderModel -> database "Crée, Modifie, Supprime et lire les commandes dans la base de donnée"
        restside.crudService.simulationRoutes -> restside.crudService.simulationModel "demande la création, modification, suppression ou la liste des simulations"
        restside.crudService.simulationModel -> database "Crée, Modifie, Supprime et lire les simulations dans la base de donnée"
    
        restside.notificationService -> webhookService "Souscrit et reçoit des notifications de commande"
        restside.notificationService.apiRoutes -> restside.notificationService.validationMiddleware "Authentifie la commande avant de l'envoyer au controlleur"
        restside.notificationService.validationMiddleware -> restside.notificationService.notificationController "Envoie la commande au controlleur"
        restside.notificationService.apiRoutes -> restside.notificationService.notificationController "Utilise le controlleur pour afficher le status"
        restside.notificationService.notificationController -> restside.notificationService.notificationService "Demande l'envoie d'une commande"
        restside.notificationService.notificationService -> restside.notificationService.connexionService "Récupère la connexion associé a la commande"
        restside.notificationService.notificationService -> restside.notificationService.simulationService "Récupère la simulation associé a la commande"
        restside.notificationService.simulationService -> restside.notificationService.socket "Envoie la commande au client"
        
        restside.osrmProxy.routeHandler -> osrmService "Demande le trajet entre 2 points"
        restside.osrmProxy.nearestPointHandler -> osrmService "Demande le point le plus proche sur la route"
    }

    views {
        systemContext restside "Diagramme_Contexte" {
            include *
            autolayout lr
        }

        container restside "Diagramme_Conteneur" {
            include *
            autolayout lr
        }
        
        component restside.clientApp "Diagramme_Client" {
            include *
            autolayout lr
        }
        
        component restside.crudService "Diagramme_CRUD" {
            include *
            autolayout lr
        }
        
        component restside.notificationService "Diagramme_Notification" {
            include *
            autolayout lr
        }
        
        component restside.osrmProxy "Diagramme_OSRM" {
            include *
            autolayout lr
        }

        styles {
            element "Element" {
                color white
            }
            element "Person" {
                background #116611
                shape person
            }
            element "Software System" {
                background #2D882D
            }
            element "Container" {
                background #55aa55
            }
            element "Database" {
                shape cylinder
            }
        }
    }

}