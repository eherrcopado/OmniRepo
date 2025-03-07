public with sharing class LASMSampleData {
    public static List<String> profiles = new List<String>{'SDO-Sales'};
    public static Map<String, List<Map<String, String>>> locToAddress = new Map<String, List<Map<String, String>>>{
        'Office' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Bath Street',
                'city' => 'Nottingham',
                'state' => 'Nottinghamshire',
                'country' => 'England',
                'postalCode' => 'NG1 1BZ'
            }
        },
        'England' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '1 Pioneer Close, Abbey Lane',
                'city' => 'Leicester',
                'state' => 'Leicestershire',
                'country' => 'England',
                'postalCode' => 'LE4 5QY'
            }
        },
        'Bristol' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '78-86 Pennywell Road, Old Market',
                'city' => 'Bristol',
                'state' => 'Bristol',
                'country' => 'England',
                'postalCode' => 'BS5 0TG'
            }
        },
        'Coventry' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Unit 1, Cyan Business Park, Jimmy Hill Way',
                'city' => 'Coventry',
                'state' => 'West Midlands',
                'country' => 'England',
                'postalCode' => 'CV2 4QP'
            }
        },
        'Luton' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Unit 12, Cosgrove Way',
                'city' => 'Luton',
                'state' => 'Bedfordshire',
                'country' => 'England',
                'postalCode' => 'LU1 1XL'
            }
        },
        'Peterborough' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Padholme Road East',
                'city' => 'Peterborough',
                'state' => 'Peterborough',
                'country' => 'England',
                'postalCode' => 'PE1 5XL'
            }
        },
        'Scotland' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '1 Carron Place, Salamander Street',
                'city' => 'Edinburgh',
                'state' => 'Lothian',
                'country' => 'Scotland',
                'postalCode' => 'EH6 7RE'
            }
        },
        'Edinburgh' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Unit 1-3, Eastern Industrial Estate, 62-66 Newcraighall Road',
                'city' => 'Edinburgh',
                'state' => 'Lothian',
                'country' => 'Scotland',
                'postalCode' => 'EH15 3HS'
            }
        },
        'Glasgow' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '9 Canal Street',
                'city' => 'Glasgow',
                'state' => 'Lanarkshire',
                'country' => 'Scotland',
                'postalCode' => 'G4 0AD'
            }
        },
        'Wales' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Unit 1-2, Davis Street',
                'city' => 'Cardiff',
                'state' => 'Glamorgan',
                'country' => 'Wales',
                'postalCode' => 'CF24 2FU'
            }
        },
        'Cardiff' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Unit 1-2, Davis Street',
                'city' => 'Cardiff',
                'state' => 'Glamorgan',
                'country' => 'Wales',
                'postalCode' => 'CF24 2FU'
            }
        },
        'Swansea' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Ashford House, Abergelly Road, Swansea West Industrial Estate',
                'city' => 'Swansea',
                'state' => 'Glamorgan',
                'country' => 'Wales',
                'postalCode' => 'SA54DY'
            }
        },
        'Derby' =>  new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '22 Crown Walk, West Mall,, Intu Centre',
                'city' => 'Derby',
                'state' => 'Derbyshire',
                'country' => 'England',
                'postalCode' => 'DE1 2NP'
            }
        },
        'Evesham' =>  new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '24 Bridge Street',
                'city' => 'Evesham',
                'state' => 'Worcestershire',
                'country' => 'England',
                'postalCode' => 'WR11 4RR'
            }
        },
        'London' =>  new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '114 Strand',
                'city' => 'London',
                'state' => 'Greater London',
                'country' => 'England',
                'postalCode' => 'WC2R 0AG'
            }
        },
        'Manchester' =>  new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '24 Briar Hill Way',
                'city' => 'Salford',
                'state' => 'Greater Manchester',
                'country' => 'England',
                'postalCode' => 'M6 5FD'
            }
        },
        'Chichester' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '21 College Lane',
                'city' => 'Chichester',
                'state' => 'West Sussex',
                'country' => 'England',
                'postalCode' => 'PO19 6PE'
            }
        },
        'Worcester' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '9-13 Pump Street',
                'city' => 'Worcester',
                'state' => 'Worcestershire',
                'country' => 'England',
                'postalCode' => 'WR1 2QX'
            }
        },
        'Birmingham' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Unit 31 Stephenson Place',
                'city' => 'Birmingham',
                'state' => 'West Midlands',
                'country' => 'England',
                'postalCode' => 'B2 4BF'
            }
        },
        'Lewes' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Unit 3 The Friars',
                'city' => 'Lewes',
                'state' => 'East Sussex',
                'country' => 'England',
                'postalCode' => 'BN7 2LE'
            }
        },
        'Solihull' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '8 Crescent Arcade Touchwood Centre',
                'city' => 'Solihull',
                'state' => 'West Midlands',
                'country' => 'England',
                'postalCode' => 'B91 3GZ'
            }
        },
        'Warrington' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'SU50 Golden Square 48 The Mall',
                'city' => 'Warrington',
                'state' => 'Cheshire',
                'country' => 'England',
                'postalCode' => 'WA1 1QP'
            }
        },
        'Cafe' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Palatine Centre, 4 Stockton Rd',
                'city' => 'Durham',
                'state' => 'Durham',
                'country' => 'England',
                'postalCode' => 'DH1 3DX'
            }
        },
        'Club' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '36-38 Mosley St',
                'city' => 'Newcastle upon Tyne',
                'state' => 'Tyne and Wear',
                'country' => 'England',
                'postalCode' => 'NE1 1DF'
            }
        },
        'Deli' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '65 Main St',
                'city' => 'Bingley',
                'state' => 'West Yorkshire',
                'country' => 'England',
                'postalCode' => 'BD16 2HZ'
            }
        },
        'Works' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '29 Hurlbutt Rd, Heathcote Industrial Estate',
                'city' => 'Leamington Spa',
                'state' => 'Warwickshire',
                'country' => 'England',
                'postalCode' => 'CV34 6TB'
            }
        },
        'Styles' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '26 Southgate',
                'city' => 'Chichester',
                'state' => 'West Sussex',
                'country' => 'England',
                'postalCode' => 'PO19 1ES'
            }
        },
        'Shed' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'Hartley House',
                'city' => 'Gretton',
                'state' => 'Gloucestershire',
                'country' => 'England',
                'postalCode' => 'GL54 2AL'
            }
        },
        'Room' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => 'New Market, King Street',
                'city' => 'Maidenhead',
                'state' => 'Berkshire',
                'country' => 'England',
                'postalCode' => 'SL6 1DS'
            }
        },
        'Restaurant' => new List<Map<String, String>>{
            new Map<String, String> {
                'street' => '36-38 Mayflower St',
                'city' => 'Plymouth',
                'state' => 'Devon',
                'country' => 'England',
                'postalCode' => 'PL1 1QX'
            }
        }
    };
    
    //Business Accounts
    public static List<Map<String, String>> bAccountsL1 = new List<Map<String, String>>{
        //standalone
        new Map<String, String>{'name' => 'Hair Styles', 'industry' => 'Hospitality'},
        new Map<String, String>{'name' => 'Granite Works', 'industry' => 'Hospitality'},
        new Map<String, String>{'name' => 'The Deli', 'industry' => 'Hospitality'},
        new Map<String, String>{'name' => 'University Cafe', 'industry' => 'Hospitality'},
        new Map<String, String>{'name' => 'Geordie Club', 'industry' => 'Hospitality'},
        new Map<String, String>{'name' => 'Leather Works', 'industry' => 'Hospitality'},
        new Map<String, String>{'name' => 'The Chip Shed', 'industry' => 'Hospitality'},
        new Map<String, String>{'name' => 'Maggies Tea Room', 'industry' => 'Hospitality'},
        new Map<String, String>{'name' => 'Corner Cafe', 'industry' => 'Hospitality'},
        new Map<String, String>{'name' => 'Pier Head Restaurant', 'industry' => 'Hospitality'},
        //medium
        new Map<String, String>{'name' => 'SpecSavers Head Office', 'industry' => 'Apparel'},
        new Map<String, String>{'name' => 'Paper Chase Head Office', 'industry' => 'Retail'},
        //Large
        new Map<String, String>{'name' => 'National Storage Head Office', 'industry' => 'Retail'}
    };
    public static List<Map<String, String>> bAccountsL2 = new List<Map<String, String>>{
        //medium
        new Map<String, String>{'name' => 'SpecSavers Derby', 'industry' => 'Apparel', 'parentId' => 'SpecSavers Head Office'},
        new Map<String, String>{'name' => 'SpecSavers Evesham', 'industry' => 'Apparel', 'parentId' => 'SpecSavers Head Office'},
        new Map<String, String>{'name' => 'SpecSavers London', 'industry' => 'Apparel', 'parentId' => 'SpecSavers Head Office'},
        new Map<String, String>{'name' => 'SpecSavers Manchester', 'industry' => 'Apparel', 'parentId' => 'SpecSavers Head Office'},
        new Map<String, String>{'name' => 'SpecSavers Worcester', 'industry' => 'Apparel', 'parentId' => 'SpecSavers Head Office'},

        new Map<String, String>{'name' => 'Paper Chase Birmingham', 'industry' => 'Retail', 'parentId' => 'Paper Chase Head Office'},
        new Map<String, String>{'name' => 'Paper Chase Lewes', 'industry' => 'Retail', 'parentId' => 'Paper Chase Head Office'},
        new Map<String, String>{'name' => 'Paper Chase London', 'industry' => 'Retail', 'parentId' => 'Paper Chase Head Office'},
        new Map<String, String>{'name' => 'Paper Chase Solihull', 'industry' => 'Retail', 'parentId' => 'Paper Chase Head Office'},
        new Map<String, String>{'name' => 'Paper Chase Warrington', 'industry' => 'Retail', 'parentId' => 'Paper Chase Head Office'},
        //Large
        new Map<String, String>{'name' => 'National Storage England', 'industry' => 'Retail', 'parentId' => 'National Storage Head Office'},
        new Map<String, String>{'name' => 'National Storage Scotland', 'industry' => 'Retail', 'parentId' => 'National Storage Head Office'},
        new Map<String, String>{'name' => 'National Storage Wales', 'industry' => 'Retail', 'parentId' => 'National Storage Head Office'}
    };
    public static List<Map<String, String>> bAccountsL3 = new List<Map<String, String>>{
        //Large
        new Map<String, String>{'name' => 'National Storage Bristol', 'industry' => 'Retail', 'parentId' => 'National Storage England'},
        new Map<String, String>{'name' => 'National Storage Coventry', 'industry' => 'Retail', 'parentId' => 'National Storage England'},
        new Map<String, String>{'name' => 'National Storage Luton', 'industry' => 'Retail', 'parentId' => 'National Storage England'},
        new Map<String, String>{'name' => 'National Storage Peterborough', 'industry' => 'Retail', 'parentId' => 'National Storage England'},
        new Map<String, String>{'name' => 'National Storage Edinburgh', 'industry' => 'Retail', 'parentId' => 'National Storage Scotland'},
        new Map<String, String>{'name' => 'National Storage Glasgow', 'industry' => 'Retail', 'parentId' => 'National Storage Scotland'},
        new Map<String, String>{'name' => 'National Storage Cardiff', 'industry' => 'Retail', 'parentId' => 'National Storage Wales'},
        new Map<String, String>{'name' => 'National Storage Swansea', 'industry' => 'Retail', 'parentId' => 'National Storage Wales'}
    };
    public static Map<String, Map<String, Object>> acParams = new Map<String, Map<String, Object>>{
        'Hair Styles' => new Map<String, Object>{'contactCount' => 5, 'contractCount' => 2},
        'Granite Works' => new Map<String, Object>{'contactCount' => 4, 'contractCount' => 2},
        'The Deli' => new Map<String, Object>{'contactCount' => 4, 'contractCount' => 2},
        'University Cafe' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'Geordie Club' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'Leather Works' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'The Chip Shed' => new Map<String, Object>{'contactCount' => 2, 'contractCount' => 2},
        'Maggies Tea Room' => new Map<String, Object>{'contactCount' => 2, 'contractCount' => 2},
        'Corner Cafe' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'Pier Head Restaurant' => new Map<String, Object>{'contactCount' => 4, 'contractCount' => 2},
           
        'SpecSavers Head Office' => new Map<String, Object>{'contactCount' => 5, 'contractCount' => 4},
        'SpecSavers Derby' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'SpecSavers Evesham' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'SpecSavers London' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'SpecSavers Manchester' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'SpecSavers Worcester' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},

        'Paper Chase Head Office' => new Map<String, Object>{'contactCount' => 5, 'contractCount' => 4},
        'Paper Chase Birmingham' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'Paper Chase Lewes' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'Paper Chase London' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'Paper Chase Solihull' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'Paper Chase Warrington' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},

        'National Storage Head Office' => new Map<String, Object>{'contactCount' => 5, 'contractCount' => 5},
        'National Storage England' => new Map<String, Object>{'contactCount' => 4, 'contractCount' => 3},
        'National Storage Bristol' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'National Storage Coventry' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'National Storage Luton' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'National Storage Peterborough' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'National Storage Scotland' => new Map<String, Object>{'contactCount' => 4, 'contractCount' => 3},
        'National Storage Edinburgh' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'National Storage Glasgow' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'National Storage Wales' => new Map<String, Object>{'contactCount' => 4, 'contractCount' => 3},
        'National Storage Cardiff' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2},
        'National Storage Swansea' => new Map<String, Object>{'contactCount' => 3, 'contractCount' => 2}
        
    };
    //Leads
    public static List<String> lstatus = new List<String>{'New', 'Nurturing', 'Contacted', 'Qualified', 'Unqualified'};
    public static List<String> rstatus = new List<String>{'Contacted', 'Qalified'};
    public static List<String> lrating = new List<String>{'Hot', 'Warm', 'Cold'};
    static String jsonMap =  '[{"sal":"Mr","fName":"John","lName":"Jackson","company":"Marble Kitchens"},{"sal":"Mr","fName":"Faizel","lName":"Patel","company":"Coventry Hospital"},{"sal":"Mrs","fName":"Mary","lName":"Smith","company":"Bikers Tattoos"},{"sal":"Mr","fName":"Donghai","lName":"Zhao","company":"White Linen Company"},{"sal":"Ms","fName":"Ingrid","lName":"Scneider","company":"Midlands Dental Clinic"},{"sal":"Ms","fName":"Eleanor","lName":"Pickering","company":"Books on the Square"},{"sal":"Mr","fName":"Vincente","lName":"Fernandez","company":"World Tours Travel"},{"sal":"Mr","fName":"Jose","lName":"Rodriguez","company":"Sports World"},{"sal":"Bongani","fName":"Ibrahim","lName":"Mobile","company":"Fone Accessories"},{"sal":"Mrs","fName":"Janice","lName":"Green","company":"Corner Supermarket"},{"sal":"Mrs","fName":"Bhavna","lName":"Reddy","company":"Home Furnishings"},{"sal":"Mr","fName":"Yiannis","lName":"Georgiou","company":"Classic Car Sales"},{"sal":"Mr","fName":"Ric","lName":"Morales","company":"Used Keyboard Emporium"},{"sal":"Ms","fName":"Elena","lName":"Pandazopolous","company":"Elena’s Kitchen"},{"sal":"Mrs","fName":"Monique","lName":"Capel","company":"Hitech Software"},{"sal":"Mr","fName":"Ettiene","lName":"Garnier","company":"Bistrot Romaine"},{"sal":"Mrs","fName":"Ah","lName":"Lam","company":"Chen Oriental Supermarket"},{"sal":"Mr","fName":"Walter","lName":"Meyer","company":"Autorepair Shop"},{"sal":"Mrs","fName":"Mariana","lName":"Garcia","company":"Craftstore"},{"sal":"Ms","fName":"Imani","lName":"Ali","company":"Designer Dress Shop"}]';
    static List<Object> leadCos = (List<Object>) JSON.deserializeUntyped(jsonMap);
    public static List<Map<String, Object>> leadCompany = new List<Map<String, Object>>();

    //Oppty
    public static List<String> stages = new List<String>{'Prospecting', 'Qualification', 'Needs Analysis', 'Value Proposition', 'Id. Decision Makers', 'Perception Analysis', 'Proposal/Price Quote', 'Negotiation/Review'};// , 'Closed Won', 'Closed Lost'
    public static List<String> nameSuffixes = new List<String>{'Installations', 'FY', 'Monthly', 'Charges', 'SLA', 'Small Deal', 'Medium Deal', 'Large Deal', 'Emergency Generator', 'Lab Generators', 'Office Portable Generators', 'Portable Truck Generators', 'Standby Generators', 'Refinery Generators'};
    public static List<String> types = new List<String>{'Existing Customer - Upgrade', 'Existing Customer - Replacement', 'Existing Customer - Downgrade', 'New Customer'};
    public static List<String> months = new List<String>{'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'};
    //quotes
    public static List<String> allStatus = new List<String>{'Draft', 'In Review', 'Needs Review', 'Approved', 'Rejected', 'Presented', 'Accepted', 'Denied'};
    //contacts
    public static List<String> fname = new List<String>{'Mason', 'Jackson',   'Harper', 'Jack', 'Avery', 'Wyatt', 'Carter', 'Grayson', 'Lincoln', 'Hudson', 'Riley', 'Madison', 'Jaxon', 'Parker', 'Hazel', 'Hunter', 'Colton', 'Landon', 'Cooper', 'Easton', 'Everly',   'Addison', 'Jameson', 'Sawyer', 'Greyson', 'Willow', 'River', 'Jaxson', 'Everett', 'Ivy', 'Wesley', 'Kinsley', 'Audrey', 'Waylon', 'Ryder', 'Weston', 'Ruby', 'Emery', 'Hayden', 'Harrison', 'Kingston', 'Hailey',  'Autumn', 'Blake', 'Emerson', 'Myles', 'Tyler', 'Piper', 'Ashton', 'Milo'};
    public static List<String> lname = new List<String>{'Adams', 'Wilson', 'Burton', 'Harris', 'Stevens', 'Robinson', 'Lewis', 'Walker', 'Payne', 'Baker', 'Owen', 'Holmes', 'Chapman',   'Webb', 'Allen', 'Jones', 'Davidson', 'Foster', 'Matthews', 'White', 'Griffiths', 'Knight', 'Corbyn', 'Young', 'Evans', 'Smith', 'Wright', 'Jenkins', 'Green',  'Hughes', 'Taylor', 'Hall', 'Anderson', 'Armstrong', 'Cox', 'Atkinson', 'Bell', 'Carter', 'Cole', 'Collins', 'Dawson', 'Bailey', 'Ball', 'Dixon', 'Edwards', 'Brown', 'Clarke', 'Yates', 'Zelly', 'Zouch', 'Fisher', 'Fletcher'};
    //location
    public static List<Map<String, String>> contactAddr = new List<Map<String, String>>{
        new Map<String, String>{'city' => 'Bath', 'state' => 'Somerset', 'pincode' => 'BA1 1UA'},
        new Map<String, String>{'city' => 'Birmingham', 'state' => 'West Midlands', 'pincode' => 'B1 1AA'},
        new Map<String, String>{'city' => 'Bradford', 'state' => 'West Yorkshire', 'pincode' => 'BD1 1AA'},
        new Map<String, String>{'city' => 'Brighton and Hove', 'state' => 'East Sussex', 'pincode' => 'BN1 1AA'},
        new Map<String, String>{'city' => 'Bristol', 'state' => 'Somerset', 'pincode' => 'BS1 1AA'},
        new Map<String, String>{'city' => 'Cambridge', 'state' => 'Cambridgeshire', 'pincode' => 'CB1 1AA'},
        new Map<String, String>{'city' => 'Canterbury', 'state' => 'Kent', 'pincode' => 'CT1 1AA'},
        new Map<String, String>{'city' => 'Carlisle', 'state' => 'Cumbria', 'pincode' => 'CA1 1AA'},
        new Map<String, String>{'city' => 'Chester', 'state' => 'Cheshire', 'pincode' => 'CH1 1AA'},
        new Map<String, String>{'city' => 'Chelmsford', 'state' => 'Essex', 'pincode' => 'CM1 1AA'},
        new Map<String, String>{'city' => 'Chichester', 'state' => 'West Sussex', 'pincode' => 'PO19 1AR'},
        new Map<String, String>{'city' => 'Coventry', 'state' => 'West Midlands', 'pincode' => 'CV1 1AB'},
        new Map<String, String>{'city' => 'Derby', 'state' => 'Derbyshire', 'pincode' => 'DE1 2XY'},
        new Map<String, String>{'city' => 'Durham', 'state' => 'County Durham', 'pincode' => 'DH1 4XX'},
        new Map<String, String>{'city' => 'Ely', 'state' => 'Cambridgeshire', 'pincode' => 'CB7 4XX'},
        new Map<String, String>{'city' => 'Exeter', 'state' => 'Devon', 'pincode' => 'EX1 2AB'},
        new Map<String, String>{'city' => 'Gloucester', 'state' => 'Gloucestershire', 'pincode' => 'GL1 4CD'},
        new Map<String, String>{'city' => 'Hereford', 'state' => 'Herefordshire', 'pincode' => 'HR1 3EF'},
        new Map<String, String>{'city' => 'Kingston upon Hull', 'state' => 'East Yorkshire', 'pincode' => 'HU1 2FG'},
        new Map<String, String>{'city' => 'Lancaster', 'state' => 'Lancashire', 'pincode' => 'LA1 3GH'},
        new Map<String, String>{'city' => 'Leeds', 'state' => 'West Yorkshire', 'pincode' => 'LS1 1AA'},
        new Map<String, String>{'city' => 'Leicester', 'state' => 'Leicestershire', 'pincode' => 'LE1 1AA'},
        new Map<String, String>{'city' => 'Lichfield', 'state' => 'Staffordshire', 'pincode' => 'WS13 6XX'},
        new Map<String, String>{'city' => 'Lincoln', 'state' => 'Lincolnshire', 'pincode' => 'LN1 1XX'},
        new Map<String, String>{'city' => 'Liverpool', 'state' => 'Merseyside', 'pincode' => 'L1 1AA'},
        new Map<String, String>{'city' => 'London', 'state' => 'Greater London', 'pincode' => 'SW1A 1AA'},
        new Map<String, String>{'city' => 'Manchester', 'state' => 'Greater Manchester', 'pincode' => 'M1 1AA'},
        new Map<String, String>{'city' => 'Norwich', 'state' => 'Norfolk', 'pincode' => 'NR1 1AA'},
        new Map<String, String>{'city' => 'Nottingham', 'state' => 'Nottinghamshire', 'pincode' => 'NG1 1AA'},
        new Map<String, String>{'city' => 'Oxford', 'state' => 'Oxfordshire', 'pincode' => 'OX1 1AA'},
        new Map<String, String>{'city' => 'Peterborough', 'state' => 'Cambridgeshire', 'pincode' => 'PE1 2XY'},
        new Map<String, String>{'city' => 'Plymouth', 'state' => 'Devon', 'pincode' => 'PL1 4CD'},
        new Map<String, String>{'city' => 'Portsmouth', 'state' => 'Hampshire', 'pincode' => 'PO1 3EF'},
        new Map<String, String>{'city' => 'Preston', 'state' => 'Lancashire', 'pincode' => 'PR1 5FG'},
        new Map<String, String>{'city' => 'Ripon', 'state' => 'North Yorkshire', 'pincode' => 'HG4 1HI'},
        new Map<String, String>{'city' => 'Salford', 'state' => 'Greater Manchester', 'pincode' => 'M5 4JK'},
        new Map<String, String>{'city' => 'Salisbury', 'state' => 'Wiltshire', 'pincode' => 'SP1 6LM'},
        new Map<String, String>{'city' => 'Sheffield', 'state' => 'South Yorkshire', 'pincode' => 'S1 7NO'},
        new Map<String, String>{'city' => 'Southampton', 'state' => 'Hampshire', 'pincode' => 'SO14 5PQ'},
        new Map<String, String>{'city' => 'St Albans', 'state' => 'Hertfordshire', 'pincode' => 'AL1 8RS'},
        new Map<String, String>{'city' => 'Sunderland', 'state' => 'Tyne and Wear', 'pincode' => 'SR1 2AB'},
        new Map<String, String>{'city' => 'Truro', 'state' => 'Cornwall', 'pincode' => 'TR1 1BH'},
        new Map<String, String>{'city' => 'Wakefield', 'state' => 'West Yorkshire', 'pincode' => 'WF1 1HA'},
        new Map<String, String>{'city' => 'Wells', 'state' => 'Somerset', 'pincode' => 'BA5 2AA'},
        new Map<String, String>{'city' => 'Westminster', 'state' => 'Greater London', 'pincode' => 'SW1A 1AA'},
        new Map<String, String>{'city' => 'Winchester', 'state' => 'Hampshire', 'pincode' => 'SO23 9JA'},
        new Map<String, String>{'city' => 'Wolverhampton', 'state' => 'West Midlands', 'pincode' => 'WV1 4LD'},
        new Map<String, String>{'city' => 'Worcester', 'state' => 'Worcestershire', 'pincode' => 'WR1 1YQ'},
        new Map<String, String>{'city' => 'York', 'state' => 'North Yorkshire', 'pincode' => 'YO1 8SG'}
    };
    static {
        for(Object o: leadCos)
        {
            leadCompany.add((Map<String, Object>)o);
        }
    }
}