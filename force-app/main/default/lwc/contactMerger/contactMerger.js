import { LightningElement, wire, track } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getUserContacts';


export default class ContactMerger extends LightningElement {
    @track contacts;
    @track selectedContacts = [];
    @track showModal = false;

    columns = [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'Last Name', fieldName: 'LastName' },
        { label: 'Email', fieldName: 'Email' },
        { label: 'Phone', fieldName: 'Phone' },
        { label: 'Account Name', fieldName: 'AccountName' },
        { label: 'Created Date', fieldName: 'CreatedDate' }
    ];

    @wire(getContacts)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
        } else if (error) {
            console.error(error);
        }
    }

    handleRowSelection(event) {
        this.selectedContacts = event.detail.selectedRows;
    }

    handleMerge() {
        if (this.selectedContacts.length !== 2) {
            alert('Please select exactly 2 contacts to merge.');
            return;
        }

        const [contact1, contact2] = this.selectedContacts;
        if (contact1.Email === contact2.Email && contact1.AccountId === contact2.AccountId) {
            this.showModal = true;
        } else {
            alert('The two selected contacts are not duplicates. You cannot merge them.');
        }
    }

    closeModal() {
        this.showModal = false;
    }

    mergeContacts() {
        // Logic to merge contacts
        this.showModal = false;
    }
}
