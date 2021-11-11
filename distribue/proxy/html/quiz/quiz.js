function createQuestionHTML(q, liste_questions) {
    const item = document.createElement('span');
    item.innerHTML = `
        <h3>Question ${q.num_question}</h3>   
        ${q.question_content} <br>
        <input type="text" placeholder="Réponse"/>
        <br>
    `;
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
function getIdTypeQuestion(q){
    getIdTypeQuestion(q);
}

