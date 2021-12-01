function loadIndex() {
    // call init from app.js
    init();
    let id_quiz = urlParams.get('quiz');
    window.list_carte = [];
    if(id_quiz != undefined) {
        window.id_quiz = id_quiz;
        axiosGet(`http://localhost:8888/api/quiz/${id_quiz}`, function (response){
            console.log(response.status);
            let quiz = response.data;
            $("#nom_quiz").val(quiz.nom_quiz);
            $("#description_quiz").val(quiz.description_quiz);
            quiz.questions.forEach(q => {
                if(window.questions_type == undefined)
                    window.questions_type = q.questionTypes;
                ajouterCarte(null, q);
            })
            $("#submit-quiz").text("Sauvegarder");
            prep_form("update");
        });
    } else {
        axiosGet(`http://localhost:8888/api/quiz/prepform`, function (response){
            console.log(response.status);
            window.questions_type = response.data;
            for (let i = 1; i < 4; i++) {
                ajouterCarte(i);
            }
            prep_form("create");
        });
    }
    $("#cards").sortable({
        revert: true,
        update: function(event, ui) {
            //create the array that hold the positions...
            var order = [];
            let new_list = [undefined];
            //loop trought each div...
            $('#cards > div').each( function(e) {
                let currentNum = $(this).attr("data-card-container-floater");
                if(currentNum != undefined) {
                    let new_num = $(this).index() + 1;
                    let question = window.list_carte[currentNum];
                    question.num_question = new_num;
                    question.reponses.forEach(reponse => {
                        reponse.num_question = new_num;
                    });
                    new_list[new_num] = question;
                }
            });
            window.list_carte = [];
            new_list.forEach(e => {
                if(e != undefined)
                    window.list_carte[e.num_question] = e;
            })
            updateCartes();
        }
    });
}

function prep_form(crud) {
    crud = crud.toLowerCase();
    switch (crud) {
        case "create":
            createFormSubmitObjet("create", "http://localhost:8888/api/quizInsert", "form-create-quiz", function (response) {
                console.log(response.status);
                creerQuestions(response.data);
            }, () => creerQuiz());
            break;
        case "update":
            createFormSubmitObjet("update", "http://localhost:8888/api/quiz/update", "form-create-quiz", function (response) {
                console.log(response.status);
            }, () => creerQuizQuestions());
            break;
        default:
            console.log("not a crud option!");
            alert("not a crud option!");
            break;
    }
}

function ajouterCarte(num = null, question = null) {
    if(question == null) {
        if(num == null)
            num = window.list_carte.length;
        if(num == 0)
            num = 1;
        var question = {
            questionTypes: window.questions_type,
            num_question: num,
            id_type: 1,
            question_content: "",
            reponses: [{
                num_question: num,
                num_reponse: 1,
                reponse_content: ""
            }]
        }
        window.list_carte[num] = question;
    } else {
        let num_reponse = 1;
        question.reponses.forEach(r => {
            r.num_reponse = num_reponse;
            num_reponse++;
        });
        window.list_carte[question.num_question] = question;
    }
    var carte = carte_Script(question);
    $("#cards").append(carte);
}

function deleteCarte(num) {
    var new_list = [];
    var new_index = 1;
    $("#cards").empty();
    window.list_carte.forEach(q => {
        if(q.num_question != num) {
            let question = q;
            question.num_question = new_index;
            question.reponses.forEach(r => {
                r.num_question = new_index;
            })
            new_list[new_index] = question;
            var carte = carte_Script(question);
            $("#cards").append(carte);
            new_index++;
        }
    });
    window.list_carte = new_list;
}

function updateCartes() {
    $("#cards").empty();
    window.list_carte.forEach(question => {
        var carte = carte_Script(question);
        $("#cards").append(carte);
    });
}

function updateQuestion(num) {
    var question = window.list_carte[num];
    question.question_content = $(`[data-type="question"][data-question-num="${num}"]`).val();
}

