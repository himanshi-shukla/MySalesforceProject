import { LightningElement } from 'lwc';

export default class EventPreventDefault extends LightningElement {
    name = '';
    email = '';
    handleInputChange(event) {
        const field = event.target.label.toLowerCase();
        if (field === 'name') {
            this.name = event.target.value;
        }
        else if (field === 'email') {
            this.email = event.target.value;
        }
    }

    //handle form submit - using event.preventDefault. 
    //Here the default action is form submission as soon as submit button is clicked but we will add our custom logic to execute when the submit button is clicked.
    handleFormSubmit(event) {
        // Prevent the default form submission
        event.preventDefault();
        // Perform custom logic
        if (this.name && this.email) {
            console.log('Form data here:', { name: this.name, email: this.email });
            // Call Apex to save data, etc.
        }
        else {
            alert('Please fill out all fields.');
        }

    }
}