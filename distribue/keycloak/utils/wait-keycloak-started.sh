#!/bin/bash
#processus d'attente du démarrage de keycloak et ajout des usagers


TIMEOUT_SECONDS=120
LOGFILE=/opt/jboss/keycloak/standalone/log/server.log

timeout ${TIMEOUT_SECONDS}s  grep -m 1  "listening on 0.0.0.0:8080" <(tail -f ${LOGFILE})
echo "beginning of finalisation ...." >> ${LOGFILE}
/opt/jboss/keycloak/bin/kcadm.sh config credentials --server http://localhost:8080/auth --realm master --user  admin --password  admin
/opt/jboss/keycloak/bin/kcadm.sh create realms -s realm=usager -s enabled=true -o
/opt/jboss/keycloak/bin/kcadm.sh create clients -r usager -f /var/tmp/frontend.json
/opt/jboss/keycloak/bin/kcadm.sh create clients -r usager -f /var/tmp/backend.json
/opt/jboss/keycloak/bin/kcadm.sh create partialImport -r usager -s ifResourceExists=OVERWRITE -f /var/tmp/users.json
echo "server running ...." >> ${LOGFILE}


