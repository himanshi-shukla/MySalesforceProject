import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';
export default class WireApex extends LightningElement {
    //@wire(getContactList)
    //contacts;
    contacts;
    error;
    @wire(getContactList)
    wiredContact({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }
}