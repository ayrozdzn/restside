# restside

## Live Preview
https://restside.tbreton.fr

## Les repos du projets
- Client: https://github.com/AntoineCoignac/Restside-client
- Serveur de notification: https://github.com/AyrozDZN/restside_notification
- Serveur CRUD: https://github.com/Tsito2/Arch-Log-CRUD-REST
- Proxy OSRM: https://github.com/achabdan/serveur-livraison

## Marche à suivre :

- Cloner le projet webhook : git clone git@gitlab.esiea.fr:brice.joly/restaurant-orders-webhooks.git
- Depuis le répertoire du projet :
  - Build le projet webhook : docker build -t restaurant-orders-webhook .

- Cloner le projet dans un répertoire vierge : git clone https://github.com/ayrozdzn/restside.git
- Depuis le répertoire où se situe compose.yaml :
  - Monter le projet : docker-compose up -d
  - Ouvrir le client : http://localhost:80
