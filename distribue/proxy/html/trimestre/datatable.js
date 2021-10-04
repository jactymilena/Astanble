


export const datatable = new class Datatable {


     get id() {
        return "team";
    }

    get configuration() {
        return {
            view: "datatable",
            id: this.id,
            hidden: false,
            tooltip: true,
            data: [],
            columns: [
                {
                    id: "trimesterId",
                    header: "id",
                    width: 75,
                    tooltip: "trimester ID",
                    hidden: false,
                },
                {
                    id: "trimester", header: "Trimestre",
                    hidden: false,
                    width: 200,
                    fillspace: true,
                },
                {
                    id: "debut",
                    header: "debut",
                    template: obj => {
                        return moment(obj.debut, 'YYYY-MM-DDThh:mm:ss').format('D MMM')
                    },
                    width: 300,
                },
                {
                    id: "fin",
                    header: "fin",
                    template: obj => {
                        return moment(obj.fin, 'YYYY-MM-DDThh:mm:ss').format('D MMM YYYY');
                    },
                    width: 300,
                },
            ],
        }
    }

    async loadTrimester(token) {
        $$("main").showProgress({type: 'top'});
        return webix.ajax()
            .headers({ 'Authorization': 'Bearer ' + token
                     })
            .get("api/trimester")
            .then(data => data.json())
            .then(data => {
                $$(datatable.id).clearAll();
                $$(datatable.id).parse(data);
                $$("main").hideProgress();

            })
            .catch((reason) => {
                console.error(reason);
                webix.modalbox({
                    title: 'Voir des trimesters',
                    text: "Paramètres inconsistants pour accéder à la base de données de présence",
                    type: 'alert-error',
                });
            });
    }

}