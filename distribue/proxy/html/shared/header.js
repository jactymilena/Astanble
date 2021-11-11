const header = {
    view: "toolbar", paddingY: 2, css: {"background": "#FF8921"},
    cols: [
        {
            view: "button", type: "image",
            image: "../trimestre/images/1-removebg-preview.png", width: 100, height: 100, click: function (id, event) {
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
                window.location.href = "//localhost/quiz";
            }, css: "webix_transparent"
        },
        {
            view: "button", id: "admin_tab", value: "Admin", width: 100, hidden:true, click: function (id, event) {
                window.location.href = "//localhost/admin";
            }, css: "webix_transparent"
        },
        {view: "template", borderless: true, content: "usericon", css: {"background": "#FF8921"}}
    ]
}