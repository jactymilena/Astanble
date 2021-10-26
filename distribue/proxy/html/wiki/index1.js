// roule après que le body est loadé
function loadIndex() {
    // call init from app.js
    init();
    // load all themes on side nav
    loadThemesOnSideNav();
    // load all wikis to list on page
    loadWikis();

    // let searchBtn = document.getElementById('clickMe');
    // console.log(searchBtn);
    // searchBtn.addEventListener("click", function () {
    //     console.log("allo");
    //     alert('helloooo');
    // });

    // searchBtn.onclick = searchByName();
}
function searchByName(nom_article) {
    console.log('Search by name');
    axios.get("http://localhost:8888/api/wiki/searchByName/" + nom_article)
        .then(function (response) {
            console.log(response.status);
            console.log(response.data);

            response.data.forEach(article => {
                console.log(article.nom_article);
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

function createArticleLink (article) {
    return '<span><a href="article.html?article=' + article.id_article + '">' +
                article.nom_article +
            '</a>[' + article.authors.map(a => a.nom_complet_usager).join(', ')  + ']<br>' + article.description_article + '</span><br>'
}


function loadWikis() {
    axios.get("http://localhost:8888/api/wiki")
    .then(function (response) {
        console.log(response.status);
        console.log(response.data);

        var articles;
        articles = response.data;

        var liste_article = document.getElementById("liste_article");
        articles.forEach(function(article) {
            var htmlLink = createArticleLink(article);
            liste_article.innerHTML += (htmlLink);
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


