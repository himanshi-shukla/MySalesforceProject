import { LightningElement, wire, track } from 'lwc';
import getAccountsData from '@salesforce/apex/HandleAccountLWC.getAccountsData';

export default class GetAccountsData extends LightningElement {
    accounts = [];
    @wire(getAccountsData)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.error(error);
        }
    }

}