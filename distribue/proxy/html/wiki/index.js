// roule après que le body est loadé
function loadIndex() {
    // call init from app.js
    init();
    // load all themes on side nav
    loadThemesOnSideNav();
    // load all wikis to list on page
    loadWikis();
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
        if(liste_article)
            articles.forEach(function(article) {
                var htmlLink = createArticleLink(article);
                    liste_article.innerHTML += (htmlLink);
            });
        else
            console.log("elem.id=list_article not found.")
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
