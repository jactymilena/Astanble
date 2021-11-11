// variables
var keycloak;
var editor5;

async function loadArticle() {
    // call init from app1.js
    await init();
    // load all themes on side nav
    loadThemesOnSideNav();
    await ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .then( editor => {
            editor5 = editor;
        })
        .catch( error => {
            console.error( error );
        } );
    // load wiki in page

    await loadThemesSelector();
    if(urlParams.get('create') == 'true')
    {
        clearAll();
        toggleContentEdition();
        $('#saveButton').text("Créer");
        $('#saveButton').attr("onclick", "createArticle();");
        editor5.isReadOnly = false;
        document.getElementById("description_article").removeAttribute("disabled");
    }
    else {
        requestWiki(urlParams.get('article'));
        editor5.isReadOnly = true;
    }
}

function clearAll() {
    $('#nom_article').text("");
    $('#nom_article_editTextBox').val("");
    editor5.setData("");
    $('#description_article').val("");
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
            var thematiques;
            console.log("Response: ", response.status);
            console.log(response.data);
            article = window.article = response.data;

            $('#nom_article').text(article.nom_article);
            $('#nom_article_editTextBox').val(article.nom_article);

            $("#description_article").text(article.description_article);
            editor5.setData(article.content);
            article.thematiques.forEach(t => {
                let thematique = $(`input[name='themeSelection'][value='${t.id_thematique}']`)[0];
                thematique.checked = true;
                thematique.setAttribute("data-checked", "true");
            });
            console.log(article);
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

// sauvegarde du contenu de l'éditeur
function saveEditorContent() {
    let content = editor5.getData();

    let article = {
        "id_article" : urlParams.get('article'),
        "nom_article" : $('#nom_article_editTextBox').val(),
        "content" : content,
        "description_article" : $("#description_article").val(),
        "thematiques" : getCheckedTheme()
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
    let content = editor5.getData();

    let article = {
        "nom_article" : $('#nom_article_editTextBox').val(),
        "description_robot_article" : "Description robot de l'article.",
        "content" : content,
        "description_article" : $("#description_article").val()
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

function deleteArticle() {
    axios.delete("http://localhost:8888/api/wiki/delete/" + window.article.id_article, {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token,
            'Content-Type' : 'application/json'
        }
    })
        .then(function (response) {
            alert("Article supprimé.");
            window.location = "/wiki";
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

    if(toggleContentEditionBtn.innerText.toLowerCase() == "modifier")
    {
        toggleContentEditionBtn.innerText = "Mode lecture";
        $('#nom_article').hide();
        $('#nom_article_editTextBox').show();
        document.getElementById('description_article').removeAttribute("disabled");
    }
    else
    {
        toggleContentEditionBtn.innerText = "Modifier";
        $('#nom_article').text($('#nom_article_editTextBox').val());
        $('#nom_article').show();
        $('#nom_article_editTextBox').hide();
        $('#description_article').attr('disabled','disabled');
    }
    editor5.isReadOnly = !editor5.isReadOnly;
    saveEditorBtn.toggleAttribute("hidden");
}

async function loadThemesSelector() {
    var selector = document.getElementById("themeSelector");
    await axios.get("http://localhost:8888/api/thematique")
        .then(function (response) {
            console.log("api/thematique");
            console.log(response.status);

            var thematiques = window.thematiques = response.data;
            thematiques.forEach(function(thematique) {
                var htmlLink = createThemeSelect(thematique, false);
                selector.innerHTML += (htmlLink);
            });
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

function createThemeSelect(theme, checked) {
    return `
        <span>
            <input onclick="themeSelectionCheck(this);" name="themeSelection" type="checkbox" value="${theme.id_thematique}" ${checked ? "data-checked='true' checked": "data-checked='false'"}>${theme.nom_thematique}</input>
        </span>
    `;
}

function getCheckedTheme() {
    let themesChecked = [];
    $('input[data-checked=true]').each(function(theme) {
        let thematique = {
            "id_thematique": `${$(this).val()}`,
            "nom_thematique": ""
        }
        themesChecked.push(thematique);
    });
    return themesChecked;
}

function themeSelectionCheck(input) {
    input.setAttribute("data-checked", input.checked);
}