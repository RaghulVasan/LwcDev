import { LightningElement, api } from 'lwc';

export default class EmplyeeDetail extends LightningElement {
@api
   employeename;
@api
    employeeemail;
 @api
    phone;
@api
    company;
@api
    role;
}