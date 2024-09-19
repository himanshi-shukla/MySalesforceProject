import { LightningElement } from 'lwc';

export default class AgeCheck extends LightningElement {
    showError = false;
    showDetails = false;
    details = [
        {
            Id: '01',
            Name: 'Himanshi Shukla',
            Email: 'himanshi.talk@gmail.com',
            Phone: +16698007585,
            Address: 'California, USA'
        }
    ];
    handleChange(event) {
        if (event.target.checked) {
            showError = false;
            showDetails = true;
        }
        else {
            this.showError = true;
            this.showDetails = false;
        }
    }

}