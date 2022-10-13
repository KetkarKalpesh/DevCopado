import { LightningElement } from 'lwc';

export default class ChildSlotInfo extends LightningElement {

    handleSlotChange(){
        const footerElem = this.template.querySelector('.slds-card__footer')
        if(footerElem){
            footerElem.classList.remove('slds-hide')
        }
    }
}