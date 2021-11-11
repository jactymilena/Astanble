function createQuestionHTML(q, liste_questions) {
    const item = document.createElement('span');
    item.innerHTML = `
        <h3>Question ${q.num_question}</h3>   
        ${q.question_content} <br>
    `;
    if(q.id_type == 1) {
        item.innerHTML += `
            <h3>Réponse</h3>
            <input id=${q.id_question} type="text" placeholder="Réponse"/>
            <br>
        `;
    }
    else if(q.id_type==2){
        var reponseQuiz = q.reponses;
        for(var i = 0; i<reponseQuiz.length;i++){
            item.innerHTML += `
            <input id=${reponseQuiz[i].id_reponse} type="radio" name={"reponse"+${q.id_question}} />
            <label for=${reponseQuiz[i].id_reponse}>${reponseQuiz[i].reponse_content}</label>
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
            const quiz = response.data;
            const nom_quiz = document.getElementById("nom_quiz");
            nom_quiz.innerHTML = quiz.nom_quiz;
            var liste_questions = document.getElementById("liste_questions");

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
/*function getIdTypeQuestion(q){
    getIdTypeQuestion(q);
}*/
function quiz_finish(){
    quiz.questions.forEach(q => {
        var question = document.getElementById(${q.id_question});
        
    })

}
