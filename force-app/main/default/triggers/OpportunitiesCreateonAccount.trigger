trigger OpportunitiesCreateonAccount on Account(after insert) {
    
    List<Opportunity> newOpportunity = new List<Opportunity>();

    for (Account acc :Trigger.new) 

    {

        if (acc.number_of_employees__c  > 99) 

        {

            for (Integer i =1; i < 1001; i++)  

            {

                Opportunity opp = new Opportunity();

                opp.Name = acc.Name + i;

                opp.AccountId = acc.Id;

                opp.StageName = 'Prospecting';

                opp.CloseDate = Date.today();

                newOpportunity.add(opp);

            }

        }

    }

    insert newOpportunity; 


}