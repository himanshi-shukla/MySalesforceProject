import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Phone', fieldName: 'Phone' },
    { label: 'Industry', fieldName: 'Industry' }
];

export default class AccountTable extends LightningElement {
    @track accounts;
    @track columns = columns;
    @track selectedAccounts = [];

    // Wire method to get accounts from Apex controller
    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.error('Error fetching accounts: ', error);
        }
    }

    // Handle row selection event to track selected accounts
    handleRowSelection(event) {
        console.log("Hello clicked on row... : ", event)
        const selectedRows = event.detail.selectedRows;
        this.selectedAccounts = selectedRows;
    }
}
