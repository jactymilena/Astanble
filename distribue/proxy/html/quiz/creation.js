

function loadIndex() {
    // call init from app.js
    init();
    window.list_carte = [];
    for (let i = 1; i < 4; i++) {
        ajouterCarte(i);
    }
}

function ajouterCarte(num = null) {
    if(num == null)
        num = window.list_carte.length;
    if(num == 0)
        num = 1;
    var question = {
        num_question: num,
        id_question: num,
        question_content: "",
        id_reponse: num,
        reponse_content: ""
    }
    window.list_carte[num] = question;
    var carte = carte_Script(question);
    $("#cards").append(carte);
}

function deleteCarte(num) {
    var new_list = [];
    var new_index = 1;
    $("#cards").empty();
    window.list_carte.forEach(q => {
        if(q.num_question != num) {
            var question = {
                num_question: new_index,
                id_question: new_index,
                question_content: q.question_content,
                id_reponse: new_index,
                reponse_content: q.reponse_content
            }
            new_list[new_index] = question;
            var carte = carte_Script(question);
            $("#cards").append(carte);
            new_index++;
        }
    });
    window.list_carte = new_list;
}

function updateQuestion(num) {
    var question = window.list_carte[num];
    question.question_content = $(`#question-${num}`).val();
}

function updateReponse(num) {
    var question = window.list_carte[num];
    question.reponse_content = $(`#reponse-${num}`).val();
}

function creerQuiz() {
    let quiz = {
        nom_quiz: $("#nom_quiz").val(),
        description_quiz: $("#description_quiz").val()
    }
    axiosCreate("http://localhost:8888/api/quizInsert", function (response) {
        console.log(response.status);
        creerQuestions(response.data);
    }, quiz);
}

function creerQuestions(id_quiz){
    let questionsReponses = [];
    $("[id^=question-]").each(function() {
        let num_question = $(this).attr("data-question-num");
        let id_question = $(this).attr("data-question-id");
        let question = {
            id_quiz: id_quiz,
            cip: user_profil.cip,
            num_question: num_question,
            question_content: $(this).val(),
            id_type: 1,
            reponses: []
        }
        $(`[data-question-num=${num_question}][data-question-id=${id_question}][id^=reponse-]`).each(function(){
            let reponse = {
                id_question: id_question,
                reponse_content: $(this).val(),
                bonne_mauvaise: true
            }
            question.reponses.push(reponse);
        });
        questionsReponses.push(question);
    });
    axiosCreate("http://localhost:8888/api/question/insert/all", function (response) {
        console.log(response.status);
        console.log("questions inserted");
    }, questionsReponses);
}