# Tagger
# Réseau social simpliste inspiré de Twitter

Le principe du site est le suivant:

* Un "Tag" Par Post, un Message < 140 caractères par Post et une image (optionnelle) par Post

Spécificités techniques:

* Réalisé sous Rails 5

* Système Utilisateur / Admin via Devise

* Upload d'image via CarrierWave vers un serveur Amazon S3

* Base de donnée en PostGreSQL

* Front en Slim, SASS et CoffeeScript

* Front: BootStrap 4-alpha, Font-Awesome (via sa gem).

* Deploiement sur Heroku: [simplon-tagger.herokuapp.com)](https://simplon-tagger.herokuapp.com/)
