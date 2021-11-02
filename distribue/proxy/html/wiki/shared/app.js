function createSideNavLink(theme) {
    return '<a onclick="getArticleByTheme(\'' + theme.id_thematique + '\')" href="#' + theme.id_thematique + '">' + theme.nom_thematique + '</a> <br>'
}

function loadThemesOnSideNav() {
    var sideNav = document.getElementById("sidenav");
    axios.get("http://localhost:8888/api/thematique")
        .then(function (response) {
            console.log("api/thematique");
            console.log(response.status);

            var thematiques = window.thematiques = response.data;
            thematiques.forEach(function(thematique) {
                var htmlLink = createSideNavLink(thematique);
                sideNav.innerHTML += (htmlLink);
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

function getArticleByTheme(id_theme) {
    axios.get("http://localhost:8888/api/wikiByThematique/" + id_theme)
        .then(function (response) {
            console.log("Select by thematique");
            console.log(response.status);

            const articles = response.data;
            const list_articles = document.getElementById('liste_article');
            list_articles.innerHTML = "";

            document.getElementById('searchCloseButton').style.visibility = 'hidden';
            document.getElementById('champSearch').value = "";

            // Mettre data trouvé dans la liste
            articles.forEach(article => {
                var htmlLink = createArticleLink(article);
                liste_article.innerHTML += (htmlLink);
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