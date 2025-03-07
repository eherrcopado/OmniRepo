@isTest
private class SampleResolveRefDateImplTest {

    @testSetup 
    private static void setupData(){
        vlocity_cmt__TriggerSetup__c trigger1 = new vlocity_cmt__TriggerSetup__c(Name = 'AllTriggers', vlocity_cmt__IsTriggerOn__c = true);

        Product2 newPro1 = new Product2(Name='Test Pro1', vlocity_cmt__SellingStartDate__c=System.today(), vlocity_cmt__SellingEndDate__c=System.today(), vlocity_cmt__EndOfLifeDate__c=System.today()+1, vlocity_cmt__EndDate__c=System.today()+2);
        Product2 newPro2 = new Product2(Name='Test Pro2', vlocity_cmt__SellingStartDate__c=System.today(), vlocity_cmt__EndOfLifeDate__c=System.today(), vlocity_cmt__EndDate__c=System.today()+1);
        Product2 newPro3 = new Product2(Name='Test Pro3', vlocity_cmt__SellingStartDate__c=System.today(), vlocity_cmt__EndOfLifeDate__c=System.today(), vlocity_cmt__EndDate__c=System.today()+1);
        Product2 newPro4 = new Product2(Name='Test Pro4', vlocity_cmt__SellingStartDate__c=System.today(), vlocity_cmt__EndOfLifeDate__c=System.today(), vlocity_cmt__EndDate__c=System.today()+1);
        
        insert newPro1;
        insert newPro2;
        insert newPro3;
        insert newPro4;
        
        PricebookEntry pricebookEntry1 = new PricebookEntry(
            Pricebook2Id = Test.getStandardPricebookId(), Product2Id = newPro1.Id, UnitPrice = 0,
            vlocity_cmt__RecurringPrice__c =0, IsActive = true, UseStandardPrice = false);
        insert pricebookEntry1;
        
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        Order testOrder1 = new Order(Name = 'Test Order1', AccountId = testAccount.Id , EffectiveDate = System.today(), status = 'Draft', Pricebook2Id = Test.getStandardPricebookId(), vlocity_cmt__RequestedStartDate__c = System.now().addDays(-5));
        insert testOrder1;

        OrderItem orderItem1 = new OrderItem(OrderId=testOrder1.Id, vlocity_cmt__LineNumber__c = String.valueOf(1), vlocity_cmt__CatalogItemReferenceDateTime__c = System.now(), 
                                            Quantity = 1, UnitPrice = 10, vlocity_cmt__Action__c = 'Add', PricebookEntryId = pricebookEntry1.Id,
                                             vlocity_cmt__ProductHierarchyPath__c = newPro1.Id+'<'+newPro2.Id+'<'+newPro3.Id+'<'+newPro4.Id);
        insert orderItem1;
        
        Order testOrder2 = new Order(Name = 'Test Order2', AccountId = testAccount.Id , EffectiveDate = System.today(), status = 'Draft', Pricebook2Id = Test.getStandardPricebookId());
        insert testOrder2;
        
        Opportunity oppty = new Opportunity(Name='Test Oppty', AccountId = testAccount.Id, Pricebook2Id=Test.getStandardPricebookId(),
                                           StageName='Prospecting',CloseDate = System.today());
        insert oppty;

        OpportunityLineItem opptyItem = new OpportunityLineItem(OpportunityId=oppty.Id, PricebookEntryId = pricebookEntry1.Id, vlocity_cmt__CatalogItemReferenceDateTime__c = System.now(),
                                          vlocity_cmt__LineNumber__c = String.valueOf(1),Quantity = 1, UnitPrice = 100, vlocity_cmt__Action__c = 'Add',
                                          vlocity_cmt__ProductHierarchyPath__c = newPro1.Id+'<'+newPro2.Id+'<'+newPro3.Id+'<'+newPro4.Id);
        insert opptyItem;
        
        Quote testQuote = new Quote(Name='TestQuote',Pricebook2Id = Test.getStandardPricebookId(), OpportunityId=oppty.Id );
        insert testQuote;

        QuoteLineItem qItem = new QuoteLineItem(QuoteId=testQuote.Id, PricebookEntryId = pricebookEntry1.Id, Quantity = 1, UnitPrice = 100, vlocity_cmt__CatalogItemReferenceDateTime__c = System.now(), 
                                                vlocity_cmt__ProductHierarchyPath__c = newPro1.Id+'<'+newPro2.Id+'<'+newPro3.Id+'<'+newPro4.Id);
        insert qItem;
        
    }
    
    private static testMethod void testMethod1(){
        
        SampleResolveRefDateImpl sampleImpl = new SampleResolveRefDateImpl();
        Map<String,Object> input = new Map<String,Object>(); 
        Map<String,Object> output = new Map<String,Object>();
        Map<String,Object> inputMap = new Map<String,Object>();
        Opportunity opp = [Select Id, CreatedDate From Opportunity LIMIT 1];
        
        input.put('parentItemId',opp.Id);
        input.put('parentSObjectType',opp.getSOBjectType());
        inputMap.put('input',input);
        inputMap.put('output',output);
        
        Test.startTest();
        sampleImpl.call('getReferenceDate',inputMap);
        sampleImpl.invokeMethod('getReferenceDate',input, output, null);
        Test.stopTest();
        System.assert((Datetime)output.get('referenceDate') == opp.CreatedDate);
    }
    
}