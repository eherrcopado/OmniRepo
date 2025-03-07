@IsTest
public class CpqNextPricingPlanHelperTest {

    private static String namespace = 'vlocity_cmt__';

    // Intitialized in Setup, used throughout
    public static vlocity_cmt__CalculationMatrixVersion__c version;
    public static SObject versionSobj;
    public static vlocity_cmt__CalculationMatrix__c parent;
    public static SObject parentSobj;
    public static List<vlocity_cmt__CalculationMatrixRow__c> lineItems;
    public static List<SObject> lineItemsSobj;
    private static boolean flag;  //used to upload matrix row data for test1 or test2

	//Initializing Product Details
    static private vlocity_cmt.CpqCartDocument testCpqNextSetup()
	{
		return testCpqNextSetup(null);
	}

    //Initializing Product Details
    static private vlocity_cmt.CpqCartDocument testCpqNextSetup(String cartJson){

        vlocity_cmt__GeneralSettings__c toggleSetting = new vlocity_cmt__GeneralSettings__c(Name = 'FixToggleList', vlocity_cmt__Value__c = 'UnitTestContextBypass');
        insert toggleSetting;

        String defaultCartJson = '{"lineitems":[{"orderactive":false,"haschildren":true,"linenumber":"0001","specificationyype":"Product","assetreferenceid":"ad0648b6-1772-4250-8c13-67d2b1b04486","versionlabel":null,"productglobalgroupkey":"90cfac05-8d1c-9796-a585-feead252f3d6","lifecyclestatus":"Draft","isconfigurable":false,"subtype":"None","type":"None","productid":"01txx0000006iC8AAI","productcode":"VLO-BUN-0001","name":"Triple Play Bundle Small","producthierarchypath":"01txx0000006iC8AAI","pcichildlinenumber":"1","collapsehierarchy":false,"ispcioverride":false,"isvirtualitem":false,"productchilditemid":"a3Oxx0000004C92EAE","sequencenumber":1,"groupmaxquantity":99999,"groupminquantity":0,"maxquantity":99999,"minquantity":0,"defaultquantity":1,"pricebookentryid":"01uxx0000008yggAAA","recurringprice":0,"unitprice":0,"quantity":1,"itemtype":"lineItem","action":"Add","rootitemid":"ad0648b6-1772-4250-8c13-67d2b1b04486","messages":[],"cpqcardinalitymessage":null,"priceListId":"a3Gxx0000004C92EAE","lineitems":["0a7e0676-3fa7-41ca-b06e-d38b0cff39aa","0a7e0676-3fa7-41ca-b06e-d38b0cff39ab","0a7e0676-3fa7-41ca-b06e-d38b0cff39ac","0a7e0676-3fa7-41ca-b06e-d38b0cff39ad"],"incartquantitymap":{"01txx0000006iLoAAI":1},"childproducts":["01txx0000006iC8AAI<01txx0000006iDkAAI","01txx0000006iC8AAI<01txx0000006iLoAAI"]},{"orderactive":false,"haschildren":false,"linenumber":"0001.0001","specificationyype":"Product","assetreferenceid":"0a7e0676-3fa7-41ca-b06e-d38b0cff39aa","versionlabel":null,"productglobalgroupkey":"520590a5-9140-b7fa-5a58-e7ab0b56493c","lifecyclestatus":"Draft","isconfigurable":false,"subtype":"None","type":"None","productid":"01txx0000006iLoAAA","productcode":"VLO-PHN-0005","name":"Consumer Landline","producthierarchypath":"01txx0000006iC8AAI<01txx0000006iLoAAA","pcichildlinenumber":"20","collapsehierarchy":false,"ispcioverride":false,"isvirtualitem":false,"productchilditemid":null,"sequencenumber":20,"groupmaxquantity":99999,"groupminquantity":0,"maxquantity":10,"minquantity":0,"defaultquantity":1,"pricebookentryid":"01uxx0000008z02AAA","recurringprice":0,"unitprice":0,"itemtype":"lineItem","action":"Add","quantity":1,"rootitemid":"ad0648b6-1772-4250-8c13-67d2b1b04486","messages":[],"cpqcardinalitymessage":null,"priceListId":"a3Gxx0000004C92EAE","attributeCategories":{"totalSize":1,"records":[{"uiStates":{},"nameResult":{"productAttributes":{"totalSize":2,"records":[{"uiStates":{},"nameResult":{},"messages":[],"fields":{"isNotAssetizable":false},"displaySequence":1,"actions":{},"values":[{"value":null,"selected":null,"rules":[],"readonly":false,"name":null,"label":null,"id":null,"displaySequence":null,"disabled":false,"defaultValue":null,"defaultSelected":null}],"userValues":{"value":"Verizon"},"step":null,"rules":[],"required":false,"readonly":false,"placeholder":null,"pattern":null,"multiselect":false,"minLongValue":null,"minlength":null,"min":null,"maxLongValue":null,"maxlength":null,"max":null,"label":"Provider","isRatingAttribute":null,"isNotTranslatable":false,"isNotAssetizable":null,"isConfigurable":null,"inputType":"text","hidden":false,"hasRules":false,"formatMask":null,"filterable":false,"disabled":false,"description":null,"dataType":"text","customTemplate":null,"code":"Attribute-124","cloneable":true,"cacheable":true,"autocomplete":null,"attributeId":"a0axx000000FfgqAAC","attributeConfigurable":null},{"uiStates":{},"nameResult":{},"messages":[],"fields":{"isNotAssetizable":false},"displaySequence":1,"actions":{},"values":[{"value":"First","selected":null,"rules":[],"readonly":false,"name":null,"label":"First Value","id":"0ce864e6-cbe9-ac5c-7a09-d94adbe75eca","displaySequence":10,"disabled":false,"defaultValue":null,"defaultSelected":null},{"value":"Second","selected":null,"rules":[],"readonly":false,"name":null,"label":"Second Value","id":"83e81c54-3620-1874-5b52-71129230bdf1","displaySequence":20,"disabled":false,"defaultValue":null,"defaultSelected":null},{"value":"Third","selected":null,"rules":[],"readonly":false,"name":null,"label":"Third Value","id":"b7b149a0-aceb-e0fb-53c1-fc3cdb1b9a9f","displaySequence":30,"disabled":false,"defaultValue":null,"defaultSelected":null}],"userValues":{"value":"First"},"step":null,"rules":[],"required":false,"readonly":false,"placeholder":null,"pattern":null,"multiselect":false,"minLongValue":null,"minlength":null,"min":null,"maxLongValue":null,"maxlength":null,"max":null,"label":"Attribute1 Test","isRatingAttribute":null,"isNotTranslatable":false,"isNotAssetizable":null,"isConfigurable":null,"inputType":"dropdown","hidden":false,"hasRules":false,"formatMask":null,"filterable":false,"disabled":false,"description":null,"dataType":"text","customTemplate":null,"code":"Attribute1 Test","cloneable":true,"cacheable":true,"autocomplete":null,"attributeId":"a0axx000000FfqWAAS","attributeConfigurable":null}],"name":null,"messages":[],"description":null,"data":{"totalSize":null,"messages":[],"dataMap":{},"actions":{}},"actions":{}}},"messages":[],"fields":{"id":"a0Zxx000000c3mzEAA","Name":"MLS","Code__c":"MLS"},"displaySequence":10,"actions":{}}],"name":null,"messages":[],"description":null,"data":{"totalSize":null,"messages":[],"dataMap":{},"actions":{}},"actions":{}},"parentitemid":"ad0648b6-1772-4250-8c13-67d2b1b04486","cpqmessagedata":null},{"orderactive":false,"haschildren":false,"linenumber":"0001.0002","specificationyype":"Product","assetreferenceid":"0a7e0676-3fa7-41ca-b06e-d38b0cff39ab","versionlabel":null,"productglobalgroupkey":"520590a5-9140-b7fa-5a58-e7ab0b56493c","lifecyclestatus":"Draft","isconfigurable":false,"subtype":"None","type":"None","productid":"01txx0000006iLoAAB","productcode":"VLO-INT-0001","name":"Broadband Internet Small","producthierarchypath":"01txx0000006iC8AAI<01txx0000006iLoAAB","pcichildlinenumber":"20","collapsehierarchy":false,"ispcioverride":false,"isvirtualitem":false,"productchilditemid":null,"sequencenumber":20,"groupmaxquantity":99999,"groupminquantity":0,"maxquantity":10,"minquantity":0,"defaultquantity":1,"pricebookentryid":"01uxx0000008z02AAA","recurringprice":0,"unitprice":0,"quantity":1,"itemtype":"lineItem","action":"Add","rootitemid":"ad0648b6-1772-4250-8c13-67d2b1b04486","parentitemid":"ad0648b6-1772-4250-8c13-67d2b1b04486","messages":[],"cpqcardinalitymessage":null,"attributeCategories":{"totalSize":1,"records":[{"uiStates":{},"nameResult":{"productAttributes":{"totalSize":2,"records":[{"uiStates":{},"nameResult":{},"messages":[],"fields":{"isNotAssetizable":false},"displaySequence":1,"actions":{},"values":[{"value":null,"selected":null,"rules":[],"readonly":false,"name":null,"label":null,"id":null,"displaySequence":null,"disabled":false,"defaultValue":null,"defaultSelected":null}],"userValues":{"value":"16Mbps"},"step":null,"rules":[],"required":false,"readonly":false,"placeholder":null,"pattern":null,"multiselect":false,"minLongValue":null,"minlength":null,"min":null,"maxLongValue":null,"maxlength":null,"max":null,"label":"Internet Upload Speed","isRatingAttribute":null,"isNotTranslatable":false,"isNotAssetizable":null,"isConfigurable":null,"inputType":"text","hidden":false,"hasRules":false,"formatMask":null,"filterable":false,"disabled":false,"description":null,"dataType":"text","customTemplate":null,"code":"ATTRIBUTE-1270","cloneable":true,"cacheable":true,"autocomplete":null,"attributeId":"a0axx000000FfgqAAC","attributeConfigurable":null},{"uiStates":{},"nameResult":{},"messages":[],"fields":{"isNotAssetizable":false},"displaySequence":1,"actions":{},"values":[{"value":"First","selected":null,"rules":[],"readonly":false,"name":null,"label":"First Value","id":"0ce864e6-cbe9-ac5c-7a09-d94adbe75eca","displaySequence":10,"disabled":false,"defaultValue":null,"defaultSelected":null},{"value":"Second","selected":null,"rules":[],"readonly":false,"name":null,"label":"Second Value","id":"83e81c54-3620-1874-5b52-71129230bdf1","displaySequence":20,"disabled":false,"defaultValue":null,"defaultSelected":null},{"value":"Third","selected":null,"rules":[],"readonly":false,"name":null,"label":"Third Value","id":"b7b149a0-aceb-e0fb-53c1-fc3cdb1b9a9f","displaySequence":30,"disabled":false,"defaultValue":null,"defaultSelected":null}],"userValues":{"value":"80Mbps"},"step":null,"rules":[],"required":false,"readonly":false,"placeholder":null,"pattern":null,"multiselect":false,"minLongValue":null,"minlength":null,"min":null,"maxLongValue":null,"maxlength":null,"max":null,"label":"Internet Download Speed","isRatingAttribute":null,"isNotTranslatable":false,"isNotAssetizable":null,"isConfigurable":null,"inputType":"text","hidden":false,"hasRules":false,"formatMask":null,"filterable":false,"disabled":false,"description":null,"dataType":"text","customTemplate":null,"code":"ATTRIBUTE-1200","cloneable":true,"cacheable":true,"autocomplete":null,"attributeId":"a0axx000000FfqWAAS","attributeConfigurable":null}],"name":null,"messages":[],"description":null,"data":{"totalSize":null,"messages":[],"dataMap":{},"actions":{}},"actions":{}}},"messages":[],"fields":{"id":"a0Zxx000000c3mzEAA","Name":"MLS","Code__c":"MLS"},"displaySequence":10,"actions":{}}],"name":null,"messages":[],"description":null,"data":{"totalSize":null,"messages":[],"dataMap":{},"actions":{}},"actions":{}},"priceListId":"a3Gxx0000004C92EAE","cpqmessagedata":null},{"lineitems":["0a7e0676-3fa7-41ca-b06e-d38b0cff39ae"],"priceListId":"a3Gxx0000004C92EAE","orderactive":false,"haschildren":false,"linenumber":"0001.0003","specificationyype":"Product","assetreferenceid":"0a7e0676-3fa7-41ca-b06e-d38b0cff39ad","versionlabel":null,"productglobalgroupkey":"520590a5-9140-b7fa-5a58-e7ab0b56493d","lifecyclestatus":"Draft","isconfigurable":false,"subtype":"None","type":"None","productid":"01txx0000006iLoAAD","productcode":"VLO-TV-0025","name":"TV Small","producthierarchypath":"01txx0000006iC8AAI<01txx0000006iLoAAD","pcichildlinenumber":"20","collapsehierarchy":false,"ispcioverride":false,"isvirtualitem":false,"productchilditemid":null,"sequencenumber":20,"groupmaxquantity":99999,"groupminquantity":0,"maxquantity":10,"minquantity":0,"defaultquantity":1,"pricebookentryid":"01uxx0000008z02AAA","recurringprice":0,"unitprice":0,"quantity":1,"itemtype":"lineItem","action":"Add","rootitemid":"ad0648b6-1772-4250-8c13-67d2b1b04486","parentitemid":"ad0648b6-1772-4250-8c13-67d2b1b04486","messages":[],"cpqcardinalitymessage":null,"cpqmessagedata":null},{"attributeCategories":{"totalSize":1,"records":[{"uiStates":{},"nameResult":{"productAttributes":{"totalSize":2,"records":[{"uiStates":{},"nameResult":{},"messages":[],"fields":{"isNotAssetizable":false},"displaySequence":1,"actions":{},"values":[{"value":null,"selected":null,"rules":[],"readonly":false,"name":null,"label":null,"id":null,"displaySequence":null,"disabled":false,"defaultValue":null,"defaultSelected":null}],"userValues":{"value":"HD"},"step":null,"rules":[],"required":false,"readonly":false,"placeholder":null,"pattern":null,"multiselect":false,"minLongValue":null,"minlength":null,"min":null,"maxLongValue":null,"maxlength":null,"max":null,"label":"TV Content","isRatingAttribute":null,"isNotTranslatable":false,"isNotAssetizable":null,"isConfigurable":null,"inputType":"text","hidden":false,"hasRules":false,"formatMask":null,"filterable":false,"disabled":false,"description":null,"dataType":"text","customTemplate":null,"code":"ATTRIBUTE-018","cloneable":true,"cacheable":true,"autocomplete":null,"attributeId":"a0axx000000FfgqAAC","attributeConfigurable":null},{"uiStates":{},"nameResult":{},"messages":[],"fields":{"isNotAssetizable":false},"displaySequence":1,"actions":{},"values":[{"value":"First","selected":null,"rules":[],"readonly":false,"name":null,"label":"First Value","id":"0ce864e6-cbe9-ac5c-7a09-d94adbe75eca","displaySequence":10,"disabled":false,"defaultValue":null,"defaultSelected":null},{"value":"Second","selected":null,"rules":[],"readonly":false,"name":null,"label":"Second Value","id":"83e81c54-3620-1874-5b52-71129230bdf1","displaySequence":20,"disabled":false,"defaultValue":null,"defaultSelected":null},{"value":"Third","selected":null,"rules":[],"readonly":false,"name":null,"label":"Third Value","id":"b7b149a0-aceb-e0fb-53c1-fc3cdb1b9a9f","displaySequence":30,"disabled":false,"defaultValue":null,"defaultSelected":null}],"userValues":{"value":4},"step":null,"rules":[],"required":false,"readonly":false,"placeholder":null,"pattern":null,"multiselect":false,"minLongValue":null,"minlength":null,"min":null,"maxLongValue":null,"maxlength":null,"max":null,"label":"TV Boxes Required","isRatingAttribute":null,"isNotTranslatable":false,"isNotAssetizable":null,"isConfigurable":null,"inputType":"text","hidden":false,"hasRules":false,"formatMask":null,"filterable":false,"disabled":false,"description":null,"dataType":"text","customTemplate":null,"code":"ATTRIBUTE-044","cloneable":true,"cacheable":true,"autocomplete":null,"attributeId":"a0axx000000FfqWAAS","attributeConfigurable":null}],"name":null,"messages":[],"description":null,"data":{"totalSize":null,"messages":[],"dataMap":{},"actions":{}},"actions":{}}},"messages":[],"fields":{"id":"a0Zxx000000c3mzEAA","Name":"MLS","Code__c":"MLS"},"displaySequence":10,"actions":{}}],"name":null,"messages":[],"description":null,"data":{"totalSize":null,"messages":[],"dataMap":{},"actions":{}},"actions":{}},"priceListId":"a3Gxx0000004C92EAE","orderactive":false,"haschildren":false,"linenumber":"0001.0003.0001","specificationyype":"Product","assetreferenceid":"0a7e0676-3fa7-41ca-b06e-d38b0cff39ae","versionlabel":null,"productglobalgroupkey":"520590a5-9140-b7fa-5a58-e7ab0b56493e","lifecyclestatus":"Draft","isconfigurable":false,"subtype":"None","type":"None","productid":"01txx0000006iLoAAE","productcode":"VLO-TV-0008","name":"HD TV","producthierarchypath":"01txx0000006iC8AAI<01txx0000006iLoAAD<01txx0000006iLoAAE","pcichildlinenumber":"20","collapsehierarchy":false,"ispcioverride":false,"isvirtualitem":false,"productchilditemid":null,"sequencenumber":20,"groupmaxquantity":99999,"groupminquantity":0,"maxquantity":10,"minquantity":0,"defaultquantity":1,"pricebookentryid":"01uxx0000008z02AAA","recurringprice":0,"unitprice":0,"quantity":1,"itemtype":"lineItem","action":"Add","rootitemid":"ad0648b6-1772-4250-8c13-67d2b1b04486","parentitemid":"0a7e0676-3fa7-41ca-b06e-d38b0cff39ad","messages":[],"cpqcardinalitymessage":null,"cpqmessagedata":null}],"childproducts":[{"orderactive":false,"haschildren":false,"linenumber":"0001.0001","specificationyype":"Product","assetreferenceid":"b28d6427-bd2c-7f27-84b3-f8a39c4b9677","versionlabel":null,"productglobalgroupkey":"bb9c1f88-eb81-1e66-84c1-64c963d73b69","lifecyclestatus":"Draft","isconfigurable":true,"subtype":"None","type":"None","productid":"01txx0000006iDkAAI","productcode":"Internet Child","name":"Internet Child","producthierarchypath":"01txx0000006iC8AAI<01txx0000006iDkAAI","pcichildlinenumber":"10","collapsehierarchy":false,"ispcioverride":false,"isvirtualitem":false,"productchilditemid":null,"sequencenumber":10,"groupmaxquantity":99999,"groupminquantity":0,"maxquantity":10,"minquantity":0,"defaultquantity":0,"pricebookentryid":"01uxx0000008yjuAAA","recurringprice":0,"unitprice":0,"itemtype":"childProduct","attributemetadatachanges":null,"attributedefaultvalues":{"Attribute1":35,"Attribute1 Test":"First"},"attributemetadata":{"totalSize":1,"records":[{"uiStates":{},"nameResult":{"productAttributes":{"totalSize":2,"records":[{"uiStates":{},"nameResult":{},"messages":[],"fields":{"isNotAssetizable":false},"displaySequence":1,"actions":{},"values":[{"value":null,"selected":null,"rules":[],"readonly":false,"name":null,"label":null,"id":null,"displaySequence":null,"disabled":false,"defaultValue":null,"defaultSelected":null}],"userValues":{"value":35},"step":null,"rules":[],"required":false,"readonly":false,"placeholder":null,"pattern":null,"multiselect":false,"minLongValue":null,"minlength":null,"min":null,"maxLongValue":null,"maxlength":null,"max":null,"label":"Attribute 1","isRatingAttribute":null,"isNotTranslatable":false,"isNotAssetizable":null,"isConfigurable":null,"inputType":"number","hidden":false,"hasRules":false,"formatMask":null,"filterable":false,"disabled":false,"description":null,"dataType":"number","customTemplate":null,"code":"Attribute1","cloneable":true,"cacheable":true,"autocomplete":null,"attributeId":"a0axx000000FfgqAAC","attributeConfigurable":null},{"uiStates":{},"nameResult":{},"messages":[],"fields":{"isNotAssetizable":false},"displaySequence":1,"actions":{},"values":[{"value":"First","selected":null,"rules":[],"readonly":false,"name":null,"label":"First Value","id":"0ce864e6-cbe9-ac5c-7a09-d94adbe75eca","displaySequence":10,"disabled":false,"defaultValue":null,"defaultSelected":null},{"value":"Second","selected":null,"rules":[],"readonly":false,"name":null,"label":"Second Value","id":"83e81c54-3620-1874-5b52-71129230bdf1","displaySequence":20,"disabled":false,"defaultValue":null,"defaultSelected":null},{"value":"Third","selected":null,"rules":[],"readonly":false,"name":null,"label":"Third Value","id":"b7b149a0-aceb-e0fb-53c1-fc3cdb1b9a9f","displaySequence":30,"disabled":false,"defaultValue":null,"defaultSelected":null}],"userValues":{"value":"First"},"step":null,"rules":[],"required":false,"readonly":false,"placeholder":null,"pattern":null,"multiselect":false,"minLongValue":null,"minlength":null,"min":null,"maxLongValue":null,"maxlength":null,"max":null,"label":"Attribute1 Test","isRatingAttribute":null,"isNotTranslatable":false,"isNotAssetizable":null,"isConfigurable":null,"inputType":"dropdown","hidden":false,"hasRules":false,"formatMask":null,"filterable":false,"disabled":false,"description":null,"dataType":"text","customTemplate":null,"code":"Attribute1 Test","cloneable":true,"cacheable":true,"autocomplete":null,"attributeId":"a0axx000000FfqWAAS","attributeConfigurable":null}],"name":null,"messages":[],"description":null,"data":{"totalSize":null,"messages":[],"dataMap":{},"actions":{}},"actions":{}}},"messages":[],"fields":{"id":"a0Zxx000000c3mzEAA","Name":"MLS","Code__c":"MLS"},"displaySequence":10,"actions":{}}],"name":null,"messages":[],"description":null,"data":{"totalSize":null,"messages":[],"dataMap":{},"actions":{}},"actions":{}},"priceListId":"a3Gxx0000004C92EAE"},{"orderactive":false,"haschildren":false,"linenumber":"0001.0002","specificationyype":"Product","assetreferenceid":"bef53999-44c5-667b-644a-ce8905038a3c","versionlabel":null,"productglobalgroupkey":"520590a5-9140-b7fa-5a58-e7ab0b56493c","lifecyclestatus":"Draft","isconfigurable":false,"subtype":"None","type":"None","productid":"01txx0000006iLoAAI","productcode":"Internet Source","name":"Internet Source","producthierarchypath":"01txx0000006iC8AAI<01txx0000006iLoAAI","pcichildlinenumber":"20","collapsehierarchy":false,"ispcioverride":false,"isvirtualitem":false,"productchilditemid":null,"sequencenumber":20,"groupmaxquantity":99999,"groupminquantity":0,"maxquantity":10,"minquantity":0,"defaultquantity":1,"pricebookentryid":"01uxx0000008z02AAA","recurringprice":0,"unitprice":0,"itemtype":"childProduct","priceListId":"a3Gxx0000004C92EAE"}]}';

		if(String.isBlank(cartJson))
		{
			cartJson = defaultCartJson;
		}
		Map<String, Object> input = new Map<String, Object>();
        
		input.put('cartJson', cartJson);
        input.put('alwaysInitialize', false);
        vlocity_cmt.CpqCartDocument cartDocument = vlocity_cmt.CpqCartDocument.initializeCartFromString(cartJson);

        vlocity_cmt__TriggerSetup__c itemTrigger = new vlocity_cmt__TriggerSetup__c(Name='AllTriggers', vlocity_cmt__IsTriggerOn__c=true);
        insert itemTrigger;

        vlocity_cmt__CpqConfigurationSetup__c configSetup = new vlocity_cmt__CpqConfigurationSetup__c(Name = 'DeltaPrice', vlocity_cmt__SetupValue__c = 'True');
        insert configSetup;

        vlocity_cmt__CpqConfigurationSetup__c configSetup2 = new vlocity_cmt__CpqConfigurationSetup__c(Name = 'PricingPlanHelperLogging', vlocity_cmt__SetupValue__c = 'True');
        insert configSetup2;

        vlocity_cmt__AttributeCategory__c attrCategory = new vlocity_cmt__AttributeCategory__c(Name='Logistics', vlocity_cmt__DisplaySequence__c=23, vlocity_cmt__Code__c='VLO-PRO-0015');
	
		insert attrCategory;

        List<SObject> sObjList = new List<SObject>();

        sObjList.add(new vlocity_cmt__Attribute__c(Name='Provider',vlocity_cmt__AttributeCategoryId__c=attrCategory.Id, vlocity_cmt__Code__c='Attribute-124', vlocity_cmt__ActiveFlg__c=True));

        sObjList.add(new vlocity_cmt__Attribute__c(Name='Internet Download Speed',vlocity_cmt__AttributeCategoryId__c=attrCategory.Id, vlocity_cmt__Code__c='ATTRIBUTE-1200', vlocity_cmt__ActiveFlg__c=True));

        sObjList.add(new vlocity_cmt__Attribute__c(Name='Internet Upload Speed',vlocity_cmt__AttributeCategoryId__c=attrCategory.Id, vlocity_cmt__Code__c='ATTRIBUTE-1270', vlocity_cmt__ActiveFlg__c=True));

        sObjList.add(new vlocity_cmt__Attribute__c(Name='TV Boxes Required',vlocity_cmt__AttributeCategoryId__c=attrCategory.Id, vlocity_cmt__Code__c='ATTRIBUTE-044', vlocity_cmt__ActiveFlg__c=True));

        sObjList.add(new vlocity_cmt__Attribute__c(Name='TV Content',vlocity_cmt__AttributeCategoryId__c=attrCategory.Id, vlocity_cmt__Code__c='ATTRIBUTE-018', vlocity_cmt__ActiveFlg__c=True));
        sObjList.add(new vlocity_cmt__Attribute__c(Name='Attribute1 Test',vlocity_cmt__AttributeCategoryId__c=attrCategory.Id, vlocity_cmt__Code__c='Attribute1 Test', vlocity_cmt__ActiveFlg__c=True));
        insert sObjList;
        sObjList.clear();

        vlocity_cmt.VlocityFeatureService.enableV2AttributeModel();

		populatePVBAndMappings();
        
                return cartDocument;
	}

