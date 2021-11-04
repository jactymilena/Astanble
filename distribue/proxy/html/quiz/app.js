// roule après que le body est loadé
async function loadIndex() {
    window.user_profil = {};
    // call init from app.js
    init();

    //https://stackoverflow.com/questions/1759987/listening-for-variable-changes-in-javascript
    var userProxy = new Proxy(window.user_profil, {
        set: function (target, key, value) {
            loadAuthorQuiz(window.user_profil.cip);
        }
    });
}

function createQuizLink(quiz) {
    return `
        <div class="card col-sm-12 col-md-6">
          <div class="card-body">
            <span><a href="quiz.html?quiz=${quiz.id_quiz}">${quiz.nom_quiz}</a> [${quiz.authors.map(q => q.nom_complet_usager).join(', ')}]</span><br>
          </div>
        </div>
        `
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
                    var htmlLink = createQuizLink(q);
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


