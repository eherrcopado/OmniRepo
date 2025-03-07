/*
* Salesforce, INC. CONFIDENTIAL
* __________________
* ConsoleSampleData 
*
* Author : Divakar Kummara
*
* Description: The Class which defines the Sample data for all the SObjects required for Energy utility console App
*/

public class ConsoleSampleData {

    public static final List<String> ENTITY_SOBJECT_TYPES_2DELETE = new List<String>{
        'Account',
        'vlocity_cmt__Premises__c',
        'Product2',
        'vlocity_cmt__ServicePoint__c',
        'Contact',
        'Contract',
        'Opportunity',
        'vlocity_cmt__InventoryItem__c',
        'AccountContactRelation',
        'vlocity_cmt__Statement__c',
        'Case',
        'Asset',
        'vlocity_cmt__AccountBalance__c',
        'vlocity_cmt__StatementLineItem__c'
    };

    public static Map<Integer, String> monthsMap = new Map<Integer, String>{
        1 => 'January',
        2 => 'February',
        3 => 'March',
        4 => 'April',
        5 => 'May',
        6 => 'June',
        7 => 'July',
        8 => 'August',
        9 => 'September',
        10 => 'October',
        11 => 'November',
        12 => 'December'
    };

    public static final Map<String, Schema.SObjectType> ENTITY_SOBJECT_TYPE_MAPPING = new Map<String, Schema.SObjectType>{
        'BusinessAccounts' => Account.SObjectType,
        'Premises' => vlocity_cmt__Premises__c.SObjectType,
        'Products' => Product2.SObjectType,
        'ServicePoints' => vlocity_cmt__ServicePoint__c.SObjectType,
        'BillingAccounts' => Account.SObjectType,
        'Contacts' => Contact.SObjectType,
        'Contracts' => Contract.SObjectType,
        'ServiceAccounts' => Account.SObjectType,
        'Opportunities' => Opportunity.SObjectType,
        'HierarchyRel' => Account.SObjectType,
        'InventoryItems' => vlocity_cmt__InventoryItem__c.SObjectType,
        'AccountContactRelations' => AccountContactRelation.SObjectType,
        'Statements' => vlocity_cmt__Statement__c.SObjectType,
        'Cases' => Case.SObjectType,
        'Assets' => Asset.SObjectType,
        'AccountBalances' => vlocity_cmt__AccountBalance__c.SObjectType,
        'StatementLineItems' => vlocity_cmt__StatementLineItem__c.SObjectType,
        'ConsumerAccounts' => Account.SObjectType,
        'ConsumerPremises' => vlocity_cmt__Premises__c.SObjectType,
        'ConsumerServicePoints' => vlocity_cmt__ServicePoint__c.SObjectType,
        'ConsumerContacts' => Contact.SObjectType,
        'ConsumerContracts' => Contract.SObjectType,
        'ConsumerOpportunities' => Opportunity.SObjectType,
        'ConsumerHierarchyRel' => Account.SObjectType,
        'ConsumerInventoryItems' => vlocity_cmt__InventoryItem__c.SObjectType,
        'ConsumerAccountContactRelations' => AccountContactRelation.SObjectType,
        'ConsumerStatements' => vlocity_cmt__Statement__c.SObjectType,
        'ConsumerCases' => Case.SObjectType,
        'ConsumerAssets' => Asset.SObjectType,
        'ConsumerAccountBalances' => vlocity_cmt__AccountBalance__c.SObjectType,
        'ConsumerStatementLineItems' => vlocity_cmt__StatementLineItem__c.SObjectType
    };

