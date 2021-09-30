import {toolbar} from "./toolbar.js";
import {datatable} from "./datatable.js";
import {bottom} from "./bottom.js";

export const layout = new class {

    get views() {
        return {
            none: 'emptyView',
        };
    }

    get id() {
        return "main";
    }

    get configuration() {
        return {
            view: 'form',
            id: 'main',
            rows: [
                toolbar.configuration,
                datatable.configuration,
                bottom.configuration,
            ],
        }
    }
};
