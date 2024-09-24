import { LightningElement, api } from 'lwc';

export default class EligibilityChecker extends LightningElement {
    @api age;
    isEligible = false;
    nonEligible = false;
    connectedCallback() {
        if (this.age >= 18) {
            this.isEligible = true;
            this.nonEligible = false;
        }
        else {
            this.isEligible = false;
            this.nonEligible = true;
        }
    }
}