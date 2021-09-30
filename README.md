# Astanble

# Instruction pour la mise en opération des applications usager et exemple

Pour metter en opération l'une oul'autre des applications
usager ou trimester, les services docker et jq doivent être installés et fonctionnels dans votre environnement de travail. 
jq sera utilisé lors de tests sans navigateur.

* jq (1.6) :        https://stedolan.github.io/jq/
* docker (3.5.2) :  https://www.docker.com/get-started

* Service docker (## Service)
* Keycloak (##keycloak)
* Modification après l'installation locale de Keycloak (##keycloak local)
* Modification après l'installation de Keycloak dans docker (##keycloak docker)


## Service

* Dans un terminal en ligne de commande exécuter les commandes suivantes à partir du répertoire du projet :

```shell 
cd distribue/docker
docker-compose  up -d
```


