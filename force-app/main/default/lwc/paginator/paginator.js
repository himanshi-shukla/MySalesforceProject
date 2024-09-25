// paginator.js
import { LightningElement } from "lwc";

export default class Paginator extends LightningElement {
    //previous page functionality
    previousHandler() {
        this.dispatchEvent(new CustomEvent("previous"));
    }

    nextHandler() {
        this.dispatchEvent(new CustomEvent("next"));
    }
}