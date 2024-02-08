import { LightningElement } from 'lwc';
import createcontact from '@salesforce/apex/DisplayEmployees.createContact'
export default class DisplayEmployees extends LightningElement {
    firstName;
    lastName;
    email;
    phone;
    AccountId;

    ConnectedCallback() {
        console.log("Raghul");
        console.log(this.firstName);
        console.log(this.lastName);
        console.log(this.email);
        console.log(this.phone);
        console.log(this.AccountId);
    }
    onFormDataChange(event) {
        this[event.target.name]
    }

    handleclick() {
        console.log(this.firstname);
        console.log(this.lastname);
        console.log(this.email);
        console.log(this.phone);
        createContact({ firstName: this.firstName, lastName: this.lastName, email: this.email, phone: this.phone })
            .then(data => {
                console.log(data);
                this.generatedContactId = data.Id;
            })
            .catch(error => {
                console.log(error);
            })
    }

}
