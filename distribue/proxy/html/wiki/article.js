// variables
var keycloak;
var quill;

async function loadArticle() {
    // call init from app1.js
    await init();
    // load all themes on side nav
    loadThemesOnSideNav();
    // Initialize Quill editor
    quill = new Quill('#editor', {
        toolbar: [
            [{header: [1, 2, false]}],
            ['bold', 'italic', 'underline'],
            ['image', 'code-block']
        ],
        theme: 'bubble'
    });
    // load wiki in page
    if(urlParams.get('create') == 'true')
    {
        clearAll();
        toggleContentEdition();
        $('#saveButton').text("Créer");
        $('#saveButton').attr("onclick", "createArticle();");
        quill.enable(true);
    }
    else {
        requestWiki(urlParams.get('article'));
    }
}

function clearAll() {
    $('#nom_article').text("");
    $('#nom_article_editTextBox').val("");
    quill.root.innerHTML = "";
}

function requestWiki(id) {
    if(id == null)
        alert("Aucun article a été choisi!");

    axios.get("http://localhost:8888/api/wikiByIdArticle/" + id , {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            var article;
            var h1_nom_article;
            console.log("ca fonctionnneee");

            console.log("Response: ", response.status);
            console.log(response.data);
            article = response.data;

            $('#nom_article').text(article.nom_article);
            $('#nom_article_editTextBox').val(article.nom_article);

            quill.root.innerHTML = article.content;
            quill.enable(false);
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

    let article = {
        "id_article" : urlParams.get('article'),
        "nom_article" : $('#nom_article_editTextBox').val(),
        "content" : content
    }

    axios.put("http://localhost:8888/api/wiki/update", JSON.stringify(article), {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token,
            'Content-Type' : 'application/json'
        }
    })
        .then(function (response) {
            console.log("Response: ", response.status);
            toggleContentEdition();
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

function createArticle() {
    let delta = quill.getContents();
    let content = quillGetHTML(delta);

    let article = {
        "nom_article" : $('#nom_article_editTextBox').val(),
        "description_robot_article" : "Description robot de l'article.",
        "content" : content,
        "description_article" : "La description de l'article."
    }

    axios.post("http://localhost:8888/api/wikiInsert", JSON.stringify(article), {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token,
            'Content-Type' : 'application/json'
        }
    })
        .then(function (response) {
            console.log("Response: ", response.status);
            window.location = "/wiki/article.html?article=" + response.data;
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

function toggleContentEdition() {
    var toggleContentEditionBtn = document.getElementById("toggleEditButton");
    var saveEditorBtn = document.getElementById("saveButton");

    if(toggleContentEditionBtn.innerText == "Modifier")
    {
        toggleContentEditionBtn.innerText = "Mode lecture";
        $('#nom_article').hide();
        $('#nom_article_editTextBox').show();
    }
    else
    {
        toggleContentEditionBtn.innerText = "Modifier";
        $('#nom_article').text($('#nom_article_editTextBox').val());
        $('#nom_article').show();
        $('#nom_article_editTextBox').hide();
    }
    quill.enable(!quill.isEnabled());
    saveEditorBtn.toggleAttribute("hidden");
}