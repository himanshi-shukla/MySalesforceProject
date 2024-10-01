@RestResource(urlMapping='/accountmgt/')
Global with sharing class AccMagt {
    @httpGet
    global static List<Account> getTopAcc(){
        //to make it parameterized
        Map<String, String> accParamMap = RestContext.request.params;

String accIndustry = accParamMap.get('Industry');


        List<Account> accList = [SELECT Id, Name, Industry, AnnualRevenue FROM Account WHERE AnnualRevenue!=null and Industry =: accIndustry];
        return accList;
    }
    }