	private static void populatePVBAndMappings()
	{
	
        List<SObject> sObjList = new List<SObject>();

        vlocity_cmt__PricingVariable__c oneTimeStdPriceVar = new vlocity_cmt__PricingVariable__c(Name = 'One Time Std Price', vlocity_cmt__Code__c = 'OT_STD_PRC',vlocity_cmt__Aggregation__c = 'Unit',
		vlocity_cmt__ChargeType__c='One-time',vlocity_cmt__IsActive__c = true,vlocity_cmt__Scope__c = 'Line',vlocity_cmt__SubType__c = 'Standard',vlocity_cmt__Type__c = 'Price',
		vlocity_cmt__ValueType__c='Pricing Element',vlocity_cmt__CurrencyType__c='Currency');
        sObjList.add(oneTimeStdPriceVar);

        vlocity_cmt__PricingVariable__c mrcPriceVar = new vlocity_cmt__PricingVariable__c(Name = 'Recurring Monthly Std Price', vlocity_cmt__Code__c = 'REC_MNTH_STD_PRC',vlocity_cmt__Aggregation__c = 'Unit',
			vlocity_cmt__ChargeType__c='Recurring', vlocity_cmt__RecurringFrequency__c ='Monthly',vlocity_cmt__IsActive__c = true,vlocity_cmt__Scope__c = 'Line',vlocity_cmt__SubType__c = 'Standard',vlocity_cmt__Type__c = 'Price',
			vlocity_cmt__ValueType__c='Pricing Element',vlocity_cmt__CurrencyType__c='Currency');
        sObjList.add(mrcPriceVar);

        insert sObjList;
        sObjList.clear();


        vlocity_cmt__PricingVariableBinding__c pvb1 = new vlocity_cmt__PricingVariableBinding__c(Name='One Time Std Price - OrderItem',vlocity_cmt__DestinationSObjectType__c='OrderItem',
			vlocity_cmt__DestinationFieldApiName__c = namespace + 'OneTimeCharge__c', vlocity_cmt__PricingVariableId__c = oneTimeStdPriceVar.Id);
        sObjList.add(pvb1);
        vlocity_cmt__PricingVariableBinding__c pvb2 = new vlocity_cmt__PricingVariableBinding__c(Name='Recurring Monthly Std Price - OrderItem',vlocity_cmt__DestinationSObjectType__c='OrderItem',
			vlocity_cmt__DestinationFieldApiName__c = namespace + 'RecurringCharge__c', vlocity_cmt__PricingVariableId__c = mrcPriceVar.Id);
        sObjList.add(pvb2);

        insert sObjList;
        sObjList.clear();

        List<vlocity_cmt__CustomFieldMap__c> customFieldMappings = new List<vlocity_cmt__CustomFieldMap__c>();
        vlocity_cmt__CustomFieldMap__c fieldMap = new vlocity_cmt__CustomFieldMap__c();
        fieldMap.Name = 'Order>CpqCartDocument1';
        fieldMap.vlocity_cmt__SourceSObjectType__c = 'Order';
        fieldMap.vlocity_cmt__DestinationSObjectType__c = 'CpqCartDocument';
        fieldMap.vlocity_cmt__SourceFieldName__c = namespace + 'EffectiveRecurringTotal__c';
        fieldMap.vlocity_cmt__DestinationFieldName__c = 'effectiverecurringtotal';
        customFieldMappings.add(fieldMap);

        vlocity_cmt__CustomFieldMap__c fieldMap2 = new vlocity_cmt__CustomFieldMap__c();
        fieldMap2.Name = 'OrderItem>CpqCartDocumentItem1';
        fieldMap2.vlocity_cmt__SourceSObjectType__c = 'OrderItem';
        fieldMap2.vlocity_cmt__DestinationSObjectType__c = 'CpqCartDocumentItem';
        fieldMap2.vlocity_cmt__SourceFieldName__c = namespace + 'AssetReferenceId__c';
        fieldMap2.vlocity_cmt__DestinationFieldName__c = 'assetreferenceid';
        customFieldMappings.add(fieldMap2);

        vlocity_cmt__CustomFieldMap__c fieldMap3 = new vlocity_cmt__CustomFieldMap__c();
        fieldMap3.Name = 'OrderItem>CpqCartDocumentItem2';
        fieldMap3.vlocity_cmt__SourceSObjectType__c = 'OrderItem';
        fieldMap3.vlocity_cmt__DestinationSObjectType__c = 'CpqCartDocumentItem';
        fieldMap3.vlocity_cmt__SourceFieldName__c = 'Quantity';
        fieldMap3.vlocity_cmt__DestinationFieldName__c = 'quantity';
        customFieldMappings.add(fieldMap3);

        vlocity_cmt__CustomFieldMap__c fieldMap4 = new vlocity_cmt__CustomFieldMap__c();
        fieldMap4.Name = 'OrderItem>CpqCartDocumentItem3';
        fieldMap4.vlocity_cmt__SourceSObjectType__c = 'OrderItem';
        fieldMap4.vlocity_cmt__DestinationSObjectType__c = 'CpqCartDocumentItem';
        fieldMap4.vlocity_cmt__SourceFieldName__c = namespace + 'LineNumber__c';
        fieldMap4.vlocity_cmt__DestinationFieldName__c = 'linenumber';
        customFieldMappings.add(fieldMap4);

        vlocity_cmt__CustomFieldMap__c fieldMap5 = new vlocity_cmt__CustomFieldMap__c();
        fieldMap5.Name = 'OrderItem>CpqCartDocumentItem4';
        fieldMap5.vlocity_cmt__SourceSObjectType__c = 'OrderItem';
        fieldMap5.vlocity_cmt__DestinationSObjectType__c = 'CpqCartDocumentItem';
        fieldMap5.vlocity_cmt__SourceFieldName__c = 'name';
        fieldMap5.vlocity_cmt__DestinationFieldName__c = 'name';
        customFieldMappings.add(fieldMap5);

        vlocity_cmt__CustomFieldMap__c fieldMap6 = new vlocity_cmt__CustomFieldMap__c();
        fieldMap6.Name = 'OrderItem>CpqCartDocumentItem5';
        fieldMap6.vlocity_cmt__SourceSObjectType__c = 'OrderItem';
        fieldMap6.vlocity_cmt__DestinationSObjectType__c = 'CpqCartDocumentItem';
        fieldMap6.vlocity_cmt__SourceFieldName__c = 'ProductCode';
        fieldMap6.vlocity_cmt__DestinationFieldName__c = 'productcode';
        customFieldMappings.add(fieldMap6);

        vlocity_cmt__CustomFieldMap__c fieldMap7 = new vlocity_cmt__CustomFieldMap__c();
        fieldMap7.Name = 'OrderItem>CpqCartDocumentItem6';
        fieldMap7.vlocity_cmt__SourceSObjectType__c = 'OrderItem';
        fieldMap7.vlocity_cmt__DestinationSObjectType__c = 'CpqCartDocumentItem';
        fieldMap7.vlocity_cmt__SourceFieldName__c = namespace + 'OneTimeCharge__c';
        fieldMap7.vlocity_cmt__DestinationFieldName__c = 'onetimecharge';
        customFieldMappings.add(fieldMap7);

        vlocity_cmt__CustomFieldMap__c fieldMap8 = new vlocity_cmt__CustomFieldMap__c();
        fieldMap8.Name = 'OrderItem>CpqCartDocumentItem7';
        fieldMap8.vlocity_cmt__SourceSObjectType__c = 'OrderItem';
        fieldMap8.vlocity_cmt__DestinationSObjectType__c = 'CpqCartDocumentItem';
        fieldMap8.vlocity_cmt__SourceFieldName__c = namespace + 'RecurringCharge__c';
        fieldMap8.vlocity_cmt__DestinationFieldName__c = 'recurringcharge';
        customFieldMappings.add(fieldMap8);

        insert customFieldMappings;
        customFieldMappings.clear();
    }
    
