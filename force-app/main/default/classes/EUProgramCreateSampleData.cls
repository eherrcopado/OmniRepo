/*
Steps:
    0. Deploy classes: EUProgramSampleData and EUProgramCreateSampleData
    1. Files Home (_ui/core/chatter/files/FileTabPage) => Upload images
        a. Product Image: Keep the image name same as Product Code
        b. Program Image: Keep the image name same as Program Name but remove the special characters and white-spaces.
    2. Execute:
        EUProgramCreateSampleData.createRecords();
    99. Optional: Activate Picklist values
        Product Family
    100. Delete classes: EUProgramSampleData and EUProgramCreateSampleData
*/


public without sharing class EUProgramCreateSampleData {
    //To create Records for: BenefitType, Benefit, Product2, Program, ProgramProduct and ApplicationFormTemplate, Budget and Budget Allocation
    //and Impact Savings
    static Map<String, List<SObject>> objsMap = new Map<String, List<Sobject>>();

    static final String MATCH_PRODUCT_IMAGE_NAME_WITH = 'ProductCode';
    static final String MATCH_PROGRAM_IMAGE_NAME_WITH = 'Name';
    static final String userId = UserInfo.getUserId();

    public static boolean createRecords() {
        // deleteAll(); // do not use!
        createTopObjects();
        createSecondLevelObjects();
        createThirdLevelObjects();
        createAllDependentObjects();
        linkImages();
        return true;
    }

    //BenefitType, Product2, ApplicationFormTemplate, Budget..
    //UsageImpactGroup, UsageImpactFactor
    static boolean createTopObjects() {
        List<SObject> objsL0 = EUProgramSampleData.getObjects('ApplicationFormTemplate');
        objsMap.put('ApplicationFormTemplate', objsL0);

        List<SObject> productClassifications = EUProgramSampleData.getObjects('ProductClassification');
        objsL0.addAll(productClassifications);
        objsMap.put('ProductClassification', productClassifications);

        List<SObject> uoms = EUProgramSampleData.getObjects('UnitOfMeasure');
        objsL0.addAll(uoms);
        objsMap.put('UnitOfMeasure', uoms);

        List<SObject> goalDefinitions = EUProgramSampleData.getObjects('GoalDefinition');
        objsL0.addAll(goalDefinitions);
        objsMap.put('GoalDefinition', goalDefinitions);

        List<SObject> usageImpactFactors = EUProgramSampleData.getObjects('UsageImpactFactor');
        objsL0.addAll(usageImpactFactors);
        objsMap.put('UsageImpactFactor', usageImpactFactors);

        List<SObject> groups = EUProgramSampleData.getObjects('UsageImpactGroup');
        for (SObject grp:groups) {
            grp.put('OwnerId', userId);
        }
        objsL0.addAll(groups);
        objsMap.put('UsageImpactGroup', groups);

        insert objsL0;
        return true;
    }
    //Program
    //UsageImpactGroupVersion
    static void createSecondLevelObjects() {
        List<SObject> objsL1 = EUProgramSampleData.getObjects('Program');
        for (integer i=0; i<objsL1.size(); i++) {
            if (i != 5 && i!= 8) {
                objsL1[i].put('ProgramManagerId', userId);
            }
            if (null != objsL1[i].get('ApplicationFormTemplateId')) {
                objsL1[i].put('ApplicationFormTemplateId', getIdFor((String)objsL1[i].get('ApplicationFormTemplateId'), objsMap.get('ApplicationFormTemplate')));
            }
        }
        objsMap.put('Program', objsL1);

        List<SObject> products = EUProgramSampleData.getObjects('Product2');
        for (integer i = 0; i < products.size(); i++) {
            if (products[i].get('BasedOnId') != null) {
                string pcId = getIdFor((String)products[i].get('BasedOnId'), objsMap.get('ProductClassification'));
                products[i].put('BasedOnId', pcId);
            }
        }
        objsL1.addAll(products);
        objsMap.put('Product2', products);

        List<SObject> benefitTypes = EUProgramSampleData.getObjects('BenefitType');
        for (SObject benefitType: benefitTypes) {
            benefitType.put('UnitOfMeasureId', getIdFor((String)benefitType.get('UnitOfMeasureId'), objsMap.get('UnitOfMeasure')));
        }
        objsL1.addAll(benefitTypes);
        objsMap.put('BenefitType', benefitTypes);

        List<SObject> groupVersions = EUProgramSampleData.getObjects('UsageImpactGroupVersion');
        for (SObject groupVersion:groupVersions) {
            groupVersion.put('UsageImpactGroupId', getIdFor((String)groupVersion.get('UsageImpactGroupId'), objsMap.get('UsageImpactGroup')));
            groupVersion.put('OwnerId', userId);
        }
        objsL1.addAll(groupVersions);
        objsMap.put('UsageImpactGroupVersion', groupVersions);

        insert objsL1;
    }

    //ProgramProduct, Benefit
    //UsageImpactGroupFactor, UsageImpactGroupProgramMeasure
    static void createThirdLevelObjects() {

        List<SObject> objsL2 = EUProgramSampleData.getObjects('ProgramProduct');
        for (SObject obj : objsL2) {
            obj.put('ProgramId', getIdFor((String)obj.get('ProgramId'), objsMap.get('Program')));
            obj.put('ProductId', getIdFor((String)obj.get('ProductId'), objsMap.get('Product2')));
        }
        objsMap.put('ProgramProduct', objsL2);

        List<SObject> measures = EUProgramSampleData.getObjects('UsageImpactGroupPgmMeasure');
        for (SObject measure: measures) {
            measure.put('UsageImpactGroupVersionId', getIdFor((String)measure.get('UsageImpactGroupVersionId'), objsMap.get('UsageImpactGroupVersion')));
            measure.put('ProgramId', getIdFor((String)measure.get('ProgramId'), objsMap.get('Program')));
            measure.put('Product2Id', getIdFor((String)measure.get('Product2Id'), objsMap.get('Product2')));
        }
        objsL2.addAll(measures);

        List<SObject> benefits = EUProgramSampleData.getObjects('Benefit');
        for (SObject benefit: benefits) {
            benefit.put('ProgramId', getIdFor((String)benefit.get('ProgramId'), objsMap.get('Program')));
            benefit.put('BenefitTypeId', getIdFor((String)benefit.get('BenefitTypeId'), objsMap.get('BenefitType')));
            benefit.put('UnitId', getIdFor((String)benefit.get('UnitId'), objsMap.get('UnitOfMeasure')));
            benefit.put('GoalDefinitionId', getIdFor((String)benefit.get('GoalDefinitionId'), objsMap.get('GoalDefinition')));
            benefit.put('Product2Id', getIdFor((String)benefit.get('Product2Id'), objsMap.get('Product2')));
        }
        objsL2.addAll(benefits);

        List<SObject> usageImpactGroupFactors = EUProgramSampleData.getObjects('UsageImpactGroupFactor');
        for (SObject usageImpactGroupFactor: usageImpactGroupFactors) {
            usageImpactGroupFactor.put('UsageImpactGroupVersionId', getIdFor((String)usageImpactGroupFactor.get('UsageImpactGroupVersionId'), objsMap.get('UsageImpactGroupVersion')));
            usageImpactGroupFactor.put('UsageImpactFactorId', getIdFor((String)usageImpactGroupFactor.get('UsageImpactFactorId'), objsMap.get('UsageImpactFactor')));
        }
        objsL2.addAll(usageImpactGroupFactors);

        insert objsL2;
    } 

    //Product2, Program
    /*
    * Current Logic: 
    * Product - match the ProductCode with File : Title
    * Program - match the Name (without space and special char Document) with File : Title 
    */
    public static void linkImages() {
        List<ContentDocumentLink> links = new List<ContentDocumentLink>();
        List<SObject> products = objsMap.get('Product2');
        List<SObject> programs = objsMap.get('Program');
        List<String> allPossibleTitles = getAllPossibleTitles(products, MATCH_PRODUCT_IMAGE_NAME_WITH, false);
        allPossibleTitles.addAll(getAllPossibleTitles(programs, MATCH_PROGRAM_IMAGE_NAME_WITH, true));
        List<ContentDocument> cds = [Select Id, Title from ContentDocument where Title IN :allPossibleTitles];
        //Product
        for (SObject prod: products) {
            for (ContentDocument cd: cds) {
                if (prod.get(MATCH_PRODUCT_IMAGE_NAME_WITH) == cd.Title) {
                    links.add(new ContentDocumentLink(LinkedEntityId = prod.Id, ContentDocumentId = cd.Id));
                }
            }
        }
        //Program
        for (SObject prog: programs) {
            String progName = trimSpecialChars((String)prog.get(MATCH_PROGRAM_IMAGE_NAME_WITH));
            for (ContentDocument cd: cds) {
                if (progName == cd.Title) {
                    links.add(new ContentDocumentLink(LinkedEntityId = prog.Id, ContentDocumentId = cd.Id));
                }
            }
        }

        List<ContentVersion> cvs = [Select Id, Title from ContentVersion where Title IN :allPossibleTitles];
        //Product
        for (SObject prod: products) {
            for (ContentVersion cv: cvs) {
                if (prod.get(MATCH_PRODUCT_IMAGE_NAME_WITH) == cv.Title) {
                    prod.put('DisplayUrl', '/sfc/servlet.shepherd/version/download/' + cv.Id);
                }
            }
        }
        //Program
        for (SObject prog: programs) {
            String progName = trimSpecialChars((String)prog.get(MATCH_PROGRAM_IMAGE_NAME_WITH));
            for (ContentVersion cv: cvs) {
                if (progName == cv.Title) {
                   // prog.put('DefaultImageUrl', '/sfc/servlet.shepherd/version/download/' + cv.Id);
                }
            }
        }
        update products;
        update programs;
        insert links;
    }

    static List<String> getAllPossibleTitles(List<SObject> objects, String field, Boolean trimSpecialChar) {
        List<String> allPossibleTitles = new List<String>();
        for (SObject obj: objects) {
            String val = (String)obj.get(field);
            if (trimSpecialChar) {
                val = trimSpecialChars(val);
            }
            allPossibleTitles.add(val);
        }
        return allPossibleTitles;
    }
    static String trimSpecialChars(String val) {
        return val.replaceAll('[^a-zA-Z0-9+]', '');
    }

    static String getIdFor(String name, List<Sobject> fromObjects) {
        if (name == null) return null;
        for (SObject obj : fromObjects) {
            if (name.equals(obj.get('Name'))) {
                return (String)obj.get('Id');
            }
        }
        return null;
    }

    public static List<String> getForeignKeyIdsFields(SObject mySObject) {
        List<String> foreignKeyFields = new List<String>();

        // List of common fields to exclude
        Set<String> excludedFields = new Set<String>{'Id', 'OwnerId', 'CreatedById', 'LastModifiedById', 'PicklistId'};

        // Iterate through the fields of the SObject
        for (SObjectField field : mySObject.getSObjectType().getDescribe().fields.getMap().values()) {
            String fieldName = field.getDescribe().getName();

            // Check if the field name ends with "Id" and is not in the excluded set
            if (fieldName.endsWith('Id') && !excludedFields.contains(fieldName)) {
                foreignKeyFields.add(fieldName);
            }
        }

        return foreignKeyFields;
    }

    public static List<SObject> putNullForeignKeyFields(List<SObject> sObjs) {
        if (sObjs.isEmpty()) return sObjs;

        List<String> fields = getForeignKeyIdsFields(sObjs[0]);
        Set<String> excludedFields = new Set<String>{'ExternalDataSource'};
        Map<String, String> replaceFields = new Map<String, String>{
            'Product' => 'Product2',
            'UnitofMeasure' => 'UnitOfMeasure',
            'Unit' => 'UnitOfMeasure',
            'BasedOn' => 'ProductClassification'
        };
        system.debug('Foreign Keys: ' + fields);
        for (SObject sObj : sObjs) {
            for (String field : fields) {
                if (sObj.get(field) == null) continue;

                String fObjType = field.removeEnd('Id');
                if (excludedFields.contains(fObjType)) continue;
                if (replaceFields.keySet().contains(fObjType)) {
                    fObjType = replaceFields.get(fObjType);
                }
                
                if (objsMap.get(fObjType) != null) {
                    String name = (String)sObj.get(field);
                    String id = getIdFor(name, objsMap.get(fObjType));
                    if (id == null) {
                        system.debug('Cannot find id for name: ' + name);
                    }
                    sObj.put(field, id);
                } else {
                    system.debug('Foreign Key not found: ' + field);
                }
            }
        }

        return sObjs;
    }

    static void createAllDependentObjects() {
        List<String> objTypes = EUProgramSampleData.CREATION_ORDER;
        for (String objType : objTypes) {
            system.debug('ObjType: ' + objType);
            List<SObject> objs = EUProgramSampleData.getObjects(objType);
            system.debug('objs: ' + objs.size());
            objs = putNullForeignKeyFields(objs);
            if (objType == 'UsageImpactGroupVersion') {
                for (SObject grp:objs) {
                    grp.put('OwnerId', userId);
                }
            }
            if (objType == 'Program') {
                for (Integer i = 0; i < objs.size(); i++) {
                    if (i != 5 && i!= 8) {
                        objs[i].put('ProgramManagerId', userId);
                    }
                }
            }
            objsMap.put(objType, objs);
            insert objs;
            system.debug('Completed Insertion');
        }
    }


    //Do not use
    static void deleteAll() {
        List<String> objNames = EUProgramSampleData.ENTITY_SOBJECT_TYPES_2DELETE;
        for (Integer i = 0; i < objNames.size(); i++) {
            String objType = objNames[i];
            System.debug('ObjType: ' + objType);
            List<SObject> objsToDelete = new List<SObject>();
            objsToDelete.addAll(Database.query('Select Id From ' + objType));
            System.debug(objsToDelete);
            delete objsToDelete;
        }
    }
}