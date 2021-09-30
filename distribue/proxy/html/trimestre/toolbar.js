import {config} from "./config.js";


export const toolbar = new class Toolbar {


    getViewId() {
        return "toolbar";
    }

    get configuration() {
        return {
            view: "toolbar",
            id: this.getViewId(),
            paddingY: 1,
            hidden: false,
            height: 40, elements: [
                {
                    view: "icon",
                    icon: "mdi mdi-settings",
                    id: 'settings',
                    hidden: false,
                    tooltip: "Configuration",
                    click: () => {
                        webix.ui(config.configuration, $$(config.id)).show();
                    }
                },
                {},
                {
                    view: "label",
                    id: 'message',
                    hidden: false,
                    label: `<span style="font-size: 150%" >Trimestre</span>`,
                    width: 200,
                },
                {},
                {
                    view: "icon", id: 'help', tooltip: 'Aide', icon: 'mdi mdi-help-circle-outline',
                    click: () => {
                        const node = $$('help').getNode();
                        webix.ui({
                            view: "popup",
                            position: "center",
                            dynamic: true,
                            head: false,
                            body: {view: "template", width: 500, height: 300, src: "help.html"}
                        }).show(node)
                    }
                },
            ],
        }
    }
};




