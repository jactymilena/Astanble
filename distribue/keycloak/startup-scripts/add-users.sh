# Script d'ajout des usagers d'administration du serveur

/opt/jboss/keycloak/bin/add-user-keycloak.sh -u admin  -p admin
/opt/jboss/keycloak/bin/add-user.sh -u admin  -p admin

# Appel du processus d'attente du démarrage de keycloak et ajout des usagers

/var/tmp/wait-keycloak-started.sh &
