function createSideNavLink(theme) {
    return '<a onclick="alert(\'Thematique: ' + theme.nom_thematique + '\')" href="#' + theme.id_thematique + '">' + theme.nom_thematique + '</a>'
}

function loadThemesOnSideNav() {
    var sideNav = document.getElementById("sidenav");
    axios.get("http://localhost:8888/api/thematique")
        .then(function (response) {
            console.log("api/thematique");
            console.log(response.status);

            var thematiques = response.data;
            thematiques.forEach(function(thematique) {
                var htmlLink = createSideNavLink(thematique);
                sideNav.innerHTML += (htmlLink);
            });
            choixThemes(thematiques, "choix-theme");
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