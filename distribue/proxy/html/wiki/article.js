// variables
var keycloak;
var editor5;

async function loadArticle() {
    // call init from app.js
    await init();
    // load all themes on side nav
    loadThemesSelector();
    await ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .then( editor => {
            editor5 = editor;
        })
        .catch( error => {
            console.error( error );
        } );
    // load wiki in page
    if(urlParams.get('create') == 'true')
    {
        clearAll();
        toggleContentEdition();
        $('#saveButton').text("Créer");
        $('#saveButton').attr("onclick", "createArticle();");
        editor5.isReadOnly = false;
        document.getElementById("description_article").removeAttribute("disabled");

        // Cacher commentaires et liens articles
        const comment_option = document.getElementById('section_commentaire');
        comment_option.toggleAttribute("hidden")

        const liens_quiz = document.getElementById('liens_quiz');
        liens_quiz.toggleAttribute("hidden");
    }
    else {
        requestWiki(urlParams.get('article'));
        editor5.isReadOnly = true;
        loadCommentaires();
        loadQuizref();
    }
}

function commentOnKeyDown(event) {
    if(event.keyCode === 13) {
        $("#comment_button").click();
    }
}

function respondeOnKeyDown(event, id_commentaire) {
    if(event.keyCode === 13) {
        // $(`#comment_button${id_commentaire}`).click();
        createCommentaireReponse(id_commentaire);
    }
}

function createCommentaireHTML(commentaire, isReponse, liste) {
    const item = document.createElement('section');
    item.setAttribute('commentaire', `${commentaire.id_commentaire}`);
    item.setAttribute('class', 'comment-container');

    item.innerHTML = `
        <img id="comment_icon" src="../trimestre/images/UserIcon.png"
             alt="Icone utilisateur"
             style="width:30px; height: 30px;">
        <div class="box" commentaire="${commentaire.id_commentaire}">
            <div class="box-header">
                <span class="box--title">
                    ${commentaire.auteur.prenom_usager} ${commentaire.auteur.nom_usager}
                </span>
                <span class="box--date">
                    ${commentaire.date_commentaire}
                </span>
                <div class="box--tools">
                    <button class="delete-btn" onclick="deleteCommentaire(${commentaire.id_commentaire})"><i class="fas fa-trash"></i></button>
                </div>
            </div>
            <span>
                ${commentaire.commentaire_content}
            </span>
            <div class="box--tools" style="margin-top: 1.75em; margin-right: 1.05em">
                <button id="comment_button${commentaire.id_commentaire}" class="rep-btn" onclick="addResponseOption(${commentaire.id_commentaire})" 
                ${isReponse == true ? "hidden" : ''}><span>Répondre</span></button>
            </div>
        </div>
    `;

    item.setAttribute('style', `margin-left: ${isReponse == true ? '30px' : '0px'};
                                                  margin-top : 15px`);
    liste.appendChild(item);
}

function addResponseOption(id_commentaire) {
    const comment_option = document.querySelector(`[optionResponse="${id_commentaire}"]`);
    comment_option.toggleAttribute("hidden");
}

function createResponseOption(id_commentaire) {

    const comment_option = document.createElement('div');
    comment_option.setAttribute('optionResponse', `${id_commentaire}`);

    comment_option.innerHTML += `
        <div class="comment-container" >
            <div class="response-box">
                <div class="box-header">
                    <img src="../trimestre/images/UserIcon.png"
                         alt="Icone utilisateur"
                         style="width:30px; height: 30px;">
                    <span id="comment_username" class="box--title">${user_profil.prenom_usager + " " + user_profil.nom_usager}</span>
                </div>
                <textarea id="champ_commentaire_reponse" class="response-area" parent="${id_commentaire}" onkeydown="respondeOnKeyDown(event, ${id_commentaire})" rows="3" placeholder="Écrire un commentaire..."></textarea>
                <div class="box--tools">
                    <input id="comment_button" class="rep-btn" type="button" value="Répondre" onclick="createCommentaireReponse(${id_commentaire})"/>
                </div>
            </div>
         </div>
    `;
    comment_option.setAttribute('style', `margin-top : 15px; flex: 0 0 100%; margin-bottom: 2.25em`);
    comment_option.toggleAttribute("hidden");

    var liste_commentaire = document.querySelector(`[commentaire="${id_commentaire}"]`);
    liste_commentaire.appendChild(comment_option);

}

