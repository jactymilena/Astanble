// roule après que le body est loadé
function loadIndex() {
    // call init from app.js
    init();
    loadThematiques();
    loadArticles();
    prep_form();
}

function loadThematiques() {
    axiosGet("http://localhost:8888/api/thematique", function(response) {
        console.log(response.status);
        var thematiques = window.thematiques = response.data;
        var liste_thematique = data_theme_Script(thematiques);
        prep_dataTable("theme-table", liste_thematique);
    });
}

function loadArticles() {
    axiosGet("http://localhost:8888/api/wiki", function(response) {
        console.log(response.status);
        console.log(response.data);

        var articles;
        articles = window.articles = response.data;
        var list_article = data_article_Script(articles);
        prep_dataTable("article-table", list_article);
    });
}

function prep_form() {
    createFormSubmit("http://localhost:8888/api/thematique/insert",'form-create-theme', function(response) {
        console.log(response.status);
        loadThematiques();
    });
}

function createFormSubmit(url, id_form, onsuccess) {
    var form = document.getElementById(id_form);
    form.onsubmit = async (e) => {
        e.preventDefault();
        if (form.checkValidity() === false) {
            e.stopPropagation();
        } else {
            await axiosCreate(url,
                function(response) {
                    onsuccess(response);
                    form.classList.add('was-validated');
                    if(response.status === 200) {
                        form.reset();
                        form.classList.remove('was-validated');
                    }
                }, objectifyForm($(`#${id_form}`).serializeArray()));
        }
    };
}

function deleteArticle(id_article) {
    axiosDelete("http://localhost:8888/api/wiki/delete/" + id_article, function(response) {
        console.log(response.status);
        alert("Article supprimé.");
        loadArticles();
    });
}

function deleteThematique(id_thematique) {
    axiosDelete("http://localhost:8888/api/thematique/delete/" + id_thematique, function(response) {
        console.log(response.status);
        alert("Thematique supprimé.");
        loadThematiques();
    });
}

function prep_dataTable(dataTable_ID, liste, properties = {}) {
    if (!$.fn.DataTable.isDataTable('#' + dataTable_ID)) {
        document.querySelector("#" + dataTable_ID).tBodies[0].innerHTML =
            liste;

    } else {

        $('#' + dataTable_ID).DataTable().destroy();

        document.querySelector('#' + dataTable_ID).tBodies[0].innerHTML =
            liste;

    }
}