import { LightningElement, wire, api } from 'lwc';
import accountsWithContacts from '@salesforce/apex/ContactController.getAccountContacts';

export default class AccountContactList extends LightningElement {
    @api recordId; 
    contacts;

    @wire(accountsWithContacts)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
        } else if (error) {

        }
    }
}