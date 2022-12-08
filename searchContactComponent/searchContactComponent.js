import { LightningElement, wire, track } from 'lwc';
import GETCONTACT from '@salesforce/apex/ContactNameClass.getContactName';

const DELAY=400;

export default class ContactSearchComponent extends LightningElement {
    contactName;
    @track contactList=[];

    @wire( GETCONTACT, { conName:'$contactName' })
    retriveContact( {data, error} ){
        if( data ){
            this.contactList=data;
        }
        else if( error ){
            
        }
    }

    handleChange( event ){
        const searchString = event.target.value;
        window.clearTimeout(this.delayTimeout);
        this.delayTimeout = setTimeout(() => {
            this.contactName = searchString;
        }, DELAY);
    }
}
