// variables
var keycloak;
var quill;


// roule après que le body est loadé
function loadPage() {
    initKeycloak();

    // Initialize Quill editor
    quill = new Quill('#editor', {
        toolbar: [
            [{header: [1, 2, false]}],
            ['bold', 'italic', 'underline'],
            ['image', 'code-block']
        ],
        theme: 'bubble'
    });
}

// conversion d'un objet Delta en HTML
function quillGetHTML(inputDelta) {
    let tempQuill=new Quill(document.createElement("div"));
    tempQuill.setContents(inputDelta);
    return tempQuill.root.innerHTML;
}


// sauvegarde du contenu de l'éditeur
function saveEditorContent() {
    let delta = quill.getContents();
    let content = quillGetHTML(delta);

    console.log(content);

    let article = {
        "id_article" : 2,
        "nom_article" : "Test",
        "content" : content,
        "description_article" : "Description"
    }

    axios.put("http://localhost:8888/api/wiki/update", JSON.stringify(article), {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token,
            'Content-Type' : 'application/json'
        }
    })
        .then(function (response) {
            console.log("Response: ", response.status);

            quill.enable(false);
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
}

function initKeycloak() {
    console.log("Initializing Keycloack");
    keycloak = new Keycloak({
        "realm": "usager",
        "auth-server-url": "https://localhost/auth/",
        "ssl-required": "external",
        "clientId": "frontend",
        "public-client": true,
        "confidential-port": 0
    });
    keycloak.init({onLoad: 'login-required'}).then(function (authenticated) {
        // alert(authenticated ? 'authenticated' : 'not authenticated');
    }).catch(function () {
        alert('failed to initialize');
    });
}

function requestWikis() {
    // let article = {
    //     "id_article" : 2,
    //     "nom_article" : "Test5",
    //     "content" : "Allo",
    //     "description_article" : "alloooooo"
    // }

    axios.delete("http://localhost:8888/api/wiki/delete" + "/1", {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token,
            'Content-Type' : 'application/json'
        }
    })
        .then(function (response) {
            // var article;
            // var h1_nom_article;
            console.log("ca fonctionnneee");

            console.log("Response: ", response.status);
            // console.log(response.data);
            // article = response.data[0];
            //
            // h1_nom_article = document.getElementById("nom_article");
            // h1_nom_article.innerHTML = article.nom_article;
            // quill.setText(article.content);
        })
        .catch(function (error) {
            console.log('refreshing');
            keycloak.updateToken(5).then(function () {
                console.log('Token refreshed');
            }).catch(function () {
                console.log('Failed to refresh token');
            })
            alert(error);
        });
}