import { LightningElement } from 'lwc';

export default class QuerySelectorDemo extends LightningElement {
    greeting = 'World';
    handleClick(event) {
        this.greeting = this.template.querySelector("lightning-input").value;
    }
}