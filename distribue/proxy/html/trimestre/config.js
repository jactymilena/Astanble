
import { datatable } from "./datatable.js";
import { toolbar } from "./toolbar.js";

export const config = new class Config {

    get id() {
        return "config";
    }

    get configuration() {
        return {
            view: "window",
            id: this.id,
            modal: true,
            move: true,
            position: "center",
            dynamic: true,
            head: false,
            body: {
                paddingX: 10,
                paddingY: 10,
                rows: [{
                    view: "toolbar",
                    id: "configtoolbar",
                    paddingY: 1,
                    height: 25, elements: [
                        {},
                        {
                            view: "icon", id: 'help1', tooltip: 'Aide', icon: 'mdi mdi-help-circle-outline',
                            click: () => {
                                const node = $$('help1').getNode();
                                webix.ui({
                                    view: "popup",
                                    dynamic: true,
                                    head: false,
                                    body: {view: "template", width: 500, height: 300, src: "help.html"}
                                }).show(node);
                            }
                        }
                    ]
                },
                    {
                        view: "fieldset",
                        label: "configuration",
                        width: 600,
                        body: {
                            view: "form",
                            margin: 0,
                            padding: 0,
                            id: "configform",
                            borderless: true,
                            scroll: false,
                            elements: [
                                {
                                    view: "text",
                                    id: "id",
                                    name: "trimester",
                                    label: "id du trimester",
                                    labelWidth: 280,
                                    inputWidth: 375,
                                },
                                {
                                    view: "text",
                                    id: "nom",
                                    name: "trimester",
                                    label: "nom du trimester",
                                    labelWidth: 280,
                                    inputWidth: 500,
                                },
                                {
                                    view: "datepicker",
                                    id: "debut",
                                    name: "début",
                                    label:" Date de début du trimester",
                                    labelWidth: 280,
                                    inputAlign: "right",
                                    inputWidth: 450,
                                },
                                {
                                    view: "datepicker",
                                    id: "fin",
                                    label: "Date de fin du trimester",
                                    name: "fin",
                                    labelWidth: 280,
                                    inputAlign: "right",
                                    inputWidth: 450,
                                },


                                {
                                    container: "button",
                                    padding: 20,
                                    cols: [
                                        {},
                                        {
                                            view: "button",
                                            id: "cancel",
                                            label: "Annuler",
                                            width: 110,
                                            icon: "mdi  mdi-48px mdi-content-save-settings-outline",
                                            click: () => $$(this.id).close(),
                                        },
                                        {
                                            view: "button",
                                            id: "apply",
                                            label: "Sauvegarder",
                                            width: 110,
                                            icon: "mdi  mdi-48px mdi-content-save-settings-outline",
                                            disabled: true,  //c'est la raison pour laquelle  c'est grisé
                                            click: () => {
                                                const trimester = {
                                                    trimestreId: $$("id").getValue(),
                                                    trimester: $$("nom").getValue(),
                                                    debut: $$("debut").getValue(),
                                                    fin: $$("fin").getValue(),
                                                };
                                                this.insertTrimestre(trimester);
                                            }
                                        }]
                                }
                            ],
                            elementsConfig: {
                                labelAlign: "right",
                                labelWidth: 140,
                                on: {
                                    "onChange": function (newv, oldv) {
                                        $$("apply").enable();
                                    }
                                },
                            },
                        }
                    }]
            },
        }
    }

    async insertTrimestre(trimester) {
        $$("main").showProgress({type: 'top'});
        webix
            .ajax()
            .headers({"Content-Type": "application/json"})
            .put("api/insert_trimestre", JSON.stringify(trimester))
            .then(async data => {
                webix.message({type: "success", text: "Trimestre inséré"});
                webix.ui(datatable.configuration, $$(datatable.id));
                await datatable.loadTrimestre();
                $$(this.id).close();
                $$("main").hideProgress();
            })
            .catch((reason) => {
                webix.alert({
                    text: "erreur lors de la sauvegarde d'un trimester."
                })
            });
    }

    show() {
        $$("apply").disable();
        $$("config").show();
    }

};



