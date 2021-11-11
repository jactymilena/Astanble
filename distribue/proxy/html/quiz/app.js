// roule après que le body est loadé
async function loadIndex() {
    // call init from app.js
    await init();

    // load quiz de l'auteur
    // TODO: Mettre le cip de la personne connectée
    loadAuthorQuiz("larn5378");
    loadHistorique("larn5378");
}

function createQuizLinkWithAuthor(quiz) {
    return `
        <div class="card col-sm-12 col-md-6">
          <div class="card-body">
            <span><a href="quiz.html?quiz=${quiz.id_quiz}">${quiz.nom_quiz}</a> [${quiz.authors.map(q => q.nom_complet_usager).join(', ')}]</span><br>
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


