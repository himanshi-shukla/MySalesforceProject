public class PaymentController {
    @AuraEnabled
    public static String sendPayment(Id caseId) {
        List<Distribution__c> distributions = [SELECT Id, External_Id__c, Amount__c FROM Distribution__c WHERE Service__r.Case__c = :caseId AND Status__c = 'Approved'];
        if (distributions.isEmpty()) {
            return 'No approved distributions found.';
        }

        for (Distribution__c dist : distributions) {
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://cs191.salesforce.com/services/apexrest/test/Payment');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json');
            req.setHeader('Authorization', 'Bearer ' + getAccessToken());

            Map<String, Object> body = new Map<String, Object>();
            body.put('disbursementNumber', dist.External_Id__c);
            body.put('amount', dist.Amount__c);
            req.setBody(JSON.serialize(body));

            Http http = new Http();
            HttpResponse res = http.send(req);

            if (res.getStatusCode() == 200) {
                dist.Status__c = 'Sent';
            } else {
                dist.Status__c = 'Integration Failed';
            }
            update dist;
        }
        return 'Success';
    }

    private static String getAccessToken() {
        // Implement OAuth flow to get access token
        return 'access_token';
    }
}
