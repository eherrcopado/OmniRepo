/*
* Salesforce, INC. CONFIDENTIAL
* __________________
* ConsoleSampleData 
*
* Author : Divakar Kummara
*
* Steps:
    0. Deploy classes: ConsoleSampleData and ConsoleSampleDataCreation
    1. Execute below line of Apex code from Anonymous Window
        ConsoleSampleDataCreation.createRecords();
        Note: Script execution will take around 20 - 30 Seconds. 
    2. Delete classes: ConsoleSampleData and ConsoleSampleDataCreation
*/

public without sharing class ConsoleSampleDataCreation {
 
    static Map<String, List<SObject>> objsMap = new Map<String, List<Sobject>>();
    static Map<String, String> acRoles = new Map<String, String>();

    static final String userId = UserInfo.getUserId();

    static String businessRecTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Business').getRecordTypeId();
    static String billingRecTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Billing').getRecordTypeId();
    static String serviceRecTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Service').getRecordTypeId();
    static String consumerRecTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Consumer').getRecordTypeId();

    public static boolean createRecords() {
        createFirstLevelObjects();
        createSecondLevelObjects();
        createThirdLevelObjects();
        createFourthLevelObjects();
        updateACR();
        updateHierarchy();

        for(String key: objsMap.keySet()) {
            for(SObject sb: objsMap.get(key)) {
                System.debug(key + ' ' +(String)sb.get('Id'));
            }
        }

        return true;
    }

    //Update AccountContactRelation
    //Update ConsumerAccountContactRelation
    static void updateACR() {

        List<SObject> acccrs = ConsoleSampleData.getObjects('AccountContactRelations');
        for (SObject acccr : acccrs) {
            acccr.put('AccountId', getIdFor((String)acccr.get('AccountId'), objsMap.get('BusinessAccounts')));
            acccr.put('ContactId', getIdFor((String)acccr.get('ContactId'), objsMap.get('Contacts')));
            acRoles.put((String)acccr.get('AccountId') + ' ' + (String)acccr.get('ContactId'), (String)acccr.get('Roles'));
        }

        List<SObject> cAccrs = ConsoleSampleData.getObjects('ConsumerAccountContactRelations');
        for (SObject cAccr : cAccrs) {
            cAccr.put('AccountId', getIdFor((String)cAccr.get('AccountId'), objsMap.get('ConsumerAccounts')));
            cAccr.put('ContactId', getIdFor((String)cAccr.get('ContactId'), objsMap.get('ConsumerContacts')));
            acRoles.put((String)cAccr.get('AccountId') + ' ' + (String)cAccr.get('ContactId'), (String)cAccr.get('Roles'));
        }

        List<SObject> bAccounts = objsMap.get('BusinessAccounts');
        for (SObject bAccount : bAccounts) {
            String bAccountId = (String)bAccount.get('Id');

            List<AccountContactRelation> acrs = [Select Id, AccountId, ContactId, Roles from AccountContactRelation where AccountId = :bAccountId];
            for(AccountContactRelation acr: acrs) {
                acr.Roles = acRoles.get((String)acr.AccountId + ' ' + (String)acr.ContactId);
            }
            update acrs;
        }

        List<SObject> cAccounts = objsMap.get('ConsumerAccounts');
        for (SObject cAccount : cAccounts) {
            String cAccountId = (String)cAccount.get('Id');

            List<AccountContactRelation> acrs = [Select Id, AccountId, ContactId, Roles from AccountContactRelation where AccountId = :cAccountId];
            for(AccountContactRelation acr: acrs) {
                acr.Roles = acRoles.get((String)acr.AccountId + ' ' + (String)acr.ContactId);
            }
            update acrs;
        }

    }

    static void updateHierarchy() {
        List<SObject> hRels = ConsoleSampleData.getObjects('HierarchyRel');
        for (SObject hRel : hRels) {
            hRel.put('Id', getIdFor((String)hRel.get('Id'), objsMap.get('BusinessAccounts')));
            hRel.put('vlocity_cmt__PrimaryContactId__c', getIdFor((String)hRel.get('vlocity_cmt__PrimaryContactId__c'), objsMap.get('Contacts')));
            hRel.put('ParentId', getIdFor((String)hRel.get('ParentId'), objsMap.get('BusinessAccounts')));
        }
        update hRels;

        List<SObject> chRels = ConsoleSampleData.getObjects('ConsumerHierarchyRel');
        for (SObject chRel : chRels) {
            chRel.put('Id', getIdFor((String)chRel.get('Id'), objsMap.get('ConsumerAccounts')));
            chRel.put('vlocity_cmt__PrimaryContactId__c', getIdFor((String)chRel.get('vlocity_cmt__PrimaryContactId__c'), objsMap.get('ConsumerContacts')));
            chRel.put('vlocity_cmt__PremisesId__c', getIdFor((String)chRel.get('vlocity_cmt__PremisesId__c'), objsMap.get('ConsumerPremises')));
        }
        update chRels;
    }

    //BusinessAccounts, Premises, Products, 
    //ConsumerAccounts, ConsumerPremises
    static boolean createFirstLevelObjects() {
        List<SObject> objsL0 = new List<SObject>();

        List<SObject> bAccounts = ConsoleSampleData.getObjects('BusinessAccounts');
        for (SObject bAccount : bAccounts) {
            bAccount.put('RecordTypeId', businessRecTypeId);
        }
        objsL0.addAll(bAccounts);
        objsMap.put('BusinessAccounts', bAccounts);

        List<SObject> premises = ConsoleSampleData.getObjects('Premises');
        objsL0.addAll(premises);
        objsMap.put('Premises', premises);

        List<SObject> products = ConsoleSampleData.getObjects('Products');
        objsL0.addAll(products);
        objsMap.put('Products', products);
        
        List<SObject> cAccounts = ConsoleSampleData.getObjects('ConsumerAccounts');
        for (SObject cAccount : cAccounts) {
            cAccount.put('RecordTypeId', consumerRecTypeId);
        }
        objsL0.addAll(cAccounts);
        objsMap.put('ConsumerAccounts', cAccounts);

        List<SObject> cPremises = ConsoleSampleData.getObjects('ConsumerPremises');
        objsL0.addAll(cPremises);
        objsMap.put('ConsumerPremises', cPremises);

        insert objsL0;
        return true;
    }

    //ServicePoints, BillingAccounts, Contacts, Contracts, ServiceAccounts, Opportunities
    //ConsumerServicePoints, ConsumerContacts, ConsumerContracts, ConsumerOpportunities
    static void createSecondLevelObjects() {
        List<SObject> objsL1 = new List<SObject>();
        
        List<SObject> sPoints = ConsoleSampleData.getObjects('ServicePoints');
        for (SObject sPoint: sPoints) {
            sPoint.put('vlocity_cmt__PremisesId__c', getIdFor((String)sPoint.get('vlocity_cmt__PremisesId__c'), objsMap.get('Premises')));
        }
        objsL1.addAll(sPoints);
        objsMap.put('ServicePoints', sPoints);

        List<SObject> biAccounts = ConsoleSampleData.getObjects('BillingAccounts');
        for (SObject biAccount: biAccounts) {
            biAccount.put('ParentId', getIdFor((String)biAccount.get('ParentId'), objsMap.get('BusinessAccounts')));
            biAccount.put('RecordTypeId', billingRecTypeId);
        }
        objsL1.addAll(biAccounts);
        objsMap.put('BillingAccounts', biAccounts);

        List<SObject> contacts = ConsoleSampleData.getObjects('Contacts');
        for (SObject contact:contacts) {
            contact.put('AccountId', getIdFor((String)contact.get('AccountId'), objsMap.get('BusinessAccounts')));
        }
        objsL1.addAll(contacts);
        objsMap.put('Contacts', contacts);

        List<SObject> contracts = ConsoleSampleData.getObjects('Contracts');
        for (SObject contract:contracts) {
            contract.put('AccountId', getIdFor((String)contract.get('AccountId'), objsMap.get('BusinessAccounts')));
        }
        objsL1.addAll(contracts);
        objsMap.put('Contracts', contracts);

        List<SObject> sAccounts = ConsoleSampleData.getObjects('ServiceAccounts');
        for (SObject sAccount:sAccounts) {
            sAccount.put('ParentId', getIdFor((String)sAccount.get('ParentId'), objsMap.get('BusinessAccounts')));
            sAccount.put('RecordTypeId', serviceRecTypeId);
            sAccount.put('vlocity_cmt__PremisesId__c', getIdFor((String)sAccount.get('vlocity_cmt__PremisesId__c'), objsMap.get('Premises')));
        }
        objsL1.addAll(sAccounts);
        objsMap.put('ServiceAccounts', sAccounts);

        List<SObject> opportunities = ConsoleSampleData.getObjects('Opportunities');
        for (SObject opportunity:opportunities) {
            opportunity.put('AccountId', getIdFor((String)opportunity.get('AccountId'), objsMap.get('BusinessAccounts')));
        }
        objsL1.addAll(opportunities);
        objsMap.put('Opportunities', opportunities);
        
        List<SObject> cServicePoints = ConsoleSampleData.getObjects('ConsumerServicePoints');
        for (SObject cServicePoint: cServicePoints) {
            cServicePoint.put('vlocity_cmt__PremisesId__c', getIdFor((String)cServicePoint.get('vlocity_cmt__PremisesId__c'), objsMap.get('ConsumerPremises')));
        }
        objsL1.addAll(cServicePoints);
        objsMap.put('ConsumerServicePoints', cServicePoints);

        List<SObject> cContacts = ConsoleSampleData.getObjects('ConsumerContacts');
        for (SObject cContact:cContacts) {
            cContact.put('AccountId', getIdFor((String)cContact.get('AccountId'), objsMap.get('ConsumerAccounts')));
        }
        objsL1.addAll(cContacts);
        objsMap.put('ConsumerContacts', cContacts);

        List<SObject> cContracts = ConsoleSampleData.getObjects('ConsumerContracts');
        for (SObject cContract:cContracts) {
            cContract.put('AccountId', getIdFor((String)cContract.get('AccountId'), objsMap.get('ConsumerAccounts')));
        }
        objsL1.addAll(cContracts);
        objsMap.put('ConsumerContracts', cContracts);

        List<SObject> cOpportunities = ConsoleSampleData.getObjects('ConsumerOpportunities');
        for (SObject cOpportunity:cOpportunities) {
            cOpportunity.put('AccountId', getIdFor((String)cOpportunity.get('AccountId'), objsMap.get('ConsumerAccounts')));
        }
        objsL1.addAll(cOpportunities);
        objsMap.put('ConsumerOpportunities', cOpportunities);
        
        insert objsL1;
    }

    //InventoryItems, Statements, Cases, Assets, AccountBalances
    //ConsumerInventoryItems, ConsumerStatements, ConsumerCases, ConsumerAssets, ConsumerAccountBalances
    static void createThirdLevelObjects() {
        List<SObject> objsL2 = new List<SObject>();

        List<SObject> iItems = ConsoleSampleData.getObjects('InventoryItems');
        for (SObject iItem : iItems) {
            iItem.put('vlocity_cmt__PremiseId__c', getIdFor((String)iItem.get('vlocity_cmt__PremiseId__c'), objsMap.get('Premises')));
            iItem.put('vlocity_cmt__ServicePointId__c', getIdFor((String)iItem.get('vlocity_cmt__ServicePointId__c'), objsMap.get('ServicePoints')));
        }
        objsL2.addAll(iItems);
        objsMap.put('InventoryItems', iItems);

        List<SObject> cases = ConsoleSampleData.getObjects('Cases');
        for (SObject case1: cases) {
            case1.put('AccountId', getIdFor((String)case1.get('AccountId'), objsMap.get('BusinessAccounts')));
            case1.put('ContactId', getIdFor((String)case1.get('ContactId'), objsMap.get('Contacts')));
        }
        objsL2.addAll(cases);
        objsMap.put('Cases', cases);

        List<SObject> assets = ConsoleSampleData.getObjects('Assets');
        for (SObject asset: assets) {
            asset.put('AccountId', getIdFor((String)asset.get('AccountId'), objsMap.get('BusinessAccounts')));
            asset.put('ContactId', getIdFor((String)asset.get('ContactId'), objsMap.get('Contacts')));
            asset.put('Product2Id', getIdFor((String)asset.get('Product2Id'), objsMap.get('Products')));
            asset.put('vlocity_cmt__BillingAccountId__c', getIdFor((String)asset.get('vlocity_cmt__BillingAccountId__c'), objsMap.get('BillingAccounts')));
            asset.put('vlocity_cmt__ServicePointId__c', getIdFor((String)asset.get('vlocity_cmt__ServicePointId__c'), objsMap.get('ServicePoints')));
            asset.put('vlocity_cmt__PremisesId__c', getIdFor((String)asset.get('vlocity_cmt__PremisesId__c'), objsMap.get('Premises')));
            asset.put('vlocity_cmt__ServiceAccountId__c', getIdFor((String)asset.get('vlocity_cmt__ServiceAccountId__c'), objsMap.get('ServiceAccounts')));
        }
        objsL2.addAll(assets);
        objsMap.put('Assets', assets);

        List<SObject> aBalances = ConsoleSampleData.getObjects('AccountBalances');
        for (SObject aBalance: aBalances) {
            aBalance.put('vlocity_cmt__AccountId__c', getIdFor((String)aBalance.get('vlocity_cmt__AccountId__c'), objsMap.get('BillingAccounts')));
        }
        objsL2.addAll(aBalances);
        objsMap.put('AccountBalances', aBalances);

        List<SObject> statements = ConsoleSampleData.getObjects('Statements');
        for (SObject statement: statements) {
            statement.put('vlocity_cmt__AccountId__c', getIdFor((String)statement.get('vlocity_cmt__AccountId__c'), objsMap.get('BillingAccounts')));
        }
        objsL2.addAll(statements);
        objsMap.put('Statements', statements);
        
        List<SObject> cInventoryItems = ConsoleSampleData.getObjects('ConsumerInventoryItems');
        for (SObject cInventoryItem : cInventoryItems) {
            cInventoryItem.put('vlocity_cmt__PremiseId__c', getIdFor((String)cInventoryItem.get('vlocity_cmt__PremiseId__c'), objsMap.get('ConsumerPremises')));
            cInventoryItem.put('vlocity_cmt__ServicePointId__c', getIdFor((String)cInventoryItem.get('vlocity_cmt__ServicePointId__c'), objsMap.get('ConsumerServicePoints')));
        }
        objsL2.addAll(cInventoryItems);
        objsMap.put('ConsumerInventoryItems', cInventoryItems);

        List<SObject> cCases = ConsoleSampleData.getObjects('ConsumerCases');
        for (SObject cCase: cCases) {
            cCase.put('AccountId', getIdFor((String)cCase.get('AccountId'), objsMap.get('ConsumerAccounts')));
            cCase.put('ContactId', getIdFor((String)cCase.get('ContactId'), objsMap.get('ConsumerContacts')));
        }
        objsL2.addAll(cCases);
        objsMap.put('ConsumerCases', cCases);

        List<SObject> cAssets = ConsoleSampleData.getObjects('ConsumerAssets');
        for (SObject cAsset: cAssets) {
            cAsset.put('AccountId', getIdFor((String)cAsset.get('AccountId'), objsMap.get('ConsumerAccounts')));
            cAsset.put('ContactId', getIdFor((String)cAsset.get('ContactId'), objsMap.get('ConsumerContacts')));
            cAsset.put('Product2Id', getIdFor((String)cAsset.get('Product2Id'), objsMap.get('Products')));
            cAsset.put('vlocity_cmt__BillingAccountId__c', getIdFor((String)cAsset.get('vlocity_cmt__BillingAccountId__c'), objsMap.get('ConsumerAccounts')));
            cAsset.put('vlocity_cmt__ServicePointId__c', getIdFor((String)cAsset.get('vlocity_cmt__ServicePointId__c'), objsMap.get('ConsumerServicePoints')));
            cAsset.put('vlocity_cmt__PremisesId__c', getIdFor((String)cAsset.get('vlocity_cmt__PremisesId__c'), objsMap.get('ConsumerPremises')));
            cAsset.put('vlocity_cmt__ServiceAccountId__c', getIdFor((String)cAsset.get('vlocity_cmt__ServiceAccountId__c'), objsMap.get('ConsumerAccounts')));
        }
        objsL2.addAll(cAssets);
        objsMap.put('ConsumerAssets', cAssets);

        List<SObject> cAccountBalances = ConsoleSampleData.getObjects('ConsumerAccountBalances');
        for (SObject cAccountBalance: cAccountBalances) {
            cAccountBalance.put('vlocity_cmt__AccountId__c', getIdFor((String)cAccountBalance.get('vlocity_cmt__AccountId__c'), objsMap.get('ConsumerAccounts')));
        }
        objsL2.addAll(cAccountBalances);
        objsMap.put('ConsumerAccountBalances', cAccountBalances);

        List<SObject> cStatements = ConsoleSampleData.getObjects('ConsumerStatements');
        for (SObject cStatement: cStatements) {
            cStatement.put('vlocity_cmt__AccountId__c', getIdFor((String)cStatement.get('vlocity_cmt__AccountId__c'), objsMap.get('ConsumerAccounts')));
        }
        objsL2.addAll(cStatements);
        objsMap.put('ConsumerStatements', cStatements);

        insert objsL2;

    } 

    //StatementLineItems
    static void createFourthLevelObjects() {
        List<SObject> objsL3 = new List<SObject>();

        List<SObject> slItems = ConsoleSampleData.getObjects('StatementLineItems');
        for (SObject slItem : slItems) {
            slItem.put('vlocity_cmt__StatementId__c', getIdFor((String)slItem.get('vlocity_cmt__StatementId__c'), objsMap.get('Statements')));
            slItem.put('vlocity_cmt__AssetId__c', getIdFor((String)slItem.get('vlocity_cmt__AssetId__c'), objsMap.get('Assets')));
        }
        objsL3.addAll(slItems);
        objsMap.put('StatementLineItems', slItems);
        
        List<SObject> cStatementLineItems = ConsoleSampleData.getObjects('ConsumerStatementLineItems');
        for (SObject cStatementLineItem : cStatementLineItems) {
            cStatementLineItem.put('vlocity_cmt__StatementId__c', getIdFor((String)cStatementLineItem.get('vlocity_cmt__StatementId__c'), objsMap.get('ConsumerStatements')));
            cStatementLineItem.put('vlocity_cmt__AssetId__c', getIdFor((String)cStatementLineItem.get('vlocity_cmt__AssetId__c'), objsMap.get('ConsumerAssets')));
        }
        objsL3.addAll(cStatementLineItems);
        objsMap.put('ConsumerStatementLineItems', cStatementLineItems);

        insert objsL3;

    }

    static String getIdFor(String name, List<Sobject> fromObjects) {
        if (name == null) return null;

        for (SObject obj : fromObjects) {
            String key = 'Name';
            if(obj.get('Name') == null) {
                key = 'Email';
            }
            if (name.equals(obj.get(key))) {
                return (String)obj.get('Id');
            }
        }
        return null;
    }

}