import {datatable} from "./datatable.js";

export const initKeycloak = new class initKeycloak {


init() {
 this.keycloak = new Keycloak({
                 "realm": "usager",
                 "auth-server-url": "https://localhost/auth/",
                 "ssl-required": "external",
                 "clientId": "frontend",
                 "public-client": true,
                 "confidential-port": 0
             });
             this.keycloak.init({onLoad: 'login-required'}).then(function (authenticated) {
             // alert(authenticated ? 'authenticated' : 'not authenticated');
                 datatable.loadTrimestre(keycloak.token); //initialize les données à partir de service rest

         }).catch(function () {
             alert('failed to initialize');
         });
}

 get keycloak() {
        return this.keycloak;
    }
 }

