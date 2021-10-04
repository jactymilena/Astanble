  import {layout} from "./layout.js";

    webix.attachEvent(
        'onAjaxError',
        async (status) => {
            switch (status) {
                case 0:
                    webix.modalbox({
                        title: 'Session expiré',
                        text: 'Redirection en cours...',
                        type: 'alert-error',
                    });
                    await sleep(2000);
                    window.location.reload();
                    break;
                case 500:
                    webix.message({
                        type: 'error',
                        text: 'Un problème serveur est survenu',
                    });
                    break;
            }
        },
    );
    webix.i18n.setLocale('fr-FR');   // set notation
    webix.extend($$("main"), webix.ProgressBar);  //Met en place une barre d'information pour la sauvegarde
    initKeycloak();

 function initKeycloak() {
       let keycloak = new Keycloak({
            "realm": "usager",
            "auth-server-url": "https://localhost/auth/",
            "ssl-required": "external",
            "clientId": "frontend",
            "public-client": true,
            "confidential-port": 0
        });
        keycloak.init({onLoad: 'login-required'}).then(function (authenticated) {
             alert(authenticated ? 'authenticated' : 'not authenticated');
          //   webix.ui(layout.configuration);  // établi les grandes lignes de l'interface usager
         //    datatable.loadTrimestre(token); //initialize les données à partir de service rest

        }).catch(function () {
            alert('failed to initialize');
        });
    }

function init(token) {
     datatable.loadTrimestre(token); //initialize les données à partir de service rest
}