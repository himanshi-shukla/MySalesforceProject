import { LightningElement, api } from 'lwc';

export default class SeniorCitizenChecker extends LightningElement {
    @api age;
    confirmYes = false;
    confirmNo = false;
    connectedCallback() {
        if (this.age >= 60) {
            this.confirmYes = true;
            this.confirmNo = false;
        }
        else {
            this.confirmYes = false;
            this.confirmNo = true;
        }
    }
}