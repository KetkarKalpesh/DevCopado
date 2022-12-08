import { LightningElement, wire, track } from 'lwc';
import { getRelatedListRecords } from 'lightning/uiRelatedListApi';

export default class RelatedListComponent extends LightningElement {
    @track data;
    @track columns=[
        {label:'Name', type:'text', fieldName:'Car Name'},
        {label:'Number', type:'number', fieldName:'Car Number'},
        {label:'Name', type:'text', fieldName:'Driver Name'},
    ];

   

    @wire(getRelatedListRecords) 
    retriveRelatedList({ data, error }){
        if(data){
            this.data = data;
        }
        else if(error){
            this.data = undefined;
        }
    }
}