    //Testing Price a target using attribute value
    /*
    Input : "Consumer Landline" order Item which has "Provider" Attribute having "Verizon"
    Output : MRC 300 and NRC 125 and Target Product Name : Path3 (HD TV)
    */
    @isTest
    static private void attributeValueBasedTargetPricing(){

        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String,Object>();
        Map<String, Object> input = new Map<String, Object>();
        flag = false;

        Test.startTest();
        vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup();
        testMatrixSetup();

        input.put('ProcedureName','TargetPathRangePricingDemoProcedureTest');
        input.put('MatrixName','TargetPathRangePricingMatrixTest');
        //input.put('Path1','Triple Play Bundle Small<Consumer Landline');
        //input.put('Path2','Triple Play Bundle Small<Broadband Internet Small');
        input.put('Path3','Triple Play Bundle Small<TV Small<HD TV');
        input.put('RangeFields','Quantity');
        input.put('IncludeAttrInfoInRangeKeys','true');
        input.put('SourceTargetABP','True');
        input.put('cartDocument', cartDocument);

        CpqNextPricingPlanHelper testing = new CpqNextPricingPlanHelper();
        testing.invokeMethod('GetCalculationProcedurePrice',input,output,options);

        Boolean assertExecuted = false;

        
		Map<String, Object> cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
		Map<String, vlocity_cmt.CpqCartDocumentItem> allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');
        
		for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
		{
			Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name','vlocity_cmt__RecurringCharge__c', 'vlocity_cmt__OneTimeCharge__c'}});
			Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
            String lineItemName = (String)fieldValueMap.get('name');
            if(lineItemName.equals('HD TV'))
            {
                System.assert(fieldValueMap.get('vlocity_cmt__RecurringCharge__c') == 300.00 );
                System.assert(fieldValueMap.get('vlocity_cmt__OneTimeCharge__c') == 125.00 );
                assertExecuted = true;
                break;
            }
        }
        System.assert(assertExecuted);

        Test.stopTest();
    }

    //Testing Price a target using multiple attribute values
    /*
    Input : "Broadband Internet Small" order Item which has "Internet Upload Speed;Internet Download Speed"  ......  Default : "80Mbps;16Mbps"
    Output : MRC 25 and NRC 0 and Target Product Name : Path1 (Consumer Product)
    */
    @isTest
    static private void attributeValuesBasedTargetPricing(){

        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String,Object>();
        Map<String, Object> input = new Map<String, Object>();
        flag = true;

        Test.startTest();
        vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup();
        testMatrixSetup();

        input.put('ProcedureName','TargetPathRangePricingDemoProcedureTest');
        input.put('MatrixName','TargetPathRangePricingMatrixTest');
        input.put('Path1','Triple Play Bundle Small<Consumer Landline');
        //input.put('Path2','Triple Play Bundle Small<Broadband Internet Small');
        //input.put('Path3','Triple Play Bundle Small<TV Small<HD TV');
        input.put('IncludeAttrInfoInRangeKeys','true');
        input.put('RangeFields','Quantity');
        input.put('SourceTargetABP','True');
        input.put('cartDocument', cartDocument);

        CpqNextPricingPlanHelper testing = new CpqNextPricingPlanHelper();
        testing.invokeMethod('GetCalculationProcedurePrice',input,output,options);

        Boolean assertExecuted = false;

        
		Map<String, Object> cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
		Map<String, vlocity_cmt.CpqCartDocumentItem> allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');
        for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
		{
			Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name','vlocity_cmt__RecurringCharge__c', 'vlocity_cmt__OneTimeCharge__c'}});
			Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
            String lineItemName = (String)fieldValueMap.get('name');
            if(lineItemName.equals('Consumer Landline'))
            {
                System.assert(fieldValueMap.get('vlocity_cmt__RecurringCharge__c') == 15.00 );
                System.assert(fieldValueMap.get('vlocity_cmt__OneTimeCharge__c') == 0 );
                assertExecuted = true;
                break;
            }
        }
        System.assert(assertExecuted);

        Test.stopTest();
    }

    //Testing Price a target using attribute value range
    /*
    Input : "HD TV" order Item which has "TV Content;TV Boxes Required"  ......  Default : "HD;4"
    Output : MRC 300 and NRC 125 and Target Product Name : Path1 (Consumer Landline)
    */
    @isTest
    static private void attributeRangeBasedTargetPricing(){

        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String,Object>();
        Map<String, Object> input = new Map<String, Object>();
        flag = true;

        Test.startTest();
        vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup();
        attributeRangeBasedTargetPricingMatrixSetup();

        input.put('ProcedureName','TargetPathRangePricingDemoProcedureTest');
        input.put('MatrixName','TargetPathRangePricingMatrixTest');
        input.put('Path1','Triple Play Bundle Small<Consumer Landline');
        input.put('RangeAttributes','TV Boxes Required');
        input.put('RangeFields','Quantity');
        input.put('SourceTargetABP','True');
        input.put('IncludeAttrInfoInRangeKeys','True');
        input.put('cartDocument', cartDocument);

        CpqNextPricingPlanHelper testing = new CpqNextPricingPlanHelper();
        testing.invokeMethod('GetCalculationProcedurePrice',input,output,options);

        Boolean assertExecuted = false;

        
		Map<String, Object> cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
		Map<String, vlocity_cmt.CpqCartDocumentItem> allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');
        
		for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
		{
			Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name','vlocity_cmt__RecurringCharge__c', 'vlocity_cmt__OneTimeCharge__c'}});
			Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
            String lineItemName = (String)fieldValueMap.get('name');
            if(lineItemName.equals('Consumer Landline'))
            {
                System.assert(fieldValueMap.get('vlocity_cmt__RecurringCharge__c') == 300.00 );
                System.assert(fieldValueMap.get('vlocity_cmt__OneTimeCharge__c') == 125.00 );
                assertExecuted = true;
                break;
            }
        }
        System.assert(assertExecuted);

        Test.stopTest();
    }

    //Testing Price a product using attribute value range
    /*
    Input : "Broadband Internet Small" order Item which has "Internet Upload Speed;Internet Download Speed"  ......
    Output : MRC 30 and NRC 0 for Internet Upload Speed:0-10 and Internet Download Speed:100Mbps
    */
    @isTest
    static private void testRangeAttributeOverlapping(){

        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String,Object>();
        Map<String, Object> input = new Map<String, Object>();

        vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup();
        testOverlappingAttributeRangeMatrixSetup();

        
		Map<String, Object> cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
		Map<String, vlocity_cmt.CpqCartDocumentItem> allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');
        
		for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
		{
			Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name'}});
			Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
            String lineItemName = (String)fieldValueMap.get('name');
            if(lineItemName.equals('Broadband Internet Small'))
            {
				Map<String, Object> attributeOutput = lineItem.call('getItemAttributes', new Map<String, Object>{'returnLabel'=>false});
                Map<String, Object> attributeCodeToValueMap = (Map<String, Object>) attributeOutput.get('result');
                attributeCodeToValueMap.put('ATTRIBUTE-1270', 5);
                attributeCodeToValueMap.put('ATTRIBUTE-1200', '100Mbps');
                lineItem.call('setItemAttributes', new Map<String, Object>{'attributeCodeToValueMap'=>attributeCodeToValueMap});
                break;
            }
        }

        input.put('ProcedureName','AttributeRangePricingDemoProcedureTest');
        input.put('MatrixName','AttributeRangePricingMatrixTest');
        input.put('OverlappingRanges','True');
        input.put('RangeAttributes','Internet Upload Speed');
        input.put('cartDocument', cartDocument);

        Test.startTest();
        CpqNextPricingPlanHelper testing = new CpqNextPricingPlanHelper();
        testing.invokeMethod('GetCalculationProcedurePrice',input,output,options);

        Boolean assertExecuted = false;

		cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
		allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');
        
		for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
		{
			Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name','vlocity_cmt__RecurringCharge__c', 'vlocity_cmt__OneTimeCharge__c'}});
			Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
            String lineItemName = (String)fieldValueMap.get('name');
            if(lineItemName.equals('Broadband Internet Small'))
            {
                System.assert(fieldValueMap.get('vlocity_cmt__OneTimeCharge__c') == 0 );
                System.assert(fieldValueMap.get('vlocity_cmt__RecurringCharge__c') == 30.00 );
				assertExecuted = true;
                break;
            }
        }
		System.assert(assertExecuted);
        Test.stopTest();
    }

    static private void testMatrixSetup() {
        insert new vlocity_cmt__TriggerSetup__c(Name = 'AllTriggers', vlocity_cmt__IsTriggerOn__c = true);
        parent = new vlocity_cmt__CalculationMatrix__c(Name = 'TargetPathRangePricingMatrixTest');
        insert parent;

        version = new vlocity_cmt__CalculationMatrixVersion__c(Name = 'TargetPathRangePricingMatrixTest Version', vlocity_cmt__VersionNumber__c = 5,
                vlocity_cmt__IsEnabled__c = false, vlocity_cmt__CalculationMatrixId__c = parent.Id,
                vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-10), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(10),vlocity_cmt__Priority__c = 5);
        insert version;

