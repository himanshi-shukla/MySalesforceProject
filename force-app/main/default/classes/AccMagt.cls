@RestResource(urlMapping='/accountmgt/')
Global with sharing class AccMagt {
    @httpGet
    global static List<Account> getTopAcc(){
        List<Account> accList = [SELECT Id, Name,AnnualRevenue FROM Account WHERE AnnualRevenue!=null ];
        return accList;
    }
    }
