/*
 * Pre-Req
 * 1. Setup Users with Sales Agent and Sales Team Lead profiles
 * 2. Make sure Product and Pricings are setup, update the PricebookId query filter in this class.
 * 3. Deploy classes: ConsoleSampleData, ConsoleSampleDataCreation, LASMSampleData, LASMSampleDataScript in this order.
 *
 * Execution instruction:
 * If Console Data is already created execute: 
 *   LASMSampleDataScript.setupLASMData();
 * 
 * If You haven't created Console data already, to create both Console and LASM data execute: 
 *   LASMSampleDataScript.setupConsoleAndLASMData();
 * You can also separately execute: 
 *    1. ConsoleSampleDataCreation.createRecords();
 *  2. LASMSampleDataScript.setupLASMData();
 *
 * Optional: If you want to create Opportunities with Quotes in Bulk for an account, feel free to separately execute:
 *  LASMSampleDataScript.createBulkOpportunities('AccountId', OpptyCount);
 * 
 * If you come across CPU Time limit exceeded error, make sure to reduce Apex log level to Debug for Developer-console.
 * 
 * */
public with sharing class LASMSampleDataScript {

    static final String NSP = 'vlocity_cmt__';
    static final List<User> USERS = [select Id from user where Profile.Name in :LASMSampleData.profiles And isActive = true];
    static final String PRICEBOOK_ID = [SELECT Id FROM Pricebook2 where isActive = true and Name = 'Standard Price Book' Limit 1].Id;

    static List<Opportunity> opportunities = new List<Opportunity>();
    static List<Quote> quotes = new List<Quote>();
    static List<Account> businessAcs = new List<Account>();
    static List<Account> serviceAcs = new List<Account>();
    static List<Account> billingAcs = new List<Account>();
    static List<Contact> contacts = new List<Contact>();
    static List<Contract> contracts = new List<Contract>();
    static List<vlocity_cmt__Premises__c> premises = new List<vlocity_cmt__Premises__c>();
    static Map<String, Account> accountNameToAccount = new Map<String, Account>();
    static Map<Id, vlocity_cmt__Premises__c> accountIdToPremises = new Map<Id, vlocity_cmt__Premises__c>();
    static {
        Assert.isTrue(users.size()>2, 'Setup at least 3 Sales users');
        Assert.isNotNull(PRICEBOOK_ID, 'Setup Pricebook');
    }

    public static void setupLASMData()
    {
        setupLeads();
        setupOffices();
        createBulkOpportunities((Id)accountNameToAccount.get('National Storage Bristol').get('Id'),20);
    }

    public static void setupConsoleAndLASMData()
    {
        ConsoleSampleDataCreation.createRecords();
        setupLASMData();
    }

    public static void createBulkOpportunities(Id AccountId, Integer opptyCount)
    {
        List<Opportunity> opptys = new List<Opportunity>();
        Account ac = [Select Id, Name From Account where Id = :AccountId];
        for (Integer i=opptyCount; i>0; i--)
        {
            opptys.add(formNewOpportunity(ac));
        }
        if (!opptys.isEmpty())
        {
            insert opptys;
            Integer quoteCount;
            List<Quote> qts = new List<Quote>();
            for (Opportunity oppty: opptys)
            {
                quoteCount = Integer.valueof((Math.random() * 5));
                for (Integer i=quoteCount; i>0; i--)
                {
                    qts.add(formNewQuote(oppty));
                }
            }
            if (!qts.isEmpty())
            {
                insert qts;
                String query = 'Select Id from PricebookEntry where Pricebook2Id = :PRICEBOOK_ID AND Product2.vlocity_cmt__isOrderable__c = true and isActive =true Limit 100';
                List<PricebookEntry> prods = Database.query(query);
                List<QuoteLineItem> xlis = new List<QuoteLineItem>();
                for (Quote quote: qts)
                {
                    xlis.add(formNewQuoteLineItem(quote, prods[0]));
                }
                insert xlis;
                Set<Id> quoteIds = (new Map<Id,SObject>(qts)).keySet();
                List<QuoteLineItem> qlis = [Select Id,TotalPrice, vlocity_cmt__OneTimeTotal__c from QuoteLineItem WHERE QuoteId in :quoteIds];
                for (QuoteLineItem i: qlis)
                {
                    i.vlocity_cmt__OneTimeTotal__c = i.TotalPrice;
                }
                update qlis;
            }
        }
    }

    private static void setupLeads()
    {
        List<Lead> leads = new List<Lead>();
        for (Integer i=0; i<20; i++)
        {
            leads.add(getNewLeadRecord());
        }
        insert leads;
    }

    private static void setupOffices() {
        String businessRecTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Business').getRecordTypeId();
        String serviceRecTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Service').getRecordTypeId();
        String billingRecTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Billing').getRecordTypeId();
        //First level Business-Accounts
        insertAccounts(LASMSampleData.bAccountsL1, businessRecTypeId, true);
        //Second level Business-Accounts
        insertAccounts(LASMSampleData.bAccountsL2, businessRecTypeId, false);
        //Third level Business-Accounts
        insertAccounts(LASMSampleData.bAccountsL3, businessRecTypeId, false);

        for (Account ba: accountNameToAccount.values()){
            Integer contactCount = (Integer)LASMSampleData.acParams.get(ba.Name).get('contactCount');
            Integer contractCount = (Integer)LASMSampleData.acParams.get(ba.Name).get('contractCount');
            contacts.AddAll(formNewContacts(ba.Id, contactCount));
            contracts.AddAll(formNewContracts(ba, contractCount));
            serviceAcs.add(formNewAccount(ba.Name, ba.Industry, serviceRecTypeId, ba.Id));
            billingAcs.add(formNewAccount(ba.Name, ba.Industry, billingRecTypeId, ba.Id));
        }
        //ServiceAccounts, BillingAccounts, Business-Contacts, Business-Contracts
        List<SObject> objs = new List<SObject>();
        objs.addAll(serviceAcs);
        objs.addAll(billingAcs);
        objs.addAll(contacts);
        objs.addAll(contracts);
        insert objs;
        objs.clear();

        //publishContracts, Premises,LinkPrimaryContactId-OnBusinessAccounts, AccountContactRelation
        Date dateI = Date.newInstance(System.today().year(), 1, 1);
        Integer years = 1;
        for (Contract c: contracts)
        {
            c.StartDate = dateI.addYears(years++);
            c.Status = 'Activated';
        }
        objs.addAll(contracts);

        for (Account a: serviceAcs)
        {
            premises.add(formPremises(a));
        }
        objs.addAll(premises);

        Set<Id> businessAcIds = (new Map<Id,Account>(accountNameToAccount.values())).keySet();
        Map<Id,Contact> aToc= new Map<Id, contact>();
        for (Contact c: contacts)
        {
            aToc.put(c.AccountId, c);
        }
        List<Account> acToUpdate = new List<Account>();
        for (Contact c:aToc.values())
        {
            Account a = new Account();
            a.Id = c.AccountId;
            a.vlocity_cmt__PrimaryContactId__c = c.Id;
            acToUpdate.add(a);
        }
        objs.addAll(acToUpdate);

        List<AccountContactRelation> acrs = [SELECT Account.Name,Id,Roles FROM AccountContactRelation WHERE AccountId in :businessAcIds and Roles = ''];
        for (AccountContactRelation a: acrs)
        {
            a.Roles ='Business User';
        }
        objs.addAll(acrs);

        upsert objs;
        objs.clear();

        //ServicePoints, LinkPremisesToServiceAccounts
        List<vlocity_cmt__ServicePoint__c> sps = new List<vlocity_cmt__ServicePoint__c>();
        for (vlocity_cmt__Premises__c p: premises) {
            sps.addAll(formServicePoints(p));
        }
        objs.addAll(sps);
        acToUpdate = new List<Account>();
        for (Id accId: accountIdToPremises.keySet()){
            Account a = new Account();
            a.Id = accId;
            a.vlocity_cmt__PremisesId__c = (Id)accountIdToPremises.get(accId).get('Id');
            acToUpdate.add(a);
        }
        objs.addAll(acToUpdate);
        upsert objs;
        objs.clear();

        createOpptyQuoteBundle();
    }

    private static void insertAccounts(List<Map<String, String>> accs, Id recTypeId, boolean isRoot) {
        List<Account> accounts = new List<Account>();
        for (Map<String, String> acc: accs) {
            Account ac = formNewAccount(acc.get('name'), acc.get('industry'), recTypeId, null);
            if (!isRoot) {
                ac.ParentId = (Id)accountNameToAccount.get(acc.get('parentId')).get('Id');
            }
            accounts.add(ac);
        }
        insert accounts;
        for(Account a: accounts){
            accountNameToAccount.put(a.Name, a);
        }
    }
    private static Lead getNewLeadRecord()
    {
        Lead l = new Lead();
        l.Status = LASMSampleData.lStatus[Integer.valueOf(Math.random() * LASMSampleData.lstatus.size())];
        l.Rating = LASMSampleData.lrating[Integer.valueOf(Math.random()*3)];
        l.OwnerId = users[Integer.valueOf(Math.random()*users.size())].Id;
        if (LASMSampleData.rstatus.contains(l.Status))
        {
            l.AnnualRevenue = 10*(65 + Math.random()* 1350); // 65 - 2 000, 000
            //l.CurrencyIsoCode = 'EUR';
        }
        Integer rand = Integer.valueOf(Math.random() * LASMSampleData.leadCompany.size());
        l.FirstName = (String)LASMSampleData.leadCompany[rand].get('fName');
        l.LastName = (String)LASMSampleData.leadCompany[rand].get('lName');
        l.Salutation = (String)LASMSampleData.leadCompany[rand].get('sal');
        l.company = (String)LASMSampleData.leadCompany[rand].get('company');

        return l;
    }
    private static Opportunity formNewOpportunity(Account ac)
    {
        Opportunity op = new Opportunity();
        op.closeDate = Date.newInstance((Integer.valueOf(Math.random()*1) + 2021), Integer.valueOf(Math.random()*10),Integer.valueOf(Math.random()*30));
        op.Name = ac.Name + ' ' + LASMSampleData.months[op.closeDate.month()-1] + op.closeDate.year();
        op.Description = op.Name;
        op.AccountId = ac.Id;
        op.StageName = LASMSampleData.stages[Integer.valueof((Math.random() * LASMSampleData.stages.size()))];
        op.amount = 1000 * Integer.valueOf(Math.random()*1000);
        op.Type = LASMSampleData.types[Integer.valueof((Math.random() * LASMSampleData.types.size()))];

        return op;
    }
    private static Quote formNewQuote(Opportunity op)
    {
        Quote quote = new Quote();
        quote.Name = 'Quote For ' + op.Name;
        quote.OpportunityId = op.Id;
        quote.Status = LASMSampleData.allStatus[Integer.valueof((Math.random() * LASMSampleData.allStatus.size()))];
        quote.vlocity_cmt__NumberOfContractedMonths__c = Integer.valueOf(Math.random()*100);
        quote.pricebook2Id = PRICEBOOK_ID;
        return quote;
    }
    private static QuoteLineItem formNewQuoteLineItem(Quote quote, PricebookEntry pbe)
    {
        QuoteLineItem item = new QuoteLineItem();
        item.QuoteId = quote.Id;
        item.PricebookEntryId = pbe.Id;
        item.Quantity = 1 + 10 * Integer.valueOf(Math.random()*100);
        item.UnitPrice = 1 + 100 * Integer.valueOf(Math.random()*100);
        return item;
    }
    private static List<Contact> formNewContacts(Id accountId, Integer count)
    {
        List<Contact> ctcs = new List<Contact>();
        for (Integer i = count; i>0; i--)
        {
            Contact ct = new Contact();
            Integer randomfname = Integer.valueOf(Math.random()*(LASMSampleData.fname.size()-1));
            Integer randomlname = Integer.valueOf(Math.random()*(LASMSampleData.lname.size()-1));
            Integer randomCAIdx = Integer.valueOf(Math.random()*(LASMSampleData.contactAddr.size()-1));

            ct.Birthdate = Date.newInstance((Integer.valueOf(Math.random()*20) + 1970),Integer.valueOf(Math.random()*10),Integer.valueOf(Math.random()*30));
            //ct.Description = 'Desc'+(concount+i+1);
            ct.Email = LASMSampleData.fname[randomfname]+'@'+LASMSampleData.lname[randomlname]+'.com';
            ct.FirstName = LASMSampleData.fname[randomfname];
            ct.LastName = LASMSampleData.lname[randomlname];
            ct.LeadSource = 'Web';
            ct.MailingStreet = Integer.valueOf(1 + Math.random()*100) + ', Street';
            ct.MailingCity = LASMSampleData.contactAddr[randomCAIdx].get('city');
            ct.MailingState = LASMSampleData.contactAddr[randomCAIdx].get('state');
            ct.MailingCountry = 'UK';
            ct.MailingPostalCode = LASMSampleData.contactAddr[randomCAIdx].get('pincode');
            ct.OtherStreet = ct.MailingStreet;
            ct.OtherCity = ct.MailingCity;
            ct.OtherState = ct.MailingState;
            ct.OtherCountry = 'UK';
            ct.OtherPostalCode = ct.MailingPostalCode;
            ct.MobilePhone = '0' + (Integer.valueOf(Math.random()*100000000) + 100000000);
            ct.HomePhone = ct.MobilePhone;
            ct.Phone = ct.MobilePhone;
            ct.Salutation = 'Mr.';
            ct.put(NSP + 'IsActive__c', true);
            ct.AccountId = accountId;
            ctcs.add(ct);
        }
        return ctcs;
    }
    private static Map<String, String> getAddress(String name)
    {
        List<String> temp = name.split(' ');
        String office = temp[temp.size() -1];
        return LASMSampleData.locToAddress.get(office)[0];
    }
    private static Account formNewAccount(String name, String industry, String recTypeId, String parentId)
    {
        //name = 'A4: ' + name;
        //List<String> industry = new List<String>{'Engineering', 'Banking', 'Electronics', 'Chemicals', 'Communications', 'Construction'};
        Map<String, String> addr = getAddress(name);
        Account ac = new Account();
        ac.AccountNumber = 'AC'+Integer.valueOf(Math.random()*1000000000);
        ac.BillingStreet = addr.get('street');
        ac.BillingCity = addr.get('city');
        ac.BillingState = addr.get('state');
        ac.BillingCountry = addr.get('country');
        ac.BillingPostalCode = addr.get('postalCode');
        ac.Industry = String.isBlank(industry) ? 'Retail' : industry;
        ac.Name = name ;//+ ' (' + recType + ')';
        ac.Ownership = 'Private';
        ac.Phone = '0'+(Integer.valueOf(Math.random()*100000000) + 100000000);
        ac.RecordTypeId = recTypeId;
        ac.ShippingStreet = addr.get('street');
        ac.ShippingCity = addr.get('city');
        ac.ShippingState = addr.get('state');
        ac.ShippingCountry = addr.get('country');
        ac.ShippingPostalCode = addr.get('postalCode');
        ac.put(NSP + 'AccountPaymentType__c', 'Prepaid');
        ac.put(NSP + 'BillCycle__c', '1');
        ac.put(NSP + 'BillDeliveryMethod__c', 'Paper Billing');
        ac.put(NSP + 'BillFormat__c', 'Summary');
        ac.put(NSP + 'BillFrequency__c', 'Monthly');
        // ac.put(NSP + 'BillingEmailAddress__c', ct.Email);
        ac.put(NSP + 'ContactPreferences__c', 'eMail;Phone');
        ac.put(NSP + 'CustomerClass__c', 'Residential');
        ac.put(NSP + 'IsRootResolved__c', false);
        // ac.put(NSP + 'PrimaryContactId__c', ct.Id);
        ac.put(NSP + 'Status__c', 'Active');
        ac.put(NSP + 'TaxExemptionType__c', 'Non-exempt');
        ac.put(NSP + 'TaxID__c', '' + (Integer.valueOf(Math.random()*100000000) + 100000000));
        if (parentId != null) {
            ac.ParentId = parentId;
        }
        return ac;
    }
    private static List<Contract> formNewContracts(Account a, Integer count)
    {
        List<Contract> ctrs = new List<Contract>();
        for (Integer i = count; i>0; i--)
        {
            Contract ctr = new Contract();
            ctr.AccountId = a.Id;
            ctr.ContractTerm = Integer.valueOf(12);
            //ctr.CurrencyIsoCode = 'USD';
            ctrs.add(ctr);
        }

        return ctrs;
    }
    private static vlocity_cmt__Premises__c formPremises(Account ac)
    {
        vlocity_cmt__Premises__c prem = (vlocity_cmt__Premises__c)Schema.getGlobalDescribe().get(NSP + 'Premises__c').newSObject();
        prem.put('Name', 'Corporate Tower');
        prem.put(NSP + 'City__c', ac.ShippingCity);
        prem.put(NSP + 'PostalCode__c', ac.ShippingPostalCode);
        prem.put(NSP + 'State__c', ac.ShippingState);
        prem.put(NSP + 'StreetAddress__c', ac.ShippingStreet);
        prem.put(NSP + 'Country__c', ac.ShippingCountry);
        prem.put(NSP + 'PremisesNumber__c', 'PN' + Integer.valueOf(Math.random()*1000000));
        prem.put(NSP + 'PremisesIdentifier__c', '' + Integer.valueOf(Math.random()*1000000));
        accountIdToPremises.put(ac.Id, prem);
        return prem;
    }
    private static List<vlocity_cmt__ServicePoint__c> formServicePoints(vlocity_cmt__Premises__c prem)
    {
        List<vlocity_cmt__ServicePoint__c> sps = new List<vlocity_cmt__ServicePoint__c>();
        List<String> servTypes = new List<String>{'Electricity', 'Gas'}; //, 'Water'
        List<String> voltLevels = new List<String>{'Low', 'Medium', 'High', 'High'};
        List<String> utilityProvider = new List<String>{'Aqua America', 'Crystal Geiser', '4Change', 'Champion Energy', 'Bounce Energy', 'Southern Company', 'Georgia Gas', 'Pacific Gas and Electric', 'Georgia Gas'};
        Integer i =1;
        for (String servType : servTypes)
        {
            String voltLevel = voltLevels[Integer.valueOf((Math.random()*voltLevels.size()))];
            SObject sp = Schema.getGlobalDescribe().get(NSP + 'ServicePoint__c').newSObject();
            sp.put('Name', (String)prem.get('Name') + ' Floor ' + (i++));
            sp.put(NSP + 'PremisesId__c', prem.Id);
            sp.put(NSP + 'ServiceType__c', servType);
            sp.put(NSP + 'ServicePointNumber__c', 'SP' + Integer.valueOf(Math.random()*1000000));
            sp.put(NSP + 'ActivationDate__c', Date.Today());
            sp.put(NSP + 'AverageMonthlyUsage__c', Integer.valueOf((Math.random()*10000)));
            sp.put(NSP + 'LoadProfile__c', 'Residential ' + voltLevel); //Use Residential or SMB
            sp.put(NSP + 'MarketIdentifier__c', String.valueOf(Math.abs(Integer.valueOf(Math.random()*1000000000) * 1000)));
            sp.put(NSP + 'UtilityProvider__c', utilityProvider[Integer.valueOf((Math.random()*utilityProvider.Size()))]);

            if (servType == 'Electricity')
            {
                sp.put(NSP + 'VoltageLevel__c', voltLevel);
            }
            sps.add((vlocity_cmt__ServicePoint__c)sp);
        }
        return sps;
    }
    private static void createOpptyQuoteBundle()
    {
        for (Account ac: accountNameToAccount.values())
        {
            Integer openOpptyCount = Integer.valueof(Math.random() * 3) + 1;
            Boolean headOffice = false, countryOffice = false;
            if (ac.Name.contains('Head'))
            {
                headOffice = true;
            }
            else if (ac.Name.contains('England') || ac.Name.contains('Scotland') || ac.Name.contains('Wales'))
            {
                countryOffice = true;
            }
            
            for (Integer i=openOpptyCount; i>0; i--)
            {
                Opportunity op = formNewOpportunity(ac);
                op.ownerId = (headOffice || countryOffice) ? users[0].Id : (Math.random()<0.5? users[1].Id: users[2].Id);
                    opportunities.add(op);
            }
            Integer closedOpptyCount = headOffice ? 4: (countryOffice ? 2 : 1);
                for (Integer i=closedOpptyCount; i>0; i--)
            {
                Opportunity op = formNewOpportunity(ac);
                op.ownerId = (headOffice || countryOffice) ? users[0].Id : (Math.random()<0.5? users[1].Id: users[2].Id);
                    op.StageName = i==closedOpptyCount ? 'Closed Won' : 'Closed Lost';
                opportunities.add(op);
            }
        }
        if (!opportunities.isEmpty())
        {
            insert opportunities;

            Integer quoteCount = 1 + Integer.valueof((Math.random() * 2));
            for (Opportunity oppty: opportunities)
            {
                for (Integer i=quoteCount; i>0; i--)
                {
                    Quote q = formNewQuote(oppty);
                    q.Name = oppty.Name + ' #' + i;
                    q.OwnerId = oppty.OwnerId;
                    if (oppty.StageName == 'Closed Won')
                    {
                        q.Status = i == quoteCount ? 'Accepted' : 'Rejected';
                    }
                    if (oppty.StageName == 'Closed Lost')
                    {
                        q.Status = 'Rejected';
                    }
                    quotes.add(q);
                }
            }
            if (!quotes.isEmpty())
            {
                insert quotes;
                String query = 'Select Id from PricebookEntry where Pricebook2Id = :PRICEBOOK_ID AND Product2.vlocity_cmt__isOrderable__c = true AND isActive = true Limit 100';
                List<PricebookEntry> prods = Database.query(query);
                List<QuoteLineItem> xlis = new List<QuoteLineItem>();
                for (Quote quote: quotes)
                {
                    xlis.add(formNewQuoteLineItem(quote, prods[Integer.valueof((Math.random() * prods.size()))]));
                }
                insert xlis;
                Set<Id> quoteIds = (new Map<Id,SObject>(quotes)).keySet();
                List<QuoteLineItem> qlis = [Select Id,TotalPrice, vlocity_cmt__OneTimeTotal__c from QuoteLineItem WHERE QuoteId in :quoteIds];
                for (QuoteLineItem i: qlis)
                {   
                    i.vlocity_cmt__OneTimeTotal__c = i.TotalPrice;
                }
                update qlis;
            }
        }
    }
}