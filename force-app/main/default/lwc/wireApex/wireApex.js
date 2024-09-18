import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';
export default class WireApex extends LightningElement {
    //@wire(getContactList)
    //contacts;
    contacts;
    error;

    /*Wire with function
    @wire(getContactList)
    wiredContact({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }*/

    /*using conncated callback
    connectedCallback() {
        getContactList()
            .then(result => {
                this.contacts = result;
            })
            .catch(error => {
                this.error = error;
            });
    }*/
    // approach 4 : Event Triggered Imperative calling
    handleLoad() {
        getContactList()
            .then(result => {
                this.contacts = result;
            })
            .catch(error => {
                this.error = error;
            })
    }
}