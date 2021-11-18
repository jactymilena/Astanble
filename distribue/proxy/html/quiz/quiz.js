function createQuestionHTML(q, liste_questions) {
    const item = document.createElement('span');
    item.innerHTML = `
        <h3>Question ${q.num_question}</h3>   
        ${q.question_content} <br>
    `;
    if(q.id_type == 1) {
        item.innerHTML += `
            <h3>Réponse</h3>
            <input id=${q.id_question} type="text" placeholder="Réponse" />
            <br>
        `;
    }
    else if(q.id_type==2){
        var reponseQuiz = q.reponses;
        for(var i = 0; i<reponseQuiz.length;i++){
            item.innerHTML += `
            <input id=${reponseQuiz[i].id_reponse} type="radio" name=${q.id_question} value=${reponseQuiz[i].reponse_content} />
            <label for=${reponseQuiz[i].reponse_content}>${reponseQuiz[i].reponse_content}</label>
            `;
        }
    }

    liste_questions.appendChild(item);
}

async function loadQuiz() {
    await init();

    const id_quiz = urlParams.get('quiz');

    axios.get("http://localhost:8888/api/quizByID/" + id_quiz , {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            var quiz = response.data;
            const nom_quiz = document.getElementById("nom_quiz");
            nom_quiz.innerHTML = quiz.nom_quiz;
            const liste_questions = document.getElementById("liste_questions");

            quiz.questions.forEach(q => {
                createQuestionHTML(q, liste_questions);
            })

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
function quiz_finish(){
    const id_quiz = urlParams.get('quiz');
    axios.get("http://localhost:8888/api/quizByID/" + id_quiz , {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            console.log(response);
            var quiz = response.data;
            quiz.questions.forEach(q => {
                creerReponseUsager(q, liste_questions)
            })
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
function creerReponseUsager(q, liste_questions){
    var content=0;
    if(q.id_type == 1) {
        content = document.getElementById(q.id_question).value;
        console.log(content);
    }
    else if(q.id_type == 2) {
        var ele = document.getElementsByName(q.id_question);

        for(i = 0; i < ele.length; i++) {
            if(ele[i].checked)
               content= ele[i].value;
        }
        console.log(content);
    }
    var rep_bonne=0;
    var reponseQuiz = q.reponses;
    for(var i = 0; i<reponseQuiz.length;i++){
        if(reponseQuiz[i].reponse_content == content)
            rep_bonne = reponseQuiz[i].id_reponse;
    }
    if(rep_bonne==0){
        let reponse_mauvaise = {
            "reponse_content": content,
            "bonne_mauvaise" : false,
            "id_question": q.id_question
        };
        axios.post("http://localhost:8888/api/reponse/", JSON.stringify(reponse_mauvaise), {
            headers: {
                'Authorization': 'Bearer ' + keycloak.token,
                'Content-Type' : 'application/json'
            }
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

    let reponse_usager_question = {
        "id_question": q.id_question,
        "id_reponse": rep_bonne,
        "usager": user_profil

    };
    console.log(reponse_usager_question);
    axios.post("http://localhost:8888/api/reponse/insert/", JSON.stringify(reponse_usager_question), {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token,
            'Content-Type' : 'application/json'
        }
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