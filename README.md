# restside

## Vidéo démonstration
https://imagekit.io/tools/asset-public-link?detail=%7B%22name%22%3A%22demo-restside.mp4%22%2C%22type%22%3A%22video%2Fmp4%22%2C%22signedurl_expire%22%3A%222028-03-14T16%3A55%3A57.337Z%22%2C%22signedUrl%22%3A%22https%3A%2F%2Fmedia-hosting.imagekit.io%2F%2Ff42f4c83e8b14bb4%2Fdemo-restside.mp4%3FExpires%3D1836665757%26Key-Pair-Id%3DK2ZIVPTIP2VGHC%26Signature%3DhS6lrEVdUer172aEiBIWc8isSk4L~t~odaz~XD~rjH4m7FtV~I1D5cL9iojLU5eTFrPAPiHeTNJqbeLG52iQd0t9bv6DCXVHpK01KaXuyLp2-s25a7LnzAw-Ehl-ObfiYQlDJT8Gk-msPwXLutew8Z7PZRT4XBTm9FV~aT8-jV050XRA-nR35OwvVXfetRiSX0CBvu1BdIhz2-O8Byecb13Vf0CrI0nW16I1b7iZ0HNq8lXhCl6UcqSxAAV5Q9q9zQjDWb185LQE~LuPF7b7Hz0YOuAP~hKoXN2SRIyopXl1FKiWD2Gt3IiUfuReDBm~l8KyIR7nn4qNVzLN6JZngw__%22%7D

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