    static final Map<String, List<Map<String,Object>>> ALL_DATA = new Map<String, List<Map<String,Object>>> {

        'BusinessAccounts' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Imperial Autos - Head Office',
                'AccountNumber' => '111111',
                'BillingCity' => 'Coventry',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'CV3 4LF',
                'BillingState' => 'Warwickshire',
                'BillingStreet' => 'Abbey Road, Whitley',
                'Phone' => '01926 187300',
                'RecordTypeId' => 'Business'
            },
            new Map<String, Object>{
                'Name' => 'Northern Region',
                'AccountNumber' => '666666',
                'BillingCity' => 'Edinburgh',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'EH15 3HR',
                'BillingState' => 'Scotland',
                'BillingStreet' => '5 Whitehill Rd, Newcraighall',
                'Phone' => '3232332213',
                'RecordTypeId' => 'Business'
            },
            new Map<String, Object>{
                'Name' => 'Southern Region',
                'AccountNumber' => '787878',
                'BillingCity' => 'Bristol',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'BS1 1HT',
                'BillingState' => 'Avon',
                'BillingStreet' => '31 Corn St',
                'Phone' => '0117 9822404',
                'RecordTypeId' => 'Business'
            },
            new Map<String, Object>{
                'Name' => 'Midlands Region',
                'AccountNumber' => '444444',
                'BillingCity' => 'Birmingham',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'B4 7SS',
                'BillingState' => 'West Midlands',
                'BillingStreet' => '42 High St',
                'Phone' => '0121 0044543',
                'RecordTypeId' => 'Business'
            },
            new Map<String, Object>{
                'Name' => 'Edinburgh Dealer',
                'AccountNumber' => '777777',
                'BillingCity' => 'Edinburgh',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'EH28 8TG',
                'BillingState' => 'Scotland',
                'BillingStreet' => '1 Skene Pl',
                'Phone' => '0131 4442345',
                'RecordTypeId' => 'Business'
            },
            new Map<String, Object>{
                'Name' => 'Glasgow Dealer',
                'AccountNumber' => '9999999',
                'BillingCity' => 'Glasgow',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'G53 7RA',
                'BillingState' => 'Scotland',
                'BillingStreet' => '900 Kennishead Rd',
                'Phone' => '0141 4302005',
                'RecordTypeId' => 'Business'
            },
            new Map<String, Object>{
                'Name' => 'Newcastle Dealer',
                'AccountNumber' => '121212',
                'BillingCity' => 'Newcastle upon Tyne',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'NE7 7EG',
                'BillingState' => 'Tyne and Wear',
                'BillingStreet' => '22 Benton Rd',
                'Phone' => '0191 2244331',
                'RecordTypeId' => 'Business'
            }
        },

        'Contacts' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'AccountId' => 'Imperial Autos - Head Office',
                'Email' => 'jamescook@headoffice.com',
                'FirstName' => 'James',
                'LastName' => 'Cook',
                'Phone' => '01926 187339',
                'MobilePhone' => '0781 878 1298',
                'MailingCity' => 'Coventry',
                'MailingCountry' => 'United Kingdom',
                'MailingPostalCode' => 'CV3 4LF',
                'MailingState' => 'Warwickshire',
                'MailingStreet' => 'Abbey Road, Whitley',
                'Salutation' => 'Mrs.'
            },
            new Map<String, Object>{
                'AccountId' => 'Imperial Autos - Head Office',
                'Email' => 'fredd@headoffice.com',
                'FirstName' => 'Freddy',
                'LastName' => 'Fed',
                'Phone' => '01926 187335',
                'MobilePhone' => '0782 867 2345'
            },
            new Map<String, Object>{
                'AccountId' => 'Imperial Autos - Head Office',
                'Email' => 'graham@headoffice.com',
                'FirstName' => 'Grahem',
                'LastName' => 'Bell',
                'Phone' => '01926 187318',
                'MobilePhone' => '0781 878 3426',
                'Salutation' => 'Mrs.'
            },
            new Map<String, Object>{
                'AccountId' => 'Imperial Autos - Head Office',
                'Email' => 'jack@headoffice.com',
                'FirstName' => 'Jack',
                'LastName' => 'Bell',
                'Phone' => '0117982240'
            },

            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'Email' => 'jeff@headoffice.com',
                'FirstName' => 'Jeff',
                'LastName' => 'Steiner',
                'Phone' => '0131 878 1282'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'Email' => 'musk@headoffice.com',
                'FirstName' => 'Elon',
                'LastName' => 'Horowitz',
                'Phone' => '0131 878 1272',
                'Salutation' => 'Prof'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'Email' => 'jamesmark@headoffice.com',
                'FirstName' => 'Mark',
                'LastName' => 'James',
                'Phone' => '0131 878 1252'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'Email' => 'ross@headoffice.com',
                'FirstName' => 'Ronald',
                'LastName' => 'Ross',
                'Phone' => '0131 878 1204'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'Email' => 'steveballer@headoffice.com',
                'FirstName' => 'Steve',
                'LastName' => 'Baller',
                'Phone' => '5565545566'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'Email' => 'tom.berry@tb.com',
                'FirstName' => 'Tom',
                'LastName' => 'Berry',
                'Phone' => '5565545345'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'Email' => 'tomgates@headoffice.com',
                'FirstName' => 'Tom',
                'LastName' => 'Gates',
                'Phone' => '0131 878 1256'
            },

            new Map<String, Object>{
                'AccountId' => 'Midlands Region',
                'Email' => 'jamescliff@headoffice.com',
                'FirstName' => 'James',
                'LastName' => 'Cliff',
                'Phone' => '0121 0044543'
            },

            new Map<String, Object>{
                'AccountId' => 'Southern Region',
                'Email' => 'jack1@headoffice.com',
                'FirstName' => 'Jack',
                'LastName' => 'Bell',
                'Phone' => '0117 9822404'
            },

            new Map<String, Object>{
                'AccountId' => 'Edinburgh Dealer',
                'Email' => 'marciajones@headoffice.com',
                'FirstName' => 'Marcia',
                'LastName' => 'Jones',
                'Phone' => '2342423423'
            },

            new Map<String, Object>{
                'AccountId' => 'Glasgow Dealer',
                'Email' => 'sadiqkahn@headoffice.com',
                'FirstName' => 'Sadiq',
                'LastName' => 'Khan',
                'Phone' => '0141 4302005'
            },

            new Map<String, Object>{
                'AccountId' => 'Newcastle Dealer',
                'Email' => 'suzanne@headoffice.com',
                'FirstName' => 'Suzanne',
                'LastName' => 'Vo',
                'Phone' => '0191 2244331'
            }
        },

        'HierarchyRel' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Id' => 'Imperial Autos - Head Office',
                'vlocity_cmt__PrimaryContactId__c' => 'jamescook@headoffice.com'
            },
            new Map<String, Object>{
                'Id' => 'Northern Region',
                'vlocity_cmt__PrimaryContactId__c' => 'jeff@headoffice.com',
                'ParentId' => 'Imperial Autos - Head Office'
            },
            new Map<String, Object>{
                'Id' => 'Southern Region',
                'vlocity_cmt__PrimaryContactId__c' => 'jack@headoffice.com',
                'ParentId' => 'Imperial Autos - Head Office'
            },
            new Map<String, Object>{
                'Id' => 'Midlands Region',
                'vlocity_cmt__PrimaryContactId__c' => 'jamescliff@headoffice.com',
                'ParentId' => 'Imperial Autos - Head Office'
            },
            new Map<String, Object>{
                'Id' => 'Edinburgh Dealer',
                'vlocity_cmt__PrimaryContactId__c' => 'marciajones@headoffice.com',
                'ParentId' => 'Northern Region'
            },
            new Map<String, Object>{
                'Id' => 'Glasgow Dealer',
                'vlocity_cmt__PrimaryContactId__c' => 'marciajones@headoffice.com',
                'ParentId' => 'Northern Region'
            },
            new Map<String, Object>{
                'Id' => 'Newcastle Dealer',
                'vlocity_cmt__PrimaryContactId__c' => 'suzanne@headoffice.com',
                'ParentId' => 'Northern Region'
            }
        },

        'AccountContactRelations' => new List<Map<String,Object>>{
            new Map<String, Object>{
                'AccountId' => 'Imperial Autos - Head Office',
                'ContactId' => 'fredd@headoffice.com',
                'Roles' => 'Property Manager'
            },
            new Map<String, Object>{
                'AccountId' => 'Imperial Autos - Head Office',
                'ContactId' => 'jamescook@headoffice.com',
                'Roles' => 'Primary Contact, Influencer'
            },
            new Map<String, Object>{
                'AccountId' => 'Imperial Autos - Head Office',
                'ContactId' => 'graham@headoffice.com',
                'Roles' => 'Business User'
            },
            new Map<String, Object>{
                'AccountId' => 'Imperial Autos - Head Office',
                'ContactId' => 'jack@headoffice.com',
                'Roles' => 'Business User'
            },

            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'ContactId' => 'musk@headoffice.com',
                'Roles' => 'Decision Maker;Business User'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'ContactId' => 'jeff@headoffice.com',
                'Roles' => 'Economic Decision Maker;Evaluator;Primary Contact'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'ContactId' => 'jamesmark@headoffice.com',
                'Roles' => 'Executive Sponsor;Influencer'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'ContactId' => 'ross@headoffice.com',
                'Roles' => 'Executive Sponsor;Influencer'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'ContactId' => 'steveballer@headoffice.com',
                'Roles' => 'Business User'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'ContactId' => 'tom.berry@tb.com',
                'Roles' => 'Influencer'
            },
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'ContactId' => 'tomgates@headoffice.com',
                'Roles' => 'Other'
            },
            
            new Map<String, Object>{
                'AccountId' => 'Southern Region',
                'ContactId' => 'jack1@headoffice.com',
                'Roles' => 'Decision Maker;Primary Contact'
            },
            
            new Map<String, Object>{
                'AccountId' => 'Midlands Region',
                'ContactId' => 'jamescliff@headoffice.com',
                'Roles' => 'Economic Buyer;Primary Contact'
            },
            
            new Map<String, Object>{
                'AccountId' => 'Edinburgh Dealer',
                'ContactId' => 'marciajones@headoffice.com',
                'Roles' => 'Economic Decision Maker;Primary Contact'
            },
            
            new Map<String, Object>{
                'AccountId' => 'Glasgow Dealer',
                'ContactId' => 'sadiqkahn@headoffice.com',
                'Roles' => 'Evaluator;Primary Contact'
            },
            
            new Map<String, Object>{
                'AccountId' => 'Newcastle Dealer',
                'ContactId' => 'suzanne@headoffice.com',
                'Roles' => 'Economic Buyer;Primary Contact'
            }
        },


        'ServiceAccounts' => new List<Map<String,Object>>{
            new Map<String, Object>{
                'Name' => 'Head Office - Service 1',
                'AccountNumber' => '222222',
                'ShippingCity' => 'Coventry',
                'ShippingCountry' => 'United Kingdom',
                'ShippingPostalCode' => 'CV3 4LF',
                'ShippingState' => 'Warwickshire',
                'ShippingStreet' => 'Abbey Road, Whitley',
                'Phone' => '01926 187300',
                'RecordTypeId' => 'Service',
                'vlocity_cmt__PremisesId__c' => 'Abbey Road, Whitley, Coventry, Warwickshire CV3 4LF, United Kingdom',
                'ParentId' => 'Imperial Autos - Head Office',
                'vlocity_cmt__Status__c' => 'Active'
            },
            
            new Map<String, Object>{
                'Name' => 'Northern Region - Service 1',
                'AccountNumber' => '5656565',
                'ShippingCity' => 'Edinburgh',
                'ShippingCountry' => 'United Kingdom',
                'ShippingPostalCode' => 'EH15 3HR',
                'ShippingState' => 'Scotland',
                'ShippingStreet' => '5 Whitehill Rd, Newcraighall',
                'Phone' => '0131 878 1200',
                'RecordTypeId' => 'Service',
                'vlocity_cmt__PremisesId__c' => '5 Whitehill Rd, Newcraighall, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'ParentId' => 'Northern Region',
                'vlocity_cmt__Status__c' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Northern Region - Service 2',
                'AccountNumber' => '676767',
                'ShippingCity' => 'Edinburgh',
                'ShippingCountry' => 'United Kingdom',
                'ShippingPostalCode' => 'EH15 3HR',
                'ShippingState' => 'Scotland',
                'ShippingStreet' => '5 Whitehill Rd, Newcraighall',
                'Phone' => '0131 878 1200',
                'RecordTypeId' => 'Service',
                'vlocity_cmt__PremisesId__c' => '8 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'ParentId' => 'Northern Region',
                'vlocity_cmt__Status__c' => 'Active'
            },
            
            new Map<String, Object>{
                'Name' => 'Southern Region - Service 1',
                'AccountNumber' => '878787',
                'ShippingCity' => 'Bristol',
                'ShippingCountry' => 'United Kingdom',
                'ShippingPostalCode' => 'BS1 1HT',
                'ShippingState' => 'Avon',
                'ShippingStreet' => '31 Corn St',
                'Phone' => '0117 9822404',
                'RecordTypeId' => 'Service',
                'vlocity_cmt__PremisesId__c' => '31 Corn St, Bristol, Avon, BS1 1HT, United Kingdom',
                'ParentId' => 'Southern Region',
                'vlocity_cmt__Status__c' => 'Active'
            },
            
            new Map<String, Object>{
                'Name' => 'Midlands Region - Service 1',
                'AccountNumber' => '555555',
                'ShippingCity' => 'Birmingham',
                'ShippingCountry' => 'United Kingdom',
                'ShippingPostalCode' => 'B4 7SS',
                'ShippingState' => 'West Midlands',
                'ShippingStreet' => '42 High St',
                'Phone' => '0121 0044543',
                'RecordTypeId' => 'Service',
                'vlocity_cmt__PremisesId__c' => '42 High St, Birmingham, West Midlands, B4 7SS, United Kingdom',
                'ParentId' => 'Midlands Region',
                'vlocity_cmt__Status__c' => 'Active'
            },
            
            new Map<String, Object>{
                'Name' => 'Edinburgh Dealer - Service 1',
                'AccountNumber' => '888888',
                'ShippingCity' => 'Edinburgh',
                'ShippingCountry' => 'United Kingdom',
                'ShippingPostalCode' => 'EH28 8TG',
                'ShippingState' => 'Scotland',
                'ShippingStreet' => '1 Skene Pl',
                'Phone' => '0131 4442345',
                'RecordTypeId' => 'Service',
                'vlocity_cmt__PremisesId__c' => '1 Skene Pl, Edinburgh, Scotland, EH28 8TG, United Kingdom',
                'ParentId' => 'Edinburgh Dealer',
                'vlocity_cmt__Status__c' => 'Active'
            },
            
            new Map<String, Object>{
                'Name' => 'Glasgow Dealer - Service 1',
                'AccountNumber' => '232323',
                'ShippingCity' => 'Glasgow',
                'ShippingCountry' => 'United Kingdom',
                'ShippingPostalCode' => 'G53 7RA',
                'ShippingState' => 'Scotland',
                'ShippingStreet' => '900 Kennishead Rd',
                'Phone' => '0141 4302005',
                'RecordTypeId' => 'Service',
                'vlocity_cmt__PremisesId__c' => '900 Kennishead Rd, Glasgow,Scotland, G53 7RA, United Kingdom',
                'ParentId' => 'Glasgow Dealer',
                'vlocity_cmt__Status__c' => 'Active'
            },
            
            new Map<String, Object>{
                'Name' => 'Newcastle Dealer - Service 1',
                'AccountNumber' => '343434',
                'ShippingCity' => 'Newcastle upon Tyne',
                'ShippingCountry' => 'United Kingdom',
                'ShippingPostalCode' => 'NE7 7EG',
                'ShippingState' => 'Tyne and Wear',
                'ShippingStreet' => '22 Benton Rd',
                'Phone' => '0191 2244331',
                'RecordTypeId' => 'Service',
                'vlocity_cmt__PremisesId__c' => '22 Benton Rd, Newcastle upon Tyne, Tyne and Wear, NE7 7EG, United Kingdom',
                'ParentId' => 'Newcastle Dealer',
                'vlocity_cmt__Status__c' => 'Active'
            }
        },


        'BillingAccounts' => new List<Map<String,Object>>{
            new Map<String, Object>{
                'Name' => 'Head Office - Billing',
                'AccountNumber' => '333333',
                'BillingCity' => 'Coventry',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'CV3 4LF',
                'BillingState' => 'Warwickshire',
                'BillingStreet' => 'Abbey Road, Whitley',
                'Phone' => '01926 187300',
                'RecordTypeId' => 'Billing',
                'ParentId' => 'Imperial Autos - Head Office',
                'vlocity_cmt__Status__c' => 'Active'
            },
            
            new Map<String, Object>{
                'Name' => 'Northern Region - Billing',
                'AccountNumber' => '454545',
                'BillingCity' => 'London',
                'BillingCountry' => 'London',
                'BillingPostalCode' => '34334',
                'BillingState' => 'London',
                'BillingStreet' => '123 west',
                'Phone' => '0131 877 3431',
                'RecordTypeId' => 'Billing',
                'ParentId' => 'Northern Region',
                'vlocity_cmt__Status__c' => 'Active'
            }

        },
        'Premises' => new List<Map<String,Object>>{
            new Map<String, Object>{
                'Name' => 'Abbey Road, Whitley, Coventry, Warwickshire CV3 4LF, United Kingdom',
                'vlocity_cmt__City__c' => 'Coventry',
                'vlocity_cmt__Country__c' => 'United Kingdom',
                'vlocity_cmt__PostalCode__c' => 'CV3 4LF',
                'vlocity_cmt__PremisesIdentifier__c' => '451234',
                'vlocity_cmt__PremisesNumber__c' => '99999',
                'vlocity_cmt__State__c' => 'Warwickshire',
                'vlocity_cmt__Status__c' => 'Vacant',
                'vlocity_cmt__StreetAddress__c' => 'Abbey Road, Whitley'
            },

            new Map<String, Object>{
                'Name' => '5 Whitehill Rd, Newcraighall, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__City__c' => 'Edinburgh',
                'vlocity_cmt__Country__c' => 'United Kingdom',
                'vlocity_cmt__PostalCode__c' => 'EEH15 3HR',
                'vlocity_cmt__PremisesIdentifier__c' => '234843',
                'vlocity_cmt__PremisesNumber__c' => '55555',
                'vlocity_cmt__State__c' => 'Scotland',
                'vlocity_cmt__Status__c' => 'Connected',
                'vlocity_cmt__StreetAddress__c' => '5 Whitehill Rd, Newcraighall'
            },

            new Map<String, Object>{
                'Name' => '8 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__City__c' => 'Edinburgh',
                'vlocity_cmt__Country__c' => 'United Kingdom',
                'vlocity_cmt__PostalCode__c' => 'EH15 3HR',
                'vlocity_cmt__PremisesIdentifier__c' => '291235',
                'vlocity_cmt__PremisesNumber__c' => '77777',
                'vlocity_cmt__State__c' => 'Scotland',
                'vlocity_cmt__Status__c' => 'Connected',
                'vlocity_cmt__StreetAddress__c' => '8 Whitehill Rd, Fort Kinnaird'
            },

            new Map<String, Object>{
                'Name' => '31 Corn St, Bristol, Avon, BS1 1HT, United Kingdom',
                'vlocity_cmt__City__c' => 'Bristol',
                'vlocity_cmt__Country__c' => 'United Kingdom',
                'vlocity_cmt__PostalCode__c' => 'BS1 1HT',
                'vlocity_cmt__PremisesIdentifier__c' => '291299',
                'vlocity_cmt__PremisesNumber__c' => '33333',
                'vlocity_cmt__State__c' => 'Avon',
                'vlocity_cmt__Status__c' => 'Connected',
                'vlocity_cmt__StreetAddress__c' => '31 Corn St'
            },

            new Map<String, Object>{
                'Name' => '42 High St, Birmingham, West Midlands, B4 7SS, United Kingdom',
                'vlocity_cmt__City__c' => 'Birmingham',
                'vlocity_cmt__Country__c' => 'United Kingdom',
                'vlocity_cmt__PostalCode__c' => 'B4 7SS',
                'vlocity_cmt__PremisesIdentifier__c' => '785811',
                'vlocity_cmt__PremisesNumber__c' => '44444',
                'vlocity_cmt__State__c' => 'West Midlands',
                'vlocity_cmt__Status__c' => 'Connected',
                'vlocity_cmt__StreetAddress__c' => '42 High St'
            },

            new Map<String, Object>{
                'Name' => '1 Skene Pl, Edinburgh, Scotland, EH28 8TG, United Kingdom',
                'vlocity_cmt__City__c' => 'Edinburgh',
                'vlocity_cmt__Country__c' => 'United Kingdom',
                'vlocity_cmt__PostalCode__c' => 'EH28 8TG',
                'vlocity_cmt__PremisesIdentifier__c' => '331635',
                'vlocity_cmt__PremisesNumber__c' => '11111',
                'vlocity_cmt__State__c' => 'Scotland',
                'vlocity_cmt__Status__c' => 'Connected',
                'vlocity_cmt__StreetAddress__c' => '1 Skene Pl'
            },

            new Map<String, Object>{
                'Name' => '900 Kennishead Rd, Glasgow,Scotland, G53 7RA, United Kingdom',
                'vlocity_cmt__City__c' => 'Glasgow',
                'vlocity_cmt__Country__c' => 'United Kingdom',
                'vlocity_cmt__PostalCode__c' => 'G53 7RA',
                'vlocity_cmt__PremisesIdentifier__c' => '291635',
                'vlocity_cmt__PremisesNumber__c' => '88888',
                'vlocity_cmt__State__c' => 'Scotland',
                'vlocity_cmt__Status__c' => 'Connected',
                'vlocity_cmt__StreetAddress__c' => '900 Kennishead Rd'
            },

            new Map<String, Object>{
                'Name' => '22 Benton Rd, Newcastle upon Tyne, Tyne and Wear, NE7 7EG, United Kingdom',
                'vlocity_cmt__City__c' => 'Newcastle upon Tyne',
                'vlocity_cmt__Country__c' => 'United Kingdom',
                'vlocity_cmt__PostalCode__c' => 'NE7 7EG',
                'vlocity_cmt__PremisesIdentifier__c' => '101222',
                'vlocity_cmt__PremisesNumber__c' => '22222',
                'vlocity_cmt__State__c' => 'Tyne and Wear',
                'vlocity_cmt__Status__c' => 'Connected',
                'vlocity_cmt__StreetAddress__c' => '22 Benton Rd'
            }

        },

        'ServicePoints' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'E-CV098245',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => 'Abbey Road, Whitley, Coventry, Warwickshire CV3 4LF, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            new Map<String, Object>{
                'Name' => 'G-CV9871233',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => 'Abbey Road, Whitley, Coventry, Warwickshire CV3 4LF, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Gas',
                'vlocity_cmt__Status__c' => 'Connected'
            },

            new Map<String, Object>{
                'Name' => 'E-ED292393',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '5 Whitehill Rd, Newcraighall, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Vacant'
            },
            new Map<String, Object>{
                'Name' => 'ESL-ED847829',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '5 Whitehill Rd, Newcraighall, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            
            new Map<String, Object>{
                'Name' => 'G-ED88634',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '8 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Gas',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            new Map<String, Object>{
                'Name' => 'E-ED987444',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '8 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },

            new Map<String, Object>{
                'Name' => 'E-BS93214',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '31 Corn St, Bristol, Avon, BS1 1HT, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            new Map<String, Object>{
                'Name' => 'G-BS83752',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '31 Corn St, Bristol, Avon, BS1 1HT, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Gas',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            
            new Map<String, Object>{
                'Name' => 'E-MR00654',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '42 High St, Birmingham, West Midlands, B4 7SS, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            new Map<String, Object>{
                'Name' => 'G-MR88655',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '42 High St, Birmingham, West Midlands, B4 7SS, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Gas',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            new Map<String, Object>{
                'Name' => 'W-MR77654',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '42 High St, Birmingham, West Midlands, B4 7SS, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Water',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            
            new Map<String, Object>{
                'Name' => 'E-ED988921',
                'vlocity_cmt__ActivationDate__c' =>Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '1 Skene Pl, Edinburgh, Scotland, EH28 8TG, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Vacant'
            },
            new Map<String, Object>{
                'Name' => 'HV-ED1188353',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '1 Skene Pl, Edinburgh, Scotland, EH28 8TG, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            new Map<String, Object>{
                'Name' => 'ESL-ED773951',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '1 Skene Pl, Edinburgh, Scotland, EH28 8TG, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            
            new Map<String, Object>{
                'Name' => 'E-GL59382',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '900 Kennishead Rd, Glasgow,Scotland, G53 7RA, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            new Map<String, Object>{
                'Name' => 'HV-GL395209',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '900 Kennishead Rd, Glasgow,Scotland, G53 7RA, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            new Map<String, Object>{
                'Name' => 'ESL-GL992385',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '900 Kennishead Rd, Glasgow,Scotland, G53 7RA, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            
            new Map<String, Object>{
                'Name' => 'E-NC59382',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '22 Benton Rd, Newcastle upon Tyne, Tyne and Wear, NE7 7EG, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            new Map<String, Object>{
                'Name' => 'HV-NC395209',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '22 Benton Rd, Newcastle upon Tyne, Tyne and Wear, NE7 7EG, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            new Map<String, Object>{
                'Name' => 'ESL-NC992385',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '22 Benton Rd, Newcastle upon Tyne, Tyne and Wear, NE7 7EG, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            }
        },
        'InventoryItems' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Electricity Meter',
                'vlocity_cmt__PremiseId__c' => 'Abbey Road, Whitley, Coventry, Warwickshire CV3 4LF, United Kingdom',
                'vlocity_cmt__SerialNumber__c' => 'EM11111',
                'vlocity_cmt__ServicePointId__c' => 'G-CV9871233'
            },
            new Map<String, Object>{
                'Name' => 'Gas Meter',
                'vlocity_cmt__PremiseId__c' => 'Abbey Road, Whitley, Coventry, Warwickshire CV3 4LF, United Kingdom',
                'vlocity_cmt__SerialNumber__c' => 'GM11111',
                'vlocity_cmt__ServicePointId__c' => 'E-CV098245'
            },
            
            new Map<String, Object>{
                'Name' => 'Electricity Smart',
                'vlocity_cmt__PremiseId__c' => '5 Whitehill Rd, Newcraighall, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__SerialNumber__c' => 'ES2222',
                'vlocity_cmt__ServicePointId__c' => 'E-ED292393'
            },
            new Map<String, Object>{
                'Name' => 'Electricity Standard',
                'vlocity_cmt__PremiseId__c' => '5 Whitehill Rd, Newcraighall, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__SerialNumber__c' => 'EST3333',
                'vlocity_cmt__ServicePointId__c' => 'ESL-ED847829'
            },
            
            new Map<String, Object>{
                'Name' => 'Electricity Smart New',
                'vlocity_cmt__PremiseId__c' => '42 High St, Birmingham, West Midlands, B4 7SS, United Kingdom',
                'vlocity_cmt__SerialNumber__c' => 'ES2222',
                'vlocity_cmt__ServicePointId__c' => 'E-MR00654'
            },
            new Map<String, Object>{
                'Name' => 'Electricity Standard New',
                'vlocity_cmt__PremiseId__c' => '42 High St, Birmingham, West Midlands, B4 7SS, United Kingdom',
                'vlocity_cmt__SerialNumber__c' => 'EST3333',
                'vlocity_cmt__ServicePointId__c' => 'G-MR88655'
            },
            new Map<String, Object>{
                'Name' => 'Water Standard',
                'vlocity_cmt__PremiseId__c' => '42 High St, Birmingham, West Midlands, B4 7SS, United Kingdom',
                'vlocity_cmt__SerialNumber__c' => 'EST3333',
                'vlocity_cmt__ServicePointId__c' => 'W-MR77654'
            }
        },

        'Products' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Gas',
                'ProductCode' => 'PD_GAS_DUALFUEL',
                'Description' => 'Standard fixed rate gas (discounted as part of a dual fuel offering).',
                'IsActive' => true,
                'Family' => 'Gas'
            },
            new Map<String, Object>{
                'Name' => 'Electricity',
                'ProductCode' => 'PD_ELECTRICITY_DUALFUEL',
                'Description' => 'Standard fixed rate electricity (discounted as part of a dual fuel offering).',
                'IsActive' => true,
                'Family' => 'Electricity'
            },
            new Map<String, Object>{
                'Name' => 'Day/Night Tariff',
                'ProductCode' => 'PD_DAY_NIGHT_TARIFF',
                'Description' => 'Day/Night Tariff energy plan giving you a cheaper electricity rate at night.',
                'IsActive' => true,
                'Family' => 'Electricity'
            },
            new Map<String, Object>{
                'Name' => 'Green Energy Tariff',
                'ProductCode' => 'PD_GREEN_ENERGY_TARIFF',
                'Description' => '100% renewable electricity, an easy way to reduce your carbon footprint..',
                'IsActive' => true,
                'Family' => 'Electricity'
            },
            new Map<String, Object>{
                'Name' => 'Gas Standard Tariff',
                'ProductCode' => 'PD_GAS_STANDARD',
                'Description' => 'Standard fixed rate gas product.',
                'IsActive' => true,
                'Family' => 'Gas'
            }
        },

        'Assets' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Northern Region 2 Gas',
                'AccountId' => 'Northern Region',
                'InstallDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'Product2Id' => 'Gas',
                'SerialNumber' => 'S0012',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month(), Date.today().day()),
                'vlocity_cmt__PremisesId__c' => '8 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__RecurringUOM__c' => 'Monthly',
                'vlocity_cmt__ServiceAccountId__c' => 'Northern Region - Service 2',
                'vlocity_cmt__ServicePointId__c' => 'G-ED88634',
                'vlocity_cmt__UsageQuantity__c' => 200
            },
            new Map<String, Object>{
                'Name' => 'Northern Region 1 Electricity',
                'AccountId' => 'Northern Region',
                'ContactId' => 'ross@headoffice.com',
                'InstallDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'Product2Id' => 'Day/Night Tariff',
                'SerialNumber' => 'S0007',
                'Status' => 'Terminated',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month(), Date.today().day()),
                'vlocity_cmt__BillingAccountId__c' => 'Northern Region - Billing',
                'vlocity_cmt__PremisesId__c' => '5 Whitehill Rd, Newcraighall, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__RecurringUOM__c' => 'Monthly',
                'vlocity_cmt__ServiceAccountId__c' => 'Northern Region - Service 1',
                'vlocity_cmt__ServicePointId__c' => 'E-ED292393',
                'vlocity_cmt__UsageQuantity__c' => 2105
            },
            new Map<String, Object>{
                'Name' => 'Northern Region 1 Security Lighting',
                'AccountId' => 'Northern Region',
                'InstallDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'Product2Id' => 'Electricity',
                'SerialNumber' => 'S0010',
                'Status' => 'Active',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month(), Date.today().day()),
                'vlocity_cmt__BillingAccountId__c' => 'Northern Region - Billing',
                'vlocity_cmt__PremisesId__c' => '5 Whitehill Rd, Newcraighall, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__RecurringUOM__c' => 'Monthly',
                'vlocity_cmt__ServiceAccountId__c' => 'Northern Region - Service 1',
                'vlocity_cmt__ServicePointId__c' => 'ESL-ED847829',
                'vlocity_cmt__UsageQuantity__c' => 985
            },
            new Map<String, Object>{
                'Name' => 'Northern Region 2 Electricity',
                'AccountId' => 'Northern Region',
                'InstallDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'Product2Id' => 'Green Energy Tariff',
                'SerialNumber' => 'S0011',
                'Status' => 'Active',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month(), Date.today().day()),
                'vlocity_cmt__BillingAccountId__c' => 'Northern Region - Billing',
                'vlocity_cmt__PremisesId__c' => '8 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 3HR, United Kingdom',
                'vlocity_cmt__RecurringUOM__c' => 'Monthly',
                'vlocity_cmt__ServiceAccountId__c' => 'Northern Region - Service 2',
                'vlocity_cmt__ServicePointId__c' => 'E-ED987444',
                'vlocity_cmt__UsageQuantity__c' => 2350
            },
            
            new Map<String, Object>{
                'Name' => 'Head Office 1 Electricity',
                'AccountId' => 'Imperial Autos - Head Office',
                'InstallDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'Product2Id' => 'Day/Night Tariff',
                'SerialNumber' => 'S0099',
                'Status' => 'Active',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month(), Date.today().day()),
                'vlocity_cmt__BillingAccountId__c' => 'Head Office - Billing',
                'vlocity_cmt__PremisesId__c' => 'Abbey Road, Whitley, Coventry, Warwickshire CV3 4LF, United Kingdom',
                'vlocity_cmt__RecurringUOM__c' => 'Monthly',
                'vlocity_cmt__ServiceAccountId__c' => 'Head Office - Service 1',
                'vlocity_cmt__ServicePointId__c' => 'E-CV098245',
                'vlocity_cmt__UsageQuantity__c' => 1
            },
            new Map<String, Object>{
                'Name' => 'Head Office 2 Gas',
                'AccountId' => 'Imperial Autos - Head Office',
                'InstallDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'Product2Id' => 'Gas',
                'SerialNumber' => 'S0098',
                'Status' => 'Active',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month(), Date.today().day()),
                'vlocity_cmt__BillingAccountId__c' => 'Head Office - Billing',
                'vlocity_cmt__PremisesId__c' => 'Abbey Road, Whitley, Coventry, Warwickshire CV3 4LF, United Kingdom',
                'vlocity_cmt__RecurringUOM__c' => 'Monthly',
                'vlocity_cmt__ServiceAccountId__c' => 'Head Office - Service 1',
                'vlocity_cmt__ServicePointId__c' => 'G-CV9871233',
                'vlocity_cmt__UsageQuantity__c' => 2
            },
            
            new Map<String, Object>{
                'Name' => 'Edinburgh High Voltage',
                'AccountId' => 'Edinburgh Dealer',
                'InstallDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'Product2Id' => 'Green Energy Tariff',
                'SerialNumber' => 'S0097',
                'Status' => 'Active',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month(), Date.today().day()),
                'vlocity_cmt__PremisesId__c' => '1 Skene Pl, Edinburgh, Scotland, EH28 8TG, United Kingdom',
                'vlocity_cmt__RecurringUOM__c' => 'Monthly',
                'vlocity_cmt__ServiceAccountId__c' => 'Edinburgh Dealer - Service 1',
                'vlocity_cmt__ServicePointId__c' => 'HV-ED1188353',
                'vlocity_cmt__UsageQuantity__c' => 2
            },
            new Map<String, Object>{
                'Name' => 'Edinburgh Office Electricity',
                'AccountId' => 'Edinburgh Dealer',
                'InstallDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'Product2Id' => 'Electricity',
                'SerialNumber' => 'S0096',
                'Status' => 'Active',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month(), Date.today().day()),
                'vlocity_cmt__PremisesId__c' => '1 Skene Pl, Edinburgh, Scotland, EH28 8TG, United Kingdom',
                'vlocity_cmt__RecurringUOM__c' => 'Monthly',
                'vlocity_cmt__ServiceAccountId__c' => 'Edinburgh Dealer - Service 1',
                'vlocity_cmt__ServicePointId__c' => 'E-ED988921',
                'vlocity_cmt__UsageQuantity__c' => 3
            },
            new Map<String, Object>{
                'Name' => 'Edinburgh Security Lighting',
                'AccountId' => 'Edinburgh Dealer',
                'InstallDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'Product2Id' => 'Day/Night Tariff',
                'SerialNumber' => 'S0097',
                'Status' => 'Active',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month(), Date.today().day()),
                'vlocity_cmt__PremisesId__c' => '1 Skene Pl, Edinburgh, Scotland, EH28 8TG, United Kingdom',
                'vlocity_cmt__RecurringUOM__c' => 'Monthly',
                'vlocity_cmt__ServiceAccountId__c' => 'Edinburgh Dealer - Service 1',
                'vlocity_cmt__ServicePointId__c' => 'ESL-ED773951',
                'vlocity_cmt__UsageQuantity__c' => 2
            }
        },

        'Statements' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Head Office ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-6, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-6, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Head Office - Billing',
                'vlocity_cmt__BalanceDue__c' => 3400,
                'vlocity_cmt__CurrentBalance__c' => 3400,
                'vlocity_cmt__CurrentCharges__c' => 3400,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 25),
                'vlocity_cmt__PreviousBalance__c' => 0,
                'vlocity_cmt__ServicesBilled__c' => 3400,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },
            new Map<String, Object>{
                'Name' => 'Head Office ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-5, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-5, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Head Office - Billing',
                'vlocity_cmt__BalanceDue__c' => 0,
                'vlocity_cmt__CurrentBalance__c' => 3750,
                'vlocity_cmt__CurrentCharges__c' => 3750,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 25),
                'vlocity_cmt__PreviousBalance__c' => 10,
                'vlocity_cmt__ServicesBilled__c' => 3750,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },
            new Map<String, Object>{
                'Name' => 'Head Office ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-4, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-4, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Head Office - Billing',
                'vlocity_cmt__BalanceDue__c' => 10,
                'vlocity_cmt__CurrentBalance__c' => 3600,
                'vlocity_cmt__CurrentCharges__c' => 3600,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 25),
                'vlocity_cmt__PreviousBalance__c' => 0,
                'vlocity_cmt__ServicesBilled__c' => 3600,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },

            new Map<String, Object>{
                'Name' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-7, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-7, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Northern Region - Billing',
                'vlocity_cmt__BalanceDue__c' => 0,
                'vlocity_cmt__CurrentBalance__c' => 2831,
                'vlocity_cmt__CurrentCharges__c' => 2831,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-7, 25),
                'vlocity_cmt__PreviousBalance__c' => 0,
                'vlocity_cmt__ServicesBilled__c' => 2831,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-7, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },
            new Map<String, Object>{
                'Name' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-6, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-6, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Northern Region - Billing',
                'vlocity_cmt__BalanceDue__c' => 2237,
                'vlocity_cmt__CurrentBalance__c' => 2237,
                'vlocity_cmt__CurrentCharges__c' => 2237,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 25),
                'vlocity_cmt__PreviousBalance__c' => 700,
                'vlocity_cmt__ServicesBilled__c' => 2237,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },
            new Map<String, Object>{
                'Name' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-5, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-5, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Northern Region - Billing',
                'vlocity_cmt__BalanceDue__c' => 0,
                'vlocity_cmt__CurrentBalance__c' => 2450,
                'vlocity_cmt__CurrentCharges__c' => 2450,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 25),
                'vlocity_cmt__PreviousBalance__c' => 500,
                'vlocity_cmt__ServicesBilled__c' => 2450,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },
            new Map<String, Object>{
                'Name' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-4, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-4, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Northern Region - Billing',
                'vlocity_cmt__BalanceDue__c' => 100,
                'vlocity_cmt__CurrentBalance__c' => 2470,
                'vlocity_cmt__CurrentCharges__c' => 2470,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 25),
                'vlocity_cmt__PreviousBalance__c' => 0,
                'vlocity_cmt__ServicesBilled__c' => 2470,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },
            new Map<String, Object>{
                'Name' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-3, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-3, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Northern Region - Billing',
                'vlocity_cmt__BalanceDue__c' => 0,
                'vlocity_cmt__CurrentBalance__c' => 2456,
                'vlocity_cmt__CurrentCharges__c' => 2456,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-3, 25),
                'vlocity_cmt__PreviousBalance__c' => 0,
                'vlocity_cmt__ServicesBilled__c' => 2456,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-3, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            }
        },

        'StatementLineItems' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Northern Region 1 Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 344,
                'vlocity_cmt__Amount__c' => 344,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000001',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 10),
                'vlocity_cmt__StatementId__c' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-6, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-6, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Northern Region 2 Gas',
                'vlocity_cmt__CurrencyAmount__c' => 344,
                'vlocity_cmt__Amount__c' => 344,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000002',
                'vlocity_cmt__ServiceName__c' => 'Gas',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 10),
                'vlocity_cmt__StatementId__c' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-6, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-6, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Northern Region 1 Security Lighting',
                'vlocity_cmt__CurrencyAmount__c' => 344,
                'vlocity_cmt__Amount__c' => 344,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000003',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 10),
                'vlocity_cmt__StatementId__c' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-6, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-6, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Northern Region 2 Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 1105,
                'vlocity_cmt__Amount__c' => 1150,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000004',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 10),
                'vlocity_cmt__StatementId__c' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-6, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-6, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },

            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Northern Region 1 Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 344,
                'vlocity_cmt__Amount__c' => 344,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000005',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 10),
                'vlocity_cmt__StatementId__c' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-5, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-5, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Northern Region 2 Gas',
                'vlocity_cmt__CurrencyAmount__c' => 1806,
                'vlocity_cmt__Amount__c' => 1806,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000006',
                'vlocity_cmt__ServiceName__c' => 'Gas',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 10),
                'vlocity_cmt__StatementId__c' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-5, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-5, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },

            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Northern Region 1 Security Lighting',
                'vlocity_cmt__CurrencyAmount__c' => 344,
                'vlocity_cmt__Amount__c' => 344,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000007',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 10),
                'vlocity_cmt__StatementId__c' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-4, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-4, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Northern Region 2 Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 2126,
                'vlocity_cmt__Amount__c' => 2126,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000008',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 10),
                'vlocity_cmt__StatementId__c' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-4, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-4, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },

            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Northern Region 1 Security Lighting',
                'vlocity_cmt__CurrencyAmount__c' => 344,
                'vlocity_cmt__Amount__c' => 344,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000009',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-3, 10),
                'vlocity_cmt__StatementId__c' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-3, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-3, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Northern Region 2 Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 2112,
                'vlocity_cmt__Amount__c' => 2112,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000010',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-3, 10),
                'vlocity_cmt__StatementId__c' => 'Northern' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-3, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-3, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },
            //------
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Head Office 1 Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 344,
                'vlocity_cmt__Amount__c' => 344,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000011',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 10),
                'vlocity_cmt__StatementId__c' => 'Head Office ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-6, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-6, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Head Office 2 Gas',
                'vlocity_cmt__CurrencyAmount__c' => 3056,
                'vlocity_cmt__Amount__c' => 3056,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000012',
                'vlocity_cmt__ServiceName__c' => 'Gas',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 10),
                'vlocity_cmt__StatementId__c' => 'Head Office ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-6, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-6, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },

            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Head Office 1 Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 344,
                'vlocity_cmt__Amount__c' => 344,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000013',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 10),
                'vlocity_cmt__StatementId__c' => 'Head Office ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-5, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-5, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Head Office 2 Gas',
                'vlocity_cmt__CurrencyAmount__c' => 3406,
                'vlocity_cmt__Amount__c' => 3406,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000014',
                'vlocity_cmt__ServiceName__c' => 'Gas',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 10),
                'vlocity_cmt__StatementId__c' => 'Head Office ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-5, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-5, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },

            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Head Office 1 Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 344,
                'vlocity_cmt__Amount__c' => 344,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000015',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 10),
                'vlocity_cmt__StatementId__c' => 'Head Office ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-4, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-4, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Head Office 2 Gas',
                'vlocity_cmt__CurrencyAmount__c' => 3256,
                'vlocity_cmt__Amount__c' => 3256,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000016',
                'vlocity_cmt__ServiceName__c' => 'Gas',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 10),
                'vlocity_cmt__StatementId__c' => 'Head Office ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-4, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-4, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 300
            }
        },

        'Contracts' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'BillingCity' => 'Edinburgh',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'EH15 3HR',
                'BillingState' => 'Scotland',
                'BillingStreet' => '5 Whitehill Rd, Newcraighall',
                'ContractTerm' => 55,
                'Status' => 'Draft',
                'StartDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01)
            },
            new Map<String, Object>{
                'AccountId' => 'Imperial Autos - Head Office',
                'BillingCity' => 'Coventry',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'CV3 4LF',
                'BillingState' => 'Warwickshire',
                'BillingStreet' => 'Abbey Road, Whitley',
                'ContractTerm' => 55,
                'Status' => 'Draft',
                'StartDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01)
            }
        },

        'Opportunities' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Northern - Business expansion 1',
                'AccountId' => 'Northern Region',
                'Amount' => 699,
                'CloseDate' => Date.newInstance(Date.today().year() + 1, Date.today().month(), 01),
                'StageName' => 'Prospecting',
                'Probability' => 10,
                'Type' => 'Existing Business'
            },
            new Map<String, Object>{
                'Name' => 'Northern - Business expansion 3',
                'AccountId' => 'Northern Region',
                'Amount' => 800,
                'CloseDate' => Date.newInstance(Date.today().year() + 1, Date.today().month()-1, 01),
                'StageName' => 'Prospecting',
                'Probability' => 10,
                'Type' => 'Existing Business'
            },
            new Map<String, Object>{
                'Name' => 'Northern - Business expansion 2',
                'AccountId' => 'Northern Region',
                'Amount' => 720,
                'CloseDate' => Date.newInstance(Date.today().year() + 1, Date.today().month()-1, 01),
                'StageName' => 'Closed Lost',
                'Probability' => 10,
                'Type' => 'Existing Business'
            },

            new Map<String, Object>{
                'Name' => 'Head Office - Business expansion 1',
                'AccountId' => 'Imperial Autos - Head Office',
                'Amount' => 699,
                'CloseDate' => Date.newInstance(Date.today().year() + 1, Date.today().month()-1, 01),
                'StageName' => 'Prospecting',
                'Probability' => 10,
                'Type' => 'Existing Business'
            },
            new Map<String, Object>{
                'Name' => 'Head Office - Business expansion 3',
                'AccountId' => 'Imperial Autos - Head Office',
                'Amount' => 800,
                'CloseDate' => Date.newInstance(Date.today().year() +1, Date.today().month()-1, 01),
                'StageName' => 'Prospecting',
                'Probability' => 10,
                'Type' => 'Existing Business'
            }
        },

        'Cases' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'AccountId' => 'Northern Region',
                'ContactId' => 'jeff@headoffice.com',
                'Description' => 'Service Type: Electricity - SD',
                'Origin' => 'Phone',
                'Priority' => 'Medium',
                'Status' => 'New',
                'Subject' => 'Meter Turn Off/ Move Out',
                'vlocity_cmt__Severity__c' => 'Major'
            },
            new Map<String, Object>{
                'AccountId' => 'Imperial Autos - Head Office',
                'ContactId' => 'graham@headoffice.com',
                'Description' => 'Service Type: Electricity - SD',
                'Origin' => 'Phone',
                'Priority' => 'Medium',
                'Status' => 'New',
                'Subject' => 'Meter Turn Off/ Move Out',
                'vlocity_cmt__Severity__c' => 'Major'
            }
        },

        'AccountBalances' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'vlocity_cmt__AccountId__c' => 'Northern Region - Billing',
                'vlocity_cmt__Balance__c' => 15456
            },
            new Map<String, Object>{
                'vlocity_cmt__AccountId__c' => 'Head Office - Billing',
                'vlocity_cmt__Balance__c' => 20000
            }
        },
        
        'ConsumerAccounts' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Billy Bing',
                'AccountNumber' => '565758',
                'Industry' => 'Banking',
                'BillingCity' => 'London',
                'BillingCountry' => 'London',
                'BillingPostalCode' => '343399',
                'BillingState' => 'London',
                'BillingStreet' => '123 west',
                'Phone' => '5345345346',
                'RecordTypeId' => 'Consumer',
                'ShippingCity' => 'Edinburgh',
                'ShippingCountry' => 'United Kingdom',
                'ShippingPostalCode' => 'United Kingdom',
                'ShippingState' => 'Scotland',
                'ShippingStreet' => '5 Whitehill Rd, Newcraighall',
                'vlocity_cmt__BillCycle__c' => '2',
                'vlocity_cmt__Status__c' => 'Active'
            }
        },

        'ConsumerContacts' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'AccountId' => 'Billy Bing',
                'Email' => 'james.rawling@billybing.com',
                'FirstName' => 'James',
                'LastName' => 'Rawlings',
                'Phone' => '0131 9876333',
                'MobilePhone' => '9876543223',
                'MailingCity' => 'Luton',
                'MailingCountry' => 'United Kingdom',
                'MailingPostalCode' => 'LU2 9QT',
                'MailingState' => 'London',
                'MailingStreet' => '123 Abbey Road'
            },
            new Map<String, Object>{
                'AccountId' => 'Billy Bing',
                'Email' => 'julia.tom@billybing.com',
                'FirstName' => 'Julia',
                'LastName' => 'Tom',
                'Phone' => '0131 9876333',
                'MobilePhone' => '0782 867 2346'
            }
        },

        'ConsumerHierarchyRel' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Id' => 'Billy Bing',
                'vlocity_cmt__PrimaryContactId__c' => 'james.rawling@billybing.com',
                'vlocity_cmt__PremisesId__c' => '77 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 5HR, United Kingdom'
            }
        },

        'ConsumerAccountContactRelations' => new List<Map<String,Object>>{
            new Map<String, Object>{
                'AccountId' => 'Billy Bing',
                'ContactId' => 'james.rawling@billybing.com',
                'Roles' => 'Influencer;Primary Contact'
            },
            new Map<String, Object>{
                'AccountId' => 'Billy Bing',
                'ContactId' => 'julia.tom@billybing.com',
                'Roles' => 'Economic Buyer'
            }
        },

        'ConsumerPremises' => new List<Map<String,Object>>{
            new Map<String, Object>{
                'Name' => '77 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 5HR, United Kingdom',
                'vlocity_cmt__City__c' => 'Edinburgh',
                'vlocity_cmt__Country__c' => 'United Kingdom',
                'vlocity_cmt__PostalCode__c' => 'EH15 5HR',
                'vlocity_cmt__PremisesIdentifier__c' => '101234',
                'vlocity_cmt__PremisesNumber__c' => '66666',
                'vlocity_cmt__State__c' => 'Scotland',
                'vlocity_cmt__Status__c' => 'Connected',
                'vlocity_cmt__StreetAddress__c' => '77 Whitehill Rd, Fort Kinnaird'
            }
        },

        'ConsumerServicePoints' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'E-BB88900',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '77 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 5HR, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Electricity',
                'vlocity_cmt__Status__c' => 'Connected'
            },
            new Map<String, Object>{
                'Name' => 'G-BB22331',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'vlocity_cmt__PremisesId__c' => '77 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 5HR, United Kingdom',
                'vlocity_cmt__ServiceType__c' => 'Gas',
                'vlocity_cmt__Status__c' => 'Vacant'
            }
        },
        
        'ConsumerInventoryItems' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Gas Meter 601888',
                'vlocity_cmt__PremiseId__c' => '77 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 5HR, United Kingdom',
                'vlocity_cmt__SerialNumber__c' => '601888',
                'vlocity_cmt__ServicePointId__c' => 'G-BB22331'
            },
            new Map<String, Object>{
                'Name' => 'Electricity Meter 601932',
                'vlocity_cmt__PremiseId__c' => '77 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 5HR, United Kingdom',
                'vlocity_cmt__SerialNumber__c' => '601932',
                'vlocity_cmt__ServicePointId__c' => 'E-BB88900'
            }
        },

        'ConsumerAssets' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Billy Bing Gas',
                'AccountId' => 'Billy Bing',
                'ContactId' => 'james.rawling@billybing.com',
                'InstallDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'Product2Id' => 'Gas',
                'SerialNumber' => 'S0002',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month(), Date.today().day()),
                'vlocity_cmt__BillingAccountId__c' => 'Billy Bing',
                'vlocity_cmt__PremisesId__c' => '77 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 5HR, United Kingdom',
                'vlocity_cmt__RecurringUOM__c' => 'Monthly',
                'vlocity_cmt__ServiceAccountId__c' => 'Billy Bing',
                'vlocity_cmt__ServicePointId__c' => 'G-BB22331',
                'vlocity_cmt__UsageQuantity__c' => 100
            },
            new Map<String, Object>{
                'Name' => 'Billy Bing Electricity',
                'AccountId' => 'Billy Bing',
                'ContactId' => 'james.rawling@billybing.com',
                'InstallDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01),
                'Product2Id' => 'Electricity',
                'SerialNumber' => 'S0001',
                'Status' => 'Registered',
                'vlocity_cmt__ActivationDate__c' => Date.newInstance(Date.today().year(), Date.today().month(), Date.today().day()),
                'vlocity_cmt__BillingAccountId__c' => 'Billy Bing',
                'vlocity_cmt__PremisesId__c' => '77 Whitehill Rd, Fort Kinnaird, Edinburgh, Scotland, EH15 5HR, United Kingdom',
                'vlocity_cmt__RecurringUOM__c' => 'Monthly',
                'vlocity_cmt__ServiceAccountId__c' => 'Billy Bing',
                'vlocity_cmt__ServicePointId__c' => 'E-BB88900',
                'vlocity_cmt__UsageQuantity__c' => 6
            }
        },

        'ConsumerStatements' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-6, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-6, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Billy Bing',
                'vlocity_cmt__BalanceDue__c' => 40.00,
                'vlocity_cmt__CurrentBalance__c' => 440.00,
                'vlocity_cmt__CurrentCharges__c' => 434.00,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 25),
                'vlocity_cmt__PreviousBalance__c' => 6.00,
                'vlocity_cmt__ServicesBilled__c' => 434.00,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },
            new Map<String, Object>{
                'Name' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-5, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-5, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Billy Bing',
                'vlocity_cmt__BalanceDue__c' => 0,
                'vlocity_cmt__CurrentBalance__c' => 436,
                'vlocity_cmt__CurrentCharges__c' => 434,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 25),
                'vlocity_cmt__PreviousBalance__c' => 10,
                'vlocity_cmt__ServicesBilled__c' => 434,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },
            new Map<String, Object>{
                'Name' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-4, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-4, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Billy Bing',
                'vlocity_cmt__BalanceDue__c' => 10,
                'vlocity_cmt__CurrentBalance__c' => 450,
                'vlocity_cmt__CurrentCharges__c' => 448,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 25),
                'vlocity_cmt__PreviousBalance__c' => 20,
                'vlocity_cmt__ServicesBilled__c' => 450,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },
            new Map<String, Object>{
                'Name' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-3, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-3, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Billy Bing',
                'vlocity_cmt__BalanceDue__c' => 20,
                'vlocity_cmt__CurrentBalance__c' => 460,
                'vlocity_cmt__CurrentCharges__c' => 450,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-3, 25),
                'vlocity_cmt__PreviousBalance__c' => 10,
                'vlocity_cmt__ServicesBilled__c' => 450,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-3, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },
            new Map<String, Object>{
                'Name' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-2, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-2, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Billy Bing',
                'vlocity_cmt__BalanceDue__c' => 500,
                'vlocity_cmt__CurrentBalance__c' => 440,
                'vlocity_cmt__CurrentCharges__c' => 500,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-2, 25),
                'vlocity_cmt__PreviousBalance__c' => 30,
                'vlocity_cmt__ServicesBilled__c' => 500,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-2, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            },
            new Map<String, Object>{
                'Name' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-1, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-1, 25).year(),
                'vlocity_cmt__AccountId__c' => 'Billy Bing',
                'vlocity_cmt__BalanceDue__c' => 30,
                'vlocity_cmt__CurrentBalance__c' => 438,
                'vlocity_cmt__CurrentCharges__c' => 420,
                'vlocity_cmt__DueDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 25),
                'vlocity_cmt__PreviousBalance__c' => 438,
                'vlocity_cmt__ServicesBilled__c' => 440,
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 10),
                'vlocity_cmt__Status__c' => 'Approved'
            }
        },

        'ConsumerStatementLineItems' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 200,
                'vlocity_cmt__Amount__c' => 200,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000050',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-6, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-6, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 10
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Gas',
                'vlocity_cmt__CurrencyAmount__c' => 144,
                'vlocity_cmt__Amount__c' => 144,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000051',
                'vlocity_cmt__ServiceName__c' => 'Gas',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-6, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-6, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-6, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 20
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 200,
                'vlocity_cmt__Amount__c' => 200,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000053',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-5, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-5, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 10
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Gas',
                'vlocity_cmt__CurrencyAmount__c' => 144,
                'vlocity_cmt__Amount__c' => 144,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000054',
                'vlocity_cmt__ServiceName__c' => 'Gas',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-5, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-5, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-5, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 20
            },

            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 200,
                'vlocity_cmt__Amount__c' => 200,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000005',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-4, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-4, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 10
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Gas',
                'vlocity_cmt__CurrencyAmount__c' => 144,
                'vlocity_cmt__Amount__c' => 144,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000006',
                'vlocity_cmt__ServiceName__c' => 'Gas',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-4, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-4, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-4, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 20
            },

            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 200,
                'vlocity_cmt__Amount__c' => 200,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000007',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-3, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-3, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-3, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 10
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Gas',
                'vlocity_cmt__CurrencyAmount__c' => 144,
                'vlocity_cmt__Amount__c' => 144,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000008',
                'vlocity_cmt__ServiceName__c' => 'Gas',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-3, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-3, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-3, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 20
            },

            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 200,
                'vlocity_cmt__Amount__c' => 200,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000009',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-2, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-2, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-2, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 10
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Gas',
                'vlocity_cmt__CurrencyAmount__c' => 144,
                'vlocity_cmt__Amount__c' => 144,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000010',
                'vlocity_cmt__ServiceName__c' => 'Gas',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-2, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-2, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-2, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 20
            },
            //------
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Electricity',
                'vlocity_cmt__CurrencyAmount__c' => 200,
                'vlocity_cmt__Amount__c' => 200,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000011',
                'vlocity_cmt__ServiceName__c' => 'Electricity',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-1, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-1, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 20
            },
            new Map<String, Object>{
                'vlocity_cmt__AssetId__c' => 'Billy Bing Gas',
                'vlocity_cmt__CurrencyAmount__c' => 144,
                'vlocity_cmt__Amount__c' => 144,
                'vlocity_cmt__CurrentMonthToDate__c' => false,
                'vlocity_cmt__ServiceID__c' => '000000012',
                'vlocity_cmt__ServiceName__c' => 'Gas',
                'vlocity_cmt__StatementDate__c' => Date.newInstance(Date.today().year(), Date.today().month()-1, 10),
                'vlocity_cmt__StatementId__c' => 'Billy Bing Statement ' + monthsMap.get(Date.newInstance(Date.today().year(), Date.today().month()-1, 25).month()) + ' ' + Date.newInstance(Date.today().year(), Date.today().month()-1, 25).year(),
                'vlocity_cmt__UOM__c' => 'Kwh',
                'vlocity_cmt__Usage__c' => 20
            }
        },

        'ConsumerContracts' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'AccountId' => 'Billy Bing',
                'BillingCity' => 'Edinburgh',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'EH15 3HR',
                'BillingState' => 'Scotland',
                'BillingStreet' => '5 Whitehill Rd, Newcraighall',
                'ContractTerm' => 55,
                'Status' => 'Draft',
                'StartDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01)
            },
            new Map<String, Object>{
                'AccountId' => 'Billy Bing',
                'BillingCity' => 'Coventry',
                'BillingCountry' => 'United Kingdom',
                'BillingPostalCode' => 'CV3 4LF',
                'BillingState' => 'Warwickshire',
                'BillingStreet' => 'Abbey Road, Whitley',
                'ContractTerm' => 12,
                'Status' => 'Draft',
                'StartDate' => Date.newInstance(Date.today().year(), Date.today().month()-1, 01)
            }
        },

        'ConsumerOpportunities' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Billy Bing Renewal',
                'AccountId' => 'Billy Bing',
                'Amount' => 4500.00,
                'CloseDate' => Date.newInstance(Date.today().year() + 1, Date.today().month(), 01),
                'StageName' => 'Needs Analysis',
                'Probability' => 20,
                'Type' => 'Existing Business',
                'LeadSource' => 'Trade Show',
                'Description' => 'The deal is at 20% because they are at the sales process stage of defining their requirements. It is not clear whether our solutions are a good fit or not but they are willing to discuss this in detail.'
            }
        },

        'ConsumerCases' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'AccountId' => 'Billy Bing',
                'ContactId' => 'james.rawling@billybing.com',
                'Description' => 'Service Type: Electricity - SD',
                'Origin' => 'Phone',
                'Priority' => 'Medium',
                'Status' => 'New',
                'Subject' => 'Meter Turn Off/ Move Out',
                'vlocity_cmt__Severity__c' => 'Major'
            }
        },

        'ConsumerAccountBalances' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'vlocity_cmt__AccountId__c' => 'Billy Bing',
                'vlocity_cmt__Balance__c' => 15000.00
            }
        }
    }; 

    public static List<SObject> getObjects(String objType) {
        List<Map<String,Object>> objs = ALL_DATA.get(objType);
        List<SObject> toReturn = new List<SObject>();
        Schema.SObjectType sobjType = ENTITY_SOBJECT_TYPE_MAPPING.get(objType);
        for (Map<String,Object> obj: objs) {
            SObject sobj = sobjType.newSObject();
            for (String key: obj.keySet()) {
                Object val = obj.get(key);
                //if (!String.isBlank((String)val)) {
                    sobj.put(key, val);
                //}
            }
            toReturn.add(sobj);
        }
        return toReturn;
    }
}