function deleteCommentaire(id_commentaire) {

    axios.get("http://localhost:8888/api/commentaireAuthor/" + id_commentaire , {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            if(window.user_profil.cip == response.data) {
                axios.delete("http://localhost:8888/api/delete/commentaire/" + id_commentaire , {
                    headers: {
                        'Authorization': 'Bearer ' + keycloak.token
                    }
                })
                    .then(function (response) {
                        loadCommentaires();
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
            } else {
                alert("Vous pouvez seulement supprimer vos propres commentaires.");
            }
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

function loadCommentaires() {
    //     user_profil.prenom_usager + " " + user_profil.nom_usager
    const comment_username = document.getElementById('comment_username');
    comment_username.innerText = user_profil.prenom_usager + " " + user_profil.nom_usager;

    const id_article = urlParams.get('article');

    axios.get("http://localhost:8888/api/commentaire/" + id_article , {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            console.log(response.data);
            var liste_commentaires = document.getElementById("liste_commentaires");
            liste_commentaires.innerHTML = "";
            const commentaires = response.data;

            commentaires.forEach(com => {
                const comments_section = document.createElement("section");
                comments_section.setAttribute("class", "comments");

                createCommentaireHTML(com, false, comments_section);
                console.log(com.reponses);
                console.log('Grandeur ' + com.reponses.length);

                if(com.reponses.length > 0) {

                    var liste_reponse = document.querySelector(`[commentaire="${com.id_commentaire}"]`);
                    console.log(com.reponses);
                    com.reponses.forEach(res => {
                        createCommentaireHTML(res, true, comments_section);
                    });
                }

                liste_commentaires.innerHTML += comments_section.innerHTML;
                createResponseOption(com.id_commentaire);
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

function createCommentaireReponse(id_parent) {
    console.log("Réponse à un commentaire " + id_parent);
    const commentaire_content = document.querySelector(`textarea[parent="${id_parent}"]`);

    if(commentaire_content.value != "") {
        var commentaire = {
            "id_article" : urlParams.get('article'),
            "commentaire_content" : commentaire_content.value,
            "cip" : user_profil.cip,
            "id_reponse_commentaire" : id_parent
        };

        console.log(commentaire);

        axios.post("http://localhost:8888/api/commentaireReponseInsert", JSON.stringify(commentaire), {
            headers: {
                'Authorization': 'Bearer ' + keycloak.token,
                'Content-Type' : 'application/json'
            }
        })
            .then(function (response) {
                console.log("Response: ", response.status);
                commentaire_content.value = "";
                loadCommentaires();
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
    } else {
        alert("Entrez un commentaire dans le champ pertinent.");
    }
}

function createCommentaire() {
    console.log("Insert commentaire");
    const commentaire_content = document.getElementById('champ_commentaire');

    if(commentaire_content.value != "") {
        var commentaire = {
            "id_article" : urlParams.get('article'),
            "commentaire_content" : commentaire_content.value,
            "cip" : user_profil.cip
        };

        console.log(commentaire);

        axios.post("http://localhost:8888/api/commentaireInsert", JSON.stringify(commentaire), {
            headers: {
                'Authorization': 'Bearer ' + keycloak.token,
                'Content-Type' : 'application/json'
            }
        })
            .then(function (response) {
                console.log("Response: ", response.status);
                commentaire_content.value = "";
                loadCommentaires();
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
    } else {
        alert("Entrez un commentaire dans le champ pertinent.");
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

function createQuizLink(quiz) {
    return `
        <div class="col-sm-12 col-md-6 mt-3">
            <div class="card card-4">
              <div class="card-body">
                <h4 class="card__title">${quiz.nom_quiz}</h4>
                <span><a class="card__link" href="/quiz/quiz.html?quiz=${quiz.id_quiz}">Tester vos connaissances!</a></span><br>
              </div>
            </div>
        </div>
        `
}

function loadQuizref() {
    console.log("load des quiz")
    const id_article = urlParams.get('article');
    axios.get("http://localhost:8888/api/wiki/quizByArticle/" + id_article , {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
           console.log(response.data);
            const quiz = response.data
            const liste_quiz_article = document.getElementById('liste_quiz_article');
            quiz.forEach(q => {
                liste_quiz_article.innerHTML +=  createQuizLink(q);
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