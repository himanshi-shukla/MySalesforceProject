import { LightningElement } from 'lwc';

export default class FeetToInches extends LightningElement {
    feet;
    inch;
    handleChangeValue(event) {
        this.feet = event.target.value;
    }
    handleBtnClick() {
        this.inch = this.feet * 12;
    }

}