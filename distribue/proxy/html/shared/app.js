var user_profil = {};
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);

async function init() {
    await initKeycloak();
    await userProfil();
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
    }).catch(function () {
        alert('failed to initialize');
    });
}

function logout() {
    let logoutURL = "http://localhost/auth/realms/usager/protocol/openid-connect/logout?" +
        "redirect_uri=http://localhost/logout.html"
    window.location.href = logoutURL;
}

async function userProfil() {
    await axios.get("http://localhost:8888/api/userInfo", {
        headers: {
            'Authorization': 'Bearer ' + keycloak.token
        }
    })
        .then(function (response) {
            console.log("Response: ", response.status);
            user_profil = window.user_profil = response.data;

            // prep user on ui
            var user_profil_html = document.getElementById("user_profil_nav");
            if(user_profil_html && user_profil)
                user_profil_html.innerText = user_profil.prenom_usager + " " + user_profil.nom_usager;

            if(user_profil.roles.includes("admin"))
                $$("admin_tab").show();

            return user_profil;
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

function axiosFetch(crud, url, onsuccess, object = null) {
    crud = crud.toLowerCase();
    console.log(`axios.${crud} at ${url}`);
    switch (crud) {
         case "read":
             axios.get(url)
                 .then(function (response) {
                     onsuccess(response);
                 })
                 .catch(function (error) {
                     axiosOnError(error);
                 });
             break;
        case "create":
            axios.post(url, JSON.stringify(object), {
                headers: {
                    'Authorization': 'Bearer ' + keycloak.token,
                    'Content-Type' : 'application/json'
                }
            })
                .then(function (response) {
                    onsuccess(response);
                })
                .catch(function (error) {
                    axiosOnError(error);
                });
            break;
        case "update":
            axios.post(url, JSON.stringify(object), {
                headers: {
                    'Authorization': 'Bearer ' + keycloak.token,
                    'Content-Type' : 'application/json'
                }
            })
                .then(function (response) {
                    onsuccess(response);
                })
                .catch(function (error) {
                    axiosOnError(error);
                });
            break;
        case "delete":
            axios.delete(url, {
                headers: {
                    'Authorization': 'Bearer ' + keycloak.token,
                    'Content-Type' : 'application/json'
                }
            })
                .then(function (response) {
                    onsuccess(response);
                })
                .catch(function (error) {
                    axiosOnError(error);
                });
            break;
        default:
            alert("ERROR: crud command can be (read, create, delete, update).");
            console.log("ERROR: crud command can be (read, create, delete, update).");
            break;
    }
}

function axiosOnError(error) {
    console.log('refreshing');
    keycloak.updateToken(5).then(function () {
        console.log('Token refreshed');
    }).catch(function () {
        console.log('Failed to refresh token');
    })
    console.log('Sad ça fonctionne pas :(');
    alert(error);
}

async function axiosGet(url, onsuccess) {
    axiosFetch("read", url, onsuccess);
}

async function axiosCreate(url, onsuccess, object) {
    axiosFetch("create", url, onsuccess, object);
}

async function axiosUpdate(url, onsuccess, object) {
    axiosFetch("update", url, onsuccess, object);
}

async function axiosDelete(url, onsuccess) {
    axiosFetch("delete", url, onsuccess);
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

function createFormSubmitObjet(crud, url, id_form, onsuccess, createObjectFunc) {
    var form = document.getElementById(id_form);
    form.onsubmit = async (e) => {
        e.preventDefault();
        if (form.checkValidity() === false) {
            e.stopPropagation();
        } else {
            crud = crud.toLowerCase();
            switch (crud) {
                case "create":
                    await axiosCreate(url,
                        function(response) {
                            onsuccess(response);
                            form.classList.add('was-validated');
                        }, createObjectFunc());
                    break;
                case "update":
                    await axiosUpdate(url,
                        function(response) {
                            onsuccess(response);
                            form.classList.add('was-validated');
                            if(response.status === 200) {
                                form.classList.remove('was-validated');
                            }
                        }, createObjectFunc());
                    break;
                default:
                    console.log("not a crud command!");
                    alert("not a crud command!");
                    break;
            }
        }
    };
}


function objectifyForm(formArray) {
    //serialize data function
    var returnArray = {};
    for (var i = 0; i < formArray.length; i++){
        returnArray[formArray[i]['name']] = formArray[i]['value'];
    }
    return returnArray;
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