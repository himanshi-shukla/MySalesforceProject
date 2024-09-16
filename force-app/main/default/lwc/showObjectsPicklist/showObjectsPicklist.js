import { LightningElement } from 'lwc';

export default class ShowObjectsPicklist extends LightningElement {
    selectedObject;
    objectOptions = [
        { label: 'Account', value: 'Account' },
        { label: 'Contact', value: 'Contact' },
        { label: 'Case', value: 'Case' },
        { label: 'Opportunity', value: 'Opportunity' }

    ]

    objectChange(event) {
        this.selectedObject = event.detail.value;
        switch (this.selectedObject) {
            case 'Account': window.location.href = 'https://californiastateuniversityl5-dev-ed.develop.lightning.force.com/lightning/o/Account/new?count=1&nooverride=1&useRecordTypeCheck=1&navigationLocation=LIST_VIEW&uid=170610923132031006&backgroundContext=%2Flightning%2Fo%2FAccount%2Flist%3FfilterName%3DRecent';
                break;

            case 'Contact': window.location.href = 'https://californiastateuniversityl5-dev-ed.develop.lightning.force.com/lightning/o/Contact/new?count=1&nooverride=1&useRecordTypeCheck=1&navigationLocation=LIST_VIEW&uid=170473025442610234&backgroundContext=%2Flightning%2Fo%2FContact%2Flist%3FfilterName%3DRecent';
                break;

            case 'Case': window.location.href = 'https://californiastateuniversityl5-dev-ed.develop.lightning.force.com/lightning/o/Case/new?count=1&nooverride=1&useRecordTypeCheck=1&navigationLocation=LIST_VIEW&uid=170473059065327278&backgroundContext=%2Flightning%2Fo%2FCase%2Flist%3FfilterName%3DRecent';
                break;
            case 'Opportunity':
                window.location.href = 'https://californiastateuniversityl5-dev-ed.develop.lightning.force.com/lightning/o/Opportunity/new?count=2&nooverride=1&useRecordTypeCheck=1&navigationLocation=LIST_VIEW&uid=170473037090656137&backgroundContext=%2Flightning%2Fo%2FOpportunity%2Flist%3FfilterName%3DRecent';
                break;
            default:
                break;

        }
    }
}