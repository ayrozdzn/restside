# restside

## Vidéo démonstration
![demo-restside.mp4](<https://media-hosting.imagekit.io//f42f4c83e8b14bb4/demo-restside.mp4?Expires=1836665757&Key-Pair-Id=K2ZIVPTIP2VGHC&Signature=hS6lrEVdUer172aEiBIWc8isSk4L~t~odaz~XD~rjH4m7FtV~I1D5cL9iojLU5eTFrPAPiHeTNJqbeLG52iQd0t9bv6DCXVHpK01KaXuyLp2-s25a7LnzAw-Ehl-ObfiYQlDJT8Gk-msPwXLutew8Z7PZRT4XBTm9FV~aT8-jV050XRA-nR35OwvVXfetRiSX0CBvu1BdIhz2-O8Byecb13Vf0CrI0nW16I1b7iZ0HNq8lXhCl6UcqSxAAV5Q9q9zQjDWb185LQE~LuPF7b7Hz0YOuAP~hKoXN2SRIyopXl1FKiWD2Gt3IiUfuReDBm~l8KyIR7nn4qNVzLN6JZngw__>)

## Les repos du projets
- Client: https://github.com/AntoineCoignac/Restside-client
- Serveur de notification: https://github.com/AyrozDZN/restside_notification
- Serveur CRUD: https://github.com/Tsito2/Arch-Log-CRUD-REST
- Proxy OSRM: https://github.com/achabdan/serveur-livraison

## Marche à suivre :

- Cloner le projet webhook : git clone git@gitlab.esiea.fr:brice.joly/restaurant-orders-webhooks.git .
- Depuis le répertoire du projet :
- Build le projet webhook : docker build -t restaurant-orders-webhook .

- Cloner le projet dans un répertoire vierge : git clone https://github.com/ayrozdzn/restside.git
- Depuis le répertoire où se situe compose.yaml :
- Monter le projet : docker-compose up -d
- Ouvrir le client : http://localhost:80