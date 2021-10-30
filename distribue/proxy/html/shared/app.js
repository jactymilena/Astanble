var user_profil;
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);

async function init() {
    await initKeycloak();
}

async function initKeycloak() {
    console.log("Initializing Keycloack");
    keycloak = new Keycloak({
        "realm": "usager",
        "auth-server-url": "https://localhost/auth/",
        "ssl-required": "external",
        "clientId": "frontend",
        "public-client": true,
        "confidential-port": 0
    });
    await keycloak.init({onLoad: 'login-required'}).then(function (authenticated) {
        console.log(authenticated ? 'authenticated' : 'not authenticated');
        // prep la variable user_profil
        userProfil();
    }).catch(function () {
        alert('failed to initialize');
    });
}

function userProfil() {
    axios.get("http://localhost:8888/api/student", {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            console.log("Response: ", response.status);
            user_profil = response.data;

            // prep user on ui
            var user_profil_html = document.getElementById("user_profil_nav");
            if(user_profil_html && user_profil)
                user_profil_html.innerText = user_profil.first_name + " " + user_profil.last_name;
        })
        .catch(function (error) {
            console.log('refreshing');
            keycloak.updateToken(5).then(function () {
                console.log('Token refreshed');
            }).catch(function () {
                console.log('Failed to refresh token');
            })
        });
}

function choixThemes(list_themes, idBalise, preselected_theme = [], ) {
    var selection_formater_delegate = (theme, preselected_theme) => {
        return {
            value: theme.id_thematique,
            label: theme.nom_thematique,
            selected: preselected_theme.includes(theme.id_thematique),
            disabled: false
        }
    }
    var choice = make_choice(list_themes, idBalise, selection_formater_delegate, preselected_theme);
    return choice;
}

function make_choice(list, idBalise, selection_formater_delegate, preselected = []) {
    console.log("creating choice");
    let choice_object = new Choices('#' + idBalise, {
        removeItemButton: true,
        searchResultLimit: 10,
        noResultsText: 'Aucun résultat trouvé',
        noChoicesText: 'Aucun choix possible',
        itemSelectText: '',
        duplicateItemsAllowed: false,
        editItems: false
    });
    document.getElementById(idBalise).choices = choice_object;
    var list_possible_choices = [];

    list.forEach((item) =>  {
        list_possible_choices.push(selection_formater_delegate(item, preselected));
    });

    choice_object.setChoices(
        list_possible_choices,
        'value',
        'label',
        true,
    );
    return choice_object;
}