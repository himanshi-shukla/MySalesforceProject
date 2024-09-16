import { LightningElement, api, track, wire } from 'lwc';

export default class ChildCmp extends LightningElement {
    @api firstName = 'Britania';

    lowerCaseLastName = 'deafult Value';

    @api
    get lastName() {
        return this.lowerCaseLastName.toUpperCase();
    }

    set lastName(value) {
        this.lowerCaseLastName = value;
    }
}