        //Populating Headers
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":1,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Code\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":2,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":3,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Value\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":4,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Quantity\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":5,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Target Product Name\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":6,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"MRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":7,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"NRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":8,\"dataType\":\"Text\"}'
        ));
        insert lineItems;

        //Populating Row Data
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();

        if(flag)  //running test2
        {
            lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                    vlocity_cmt__InputData__c ='{\"Quantity\":\"1-10\",\"Characteristic Value\":\"16Mbps;80Mbps\",\"Characteristic Name\":"Internet Upload Speed;Internet Download Speed\",\"Source Product Code\":\"VLO-INT-0001\",\"Source Product Name\":\"Broadband Internet Small\"}',
                    vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"15\",\"Target Product Name\":\"Path1\"}'
            ));
            lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                    vlocity_cmt__InputData__c ='{\"Quantity\":\"11-20\",\"Characteristic Value\":\"16Mbps;80Mbps\",\"Characteristic Name\":"Internet Upload Speed;Internet Download Speed\",\"Source Product Code\":\"VLO-INT-0001\",\"Source Product Name\":\"Broadband Internet Small\"}',
                    vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"25\",\"Target Product Name\":\"Path1\"}'
            ));
            lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                    vlocity_cmt__InputData__c ='{\"Quantity\":\"1-10\",\"Characteristic Value\":\"18Mbps;90Mbps\",\"Characteristic Name\":"Internet Upload Speed;Internet Download Speed\",\"Source Product Code\":\"VLO-INT-0001\",\"Source Product Name\":\"Broadband Internet Small\"}',
                    vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"30\",\"Target Product Name\":\"Path1\"}'
            ));
            lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                    vlocity_cmt__InputData__c ='{\"Quantity\":\"1-10\",\"Characteristic Value\":\"20Mbps;100Mbps\",\"Characteristic Name\":"Internet Upload Speed;Internet Download Speed\",\"Source Product Code\":\"VLO-INT-0001\",\"Source Product Name\":\"Broadband Internet Small\"}',
                    vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"35\",\"Target Product Name\":\"Path1\"}'
            ));
        }
        else   //running test1
        {
            lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                    vlocity_cmt__InputData__c ='{\"Quantity\":\"1-10\",\"Characteristic Value\":\"Xfinity\",\"Characteristic Name\":"Provider\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                    vlocity_cmt__OutputData__c = '{\"NRC\":\"105\",\"MRC\":\"50\",\"Target Product Name\":\"Path3\"}'
            ));
            lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                    vlocity_cmt__InputData__c ='{\"Quantity\":\"11-20\",\"Characteristic Value\":\"Xfinity\",\"Characteristic Name\":"Provider\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                    vlocity_cmt__OutputData__c = '{\"NRC\":\"115\",\"MRC\":\"100\",\"Target Product Name\":\"Path3\"}'
            ));
            lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                    vlocity_cmt__InputData__c ='{\"Quantity\":\"1-10\",\"Characteristic Value\":\"Verizon\",\"Characteristic Name\":"Provider\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                    vlocity_cmt__OutputData__c = '{\"NRC\":\"125\",\"MRC\":\"300\",\"Target Product Name\":\"Path3\"}'
            ));
            lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                    vlocity_cmt__InputData__c ='{\"Quantity\":\"11-20\",\"Characteristic Value\":\"Verizon\",\"Characteristic Name\":"Provider\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                    vlocity_cmt__OutputData__c = '{\"NRC\":\"135\",\"MRC\":\"600\",\"Target Product Name\":\"Path3\"}'
            ));
        }
        insert lineItems;

        lineItems = [SELECT Name, vlocity_cmt__InputData__c, vlocity_cmt__OutputData__c FROM vlocity_cmt__CalculationMatrixRow__c WHERE Name != 'Header'];
        update new vlocity_cmt__CalculationMatrixVersion__c(Id = version.Id, vlocity_cmt__IsEnabled__c = true);

        //service
        vlocity_cmt__CalculationProcedure__c calcProcedure = new vlocity_cmt__CalculationProcedure__c(Name='TargetPathRangePricingDemoProcedureTest');
        insert calcProcedure;

        //Making isEnabled = false due to ERROR="Please add steps before enabling this procedure configuration."
        vlocity_cmt__CalculationProcedureVersion__c procVersion = new vlocity_cmt__CalculationProcedureVersion__c(Name='TargetPathRangePricingDemo V3', vlocity_cmt__VersionNumber__c=5, vlocity_cmt__IsEnabled__c=false,
                vlocity_cmt__CalculationProcedureId__c=calcProcedure.Id, vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-5), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(5), vlocity_cmt__Priority__c=5);
        insert procVersion;

        List<vlocity_cmt__CalculationProcedureStep__c> steps = new List<vlocity_cmt__CalculationProcedureStep__c> ();
        vlocity_cmt__CalculationProcedureStep__c step1 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQm', vlocity_cmt__Sequence__c=1,vlocity_cmt__Function__c='Matrix Lookup', vlocity_cmt__CalculationMatrixId__c=parent.Id, vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__Input__c='[{\"name\":\"Source Product Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"dea1b0\"},{\"name\":\"Source Product Code\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"15e771\"},{\"name\":\"Characteristic Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"a81456\"},{\"name\":\"Characteristic Value\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"880c2d\"},{\"name\":\"Quantity\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"94bbbe\"}]',
                vlocity_cmt__OutputMappingJSON__c ='{\"Target Product Name\":\"TargetPathRangePricing__TargetProductName\",\"MRC\":\"TargetPathRangePricing__MRC\",\"NRC\":\"TargetPathRangePricing__NRC\"}',
                vlocity_cmt__OutputJSON__c='[{\"name\":\"Target Product Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"fea7df\"},{\"name\":\"MRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"7776f5\"},{\"name\":\"NRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"ac5769\"}]');
        vlocity_cmt__CalculationProcedureStep__c step2 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQn', vlocity_cmt__Sequence__c=2,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='TargetPathRangePricing__MRC', vlocity_cmt__OutputJSON__c='{\"name\":\"REC_MNTH_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"REC_MNTH_STD_PRC\"}',
                vlocity_cmt__OutputMappingJSON__c = '{\"REC_MNTH_STD_PRC\":\"REC_MNTH_STD_PRC\"}', vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( TargetPathRangePricing )\",\"alias\":\"TargetPathRangePricing__MRC\",\"userDefined\":false,\"dataType\":\"Text\"}]');
        vlocity_cmt__CalculationProcedureStep__c step3 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQo', vlocity_cmt__Sequence__c=3,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='TargetPathRangePricing__NRC',vlocity_cmt__OutputMappingJSON__c = '{\"OT_STD_PRC\":\"OT_STD_PRC\"}',
                vlocity_cmt__OutputJSON__c='{\"name\":\"OT_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"OT_STD_PRC\"}',vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( TargetPathRangePricing )\",\"alias\":\"TargetPathRangePricing__NRC\",\"userDefined\":false,\"dataType\":\"Text\"}]' );
        steps.add(step1);
        steps.add(step2);
        steps.add(step3);
        insert steps;

        List<vlocity_cmt__CalculationProcedureVariable__c> calcProcVariableList = new List<vlocity_cmt__CalculationProcedureVariable__c>{
                new vlocity_cmt__CalculationProcedureVariable__c(name='REC_MNTH_STD_PRC',vlocity_cmt__alias__c='REC_MNTH_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='OT_STD_PRC',vlocity_cmt__alias__c='OT_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__defaultValue__c='27',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Name',vlocity_cmt__alias__c='SourceProductName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Code',vlocity_cmt__alias__c='SourceProductCode',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Name',vlocity_cmt__alias__c='CharacteristicName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Value',vlocity_cmt__alias__c='CharacteristicValue',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Quantity',vlocity_cmt__alias__c='Quantity',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Target Product Name',vlocity_cmt__alias__c='TargetPathRangePricing__TargetProductName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='MRC',vlocity_cmt__alias__c='TargetPathRangePricing__MRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='NRC',vlocity_cmt__alias__c='TargetPathRangePricing__NRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id)
                };
        insert calcProcVariableList;

        //Creating and enabling CalculationProcedureVersion
        update new vlocity_cmt__CalculationProcedureVersion__c(Id = procVersion.Id, vlocity_cmt__IsEnabled__c = true);

    }

    static private void testMatrix2Setup()
    {
        insert new vlocity_cmt__TriggerSetup__c(Name = 'AllTriggers', vlocity_cmt__IsTriggerOn__c = true);
        parent = new vlocity_cmt__CalculationMatrix__c(Name = 'TargetPathRangePricingMatrixTest');
        insert parent;

        version = new vlocity_cmt__CalculationMatrixVersion__c(Name = 'TargetPathRangePricing Version', vlocity_cmt__VersionNumber__c = 5,
                vlocity_cmt__IsEnabled__c = false, vlocity_cmt__CalculationMatrixId__c = parent.Id,
                vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-10), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(10),vlocity_cmt__Priority__c = 5);
        insert version;

        //Populating Headers
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":1,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Code\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":2,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":3,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Value\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":4,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"MRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":5,\"dataType\":\"Number\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"NRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":6,\"dataType\":\"Number\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"UP\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":7,\"dataType\":\"Number\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"UOM\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":8,\"dataType\":\"Text\"}'
        ));
        insert lineItems;

        //Populating Row Data
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();
        
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Characteristic Value\":\"Verizon\",\"Characteristic Name\":"Provider\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"0\",\"UOM\":\"p/day\",\"UP\":\"0.234\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Characteristic Value\":\"Xfinity\",\"Characteristic Name\":"Provider\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"0\",\"UOM\":\"kwh\",\"UP\":\"0.124\"}'
        ));
        
        insert lineItems;

        lineItems = [SELECT Name, vlocity_cmt__InputData__c, vlocity_cmt__OutputData__c FROM vlocity_cmt__CalculationMatrixRow__c WHERE Name != 'Header'];
        update new vlocity_cmt__CalculationMatrixVersion__c(Id = version.Id, vlocity_cmt__IsEnabled__c = true);

        //service
        vlocity_cmt__CalculationProcedure__c calcProcedure = new vlocity_cmt__CalculationProcedure__c(Name='TargetPathRangePricingDemoProcedureTest');
        insert calcProcedure;

        //Making isEnabled = false due to ERROR="Please add steps before enabling this procedure configuration."
        vlocity_cmt__CalculationProcedureVersion__c procVersion = new vlocity_cmt__CalculationProcedureVersion__c(Name='TargetPathRangePricingDemo V3', vlocity_cmt__VersionNumber__c=5, vlocity_cmt__IsEnabled__c=false,
                vlocity_cmt__CalculationProcedureId__c=calcProcedure.Id, vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-5), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(5), vlocity_cmt__Priority__c=5);
        insert procVersion;

        List<vlocity_cmt__CalculationProcedureStep__c> steps = new List<vlocity_cmt__CalculationProcedureStep__c> ();
        vlocity_cmt__CalculationProcedureStep__c step1 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQm', vlocity_cmt__Sequence__c=1,vlocity_cmt__Function__c='Matrix Lookup', vlocity_cmt__CalculationMatrixId__c=parent.Id, vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__Input__c='[{\"name\":\"Source Product Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"dea1b0\"},{\"name\":\"Source Product Code\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"15e771\"},{\"name\":\"Characteristic Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"a81456\"},{\"name\":\"Characteristic Value\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"880c2d\"},{\"name\":\"Quantity\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"94bbbe\"}]',
                vlocity_cmt__OutputMappingJSON__c ='{\"MRC\":\"TargetPathRangePricing__MRC\",\"NRC\":\"TargetPathRangePricing__NRC\",\"UP\":\"TargetPathRangePricing__UP\",\"UOM\":\"TargetPathRangePricing__UOM\"}',
                vlocity_cmt__OutputJSON__c='[{\"name\":\"MRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"7776f5\"},{\"name\":\"NRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"ac5769\"},{\"name\":\"UP\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"933787\"},{\"name\":\"UOM\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"6d6a3d\"}]');
        vlocity_cmt__CalculationProcedureStep__c step2 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQn', vlocity_cmt__Sequence__c=2,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='TargetPathRangePricing__MRC', vlocity_cmt__OutputJSON__c='{\"name\":\"REC_MNTH_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"REC_MNTH_STD_PRC\"}',
                vlocity_cmt__OutputMappingJSON__c = '{\"REC_MNTH_STD_PRC\":\"REC_MNTH_STD_PRC\"}', vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( TargetPathRangePricing )\",\"alias\":\"TargetPathRangePricing__MRC\",\"userDefined\":false,\"dataType\":\"Text\"}]');
        vlocity_cmt__CalculationProcedureStep__c step3 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQo', vlocity_cmt__Sequence__c=3,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='TargetPathRangePricing__NRC',vlocity_cmt__OutputMappingJSON__c = '{\"OT_STD_PRC\":\"OT_STD_PRC\"}',
                vlocity_cmt__OutputJSON__c='{\"name\":\"OT_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"OT_STD_PRC\"}',vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( TargetPathRangePricing )\",\"alias\":\"TargetPathRangePricing__NRC\",\"userDefined\":false,\"dataType\":\"Text\"}]' );
        
        vlocity_cmt__CalculationProcedureStep__c step4 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQp', vlocity_cmt__Sequence__c=4,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='TargetPathRangePricing__UP',vlocity_cmt__OutputMappingJSON__c = '{\"USAGE_STD_PRC\":\"USAGE_STD_PRC\"}',
                vlocity_cmt__OutputJSON__c='{\"name\":\"USAGE_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"USAGE_STD_PRC\"}',vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"UP ( TargetPathRangePricing )\",\"alias\":\"TargetPathRangePricing__UP\",\"userDefined\":false,\"dataType\":\"Text\"}]' );
        vlocity_cmt__CalculationProcedureStep__c step5 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQq', vlocity_cmt__Sequence__c=5,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='TargetPathRangePricing__UOM',vlocity_cmt__OutputMappingJSON__c = '{\"UOM\":\"UOM\"}',
                vlocity_cmt__OutputJSON__c='{\"name\":\"UOM\",\"dataType\":\"Text\",\"alias\":\"UOM\"}',vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"UOM ( TargetPathRangePricing )\",\"alias\":\"TargetPathRangePricing__UOM\",\"userDefined\":false,\"dataType\":\"Text\"}]' );
        steps.add(step1);
        steps.add(step2);
        steps.add(step3);
        steps.add(step4);
        steps.add(step5);
        insert steps;

        List<vlocity_cmt__CalculationProcedureVariable__c> calcProcVariableList = new List<vlocity_cmt__CalculationProcedureVariable__c>{
                new vlocity_cmt__CalculationProcedureVariable__c(name='REC_MNTH_STD_PRC',vlocity_cmt__alias__c='REC_MNTH_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='OT_STD_PRC',vlocity_cmt__alias__c='OT_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__defaultValue__c='27',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='USAGE_STD_PRC',vlocity_cmt__alias__c='USAGE_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__defaultValue__c='27',vlocity_cmt__precision__c=3,vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Name',vlocity_cmt__alias__c='SourceProductName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Code',vlocity_cmt__alias__c='SourceProductCode',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Name',vlocity_cmt__alias__c='CharacteristicName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Value',vlocity_cmt__alias__c='CharacteristicValue',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='UOM',vlocity_cmt__alias__c='UOM',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='UP',vlocity_cmt__alias__c='UP',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Target Product Name',vlocity_cmt__alias__c='TargetPathRangePricing__TargetProductName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='MRC',vlocity_cmt__alias__c='TargetPathRangePricing__MRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='NRC',vlocity_cmt__alias__c='TargetPathRangePricing__NRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='NRC',vlocity_cmt__alias__c='TargetPathRangePricing__UOM',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='NRC',vlocity_cmt__alias__c='TargetPathRangePricing__UP',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id)
                };
        insert calcProcVariableList;

        //Creating and enabling CalculationProcedureVersion
        update new vlocity_cmt__CalculationProcedureVersion__c(Id = procVersion.Id, vlocity_cmt__IsEnabled__c = true);
    
    }

    // Initialize Matrix and Procedure data for Attribute Range based pricing
    static private void attributeRangeBasedTargetPricingMatrixSetup() {
        insert new vlocity_cmt__TriggerSetup__c(Name = 'AllTriggers', vlocity_cmt__IsTriggerOn__c = true);
        parent = new vlocity_cmt__CalculationMatrix__c(Name = 'TargetPathRangePricingMatrixTest');
        insert parent;

        version = new vlocity_cmt__CalculationMatrixVersion__c(Name = 'TargetPathRangePricing Version', vlocity_cmt__VersionNumber__c = 5,
                vlocity_cmt__IsEnabled__c = false, vlocity_cmt__CalculationMatrixId__c = parent.Id,
                vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-10), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(10),vlocity_cmt__Priority__c = 5);
        insert version;

        //Populating Headers
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":1,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Code\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":2,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":3,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Value\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":4,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Quantity\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":5,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Target Product Name\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":6,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"MRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":7,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"NRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":8,\"dataType\":\"Text\"}'
        ));
        insert lineItems;

        //Populating Row Data
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();

        // Quantity:1-10, TV Content: SD, TV Boxes Required: 1-5
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                                                               vlocity_cmt__InputData__c ='{\"Quantity\":\"1-10\",\"Characteristic Value\":\"SD;1-5\",\"Characteristic Name\":"TV Content;TV Boxes Required\",\"Source Product Code\":\"VLO-TV-0008\",\"Source Product Name\":\"HD TV\"}',
                                                               vlocity_cmt__OutputData__c = '{\"NRC\":\"105\",\"MRC\":\"50\",\"Target Product Name\":\"Path1\"}'
                                                              ));
        // Quantity:1-10, TV Content: SD, TV Boxes Required: 6-10
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                                                               vlocity_cmt__InputData__c ='{\"Quantity\":\"1-10\",\"Characteristic Value\":\"SD;6-10\",\"Characteristic Name\":"TV Content;TV Boxes Required\",\"Source Product Code\":\"VLO-TV-0008\",\"Source Product Name\":\"HD TV\"}',
                                                               vlocity_cmt__OutputData__c = '{\"NRC\":\"115\",\"MRC\":\"100\",\"Target Product Name\":\"Path1\"}'
                                                              ));
        // Quantity:1-10, TV Content: HD, TV Boxes Required: 1-5
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                                                               vlocity_cmt__InputData__c ='{\"Quantity\":\"1-10\",\"Characteristic Value\":\"HD;1-5\",\"Characteristic Name\":"TV Content;TV Boxes Required\",\"Source Product Code\":\"VLO-TV-0008\",\"Source Product Name\":\"HD TV\"}',
                                                               vlocity_cmt__OutputData__c = '{\"NRC\":\"125\",\"MRC\":\"300\",\"Target Product Name\":\"Path1\"}'
                                                              ));
        // Quantity:1-10, TV Content: HD, TV Boxes Required: 6-10
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                                                               vlocity_cmt__InputData__c ='{\"Quantity\":\"1-10\",\"Characteristic Value\":\"HD;6-10\",\"Characteristic Name\":"TV Content;TV Boxes Required\",\"Source Product Code\":\"VLO-TV-0008\",\"Source Product Name\":\"HD TV\"}',
                                                               vlocity_cmt__OutputData__c = '{\"NRC\":\"135\",\"MRC\":\"400\",\"Target Product Name\":\"Path1\"}'
                                                              ));
        // Quantity:11-20, TV Content: SD, TV Boxes Required: 1-5
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                                                               vlocity_cmt__InputData__c ='{\"Quantity\":\"11-20\",\"Characteristic Value\":\"SD;1-5\",\"Characteristic Name\":"TV Content;TV Boxes Required\",\"Source Product Code\":\"VLO-TV-0008\",\"Source Product Name\":\"HD TV\"}',
                                                               vlocity_cmt__OutputData__c = '{\"NRC\":\"115\",\"MRC\":\"175\",\"Target Product Name\":\"Path1\"}'
                                                              ));
        // Quantity:11-20, TV Content: SD, TV Boxes Required: 6-10
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                                                               vlocity_cmt__InputData__c ='{\"Quantity\":\"11-20\",\"Characteristic Value\":\"SD;6-10\",\"Characteristic Name\":"TV Content;TV Boxes Required\",\"Source Product Code\":\"VLO-TV-0008\",\"Source Product Name\":\"HD TV\"}',
                                                               vlocity_cmt__OutputData__c = '{\"NRC\":\"125\",\"MRC\":\"225\",\"Target Product Name\":\"Path3\"}'
                                                              ));
        // Quantity:11-20, TV Content: HD, TV Boxes Required: 1-5
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                                                               vlocity_cmt__InputData__c ='{\"Quantity\":\"11-20\",\"Characteristic Value\":\"HD;1-5\",\"Characteristic Name\":"TV Content;TV Boxes Required\",\"Source Product Code\":\"VLO-TV-0008\",\"Source Product Name\":\"HD TV\"}',
                                                               vlocity_cmt__OutputData__c = '{\"NRC\":\"130\",\"MRC\":\"350\",\"Target Product Name\":\"Path3\"}'
                                                              ));
        // Quantity:11-20, TV Content: SD, TV Box Required: 6-10
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                                                               vlocity_cmt__InputData__c ='{\"Quantity\":\"11-20\",\"Characteristic Value\":\"HD;6-10\",\"Characteristic Name\":"TV Content;TV Boxes Required\",\"Source Product Code\":\"VLO-TV-0008\",\"Source Product Name\":\"HD TV\"}',
                                                               vlocity_cmt__OutputData__c = '{\"NRC\":\"150\",\"MRC\":\"600\",\"Target Product Name\":\"Path3\"}'
                                                              ));
        insert lineItems;

        lineItems = [SELECT Name, vlocity_cmt__InputData__c, vlocity_cmt__OutputData__c FROM vlocity_cmt__CalculationMatrixRow__c WHERE Name != 'Header'];
        update new vlocity_cmt__CalculationMatrixVersion__c(Id = version.Id, vlocity_cmt__IsEnabled__c = true);

        List<vlocity_cmt__CalculationMatrixRow__c> rows = [SELECT Id, Name, vlocity_cmt__CalculationMatrixVersionId__c FROM vlocity_cmt__CalculationMatrixRow__c];

        //service
        vlocity_cmt__CalculationProcedure__c calcProcedure = new vlocity_cmt__CalculationProcedure__c(Name='TargetPathRangePricingDemoProcedureTest');
        insert calcProcedure;

        //Making isEnabled = false due to ERROR="Please add steps before enabling this procedure configuration."
        vlocity_cmt__CalculationProcedureVersion__c procVersion = new vlocity_cmt__CalculationProcedureVersion__c(Name='TargetPathRangePricingDemo V3', vlocity_cmt__VersionNumber__c=5, vlocity_cmt__IsEnabled__c=false,
                vlocity_cmt__CalculationProcedureId__c=calcProcedure.Id, vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-5), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(5), vlocity_cmt__Priority__c=5);
        insert procVersion;

        List<vlocity_cmt__CalculationProcedureStep__c> steps = new List<vlocity_cmt__CalculationProcedureStep__c> ();
        vlocity_cmt__CalculationProcedureStep__c step1 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQm', vlocity_cmt__Sequence__c=1,vlocity_cmt__Function__c='Matrix Lookup', vlocity_cmt__CalculationMatrixId__c=parent.Id, vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__Input__c='[{\"name\":\"Source Product Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"dea1b0\"},{\"name\":\"Source Product Code\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"15e771\"},{\"name\":\"Characteristic Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"a81456\"},{\"name\":\"Characteristic Value\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"880c2d\"},{\"name\":\"Quantity\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"94bbbe\"}]',
                vlocity_cmt__OutputMappingJSON__c ='{\"Target Product Name\":\"TargetPathRangePricing__TargetProductName\",\"MRC\":\"TargetPathRangePricing__MRC\",\"NRC\":\"TargetPathRangePricing__NRC\"}',
                vlocity_cmt__OutputJSON__c='[{\"name\":\"Target Product Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"fea7df\"},{\"name\":\"MRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"7776f5\"},{\"name\":\"NRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"ac5769\"}]');
        vlocity_cmt__CalculationProcedureStep__c step2 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQn', vlocity_cmt__Sequence__c=2,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='TargetPathRangePricing__MRC', vlocity_cmt__OutputJSON__c='{\"name\":\"REC_MNTH_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"REC_MNTH_STD_PRC\"}',
                vlocity_cmt__OutputMappingJSON__c = '{\"REC_MNTH_STD_PRC\":\"REC_MNTH_STD_PRC\"}', vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( TargetPathRangePricing )\",\"alias\":\"TargetPathRangePricing__MRC\",\"userDefined\":false,\"dataType\":\"Text\"}]');
        vlocity_cmt__CalculationProcedureStep__c step3 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQo', vlocity_cmt__Sequence__c=3,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='TargetPathRangePricing__NRC',vlocity_cmt__OutputMappingJSON__c = '{\"OT_STD_PRC\":\"OT_STD_PRC\"}',
                vlocity_cmt__OutputJSON__c='{\"name\":\"OT_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"OT_STD_PRC\"}',vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( TargetPathRangePricing )\",\"alias\":\"TargetPathRangePricing__NRC\",\"userDefined\":false,\"dataType\":\"Text\"}]' );
        steps.add(step1);
        steps.add(step2);
        steps.add(step3);
        insert steps;

        List<vlocity_cmt__CalculationProcedureVariable__c> calcProcVariableList = new List<vlocity_cmt__CalculationProcedureVariable__c>{
                new vlocity_cmt__CalculationProcedureVariable__c(name='REC_MNTH_STD_PRC',vlocity_cmt__alias__c='REC_MNTH_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='OT_STD_PRC',vlocity_cmt__alias__c='OT_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__defaultValue__c='27',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Name',vlocity_cmt__alias__c='SourceProductName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Code',vlocity_cmt__alias__c='SourceProductCode',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Name',vlocity_cmt__alias__c='CharacteristicName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Value',vlocity_cmt__alias__c='CharacteristicValue',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Quantity',vlocity_cmt__alias__c='Quantity',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Target Product Name',vlocity_cmt__alias__c='TargetPathRangePricing__TargetProductName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='MRC',vlocity_cmt__alias__c='TargetPathRangePricing__MRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='NRC',vlocity_cmt__alias__c='TargetPathRangePricing__NRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id)
                };
        insert calcProcVariableList;

        //Creating and enabling CalculationProcedureVersion
        update new vlocity_cmt__CalculationProcedureVersion__c(Id = procVersion.Id, vlocity_cmt__IsEnabled__c = true);

    }

    static private void testOverlappingAttributeRangeMatrixSetup() {
        insert new vlocity_cmt__TriggerSetup__c(Name = 'AllTriggers', vlocity_cmt__IsTriggerOn__c = true);
        parent = new vlocity_cmt__CalculationMatrix__c(Name = 'AttributeRangePricingMatrixTest');
        insert parent;

        version = new vlocity_cmt__CalculationMatrixVersion__c(Name = 'AttributeRangePricingMatrixTest Version', vlocity_cmt__VersionNumber__c = 5,
                vlocity_cmt__IsEnabled__c = false, vlocity_cmt__CalculationMatrixId__c = parent.Id,
                vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-10), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(10),vlocity_cmt__Priority__c = 5);
        insert version;

        //Populating Headers
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":1,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Code\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":2,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":3,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Value\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":4,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"MRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":5,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"NRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":6,\"dataType\":\"Text\"}'
        ));
        insert lineItems;

        //Populating Row Data
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{"Characteristic Value\":\"0-15;50Mbps\",\"Characteristic Name\":"Internet Upload Speed;Internet Download Speed\",\"Source Product Code\":\"VLO-INT-0001\",\"Source Product Name\":\"Broadband Internet Small\"}',
                vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"15\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Characteristic Value\":\"0-20;75Mbps\",\"Characteristic Name\":"Internet Upload Speed;Internet Download Speed\",\"Source Product Code\":\"VLO-INT-0001\",\"Source Product Name\":\"Broadband Internet Small\"}',
                vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"25\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Characteristic Value\":\"0-10;100Mbps\",\"Characteristic Name\":"Internet Upload Speed;Internet Download Speed\",\"Source Product Code\":\"VLO-INT-0001\",\"Source Product Name\":\"Broadband Internet Small\"}',
                vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"30\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Characteristic Value\":\"0-5;125Mbps\",\"Characteristic Name\":"Internet Upload Speed;Internet Download Speed\",\"Source Product Code\":\"VLO-INT-0001\",\"Source Product Name\":\"Broadband Internet Small\"}',
                vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"35\"}'
        ));
        insert lineItems;

        lineItems = [SELECT Name, vlocity_cmt__InputData__c, vlocity_cmt__OutputData__c FROM vlocity_cmt__CalculationMatrixRow__c WHERE Name != 'Header'];
        update new vlocity_cmt__CalculationMatrixVersion__c(Id = version.Id, vlocity_cmt__IsEnabled__c = true);

        //service
        vlocity_cmt__CalculationProcedure__c calcProcedure = new vlocity_cmt__CalculationProcedure__c(Name='AttributeRangePricingDemoProcedureTest');
        insert calcProcedure;

        //Making isEnabled = false due to ERROR="Please add steps before enabling this procedure configuration."
        vlocity_cmt__CalculationProcedureVersion__c procVersion = new vlocity_cmt__CalculationProcedureVersion__c(Name='AttributeRangePricingDemo V3', vlocity_cmt__VersionNumber__c=5, vlocity_cmt__IsEnabled__c=false,
                vlocity_cmt__CalculationProcedureId__c=calcProcedure.Id, vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-5), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(5), vlocity_cmt__Priority__c=5);
        insert procVersion;

        List<vlocity_cmt__CalculationProcedureStep__c> steps = new List<vlocity_cmt__CalculationProcedureStep__c> ();
        vlocity_cmt__CalculationProcedureStep__c step1 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQm', vlocity_cmt__Sequence__c=1,vlocity_cmt__Function__c='Matrix Lookup', vlocity_cmt__CalculationMatrixId__c=parent.Id, vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__Input__c='[{\"name\":\"Source Product Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"dea1b0\"},{\"name\":\"Source Product Code\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"15e771\"},{\"name\":\"Characteristic Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"a81456\"},{\"name\":\"Characteristic Value\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"880c2d\"}]',
                vlocity_cmt__OutputMappingJSON__c ='{\"MRC\":\"AttributeRangePricing__MRC\",\"NRC\":\"AttributeRangePricing__NRC\"}',
                vlocity_cmt__OutputJSON__c='[{\"name\":\"Target Product Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"fea7df\"},{\"name\":\"MRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"7776f5\"},{\"name\":\"NRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"ac5769\"}]');
        vlocity_cmt__CalculationProcedureStep__c step2 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQn', vlocity_cmt__Sequence__c=2,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='AttributeRangePricing__MRC', vlocity_cmt__OutputJSON__c='{\"name\":\"REC_MNTH_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"REC_MNTH_STD_PRC\"}',
                vlocity_cmt__OutputMappingJSON__c = '{\"REC_MNTH_STD_PRC\":\"REC_MNTH_STD_PRC\"}', vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( AttributeRangePricing )\",\"alias\":\"AttributeRangePricing__MRC\",\"userDefined\":false,\"dataType\":\"Text\"}]');
        vlocity_cmt__CalculationProcedureStep__c step3 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQo', vlocity_cmt__Sequence__c=3,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='AttributeRangePricing__NRC',vlocity_cmt__OutputMappingJSON__c = '{\"OT_STD_PRC\":\"OT_STD_PRC\"}',
                vlocity_cmt__OutputJSON__c='{\"name\":\"OT_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"OT_STD_PRC\"}',vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( AttributeRangePricing )\",\"alias\":\"AttributeRangePricing__NRC\",\"userDefined\":false,\"dataType\":\"Text\"}]' );
        steps.add(step1);
        steps.add(step2);
        steps.add(step3);
        insert steps;

        List<vlocity_cmt__CalculationProcedureVariable__c> calcProcVariableList = new List<vlocity_cmt__CalculationProcedureVariable__c>{
                new vlocity_cmt__CalculationProcedureVariable__c(name='REC_MNTH_STD_PRC',vlocity_cmt__alias__c='REC_MNTH_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='OT_STD_PRC',vlocity_cmt__alias__c='OT_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__defaultValue__c='27',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Name',vlocity_cmt__alias__c='SourceProductName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Code',vlocity_cmt__alias__c='SourceProductCode',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Name',vlocity_cmt__alias__c='CharacteristicName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Value',vlocity_cmt__alias__c='CharacteristicValue',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='MRC',vlocity_cmt__alias__c='AttributeRangePricing__MRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='NRC',vlocity_cmt__alias__c='AttributeRangePricing__NRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id)
                };
        insert calcProcVariableList;

        //Creating and enabling CalculationProcedureVersion
        update new vlocity_cmt__CalculationProcedureVersion__c(Id = procVersion.Id, vlocity_cmt__IsEnabled__c = true);

    }

    static private vlocity_cmt.CpqCartDocument rangeABPWithDifferentQuantityMatrixSetup(){

        vlocity_cmt__GeneralSettings__c toggleSetting = new vlocity_cmt__GeneralSettings__c(Name = 'FixToggleList', vlocity_cmt__Value__c = 'UnitTestContextBypass');
        insert toggleSetting;
		String cartJson = '{"lineitems":[{"orderactive":false,"haschildren":true,"linenumber":"0001","specificationyype":"Product","assetreferenceid":"ad0648b6-1772-4250-8c13-67d2b1b04486","versionlabel":null,"productglobalgroupkey":"90cfac05-8d1c-9796-a585-feead252f3d6","lifecyclestatus":"Draft","isconfigurable":false,"subtype":"None","type":"None","productid":"01txx0000006iC8AAI","productcode":"RangeABP Product5913","name":"RangeABP Product5913","producthierarchypath":"01txx0000006iC8AAI","pcichildlinenumber":"1","collapsehierarchy":false,"ispcioverride":false,"isvirtualitem":false,"productchilditemid":"a3Oxx0000004C92EAE","sequencenumber":1,"groupmaxquantity":99999,"groupminquantity":0,"maxquantity":99999,"minquantity":0,"defaultquantity":1,"pricebookentryid":"01uxx0000008yggAAA","recurringprice":0,"unitprice":0,"quantity":5,"itemtype":"lineItem","action":"Add","rootitemid":"ad0648b6-1772-4250-8c13-67d2b1b04486","messages":[],"cpqcardinalitymessage":null,"priceListId":"a3Gxx0000004C92EAE","attributeCategories":{"totalSize":1,"records":[{"uiStates":{},"nameResult":{"productAttributes":{"totalSize":2,"records":[{"uiStates":{},"nameResult":{},"messages":[],"fields":{"isNotAssetizable":false},"displaySequence":1,"actions":{},"values":[{"value":null,"selected":null,"rules":[],"readonly":false,"name":null,"label":null,"id":null,"displaySequence":null,"disabled":false,"defaultValue":null,"defaultSelected":null}],"userValues":{"value":"64GB"},"step":null,"rules":[],"required":false,"readonly":false,"placeholder":null,"pattern":null,"multiselect":false,"minLongValue":null,"minlength":null,"min":null,"maxLongValue":null,"maxlength":null,"max":null,"label":"Capacity","isRatingAttribute":null,"isNotTranslatable":false,"isNotAssetizable":null,"isConfigurable":null,"inputType":"text","hidden":false,"hasRules":false,"formatMask":null,"filterable":false,"disabled":false,"description":null,"dataType":"text","customTemplate":null,"code":"Capacity","cloneable":true,"cacheable":true,"autocomplete":null,"attributeId":"a0axx000000FfgqAAC","attributeConfigurable":null}],"name":null,"messages":[],"description":null,"data":{"totalSize":null,"messages":[],"dataMap":{},"actions":{}},"actions":{}}},"messages":[],"fields":{"id":"a0Zxx000000c3mzEAA","Name":"MLS","Code__c":"MLS"},"displaySequence":10,"actions":{}}],"name":null,"messages":[],"description":null,"data":{"totalSize":null,"messages":[],"dataMap":{},"actions":{}},"actions":{}}}]}';
        vlocity_cmt.CpqCartDocument cartDocument = vlocity_cmt.CpqCartDocument.initializeCartFromString(cartJson);

        vlocity_cmt__TriggerSetup__c itemTrigger = new vlocity_cmt__TriggerSetup__c(Name='AllTriggers', vlocity_cmt__IsTriggerOn__c=true);
        insert itemTrigger;

        vlocity_cmt__CpqConfigurationSetup__c configSetup = new vlocity_cmt__CpqConfigurationSetup__c(Name = 'DeltaPrice', vlocity_cmt__SetupValue__c = 'True');
        insert configSetup;

		vlocity_cmt__AttributeCategory__c attrCategory = new vlocity_cmt__AttributeCategory__c(Name='Logistics', vlocity_cmt__DisplaySequence__c=23, vlocity_cmt__Code__c='VLO-PRO-0015');
		insert attrCategory;


        vlocity_cmt__Attribute__c attr = new vlocity_cmt__Attribute__c(Name='Capacity',vlocity_cmt__AttributeCategoryId__c=attrCategory.Id, vlocity_cmt__Code__c='Capacity', vlocity_cmt__ActiveFlg__c=True);
		insert attr;

        vlocity_cmt.VlocityFeatureService.enableV2AttributeModel();
		
		populatePVBAndMappings();

        parent = new vlocity_cmt__CalculationMatrix__c(Name = 'RangeAttributePricingMatrix');
        insert parent;

        version = new vlocity_cmt__CalculationMatrixVersion__c(Name = 'RangeAttributePricingMatrix v2', vlocity_cmt__VersionNumber__c = 2,
                vlocity_cmt__IsEnabled__c = false, vlocity_cmt__CalculationMatrixId__c = parent.Id,
                vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-10), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(10),vlocity_cmt__Priority__c = 1);
        insert version;

        //Populating Headers
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"name\":\"Source Product Name\",\"listValues\":null,\"lineItemId\":\"a1Wf4000004FkU6EAK\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":1,\"dataType\":\"Text\",\"columnKey\":\"13c541\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"name\":\"Source Product Code\",\"listValues\":null,\"lineItemId\":\"a1Wf4000004FkU7EAK\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":2,\"dataType\":\"Text\",\"columnKey\":\"3a0611\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"name\":\"Characteristic Name\",\"listValues\":null,\"lineItemId\":\"a1Wf4000004FkU8EAK\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":3,\"dataType\":\"Text\",\"columnKey\":\"26ee5f\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"name\":\"Characteristic Value\",\"listValues\":null,\"lineItemId\":\"a1Wf4000004FkU9EAK\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":4,\"dataType\":\"Text\",\"columnKey\":\"2a0cd2\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"name\":\"Quantity\",\"listValues\":null,\"lineItemId\":\"a1Wf4000004FkUAEA0\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":5,\"dataType\":\"Text\",\"columnKey\":\"bd81e8\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"name\":\"MRC\",\"listValues\":null,\"lineItemId\":\"a1Wf4000004FkUBEA0\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":6,\"dataType\":\"Text\",\"columnKey\":\"7cdae9\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"name\":\"NRC\",\"listValues\":null,\"lineItemId\":\"a1Wf4000004FkU5EAK\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":7,\"dataType\":\"Text\",\"columnKey\":\"7cea71\"}'
        ));
        insert lineItems;


        //Populating Row Data
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Quantity\" : \"3-8\",\"Characteristic Value\" : \"64GB\",\"Characteristic Name\" : \"Capacity\",\"Source Product Code\" : \"RangeABP Product5913\",\"Source Product Name\" : \"RangeABP Product5913\"}',
                vlocity_cmt__OutputData__c = '{ \"NRC\" : \"20\", \"MRC\" : \"10\" }',
                Name = '601b431b49323bff311431297909e578'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Quantity\" : \"1-2\",\"Characteristic Value\" : \"64GB\",\"Characteristic Name\" : \"Capacity\",\"Source Product Code\" : \"RangeABP Product5913\",\"Source Product Name\" : \"RangeABP Product5913\"}',
                vlocity_cmt__OutputData__c = '{ \"NRC\" : \"10\", \"MRC\" : \"10\" }',
                Name  = 'f98e91b68697aedee136f5ce74c7ab15'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Quantity\" : \"1-4\",\"Characteristic Value\" : \"128GB\",\"Characteristic Name\" : \"Capacity\",\"Source Product Code\" : \"RangeABP Product5913\",\"Source Product Name\" : \"RangeABP Product5913\"}',
                vlocity_cmt__OutputData__c = '{ \"NRC\" : \"40\", \"MRC\" : \"10\" }',
                Name = 'a39a02535a8372d9d89e9a0a83d8b673'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Quantity\" : \"5-15\",\"Characteristic Value\" : \"128GB\",\"Characteristic Name\" : \"Capacity\",\"Source Product Code\" : \"RangeABP Product5913\",\"Source Product Name\" : \"RangeABP Product5913\"}',
                vlocity_cmt__OutputData__c = '{ \"NRC\" : \"50\", \"MRC\" : \"10\" }',
                    Name = 'cfd95f99ac97cb146f1803c15267212d'
        ));
        insert lineItems;

        lineItems = [SELECT Name, vlocity_cmt__InputData__c, vlocity_cmt__OutputData__c FROM vlocity_cmt__CalculationMatrixRow__c WHERE Name != 'Header'];
        update new vlocity_cmt__CalculationMatrixVersion__c(Id = version.Id, vlocity_cmt__IsEnabled__c = true);

        //service
        vlocity_cmt__CalculationProcedure__c calcProcedure = new vlocity_cmt__CalculationProcedure__c(Name='RangeAttributePricingProcedure');
        insert calcProcedure;

        //Making isEnabled = false due to ERROR="Please add steps before enabling this procedure configuration."
        vlocity_cmt__CalculationProcedureVersion__c procVersion = new vlocity_cmt__CalculationProcedureVersion__c(Name='RangeAttributePricingProcedure v2', vlocity_cmt__VersionNumber__c=2, vlocity_cmt__IsEnabled__c=false,
                vlocity_cmt__CalculationProcedureId__c=calcProcedure.Id, vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-5), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(5), vlocity_cmt__Priority__c=1);
        insert procVersion;

        List<vlocity_cmt__CalculationProcedureStep__c> steps = new List<vlocity_cmt__CalculationProcedureStep__c> ();
        vlocity_cmt__CalculationProcedureStep__c step1 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQm', vlocity_cmt__Sequence__c=1,vlocity_cmt__Function__c='Matrix Lookup', vlocity_cmt__CalculationMatrixId__c=parent.Id, vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__Input__c='[{\"name\":\"Source Product Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"dea1b0\"},{\"name\":\"Source Product Code\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"15e771\"},{\"name\":\"Characteristic Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"a81456\"},{\"name\":\"Characteristic Value\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"880c2d\"},{\"name\":\"Quantity\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"94bbbe\"}]',
                vlocity_cmt__OutputMappingJSON__c ='{\"MRC\":\"RangeWithDifferentQuantityPricing__MRC\",\"NRC\":\"RangeWithDifferentQuantityPricing__NRC\"}',
                vlocity_cmt__OutputJSON__c='[{\"name\":\"MRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"7776f5\"},{\"name\":\"NRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"ac5769\"}]');
        vlocity_cmt__CalculationProcedureStep__c step2 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQn', vlocity_cmt__Sequence__c=2,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='RangeWithDifferentQuantityPricing__MRC', vlocity_cmt__OutputJSON__c='{\"name\":\"REC_MNTH_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"REC_MNTH_STD_PRC\"}',
                vlocity_cmt__OutputMappingJSON__c = '{\"REC_MNTH_STD_PRC\":\"REC_MNTH_STD_PRC\"}',
                vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( RangeAttributePricingMatrix )\",\"alias\":\"RangeWithDifferentQuantityPricing__MRC\",\"userDefined\":false,\"dataType\":\"Text\"}]');
        vlocity_cmt__CalculationProcedureStep__c step3 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQo', vlocity_cmt__Sequence__c=3,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='RangeWithDifferentQuantityPricing__NRC', vlocity_cmt__OutputJSON__c='{\"name\":\"OT_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"OT_STD_PRC\"}',
                vlocity_cmt__OutputMappingJSON__c = '{\"OT_STD_PRC\":\"OT_STD_PRC\"}',
                vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( RangeAttributePricingMatrix )\",\"alias\":\"RangeWithDifferentQuantityPricing__NRC\",\"userDefined\":false,\"dataType\":\"Text\"}]' );
        steps.add(step1);
        steps.add(step2);
        steps.add(step3);
        insert steps;

        List<vlocity_cmt__CalculationProcedureVariable__c> calcProcVariableList = new List<vlocity_cmt__CalculationProcedureVariable__c>{
                new vlocity_cmt__CalculationProcedureVariable__c(name='REC_MNTH_STD_PRC',vlocity_cmt__alias__c='REC_MNTH_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='OT_STD_PRC',vlocity_cmt__alias__c='OT_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Name',vlocity_cmt__alias__c='SourceProductName',vlocity_cmt__datatype__c='Text',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Code',vlocity_cmt__alias__c='SourceProductCode',vlocity_cmt__datatype__c='Text',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Name',vlocity_cmt__alias__c='CharacteristicName',vlocity_cmt__datatype__c='Text',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Value',vlocity_cmt__alias__c='CharacteristicValue',vlocity_cmt__datatype__c='Text',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Quantity',vlocity_cmt__alias__c='Quantity',vlocity_cmt__datatype__c='Text',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='MRC',vlocity_cmt__alias__c='RangeAttributePricingMatrix__NRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='NRC',vlocity_cmt__alias__c='RangeAttributePricingMatrix__MRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id)
                };
        insert calcProcVariableList;

        //Creating and enabling CalculationProcedureVersion
        update new vlocity_cmt__CalculationProcedureVersion__c(Id = procVersion.Id, vlocity_cmt__IsEnabled__c = true);
                
        return cartDocument;
        }

    /*
    JIRA ticket : CMT-5913
    Input : "RangeABP Product5913" order Item which has "Capacity"  ......  Selected : "64 GB" with Quantity 5
    Output : MRC 10 and NRC 20
    */
    @isTest
    static private void rangeABPWithDifferentQuantityRanges(){
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String,Object>();
        Map<String, Object> input = new Map<String, Object>();

        vlocity_cmt.CpqCartDocument cartDocument = rangeABPWithDifferentQuantityMatrixSetup();

        input.put('ProcedureName','RangeAttributePricingProcedure');
        input.put('MatrixName','RangeAttributePricingMatrix');
        input.put('RangeFields','Quantity');
        input.put('UseDisplayTextForValues','true');
        input.put('IncludeAttrInfoInRangeKeys','true');
        input.put('cartDocument', cartDocument);

        Test.startTest();
        CpqNextPricingPlanHelper testing = new CpqNextPricingPlanHelper();
        testing.invokeMethod('GetCalculationProcedurePrice',input,output,options);

        Boolean assertExecuted = false;
        
		Map<String, Object> cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
		Map<String, vlocity_cmt.CpqCartDocumentItem> allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');
        
		for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
		{
			Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name','vlocity_cmt__RecurringCharge__c', 'vlocity_cmt__OneTimeCharge__c'}});
			Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
            String lineItemName = (String)fieldValueMap.get('name');
            if(lineItemName.equals('RangeABP Product5913'))
			{
                System.assert(fieldValueMap.get('vlocity_cmt__RecurringCharge__c') == 10.00 );
                System.assert(fieldValueMap.get('vlocity_cmt__OneTimeCharge__c') == 20.00 );
                assertExecuted = true;
                break;
            }
        }
        System.assert(assertExecuted);
        Test.stopTest();
    }

    @isTest
    static private void testABPUsingBPOs()
    {

        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String,Object>();
        Map<String, Object> input = new Map<String, Object>();

		try
		{
			SObject calculationMatrixBPO = (SObject)Type.forName('CalculationMatrix').newInstance();
		}
		catch(Exception ex)
		{
			return;
		}

        Test.startTest();

        vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup();
        testMatrixSetupUsingBPOs();

        input.put('ProcedureName','TargetPathRangePricingDemoProcedureTest');
        input.put('MatrixName','TargetPathRangePricing');
        input.put('Path3','Triple Play Bundle Small<TV Small<HD TV');
        input.put('RangeFields','Quantity');
        input.put('RangeAttributes','TV Boxes Required');
        input.put('SourceTargetABP','True');
        input.put('DecisionMatrix','True');
        input.put('cartDocument', cartDocument);

        CpqNextPricingPlanHelper testing = new CpqNextPricingPlanHelper();
        testing.invokeMethod('GetCalculationProcedurePrice',input,output,options);

        Boolean assertExecuted = false;

        
        Map<String, Object> cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
        Map<String, vlocity_cmt.CpqCartDocumentItem> allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');

        for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
        {
			Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name','vlocity_cmt__RecurringCharge__c', 'vlocity_cmt__OneTimeCharge__c'}});
			Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
			String lineItemName = (String)fieldValueMap.get('name');
			if(lineItemName.equals('HD TV'))
			{
				System.assert(fieldValueMap.get('vlocity_cmt__RecurringCharge__c') == 300.00 );
				System.assert(fieldValueMap.get('vlocity_cmt__OneTimeCharge__c') == 125.00 );
			}
        }

        Test.stopTest();
    }

    // This is the utility set up for configuring/populating data for decision metrics and expression sets using BPOs. 
    static private void testMatrixSetupUsingBPOs() 
    {
        insert new vlocity_cmt__TriggerSetup__c(Name = 'AllTriggers', vlocity_cmt__IsTriggerOn__c = true);
        parentSobj = (SObject)Type.forName('CalculationMatrix').newInstance();
        parentSobj.put('Name', 'TargetPathRangePricing');
        parentSobj.put('Type', 'Standard'); 
        insert parentSobj;

        //Populating Headers
        lineItemsSobj = new List<SObject>();
        SObject headerCharName =  (SObject)Type.forName('CalculationMatrixColumn').newInstance();
        headerCharName.put('CalculationMatrixId', parentSobj.Id); 
        headerCharName.put('Name', 'CharacteristicName');
        headerCharName.put('ApiName', 'CharacteristicName');
        headerCharName.put('ColumnType', 'Input');
        headerCharName.put('DataType', 'Text');
        headerCharName.put('DisplaySequence', 1);
        lineItemsSobj.add(headerCharName);

        SObject headerSourceProdCode =  (SObject)Type.forName('CalculationMatrixColumn').newInstance();
        headerSourceProdCode.put('CalculationMatrixId', parentSobj.Id); 
        headerSourceProdCode.put('Name', 'SourceProductCode');
        headerSourceProdCode.put('ApiName', 'SourceProductCode');
        headerSourceProdCode.put('ColumnType', 'Input');
        headerSourceProdCode.put('DataType', 'Text');
        headerSourceProdCode.put('DisplaySequence', 2);
        lineItemsSobj.add(headerSourceProdCode);

        SObject headerSourceProdName =  (SObject)Type.forName('CalculationMatrixColumn').newInstance();
        headerSourceProdName.put('CalculationMatrixId', parentSobj.Id); 
        headerSourceProdName.put('Name', 'SourceProductName');
        headerSourceProdName.put('ApiName', 'SourceProductName');
        headerSourceProdName.put('ColumnType', 'Input');
        headerSourceProdName.put('DataType', 'Text');
        headerSourceProdName.put('DisplaySequence', 3);
        lineItemsSobj.add(headerSourceProdName);

        SObject headerCharValue =  (SObject)Type.forName('CalculationMatrixColumn').newInstance();
        headerCharValue.put('CalculationMatrixId', parentSobj.Id); 
        headerCharValue.put('Name', 'CharacteristicValue');
        headerCharValue.put('ApiName', 'CharacteristicValue');
        headerCharValue.put('ColumnType', 'Input');
        headerCharValue.put('DataType', 'Text');
        headerCharValue.put('DisplaySequence', 4);
        lineItemsSobj.add(headerCharValue);

        SObject headerQuantity =  (SObject)Type.forName('CalculationMatrixColumn').newInstance();
        headerQuantity.put('CalculationMatrixId', parentSobj.Id); 
        headerQuantity.put('Name', 'Quantity');
        headerQuantity.put('ApiName', 'Quantity');
        headerQuantity.put('ColumnType', 'Input');
        headerQuantity.put('DataType', 'Text');
        headerQuantity.put('DisplaySequence', 5);
        lineItemsSobj.add(headerQuantity);

        SObject headerTargetProductName =  (SObject)Type.forName('CalculationMatrixColumn').newInstance();
        headerTargetProductName.put('CalculationMatrixId', parentSobj.Id); 
        headerTargetProductName.put('Name', 'TargetProductName');
        headerTargetProductName.put('ApiName', 'TargetProductName');
        headerTargetProductName.put('ColumnType', 'Output');
        headerTargetProductName.put('DataType', 'Text');
        headerTargetProductName.put('DisplaySequence', 6);
        lineItemsSobj.add(headerTargetProductName);

        SObject headerMRC =  (SObject)Type.forName('CalculationMatrixColumn').newInstance();
        headerMRC.put('CalculationMatrixId', parentSobj.Id); 
        headerMRC.put('Name', 'MRC');
        headerMRC.put('ApiName', 'MRC');
        headerMRC.put('ColumnType', 'Output');
        headerMRC.put('DataType', 'Text');
        headerMRC.put('DisplaySequence', 7);
        lineItemsSobj.add(headerMRC);

        SObject headerNRC =  (SObject)Type.forName('CalculationMatrixColumn').newInstance();
        headerNRC.put('CalculationMatrixId', parentSobj.Id); 
        headerNRC.put('Name', 'NRC');
        headerNRC.put('ApiName', 'NRC');
        headerNRC.put('ColumnType', 'Output');
        headerNRC.put('DataType', 'Text');
        headerNRC.put('DisplaySequence', 8);
        lineItemsSobj.add(headerNRC);
        insert lineItemsSobj;

        versionSobj = (SObject)Type.forName('CalculationMatrixVersion').newInstance();
        versionSobj.put('Name', 'TargetPathRangePricingMatrixTest Version');
        versionSobj.put('VersionNumber', 5);
        versionSobj.put('IsEnabled', false);
        versionSobj.put('CalculationMatrixId', parentSobj.Id);
        versionSobj.put('StartDateTime', DateTime.now().addDays(-10));
        versionSobj.put('EndDateTime', DateTime.now().addDays(10));
        versionSobj.put('Rank', 5);     
        insert versionSobj;



        //Populating Row Data
        lineItemsSobj = new List<SObject>();

        SObject decisionRow5 =  (SObject)Type.forName('CalculationMatrixRow').newInstance();
        decisionRow5.put('CalculationMatrixVersionId', versionSobj.Id);
        decisionRow5.put('InputData', '{\"Quantity\":\"1-10\",\"CharacteristicValue\":\"Xfinity\",\"CharacteristicName\":"Provider\",\"SourceProductCode\":\"VLO-PHN-0005\",\"SourceProductName\":\"Consumer Landline\"}');
        decisionRow5.put('OutputData', '{\"NRC\":\"105\",\"MRC\":\"50\",\"TargetProductName\":\"Path3\"}');
        lineItemsSobj.add(decisionRow5);

        SObject decisionRow6 =  (SObject)Type.forName('CalculationMatrixRow').newInstance();
        decisionRow6.put('CalculationMatrixVersionId', versionSobj.Id);
        decisionRow6.put('InputData', '{\"Quantity\":\"11-20\",\"CharacteristicValue\":\"Xfinity\",\"CharacteristicName\":"Provider\",\"SourceProductCode\":\"VLO-PHN-0005\",\"SourceProductName\":\"Consumer Landline\"}');
        decisionRow6.put('OutputData', '{\"NRC\":\"115\",\"MRC\":\"100\",\"TargetProductName\":\"Path3\"}');
        lineItemsSobj.add(decisionRow6);

        SObject decisionRow7 =  (SObject)Type.forName('CalculationMatrixRow').newInstance();
        decisionRow7.put('CalculationMatrixVersionId', versionSobj.Id);
        decisionRow7.put('InputData', '{\"Quantity\":\"1-10\",\"CharacteristicValue\":\"Verizon\",\"CharacteristicName\":"Provider\",\"SourceProductCode\":\"VLO-PHN-0005\",\"SourceProductName\":\"Consumer Landline\"}');
        decisionRow7.put('OutputData', '{\"NRC\":\"125\",\"MRC\":\"300\",\"TargetProductName\":\"Path3\"}');
        lineItemsSobj.add(decisionRow7);

        SObject decisionRow8 =  (SObject)Type.forName('CalculationMatrixRow').newInstance();
        decisionRow8.put('CalculationMatrixVersionId', versionSobj.Id);
        decisionRow8.put('InputData', '{\"Quantity\":\"11-20\",\"CharacteristicValue\":\"Verizon\",\"CharacteristicName\":"Provider\",\"SourceProductCode\":\"VLO-PHN-0005\",\"SourceProductName\":\"Consumer Landline\"}');
        decisionRow8.put('OutputData', '{\"NRC\":\"135\",\"MRC\":\"600\",\"TargetProductName\":\"Path3\"}');
        lineItemsSobj.add(decisionRow8);

        insert lineItemsSobj;

        String query = 'SELECT Name, InputData, OutputData FROM CalculationMatrixRow WHERE Name != \'Header\''; //check the query
        lineItemsSobj = Database.query(query);

        SObject calMatrixVersion =  (SObject)Type.forName('CalculationMatrixVersion').newInstance();
        calMatrixVersion.put('Id', versionSobj.Id);
        calMatrixVersion.put('IsEnabled', true);
        update calMatrixVersion; 

        SObject calcProcedure =  (SObject)Type.forName('CalculationProcedure').newInstance();
        calcProcedure.put('Name', 'TargetPathRangePricingDemoProcedureTest');
        insert calcProcedure;

        //Making isEnabled = false due to ERROR="Please add steps before enabling this procedure configuration."        
        SObject procVersion =  (SObject)Type.forName('CalculationProcedureVersion').newInstance();
        procVersion.put('Name', 'TargetPathRangePricingDemo V3');
        procVersion.put('VersionNumber', 5);
        procVersion.put('IsEnabled', false);
        procVersion.put('CalculationProcedureId', calcProcedure.Id);
        procVersion.put('StartDateTime', DateTime.now().addDays(-5));
        procVersion.put('EndDateTime', DateTime.now().addDays(5));
        procVersion.put('Rank', 5);

        insert procVersion;

        List<SObject> steps = new List<SObject>();

        SObject step1 =  (SObject)Type.forName('CalculationProcedureStep').newInstance();
        step1.put('Name', 'a1L46000001ASQm');
        step1.put('StageStepSequence', 1);
        step1.put('Stage', 'Calculation');
        step1.put('StepType', 'MatrixLookup');
        step1.put('CalculationMatrixId', parentSobj.Id);
        step1.put('IsResultIncluded', true);
        step1.put('CalculationProcedureVersionId', procVersion.Id);
        step1.put('InputVariablesFormatText', '[{\"name\":\"SourceProductName\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"dea1b0\"},{\"name\":\"SourceProductCode\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"15e771\"},{\"name\":\"CharacteristicName\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"a81456\"},{\"name\":\"CharacteristicValue\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"880c2d\"},{\"name\":\"Quantity\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"94bbbe\"}]');
        step1.put('OutputVariablesMappingText', '{\"TargetProductName\":\"TargetPathRangePricing__TargetProductName\",\"MRC\":\"TargetPathRangePricing__MRC\",\"NRC\":\"TargetPathRangePricing__NRC\"}');
        step1.put('OutputVariablesFormatText', '[{\"name\":\"TargetProductName\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"fea7df\"},{\"name\":\"MRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"7776f5\"},{\"name\":\"NRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"ac5769\"}]');

        SObject step2 =  (SObject)Type.forName('CalculationProcedureStep').newInstance();
        step2.put('Name', 'a1L46000001ASQn');
        step2.put('StageStepSequence', 2);
        step2.put('Stage', 'Calculation');
        step2.put('StepType', 'Calculation');
        step2.put('IsResultIncluded', true);
        step2.put('CalculationProcedureVersionId', procVersion.Id);
        step2.put('FormulaExpressionText', 'TargetPathRangePricing__MRC');
        step2.put('InputVariablesFormatText', '[{\"name\":\"TargetPathRangePricing__MRC\",\"dataType\":\"String\",\"alias\":\"TargetPathRangePricing__MRC\"}]');
        step2.put('OutputVariablesFormatText', '{\"name\":\"REC_MNTH_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"REC_MNTH_STD_PRC\"}');
        step2.put('OutputVariablesMappingText', '{\"REC_MNTH_STD_PRC\":\"REC_MNTH_STD_PRC\"}');
        step2.put('FormulaUiFormattedText', '[{\"text\":\"MRC ( TargetPathRangePricing )\",\"alias\":\"TargetPathRangePricing__MRC\",\"userDefined\":false,\"dataType\":\"Text\"}]');

        SObject step3 =  (SObject)Type.forName('CalculationProcedureStep').newInstance();
        step3.put('Name', 'a1L46000001ASQo');
        step3.put('StageStepSequence', 3);
        step3.put('Stage', 'Calculation');
        step3.put('StepType', 'Calculation');
        step3.put('IsResultIncluded', true);
        step3.put('CalculationProcedureVersionId', procVersion.Id);
        step3.put('FormulaExpressionText', 'TargetPathRangePricing__NRC');
        step3.put('InputVariablesFormatText', '[{\"name\":\"TargetPathRangePricing__NRC\",\"dataType\":\"String\",\"alias\":\"TargetPathRangePricing__NRC\"}]');
        step3.put('OutputVariablesMappingText', '{\"OT_STD_PRC\":\"OT_STD_PRC\"}');
        step3.put('OutputVariablesFormatText', '{\"name\":\"OT_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"OT_STD_PRC\"}');
        step3.put('FormulaUiFormattedText', '[{\"text\":\"MRC ( TargetPathRangePricing )\",\"alias\":\"TargetPathRangePricing__NRC\",\"userDefined\":false,\"dataType\":\"Text\"}]');

        steps.add(step1);
        steps.add(step2);
        steps.add(step3);
        insert steps;

        List<SObject> calcProcVariableList = new List<SObject>();  
        SObject calcProcedureVar1 =  (SObject)Type.forName('CalculationProcedureVariable').newInstance();
        calcProcedureVar1.put('name', 'REC_MNTH_STD_PRC');
        calcProcedureVar1.put('ApiName', 'REC_MNTH_STD_PRC');
        calcProcedureVar1.put('DataType', 'Currency');
        calcProcedureVar1.put('CalculationProcedureVersionId', procVersion.Id);

        calcProcVariableList.add(calcProcedureVar1);        

        SObject calcProcedureVar2 =  (SObject)Type.forName('CalculationProcedureVariable').newInstance();
        calcProcedureVar2.put('name', 'OT_STD_PRC');
        calcProcedureVar2.put('ApiName', 'OT_STD_PRC');
        calcProcedureVar2.put('DataType', 'Currency');
        calcProcedureVar2.put('DefaultValue', '27');
        calcProcedureVar2.put('CalculationProcedureVersionId', procVersion.Id);

        calcProcVariableList.add(calcProcedureVar2);     

        SObject calcProcedureVar3 =  (SObject)Type.forName('CalculationProcedureVariable').newInstance();
        calcProcedureVar3.put('ApiName', 'SourceProductName');
        calcProcedureVar3.put('Name', 'Source Product Name');
        calcProcedureVar3.put('DataType', 'Text');
        calcProcedureVar3.put('DefaultValue', 'false');
        calcProcedureVar3.put('CalculationProcedureVersionId', procVersion.Id);

        calcProcVariableList.add(calcProcedureVar3);     

        SObject calcProcedureVar4 =  (SObject)Type.forName('CalculationProcedureVariable').newInstance();
        calcProcedureVar4.put('Name', 'SourceProductCode');
        calcProcedureVar4.put('ApiName', 'Source Product Code');
        calcProcedureVar4.put('DataType', 'Text');
        calcProcedureVar4.put('DefaultValue', 'false');
        calcProcedureVar4.put('CalculationProcedureVersionId', procVersion.Id);

        calcProcVariableList.add(calcProcedureVar4);     

        SObject calcProcedureVar5 =  (SObject)Type.forName('CalculationProcedureVariable').newInstance();
        calcProcedureVar5.put('Name', 'CharacteristicName');
        calcProcedureVar5.put('ApiName', 'Characteristic Name');
        calcProcedureVar5.put('DataType', 'Text');
        calcProcedureVar5.put('DefaultValue', 'false');
        calcProcedureVar5.put('CalculationProcedureVersionId', procVersion.Id);

        calcProcVariableList.add(calcProcedureVar5);     

        SObject calcProcedureVar6 =  (SObject)Type.forName('CalculationProcedureVariable').newInstance();
        calcProcedureVar6.put('Name', 'CharacteristicValue');
        calcProcedureVar6.put('ApiName', 'Characteristic Value');
        calcProcedureVar6.put('DataType', 'Text');
        calcProcedureVar6.put('DefaultValue', 'false');
        calcProcedureVar6.put('CalculationProcedureVersionId', procVersion.Id);

        calcProcVariableList.add(calcProcedureVar6);     

        SObject calcProcedureVar7 =  (SObject)Type.forName('CalculationProcedureVariable').newInstance();
        calcProcedureVar7.put('ApiName', 'Quantity');
        calcProcedureVar7.put('Name', 'Quantity');
        calcProcedureVar7.put('DataType', 'Text');
        calcProcedureVar7.put('DefaultValue', 'false');
        calcProcedureVar7.put('CalculationProcedureVersionId', procVersion.Id);

        calcProcVariableList.add(calcProcedureVar7);     

        SObject calcProcedureVar8 =  (SObject)Type.forName('CalculationProcedureVariable').newInstance();
        calcProcedureVar8.put('ApiName', 'Target Product Name');
        calcProcedureVar8.put('Name', 'TargetPathRangePricing__TargetProductName');
        calcProcedureVar8.put('DataType', 'Text');
        calcProcedureVar8.put('DefaultValue', 'false');
        calcProcedureVar8.put('CalculationProcedureVersionId', procVersion.Id);

        calcProcVariableList.add(calcProcedureVar8);     

        SObject calcProcedureVar9 =  (SObject)Type.forName('CalculationProcedureVariable').newInstance();
        calcProcedureVar9.put('ApiName', 'MRC');
        calcProcedureVar9.put('Name', 'TargetPathRangePricing__MRC');
        calcProcedureVar9.put('DataType', 'Text');
        calcProcedureVar9.put('DefaultValue', 'false');
        calcProcedureVar9.put('CalculationProcedureVersionId', procVersion.Id);

        calcProcVariableList.add(calcProcedureVar9);     

        SObject calcProcedureVar10 = (SObject)Type.forName('CalculationProcedureVariable').newInstance();
        calcProcedureVar10.put('ApiName', 'NRC');
        calcProcedureVar10.put('Name', 'TargetPathRangePricing__NRC');
        calcProcedureVar10.put('DataType', 'Text');
        calcProcedureVar10.put('DefaultValue', 'false');
        calcProcedureVar10.put('CalculationProcedureVersionId', procVersion.Id);

        calcProcVariableList.add(calcProcedureVar10);     


        insert calcProcVariableList;

        //Enable CalculationProcedureVersion        
        SObject calProcedureVersion =  (SObject)Type.forName('CalculationProcedureVersion').newInstance();
        calProcedureVersion.put('Id', procVersion.Id);
        calProcedureVersion.put('IsEnabled', true);
        update calProcedureVersion;

    }

    private static testmethod void testInitializeMethod()
    {
        CpqNextPricingPlanHelper pricingPlanHelper = new CpqNextPricingPlanHelper();

        Map<String, Object> input = new Map<String, Object>();
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        input.put('DecisionMatrix', 'false');

        Test.startTest();

        vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup('{}');
        input.put('cartDocument', cartDocument);

        pricingPlanHelper.invokeMethod('GetCalculationProcedurePrice', input, output, options);

        Test.stopTest();
    }


	private static testmethod void testClearExternalPriceFlagNullBasket()
	{
		Map<String, Object> input = new Map<String, Object>();
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup('{}');
        input.put('cartDocument', cartDocument);

		CpqNextPricingPlanHelper pricingPlanHelper = new CpqNextPricingPlanHelper();
		pricingPlanHelper.initialize(input);
		pricingPlanHelper.clearExternalPriceFlag();
	}

	private static testMethod void testClearExternalPriceFlag()
	{
		Map<String, Object> input = new Map<String, Object>();
        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String, Object>();

        vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup();
        input.put('cartDocument', cartDocument);

		CpqNextPricingPlanHelper pricingPlanHelper = new CpqNextPricingPlanHelper();

		pricingPlanHelper.initialize(input);
		pricingPlanHelper.clearExternalPriceFlag();
		
		Map<String, Object> cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
        Map<String, vlocity_cmt.CpqCartDocumentItem> allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');

        for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
        {
			Map<String, Object> result = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'REC_MNTH_STD_PRC_EXTERNAL_PRICE', 'OT_STD_PRC_EXTERNAL_PRICE'}});
			Map<String, Object> fieldValueMap = (Map<String, Object>) result.get('result');
			System.assertEquals(null, fieldValueMap.get('REC_MNTH_STD_PRC_EXTERNAL_PRICE'));
			System.assertEquals(null, fieldValueMap.get('OT_STD_PRC_EXTERNAL_PRICE'));
		}
	}

	private static testmethod void testReplaceNumberWithId()
	{
        vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup();

		CpqNextPricingPlanHelper pricingPlanHelper = new CpqNextPricingPlanHelper();
        pricingPlanHelper.initialize(new Map<String, Object>{'cartDocument' => cartDocument});

		Map<String, Object> matrixResultRow = new Map<String, Object>();
		String targetLineNumber = '0001';
		matrixResultRow.put('ID',  'ad0648b6-1772-4250-8c13-67d2b1b04486');

		System.assertEquals(matrixResultRow, pricingPlanHelper.replaceNumberWithId(null, matrixResultRow, true));
		System.assertEquals(matrixResultRow, pricingPlanHelper.replaceNumberWithId(targetLineNumber, matrixResultRow, true));
		Map<String, Object> clonedRow = pricingPlanHelper.replaceNumberWithId(targetLineNumber, matrixResultRow, false);
		matrixResultRow.put('ID', '0002');
		System.assertNotEquals(matrixResultRow.get('ID'),clonedRow.get('ID'));
	}

	private static testmethod void testSetExternalPrice()
	{
		vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup();

		Map<String, object> input = new Map<String, object>();
		Map<String, object> output = new Map<String, object>();
		Map<String, object> options = new Map<String, object>();

		CpqNextPricingPlanHelper pricingPlanHelper = new CpqNextPricingPlanHelper();
        input.put('cartDocument', cartDocument);
		pricingPlanHelper.initialize(input);

		input.put('externalPriceData', new List<Object>{
			new Map<String, Object>{'ID'=>'ad0648b6-1772-4250-8c13-67d2b1b04486', 'OT_STD_PRC'=>87.0, 'REC_MNTH_STD_PRC'=>97.0, 'vlocity_cmt__LineNumber__c'=>'0001'}
		});
		input.put('pricingVariableToFieldMap', new Map<String, String>{
			'REC_MNTH_STD_PRC'=>'vlocity_cmt__RecurringCharge__c',
			'OT_STD_PRC'=>'vlocity_cmt__OneTimeCharge__c'
		});

		pricingPlanHelper.setExternalPrice(input, output, options);

		
        Map<String, Object> cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
        Map<String, vlocity_cmt.CpqCartDocumentItem> allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');

        for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
        {
			Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name','vlocity_cmt__RecurringCharge__c', 'vlocity_cmt__OneTimeCharge__c'}});
			Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
			String lineItemName = (String)fieldValueMap.get('name');
			if(lineItemName.equals('Triple Play Bundle Small'))
			{
				System.assert(fieldValueMap.get('vlocity_cmt__RecurringCharge__c') == 97.00 );
				System.assert(fieldValueMap.get('vlocity_cmt__OneTimeCharge__c') == 87.00 );
			}
        }
	}

    private static testmethod void testFieldAttributeABP(){

        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String,Object>();
        Map<String, Object> input = new Map<String, Object>();

        vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup();
        testFieldAttributeMatrixSetup();

        
        Map<String, Object> cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
        Map<String, vlocity_cmt.CpqCartDocumentItem> allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');

        for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
        {
            Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name'}});
            Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
            String lineItemName = (String)fieldValueMap.get('name');
            if(lineItemName.equals('Consumer Landline'))
            {
                Map<String, Object> attributeOutput = lineItem.call('getItemAttributes', new Map<String, Object>{'returnLabel'=>false});
                Map<String, Object> attributeCodeToValueMap = (Map<String, Object>) attributeOutput.get('result');
                attributeCodeToValueMap.put('Attribute-124', 'Xfinity');
                attributeCodeToValueMap.put('Attribute1 Test', 'Second');
                lineItem.call('setItemAttributes', new Map<String, Object>{'attributeCodeToValueMap'=>attributeCodeToValueMap});
                break;
            }
        }

        input.put('ProcedureName','FieldAttributePricingProcedureTest');
        input.put('MatrixName','FieldAttributePricingMatrixTest');
        input.put('InputAttributeMap','Provider');
        input.put('cartDocument', cartDocument);

        CpqNextPricingPlanHelper testing = new CpqNextPricingPlanHelper();
        testing.invokeMethod('GetCalculationProcedurePrice',input,output,options);

        Boolean assertExecuted = false;

		cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
		allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');
        
		for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
		{
			Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name','vlocity_cmt__RecurringCharge__c', 'vlocity_cmt__OneTimeCharge__c'}});
			Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
            String lineItemName = (String)fieldValueMap.get('name');
            if(lineItemName.equals('Consumer Landline'))
            {
                System.assert(fieldValueMap.get('vlocity_cmt__OneTimeCharge__c') == 0);
                System.assert(fieldValueMap.get('vlocity_cmt__RecurringCharge__c') == 35.00 );
				assertExecuted = true;
                break;
            }
        }
		System.assert(assertExecuted);
    }


    private static void testFieldAttributeMatrixSetup() {
        insert new vlocity_cmt__TriggerSetup__c(Name = 'AllTriggers', vlocity_cmt__IsTriggerOn__c = true);
        parent = new vlocity_cmt__CalculationMatrix__c(Name = 'FieldAttributePricingMatrixTest');
        insert parent;

        version = new vlocity_cmt__CalculationMatrixVersion__c(Name = 'FieldAttributePricingMatrixTest Version', vlocity_cmt__VersionNumber__c = 5,
                vlocity_cmt__IsEnabled__c = false, vlocity_cmt__CalculationMatrixId__c = parent.Id,
                vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-10), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(10),vlocity_cmt__Priority__c = 5);
        insert version;

        //Populating Headers
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":1,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Code\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":2,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":3,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Value\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":4,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Provider\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":5,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"MRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":7,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"NRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":8,\"dataType\":\"Text\"}'
        ));
        insert lineItems;

        //Populating Row Data
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();

        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Provider\":\"Verizon\",\"Characteristic Value\":\"First Value\",\"Characteristic Name\":"Attribute1 Test\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"15\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Provider\":\"Xfinity\",\"Characteristic Value\":\"First Value\",\"Characteristic Name\":"Attribute1 Test\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"25\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Provider\":\"Verizon\",\"Characteristic Value\":\"Second Value\",\"Characteristic Name\":"Attribute1 Test\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"30\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Provider\":\"Xfinity\",\"Characteristic Value\":\"Second Value\",\"Characteristic Name\":"Attribute1 Test\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                vlocity_cmt__OutputData__c = '{\"NRC\":\"0\",\"MRC\":\"35\"}'
        ));
        
        insert lineItems;

        lineItems = [SELECT Name, vlocity_cmt__InputData__c, vlocity_cmt__OutputData__c FROM vlocity_cmt__CalculationMatrixRow__c WHERE Name != 'Header'];
        update new vlocity_cmt__CalculationMatrixVersion__c(Id = version.Id, vlocity_cmt__IsEnabled__c = true);

        //service
        vlocity_cmt__CalculationProcedure__c calcProcedure = new vlocity_cmt__CalculationProcedure__c(Name='FieldAttributePricingProcedureTest');
        insert calcProcedure;

        //Making isEnabled = false due to ERROR="Please add steps before enabling this procedure configuration."
        vlocity_cmt__CalculationProcedureVersion__c procVersion = new vlocity_cmt__CalculationProcedureVersion__c(Name='FieldAttributePricingProcedureTest V3', vlocity_cmt__VersionNumber__c=5, vlocity_cmt__IsEnabled__c=false,
                vlocity_cmt__CalculationProcedureId__c=calcProcedure.Id, vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-5), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(5), vlocity_cmt__Priority__c=5);
        insert procVersion;

        List<vlocity_cmt__CalculationProcedureStep__c> steps = new List<vlocity_cmt__CalculationProcedureStep__c> ();
        vlocity_cmt__CalculationProcedureStep__c step1 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQm', vlocity_cmt__Sequence__c=1,vlocity_cmt__Function__c='Matrix Lookup', vlocity_cmt__CalculationMatrixId__c=parent.Id, vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__Input__c='[{\"name\":\"Source Product Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"dea1b0\"},{\"name\":\"Source Product Code\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"15e771\"},{\"name\":\"Characteristic Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"a81456\"},{\"name\":\"Characteristic Value\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"880c2d\"},{\"name\":\"Provider\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"94bbbe\"}]',
                vlocity_cmt__OutputMappingJSON__c ='{\"MRC\":\"FieldAttributePricingMatrixTest__MRC\",\"NRC\":\"FieldAttributePricingMatrixTest__NRC\"}',
                vlocity_cmt__OutputJSON__c='[{\"name\":\"MRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"7776f5\"},{\"name\":\"NRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"ac5769\"}]');

        vlocity_cmt__CalculationProcedureStep__c step2 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQn', vlocity_cmt__Sequence__c=2,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='FieldAttributePricingMatrixTest__MRC', vlocity_cmt__OutputJSON__c='{\"name\":\"REC_MNTH_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"REC_MNTH_STD_PRC\"}',
                vlocity_cmt__OutputMappingJSON__c = '{\"REC_MNTH_STD_PRC\":\"REC_MNTH_STD_PRC\"}', vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( FieldAttributePricingMatrixTest )\",\"alias\":\"FieldAttributePricingMatrixTest__MRC\",\"userDefined\":false,\"dataType\":\"Text\"}]');
        vlocity_cmt__CalculationProcedureStep__c step3 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQo', vlocity_cmt__Sequence__c=3,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='FieldAttributePricingMatrixTest__NRC',vlocity_cmt__OutputMappingJSON__c = '{\"OT_STD_PRC\":\"OT_STD_PRC\"}',
                vlocity_cmt__OutputJSON__c='{\"name\":\"OT_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"OT_STD_PRC\"}',vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"NRC ( FieldAttributePricingMatrixTest )\",\"alias\":\"FieldAttributePricingMatrixTest__NRC\",\"userDefined\":false,\"dataType\":\"Text\"}]' );
        steps.add(step1);
        steps.add(step2);
        steps.add(step3);
        insert steps;

        List<vlocity_cmt__CalculationProcedureVariable__c> calcProcVariableList = new List<vlocity_cmt__CalculationProcedureVariable__c>{
                new vlocity_cmt__CalculationProcedureVariable__c(name='REC_MNTH_STD_PRC',vlocity_cmt__alias__c='REC_MNTH_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='OT_STD_PRC',vlocity_cmt__alias__c='OT_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__defaultValue__c='27',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Name',vlocity_cmt__alias__c='SourceProductName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Code',vlocity_cmt__alias__c='SourceProductCode',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Name',vlocity_cmt__alias__c='CharacteristicName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Value',vlocity_cmt__alias__c='CharacteristicValue',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Provider',vlocity_cmt__alias__c='Provider',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='MRC',vlocity_cmt__alias__c='FieldAttributePricingMatrixTest__MRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='0',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='NRC',vlocity_cmt__alias__c='FieldAttributePricingMatrixTest__NRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='0',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id)
                };
        insert calcProcVariableList;

        //Creating and enabling CalculationProcedureVersion
        update new vlocity_cmt__CalculationProcedureVersion__c(Id = procVersion.Id, vlocity_cmt__IsEnabled__c = true);
    }

    private static testMethod void testOutputVariableABP() {

        Map<String, Object> output = new Map<String, Object>();
        Map<String, Object> options = new Map<String,Object>();
        Map<String, Object> input = new Map<String, Object>();

        vlocity_cmt.CpqCartDocument cartDocument = testCpqNextSetup();
        testOutputAttributeMatrixSetup();

        Map<String, Object> cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
        Map<String, vlocity_cmt.CpqCartDocumentItem> allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');

        for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
        {
            Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name'}});
            Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
            String lineItemName = (String)fieldValueMap.get('name');
            if(lineItemName.equals('Consumer Landline'))
            {
                Map<String, Object> attributeOutput = lineItem.call('getItemAttributes', new Map<String, Object>{'returnLabel'=>false});
                Map<String, Object> attributeCodeToValueMap = (Map<String, Object>) attributeOutput.get('result');
                attributeCodeToValueMap.put('Attribute-124', 'Xfinity');
                attributeCodeToValueMap.put('Attribute1 Test', 'Second');
                lineItem.call('setItemAttributes', new Map<String, Object>{'attributeCodeToValueMap'=>attributeCodeToValueMap});
                break;
            }
        }

        input.put('ProcedureName','OutputAttributePricingProcedureTest');
        input.put('MatrixName','OutputAttributePricingMatrixTest');
        input.put('OutputAttributeMap','Provider=Provider');
        input.put('cartDocument', cartDocument);

        CpqNextPricingPlanHelper testing = new CpqNextPricingPlanHelper();
        testing.invokeMethod('GetCalculationProcedurePrice',input,output,options);

        Boolean assertExecuted = false;

		cartDocumentOutput = cartDocument.call('getAllItems', new Map<String, Object>{'hierarchyLevel'=>-1});
		allItems = (Map<String, vlocity_cmt.CpqCartDocumentItem>) cartDocumentOutput.get('result');

		for(vlocity_cmt.CpqCartDocumentItem lineItem : allItems.values())
		{
			Map<String, Object> lineItemOutput = lineItem.call('getItemFields', new Map<String, Object>{'fields'=>new Set<String>{'name','vlocity_cmt__RecurringCharge__c', 'vlocity_cmt__OneTimeCharge__c'}});
			Map<String, Object> fieldValueMap = (Map<String, Object>) lineItemOutput.get('result');
            String lineItemName = (String)fieldValueMap.get('name');
            if(lineItemName.equals('Consumer Landline'))
            {
                System.assert(fieldValueMap.get('vlocity_cmt__OneTimeCharge__c') == 0);
                System.assert(fieldValueMap.get('vlocity_cmt__RecurringCharge__c') == 25.00 );
				assertExecuted = true;
                break;
            }
        }
		System.assert(assertExecuted);

    }


    private static void testOutputAttributeMatrixSetup() {
        insert new vlocity_cmt__TriggerSetup__c(Name = 'AllTriggers', vlocity_cmt__IsTriggerOn__c = true);
        parent = new vlocity_cmt__CalculationMatrix__c(Name = 'OutputAttributePricingMatrixTest');
        insert parent;

        version = new vlocity_cmt__CalculationMatrixVersion__c(Name = 'OutputAttributePricingMatrixTest Version', vlocity_cmt__VersionNumber__c = 5,
                vlocity_cmt__IsEnabled__c = false, vlocity_cmt__CalculationMatrixId__c = parent.Id,
                vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-10), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(10),vlocity_cmt__Priority__c = 5);
        insert version;

        //Populating Headers
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":1,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Code\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":2,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Source Product Name\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":3,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Characteristic Value\",\"label\":null,\"headerType\":\"Input\",\"displayOrder\":4,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"Provider\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":5,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"MRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":7,\"dataType\":\"Text\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id, Name = 'Header',
                vlocity_cmt__InputData__c ='{\"listValues\":null,\"name":\"NRC\",\"label\":null,\"headerType\":\"Output\",\"displayOrder\":8,\"dataType\":\"Text\"}'
        ));
        insert lineItems;

        //Populating Row Data
        lineItems = new List<vlocity_cmt__CalculationMatrixRow__c>();

        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Characteristic Value\":\"First Value\",\"Characteristic Name\":"Attribute1 Test\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                vlocity_cmt__OutputData__c = '{\"Provider\":\"Verizon1\",\"NRC\":\"0\",\"MRC\":\"15\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Characteristic Value\":\"Second Value\",\"Characteristic Name\":"Attribute1 Test\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                vlocity_cmt__OutputData__c = '{\"Provider\":\"Xfinity1\",\"NRC\":\"0\",\"MRC\":\"25\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Characteristic Value\":\"Third Value\",\"Characteristic Name\":"Attribute1 Test\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                vlocity_cmt__OutputData__c = '{\"Provider\":\"Verizon2\",\"NRC\":\"0\",\"MRC\":\"30\"}'
        ));
        lineItems.add(new vlocity_cmt__CalculationMatrixRow__c(vlocity_cmt__CalculationMatrixVersionId__c = version.Id,
                vlocity_cmt__InputData__c ='{\"Characteristic Value\":\"Fourth Value\",\"Characteristic Name\":"Attribute1 Test\",\"Source Product Code\":\"VLO-PHN-0005\",\"Source Product Name\":\"Consumer Landline\"}',
                vlocity_cmt__OutputData__c = '{\"Provider\":\"Xfinity2\",\"NRC\":\"0\",\"MRC\":\"35\"}'
        ));

        insert lineItems;

        lineItems = [SELECT Name, vlocity_cmt__InputData__c, vlocity_cmt__OutputData__c FROM vlocity_cmt__CalculationMatrixRow__c WHERE Name != 'Header'];
        update new vlocity_cmt__CalculationMatrixVersion__c(Id = version.Id, vlocity_cmt__IsEnabled__c = true);

        //service
        vlocity_cmt__CalculationProcedure__c calcProcedure = new vlocity_cmt__CalculationProcedure__c(Name='OutputAttributePricingProcedureTest');
        insert calcProcedure;

        //Making isEnabled = false due to ERROR="Please add steps before enabling this procedure configuration."
        vlocity_cmt__CalculationProcedureVersion__c procVersion = new vlocity_cmt__CalculationProcedureVersion__c(Name='OutputAttributePricingProcedureTest V3', vlocity_cmt__VersionNumber__c=5, vlocity_cmt__IsEnabled__c=false,
                vlocity_cmt__CalculationProcedureId__c=calcProcedure.Id, vlocity_cmt__StartDateTime__c = DateTime.now().addDays(-5), vlocity_cmt__EndDateTime__c = DateTime.now().addDays(5), vlocity_cmt__Priority__c=5);
        insert procVersion;

        List<vlocity_cmt__CalculationProcedureStep__c> steps = new List<vlocity_cmt__CalculationProcedureStep__c> ();
        vlocity_cmt__CalculationProcedureStep__c step1 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQm', vlocity_cmt__Sequence__c=1,vlocity_cmt__Function__c='Matrix Lookup', vlocity_cmt__CalculationMatrixId__c=parent.Id, vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__Input__c='[{\"name\":\"Source Product Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"dea1b0\"},{\"name\":\"Source Product Code\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"15e771\"},{\"name\":\"Characteristic Name\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"a81456\"},{\"name\":\"Characteristic Value\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"880c2d\"}]',
                vlocity_cmt__OutputMappingJSON__c ='{\"MRC\":\"OutputAttributePricingMatrixTest__MRC\",\"NRC\":\"OutputAttributePricingMatrixTest__NRC\",\"Provider\":\"OutputAttributePricingMatrixTest__Provider\"}',
                vlocity_cmt__OutputJSON__c='[{\"name\":\"MRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"7776f5\"},{\"name\":\"NRC\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"ac5769\"},{\"name\":\"Provider\",\"listValues\":null,\"label\":null,\"dataType\":\"Text\",\"columnKey\":\"94bbbe\"}]');

        vlocity_cmt__CalculationProcedureStep__c step2 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQn', vlocity_cmt__Sequence__c=2,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='OutputAttributePricingMatrixTest__MRC', vlocity_cmt__OutputJSON__c='{\"name\":\"REC_MNTH_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"REC_MNTH_STD_PRC\"}',
                vlocity_cmt__OutputMappingJSON__c = '{\"REC_MNTH_STD_PRC\":\"REC_MNTH_STD_PRC\"}', vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"MRC ( OutputAttributePricingMatrixTest )\",\"alias\":\"OutputAttributePricingMatrixTest__MRC\",\"userDefined\":false,\"dataType\":\"Text\"}]');
        vlocity_cmt__CalculationProcedureStep__c step3 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQo', vlocity_cmt__Sequence__c=3,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='OutputAttributePricingMatrixTest__NRC',vlocity_cmt__OutputMappingJSON__c = '{\"OT_STD_PRC\":\"OT_STD_PRC\"}',
                vlocity_cmt__OutputJSON__c='{\"name\":\"OT_STD_PRC\",\"dataType\":\"Currency\",\"alias\":\"OT_STD_PRC\"}',vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"NRC ( OutputAttributePricingMatrixTest )\",\"alias\":\"OutputAttributePricingMatrixTest__NRC\",\"userDefined\":false,\"dataType\":\"Text\"}]' );
        vlocity_cmt__CalculationProcedureStep__c step4 = new vlocity_cmt__CalculationProcedureStep__c (Name='a1L46000001ASQo', vlocity_cmt__Sequence__c=4,vlocity_cmt__Function__c='Calculation', vlocity_cmt__IsIncludedInResult__c=true, vlocity_cmt__CalculationProcedureVersionId__c= procVersion.Id,
                vlocity_cmt__CalculationFormulaLong__c='OutputAttributePricingMatrixTest__Provider',vlocity_cmt__OutputMappingJSON__c = '{\"Provider\":\"Provider\"}',
                vlocity_cmt__OutputJSON__c='{\"name\":\"Provider\",\"dataType\":\"Text\",\"alias\":\"Provider\"}',vlocity_cmt__CalculationFormulaTags__c='[{\"text\":\"Provider ( OutputAttributePricingMatrixTest )\",\"alias\":\"OutputAttributePricingMatrixTest__Provider\",\"userDefined\":false,\"dataType\":\"Text\"}]' );

        steps.add(step1);
        steps.add(step2);
        steps.add(step3);
        steps.add(step4);
        insert steps;

        List<vlocity_cmt__CalculationProcedureVariable__c> calcProcVariableList = new List<vlocity_cmt__CalculationProcedureVariable__c>{
                new vlocity_cmt__CalculationProcedureVariable__c(name='REC_MNTH_STD_PRC',vlocity_cmt__alias__c='REC_MNTH_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='OT_STD_PRC',vlocity_cmt__alias__c='OT_STD_PRC',vlocity_cmt__datatype__c='Currency',vlocity_cmt__defaultValue__c='27',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Name',vlocity_cmt__alias__c='SourceProductName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Source Product Code',vlocity_cmt__alias__c='SourceProductCode',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Name',vlocity_cmt__alias__c='CharacteristicName',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Characteristic Value',vlocity_cmt__alias__c='CharacteristicValue',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='Provider',vlocity_cmt__alias__c='Provider',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='false',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='MRC',vlocity_cmt__alias__c='FieldAttributePricingMatrixTest__MRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='0',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id),
                new vlocity_cmt__CalculationProcedureVariable__c(name='NRC',vlocity_cmt__alias__c='FieldAttributePricingMatrixTest__NRC',vlocity_cmt__datatype__c='Text',vlocity_cmt__defaultValue__c='0',vlocity_cmt__CalculationProcedureVersionId__c=procVersion.Id)
                };
        insert calcProcVariableList;

        //Creating and enabling CalculationProcedureVersion
        update new vlocity_cmt__CalculationProcedureVersion__c(Id = procVersion.Id, vlocity_cmt__IsEnabled__c = true);
    }
}