function updateReponse(input) {
    var question = window.list_carte[$(input).attr("data-question-num")];
    let num_reponse = parseInt($(input).attr("data-reponse-num"));
    var reponse = question.reponses.find(r => {
        return r.num_reponse == num_reponse;
    })
    reponse.reponse_content = $(input).val();
}

function changeQuestionType(num_question, id_type) {
    var question = window.list_carte[num_question];
    question.id_type = id_type;
    resetQuestionContainer(num_question);
}

function ajouterReponsePossible(num_question) {
    var question = window.list_carte[num_question];
    let r = {
        id_question: question.id_question,
        num_question: num_question,
        num_reponse: question.reponses.length + 1,
        reponse_content: ""
    }
    question.reponses.push(r);
    resetQuestionContainer(num_question);
}

function deleteResponse(id_reponse_container) {
    let reponse_container = $(`[data-reponse-container="${id_reponse_container}"]`);
    let num_question = id_reponse_container.split(":")[0];
    let num_reponse = id_reponse_container.split(":")[1];

    var new_list = [];
    var new_index = 1;
    let question = window.list_carte[num_question];
    question.reponses.forEach(r => {
        if(r.num_reponse != num_reponse) {
            let reponse = r;
            reponse.num_reponse = new_index;
            new_list[new_index] = reponse;
            new_index++;
        }
    });
    window.list_carte[num_question].reponses = new_list;
    reponse_container.remove();
    console.log(num_question);
}

function reponseSelectionCheck(input) {
    input.setAttribute("data-checked", input.checked);
}

function resetQuestionContainer(num_question) {
    var question = window.list_carte[num_question];
    var carte = carte_Script(question);
    $(`[data-card-container="${num_question}"]`).empty();
    $(`[data-card-container="${num_question}"]`).replaceWith(carte);
}

function creerQuiz() {
    let quiz = {
        nom_quiz: $("#nom_quiz").val(),
        description_quiz: $("#description_quiz").val()
    }
    return quiz;
}

function creerQuizQuestions() {
    let quiz = {
        id_quiz: window.id_quiz,
        nom_quiz: $("#nom_quiz").val(),
        description_quiz: $("#description_quiz").val(),
        questions: createFormQuestions(window.id_quiz)
    }
    return quiz;
}

function creerQuestions(id_quiz){
    let questionsReponses = createFormQuestions(id_quiz);
    axiosCreate("http://localhost:8888/api/question/insert/all", function (response) {
        console.log(response.status);
        console.log("questions inserted");
        window.location = `/quiz/quiz.html?quiz=${id_quiz}`;
    }, questionsReponses);
}

function createFormQuestions(id_quiz) {
    let questionsReponses = [];
    $("[id^=question-]").each(function() {
        let num_question = $(this).attr("data-question-num");
        let id_question = $(this).attr("data-question-id");
        var _question = window.list_carte[num_question];
        let question = {
            id_quiz: id_quiz,
            cip: user_profil.cip,
            num_question: num_question,
            question_content: $(this).val(),
            id_type: _question.id_type,
            reponses: []
        };
        if(id_question != "")
            question.id_question = id_question;
        $(`[data-question-num="${num_question}"][data-type="reponse"]`).each(function(){
            let id_reponse = $(this).attr("data-reponse-id");
            let num_reponse = $(this).attr("data-reponse-num");
            let bonne_mauvaise = true;
            if(_question.id_type == 2) {
                bonne_mauvaise = $(`#check-good-question-${num_reponse}`).attr("data-checked");
            }
            let reponse = {
                reponse_content: $(this).val(),
                bonne_mauvaise: bonne_mauvaise
            };
            if(id_reponse != "")
                reponse.id_reponse = id_reponse;
            question.reponses.push(reponse);
        });
        questionsReponses.push(question);
    });
    return questionsReponses;
}