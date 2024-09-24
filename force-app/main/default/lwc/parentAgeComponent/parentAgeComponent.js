import { LightningElement } from 'lwc';

export default class ParentAgeComponent extends LightningElement {
    age;
    showChildComponents = false;
    //method to operate on age change input box
    handleAgeChange(event) {
        this.age = event.target.value;
        this.showChildComponents = false;

    }
    //method to operate on the check eligibility button
    handleBtnClick() {
        if (this.age) {
            this.showChildComponents = true;
        } else {
            alert('Please enter a valid age.');
        }

    }
}