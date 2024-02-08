import { LightningElement } from 'lwc';
import getContactList from '@salesforce/apex/getTenContacts.getContactList';
export default class ParentDisplay extends LightningElement {
    contactName;
    contactPhone;
    contactList;

    connectedCallback(){
        getContactList()
        .then(data =>{
            console.log(data);
            this.contactList=data;
        })
        .catch(error => {
            console.log(error);
            
        })
    }
    // captureContactInformation(contactName,contactPhone){
    //     this.contactName = contactName;
    //     this.contactPhone = contactPhone;
    // }

    captureContactInformation(){
        // this.contactName = contactName;
        // this.contactPhone = contactPhone;
        console.log('methodCalled :');
    }
}