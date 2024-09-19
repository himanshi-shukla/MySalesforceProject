import { LightningElement, track, wire } from 'lwc';
import getUserContacts from '@salesforce/apex/ContactController.getUserContacts';

export default class ContactDataTable extends LightningElement {
    @track contacts = [];
    @track selectedContacts = [];
    @track isError = false;
    @track errorMessage = '';

    columns = [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'Last Name', fieldName: 'LastName' },
        { label: 'Email', fieldName: 'Email' },
        { label: 'Phone', fieldName: 'Phone' },
        { label: 'Account Name', fieldName: 'Account.Name' },
        { label: 'Created Date', fieldName: 'CreatedDate', type: 'date' }
    ];

    @wire(getUserContacts)
    wiredContacts({ data, error }) {
        if (data) {
            this.contacts = data;
            console.log('Fetched Contacts:', this.contacts);
        } else if (error) {
            this.isError = true;
            this.errorMessage = error.body.message;
            console.error('Error fetching contacts:', error);
        }
    }

    handleRowSelection(event) {
        // Update selectedContacts with selected rows from event
        this.selectedContacts = event.detail.selectedRows;
        console.log('Selected Contacts:', this.selectedContacts);
    }
}
