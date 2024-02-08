import { LightningElement, wire } from 'lwc';
import getContactsByAccountName from '@salesforce/apex/ContactController.getContactsByAccountName';
export default class ContactListForAccount extends LightningElement {
    accountName = '';
    contacts = [];
    handleAccountNameChange(event) {
        this.accountName = event.target.value;
    }

    @wire(getContactsByAccountName, { accountName: '$accountName' })
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
        } else if (error) {
            console.error('Error loading contacts:', error);
        }
    }
}
