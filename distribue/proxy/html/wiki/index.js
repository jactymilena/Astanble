// roule après que le body est loadé
function loadIndex() {
    // call init from app1.js
    init();
    // load all themes on side nav
    loadThemesOnSideNav();
    // load all wikis to list on page
    loadWikis();

}

function closeSearch() {
    document.getElementById('searchCloseButton').style.visibility = 'hidden';
    const liste_article = document.getElementById("liste_article");
    liste_article.innerHTML = "";
    document.getElementById('champSearch').value = "";
    loadWikis();
}

function searchArticle() {
    const searchRadioBtn = document.getElementsByName('searchChoice');
    searchRadioBtn.forEach(btn => {
        if(btn.checked == true) {
            switch (btn.value) {
                case "name" :
                    searchByName();
                    break;
                case "author" :
                    searchByAuthor();
                    break;
                case "description" :
                    searchByDescription();
                    break;
            }
        }
    })
}

function searchByName() {
    console.log('Search by name');
    search("searchByName");
}

function searchByAuthor() {
    console.log('Search by author');
    search("searchByAuthor");
}

function searchByDescription() {
    console.log('Search by description');
    search("searchByDescription");
}

function search(searchBy) {
    const strToSearch = document.getElementById('champSearch');
    if (champSearch.value == "") {
        alert('Rentrer quelque chose dans le champ de recherche.');
    } else {
        axios.get("http://localhost:8888/api/wiki/"+ searchBy + "/" + strToSearch.value)
            .then(function (response) {
                console.log(response.status);
                console.log(response.data);
                const articles = response.data;

                // Vider liste d'articles
                const liste_article = document.getElementById("liste_article");
                liste_article.innerHTML = "";

                // Show button de fermeture de la recherche
                document.getElementById('searchCloseButton').style.visibility = 'visible';

                // Mettre data trouvé dans la liste
                if(articles.length > 0) {
                    articles.forEach(article => {
                        var htmlLink = createArticleLink(article);
                        liste_article.innerHTML += (htmlLink);
                        console.log(article.nom_article);
                    });
                } else {
                    liste_article.innerHTML = "Aucun article ne correspond à cette recherche."
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
}

// function searchByName() {
//     console.log('Search by name');
//     const strToSearch = document.getElementById('champSearch');
//     if (champSearch.value == "") {
//         alert('Rentrer quelque chose dans le champ de recherche.');
//     } else {
//         axios.get("http://localhost:8888/api/wiki/searchByName/" + strToSearch.value)
//             .then(function (response) {
//                 console.log(response.status);
//                 console.log(response.data);
//                 const articles = response.data;
//
//                 // Vider liste d'articles
//                 const liste_article = document.getElementById("liste_article");
//                 liste_article.innerHTML = "";
//
//                 // Show button de fermeture de la recherche
//                 document.getElementById('searchCloseButton').style.visibility = 'visible';
//
//                 // Mettre data trouvé dans la liste
//                 articles.forEach(article => {
//                     var htmlLink = createArticleLink(article);
//                     liste_article.innerHTML += (htmlLink);
//                     console.log(article.nom_article);
//                 })
//
//             })
//             .catch(function (error) {
//                 console.log('refreshing');
//                 keycloak.updateToken(5).then(function () {
//                     console.log('Token refreshed');
//                 }).catch(function () {
//                     console.log('Failed to refresh token');
//                 })
//                 alert(error);
//             });
//     }
//
// }

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


