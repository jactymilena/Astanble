var user_profil;
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);

async function init() {
    await initKeycloak();
}

async function initKeycloak() {
    console.log("Initializing Keycloack");
    keycloak = new Keycloak({
        "realm": "usager",
        "auth-server-url": "https://localhost/auth/",
        "ssl-required": "external",
        "clientId": "frontend",
        "public-client": true,
        "confidential-port": 0
    });
    await keycloak.init({onLoad: 'login-required'}).then(function (authenticated) {
        console.log(authenticated ? 'authenticated' : 'not authenticated');
        // prep la variable user_profil
        userProfil();
    }).catch(function () {
        alert('failed to initialize');
    });
}

function userProfil() {
    axios.get("http://localhost:8888/api/student", {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            console.log("Response: ", response.status);
            user_profil = response.data;

            // prep user on ui
            var user_profil_html = document.getElementById("user_profil_nav");
            user_profil_html.innerText = user_profil.first_name + " " + user_profil.last_name;
        })
        .catch(function (error) {
            console.log('refreshing');
            keycloak.updateToken(5).then(function () {
                console.log('Token refreshed');
            }).catch(function () {
                console.log('Failed to refresh token');
            })
        });
}

