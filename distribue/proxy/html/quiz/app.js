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
    await axios.get("http://localhost:8888/api/student", {
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

            if(user_profil.roles.includes("admin"))
                $$("admin_tab").show();

            loadAuthorQuiz(window.user_profil.cip);
            loadOthersQuiz(window.user_profil.cip);
            loadHistorique(window.user_profil.cip);
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

function createQuizLinkWithAuthor(quiz) {
    return `
<div class="col-sm-12 col-md-6">
        <div class="card">
            <div class="card-header" align="right">
                <div class="btn-group">
                  <button type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-cog"></i>
                  </button>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="/quiz/form.html?quiz=${quiz.id_quiz}">Modifier</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" onclick="deleteQuiz(${quiz.id_quiz});">Supprimer</a>
                  </div>
                </div>
            </div>
          <div class="card-body">
            <span><a href="quiz.html?quiz=${quiz.id_quiz}">${quiz.nom_quiz}</a> [${quiz.authors.map(q => q.nom_complet_usager).join(', ')}]</span><br>
          </div>
        </div>
        </div>
        `
}

function createQuizLink(quiz) {
    return `
        <div class="card col-sm-12 col-md-6">
          <div class="card-body">
            <span><a href="quiz.html?quiz=${quiz.id_quiz}">${quiz.nom_quiz}</a></span><br>
          </div>
        </div>
        `
}

function loadHistorique(cip) {
    console.log("LoadAuthorQuiz");
    axios.get("http://localhost:8888/api/quizByQuestionRepondue/" + cip , {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            console.log(response.data);
            console.log(response.status);
            var quiz = response.data;
            const liste_quiz_historique = document.getElementById("liste_quiz_historique");

            if(liste_quiz_historique) {
                quiz.forEach( q => {
                    liste_quiz_historique.innerHTML += createQuizLink(q);
                })
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

function loadAuthorQuiz(cip) {
    console.log("LoadAuthorQuiz");
    axios.get("http://localhost:8888/api/quizByAuthor/" + cip , {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            console.log(response.data);
            console.log(response.status);

            var quiz = response.data;
            const liste_quiz_author = document.getElementById("liste_quiz_author");

            if(liste_quiz_author) {
                quiz.forEach( q => {
                    var htmlLink = createQuizLinkWithAuthor(q);
                    liste_quiz_author.innerHTML += htmlLink;
                })
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

function loadOthersQuiz(cip) {
    console.log("loadOthersQuiz");
    axios.get("http://localhost:8888/api/quizNotAuthor/" + cip , {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            console.log(response.data);
            console.log(response.status);

            var quiz = response.data;
            const list_quiz_disponible = document.getElementById("list_quiz_disponible");

            if(list_quiz_disponible) {
                quiz.forEach( q => {
                    var htmlLink = createQuizLinkWithAuthor(q);
                    list_quiz_disponible.innerHTML += htmlLink;
                })
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

function deleteQuiz(id_quiz) {
    axiosDelete("http://localhost:8888/api/quiz/delete/" + id_quiz, function () {
        clearAuthorQuizList();
        loadAuthorQuiz(user_profil.cip);
    });
}

function clearAuthorQuizList() {
    let liste_quiz_author = document.getElementById("liste_quiz_author");
    liste_quiz_author.innerHTML = "";
}