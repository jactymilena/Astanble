# Tests avec la base de données
Pour faire des tests avec la base de données, il faut partir un conteneur postgres se trouvant dans le fichier docker-compose,yml.
Pour se faire, il faut exécuter la commande suivante dans le répertoire **db/docker** :
```
docker-compose up -d
```
Par la suite, il faut ajouter les identifiants se trouvant dans le fichier **docker/.env** dans la configuration de bases de données d'IntelliJ.

Commande permettant d'arrêter et supprimer les conteneurs Docker créés auparavant :
```
docker-compose down
```