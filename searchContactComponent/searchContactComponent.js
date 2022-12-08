import { LightningElement, wire, track } from 'lwc';
import GetContact from '@salesforce/apex/FetchContactClass.getContact';

const DELAY = 100;

export default class SearchContactComponent extends LightningElement {
    contactName;
    contactList=[];

    @wire(GetContact, {contactName:'$fetchContactClass'})
        retriveContacts( data, error){
            if(data){
                this.contactList=data;
            }
            else if(error){

            }
        }
    
    handleKeyChange(event){
        this.contactName = event.target.value;
    }
}