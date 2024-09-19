import { LightningElement, track, wire } from 'lwc';
import getUserContacts from '@salesforce/apex/ContactController.getUserContacts';

export default class ContactMerge extends LightningElement {
    @track contacts = [];
    @track selectedContacts = [];
    @track isError = false;
    @track errorMessage = '';
    @track showModal = false;

    columns = [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'Last Name', fieldName: 'LastName' },
        { label: 'Email', fieldName: 'Email' },
        { label: 'Phone', fieldName: 'Phone' },
        { label: 'Account Name', fieldName: 'AccountName' },
        { label: 'Created Date', fieldName: 'CreatedDate', type: 'date' }
    ];

    @wire(getUserContacts)
    wiredContacts({ data, error }) {
        if (data) {
            this.contacts = data;
        } else if (error) {
            this.showError(error.body.message);
        }
    }

    handleRowSelection(event) {
        this.selectedContacts = event.detail.selectedRows;
    }

    get firstSelectedContactId() {
        return this.selectedContacts.length > 0 ? this.selectedContacts[0].Id : null;
    }

    handleMerge() {
        if (this.selectedContacts.length !== 2) {
            this.showError('Please select exactly two contacts.');
        } else {
            // Handle merge logic
            this.showModal = true;
        }
    }

    showError(message) {
        this.isError = true;
        this.errorMessage = message;
    }

    closeModal() {
        this.showModal = false;
    }
}
