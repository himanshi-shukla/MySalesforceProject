import { LightningElement, wire, track } from 'lwc';
import getContactsForUser from '@salesforce/apex/ConController.getContactsForUser';
import mergeContacts from '@salesforce/apex/ConController.mergeContacts';

const columns = [
    { label: 'Record', type: 'checkbox' },
    { label: 'Contact First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName' },
    { label: 'Email', fieldName: 'Email' },
    { label: 'Phone', fieldName: 'Phone' },
    { label: 'Related Account Name', fieldName: 'AccountName', type: 'text' },
    { label: 'Created Date', fieldName: 'CreatedDate', type: 'date' }

];

export default class ContactDeDupeFixing extends LightningElement {
    @track contacts;
    @track columns = columns;
    @track selectedContacts = [];
    @track errorMessage;
    @track isModalOpen = false;

    @wire(getContactsForUser)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data.map(contact => ({
                ...contact,
                AccountName: contact.Account ? contact.Account.Name : ''
            }));
        } else if (error) {
            console.error(error);
        }
    }

    handleRowSelection(event) {
        this.selectedContacts = event.detail.selectedRows;
    }

    handleMerge() {
        if (this.selectedContacts.length !== 2) {
            this.errorMessage = 'Please select exactly 2 contacts to merge.';
        } else {
            const [contact1, contact2] = this.selectedContacts;
            mergeContacts({ contact1Id: contact1.Id, contact2Id: contact2.Id })
                .then(result => {
                    if (result === 'success') {
                        this.isModalOpen = true;
                        this.errorMessage = '';
                    } else {
                        this.errorMessage = 'The two selected contacts are not duplicates. You cannot merge them.';
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        }
    }

    closeModal() {
        this.isModalOpen = false;
    }

    confirmMerge() {
        // Handle the final merging logic here
        this.closeModal();
    }
}