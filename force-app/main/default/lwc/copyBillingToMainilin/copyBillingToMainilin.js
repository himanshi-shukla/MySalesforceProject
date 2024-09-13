import { LightningElement } from 'lwc';

export default class CopyBillingToMainilin extends LightningElement {
    billingAdd;
    mailingAdd;
    handleChangeValue(event) {
        //accept user input
        this.billingAdd = event.target.value;
    }
    handleBtnClick() {
        this.mailingAdd = this.billingAdd;
    }
}