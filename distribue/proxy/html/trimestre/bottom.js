
export const bottom = new class Bottom  {


    get id() {
        return "bottom"
    }

    get configuration() {
        return {
            view: "toolbar",
            id: this.id,
            hidden: false,
            height: 30,
            elements: [{
                view: "label",
                width: 30,
                label: '<img src="images/udes-logo.svg" width="60%">'
            },
                {
                    view: "label",
                    label: this.message(),
                    width: 700,
                    height: 30,
                },

            ]
        }
    }

    message() {
        const text  = "Produit par les gentils ét du programme de génie informatique de la Faculté de génie";
        const color =  "color:grey;";
        return   `<span style="font-size: 90%; ${color}" >${text}</span>`;
    }
};
