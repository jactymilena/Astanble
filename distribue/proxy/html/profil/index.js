async function loadIndex() {
    await initKeycloak();
    userProfil();
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
    }).catch(function () {
        alert('failed to initialize');
    });
}

async function userProfil() {
    await axios.get("http://localhost:8888/api/any", {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            console.log("Response: ", response.status);
            user_profil = window.user_profil = response.data;

            // prep user on ui
            var user_profil_html = document.getElementById("user_profil_nav");
            if(user_profil_html && user_profil)

                user_profil_html.innerText = user_profil.first_name + " " + user_profil.last_name;
                document.getElementById("nameTitle").innerHTML = user_profil.first_name + " " + user_profil.last_name;
                if(user_profil.roles=="default-roles-master,student"){
                    document.getElementById("champRole").innerHTML = "Étudiant(e)";
                }else document.getElementById("champRole").innerHTML = "Administrateur";

                //document.getElementById("staticCipSPan").innerHTML = user_profil.cip;

                document.getElementById("staticCourrielSpan").innerHTML= user_profil.email;

                document.getElementById("staticCip").value = user_profil.cip;
                document.getElementById("inputCIP").value = user_profil.cip;
                document.getElementById("firstname").value= user_profil.first_name;
                document.getElementById("lastname").value= user_profil.last_name;
                document.getElementById("inputEmail4").value= user_profil.email;

                userProfilOthers(response.data.email);

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

async function userProfilOthers(inputEmail) {
    axios.get("http://localhost:8888/api/usagerByCourriel/" + inputEmail, {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
        console.log("Response: ", response.status);
        user_profil = window.user_profil = response.data;


            if (response.data.courriel2 != null) {
                document.getElementById("staticCourriel1Span").innerHTML = response.data.courriel2;
                document.getElementById("inputEmail5").value = response.data.courriel2;
            } else {
                document.getElementById("staticCourriel1Span").innerHTML = "";
                document.getElementById("inputEmail5").value = "";
            }
        
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

function setInfo() {
    const usager = {
        "cip" : document.getElementById("staticCip").value,
        "nom_usager" : document.getElementById("lastname").value,
        "prenom_usager" : document.getElementById("firstname").value,
        "courriel1" : document.getElementById("inputEmail4").value,
        "courriel2" : document.getElementById("inputEmail5").value,
        "nom_complet_usager" : document.getElementById("firstname").value + " " + document.getElementById("lastname").value
    }
    axios.put("http://localhost:8888/api/usager/update", JSON.stringify(usager), {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token,
            'Content-Type' : 'application/json'
        }
    })
        .then(function (response) {
            console.log("Response: ", response.status);

        })
        .catch(function (error) {
            console.log('refreshing');
            keycloak.updateToken(5).then(function () {
                console.log('Token refreshed');
            }).catch(function () {
                console.log('Failed to refresh token');
            })
            console.log('Sad ça fonctionne pas :(');
            alert(error);

        });
};

function goBack(){
    window.location.href="//localhost/profil";
};

function modifInfoUser(){
    const userDiv = document.getElementById("initial_info");
    userDiv.hidden=true;
    const userDiv1= document.getElementById("initial_info1");
    userDiv1.hidden=true;

    const newUserDiv = document.getElementById("modif_info");
    newUserDiv.hidden=false;

    console.log("modification profil");
};

(function() {
    'use strict';
    window.addEventListener('load', function() {
        var forms = document.getElementsByClassName('needs-validation');

        var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
                setInfo();
            }, false);
        });
    }, false);
})();