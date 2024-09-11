import { LightningElement, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import Id from '@salesforce/user/Id';
import Name from '@salesforce/schema/User.Name';
import RoleName from '@salesforce/schema/User.UserRole.Name';
import ProfileName from '@salesforce/schema/User.Profile.Name';
import Alias from '@salesforce/schema/User.Manager.Alias';


export default class LoggedinUser extends LightningElement {
    userId = Id;
    Username;
    userRoleName;
    userProfileName;
    Alias;

    @wire(getRecord, { recordId: Id, fields: [Name, RoleName, ProfileName, Alias] })

    userDetails({ error, data }) {
        if (error) {
            this.error = error;
        } else if (data) {
            if (data.fields.Name.value != null) {
                this.Username = data.fields.Name.value;
            }
            if (data.fields.UserRole.value != null) {
                this.userRoleName = data.fields.UserRole.value.fields.Name.value;

            }
            if (data.fields.Profile.value != null) {
                this.userProfileName = data.fields.Profile.value.fields.Name.value;
            }
            // if (data.fields.Alias.value != null) {
            //     this.Alias = data.fields.Alias.value.fields.Name.value;
            // }
        }
    }
}