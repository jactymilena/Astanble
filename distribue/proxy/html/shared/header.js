const header = {
    view: "toolbar", paddingY: 2, css: {"background": "orange"},
    cols: [
        {
            view: "button", type: "image",
            image: "../trimestre/images/A.PNG", width: 100, height: 100, click: function (id, event) {
                window.location.href = "//localhost";
            }, css: "webix_transparent"
        },
        {
            view: "button", value: "Accueil", width: 100, height: 60, click: function (id, event) {
                window.location.href = "//localhost";
            }, css: "webix_transparent"
        },
        {
            view: "button", value: "Wiki", width: 100, click: function (id, event) {
                window.location.href = "//localhost/wiki";
            }, css: "webix_transparent"
        },
        {
            view: "button", value: "Quiz", width: 100, click: function (id, event) {
                window.location.href = "//localhost/Quiz";
            }, css: "webix_transparent"
        },
        {view: "template", borderless: true, content: "usericon", css: {"background": "orange"}}
    ]
}