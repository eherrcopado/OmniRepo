global with sharing class CustomPricingPlanStepImpl implements vlocity_cmt.VlocityOpenInterface {

    private static String nsp = 'vlocity_cmt__';

    global Boolean invokeMethod (String methodName,
                                 Map<String, Object> input,
                                 Map<String, Object> output,
                                 Map<String, Object> options)
    {
        if (methodName == 'GetMatrixPrice')
        {
            getMatrixPrice(input, output, options);
        }

        return true;
    }

    private void getMatrixPrice(Map<String, Object> input,
                                Map<String, Object> output,
                                Map<String, Object> options)
    {
        Map<String, object> priceHelperInput = new Map<String, object>();
        Map<String, object> priceHelperOutput = new Map<String, object>();
        Map<String, object> priceHelperOptions = new Map<String, object>();

        priceHelperInput.putAll(input);

        PricingPlanHelper priceHelper;

        if(input.containsKey('isCpqNextFlow') && (Boolean)input.get('isCpqNextFlow'))
        {
            Type t = Type.forName('CpqNextPricingPlanHelper');
            if(t == null) {
                throw new CustomPricingPlanStepImplException('CpqNextPricingPlanHelper does not exist.');
            }
            priceHelper = (PricingPlanHelper) t.newInstance();
            Boolean clearExternalPriceFlag = (Boolean)input.get('ClearExternalPriceFlag');
            if (clearExternalPriceFlag == null)
            {
                clearExternalPriceFlag = true;
                output.put('ClearExternalPriceFlag', false);
            }
            priceHelperInput.put('ClearExternalPriceFlag', clearExternalPriceFlag);
        }
        else
        {
            SObject parent = (SObject)vlocity_cmt.PricingPlanService.getFromPricingContext('Parent');
            List<SObject> itemList = (List<SObject>)vlocity_cmt.PricingPlanService.getFromPricingContext('LineItemList');

            //If Asset or if there are no items, then return
            if(parent == null || itemList == null || itemList.isEmpty()) return;

            String sourceTargetABP = (String)input.get('SourceTargetABP');
            String strDelta = PricingPlanHelper.getCpqConfigurationSetupValue('DeltaPrice');

            //CMT-3332 : If Delta Price is TRUE and if source target attribute based pricing is being done, then load all the line items
            if(strDelta == 'True' && sourceTargetABP == 'True')
            {
                // If UOWMode is TRUE then changes in lineitems are not committed and re-querying the lineitems will result in
                // loss of those changes, so overwriting the queried lineitems with lineitems present in Pricing Context
                List<SObject> allItemList = getAllLineItems(parent, parent.getSObjectType(), itemList[0].getSObjectType());
                Map<String, SObject> allItemIdToItemMap = new Map<String, SObject> (allItemList);
                allItemIdToItemMap.putAll(itemList);
                itemList = allItemIdToItemMap.values();
                vlocity_cmt.PricingPlanService.putInPricingContext('LineItemList',itemList);
            }
            priceHelperInput.put('Parent', parent);
            priceHelperInput.put('ItemList', itemList);

            // If this is the first getMatrixPrice step, clear the external price flag
            Boolean clearExternalPriceFlag = (Boolean)vlocity_cmt.PricingPlanService.getFromPricingContext('ClearExternalPriceFlag');
            System.debug('ClearExternalPriceFlag: ' + clearExternalPriceFlag);
            if (clearExternalPriceFlag == null)
            {
                clearExternalPriceFlag = true;
                // Do not clear the external price flag for subsequent calls to getMatrixPrice
                vlocity_cmt.PricingPlanService.putInPricingContext('ClearExternalPriceFlag', false);
            }
            priceHelperInput.put('ClearExternalPriceFlag', clearExternalPriceFlag);

            priceHelper = new PricingPlanHelper();
        }

        // create the matrix input rows from the itemList
        
        priceHelper.invokeMethod('GetCalculationProcedurePrice', priceHelperInput, priceHelperOutput, priceHelperOptions);

        if (priceHelperOutput.get('error') != null)
        {
            output.put('error', priceHelperOutput.get('error'));
        }
    }

    private List<SObject> getAllLineItems(SObject parent, SobjectType parentObjectTypeForPage, SObjectType lineItemTypeForPage)
    {
        Id parentId = (Id)parent.get('Id');

        List<String> defaultLineItemFields = new List<String>
        {
            'id', nsp+'linenumber__c', nsp+'action__c', nsp + 'subaction__c',  nsp + 'product2id__c',
            nsp + 'incartquantitymap__c', 'pricebookentry.product2.name', 'pricebookentry.product2.productcode',
            'pricebookentry.product2.id', 'pricebookentry.product2.' + nsp + 'type__c',
            'pricebookentry.product2.' + nsp + 'globalgroupkey__c',
            'pricebookentry.product2.' + nsp + 'isconfigurable__c', 'pricebookentryid', 'pricebookentry.pricebook2id',
            'listprice', 'unitprice', 'quantity', nsp + 'onetimecharge__c', nsp + 'onetimecalculatedprice__c',
            nsp + 'onetimemanualdiscount__c', nsp + 'onetimetotal__c', nsp + 'rootitemid__c', nsp + 'parentitemid__c',
            nsp + 'producthierarchypath__c', nsp + 'recurringcharge__c', nsp + 'recurringcalculatedprice__c',
            nsp + 'recurringmanualdiscount__c', nsp + 'recurringdiscountprice__c', nsp + 'recurringtotal__c',
            nsp + 'provisioningstatus__c', nsp + 'cpqmessagedata__c', nsp + 'serviceaccountid__c',
            nsp + 'serviceaccountid__r.name', nsp + 'serviceaccountid__r.id', nsp + 'billingaccountid__c',
            nsp + 'billingaccountid__r.name', nsp + 'billingaccountid__r.id', nsp + 'pricinglogdata__c',
            nsp + 'itemname__c', nsp + 'currencypaymentmode__c', nsp + 'cpqcardinalitymessage__c',
            nsp + 'effectiveonetimetotal__c', nsp + 'effectiverecurringtotal__c', nsp + 'cpqpricingmessage__c',
            nsp + 'assetreferenceid__c', nsp + 'catalogitemreferencedatetime__c',
            nsp + 'onetimeloyaltyprice__c', nsp + 'onetimeloyaltytotal__c',
            nsp + 'effectiveonetimeloyaltytotal__c', nsp + 'onetimecost__c', nsp + 'onetimecosttotal__c',
            nsp + 'effectiveonetimecosttotal__c', nsp + 'recurringcost__c', nsp + 'recurringcosttotal__c',
            nsp + 'effectiverecurringcosttotal__c', nsp + 'onetimemargin__c', nsp + 'recurringmargin__c',
            nsp + 'servicepointid__c', nsp + 'servicepointid__r.name', nsp + 'servicepointid__r.'+ nsp + 'premisesid__c',
            nsp + 'usagemeasurementid__c', nsp + 'usagemeasurementid__r.name', nsp + 'usageunitprice__c',
            nsp + 'usagepricetotal__c', nsp + 'effectiveusagepricetotal__c', nsp + 'usagequantity__c',
            nsp + 'usageunitcost__c', nsp + 'usagecosttotal__c', nsp + 'effectiveusagecosttotal__c', nsp + 'usagemargin__c'
        };
        if (parentObjectTypeForPage == Order.sObjectType)
        {
            defaultLineItemFields.addAll(new Set<String>
                {
                    nsp + 'ischangesallowed__c', nsp + 'supplementalaction__c',
                    nsp + 'supersededorderitemid__c',nsp + 'firstversionorderitemid__c',
                    nsp + 'fulfilmentstatus__c'
                });
        }

        Boolean useAttributeV2Model = false;
        try
        {
            useAttributeV2Model = vlocity_cmt.VlocityFeatureService.getFeatureValue('EnableV2AttributeModel');
        }
        catch(Exception e){
            System.debug(e.getStackTraceString());
        }

        if(useAttributeV2Model)
        {
          defaultLineItemFields.addAll(new Set<String>{
              nsp + 'attributeselectedvalues__c',
              nsp + 'attributemetadatachanges__c',
              'pricebookentry.product2.' + nsp + 'attributedefaultvalues__c',
              'pricebookentry.product2.' + nsp + 'attributemetadata__c'
          });
        }
        else
        {
          defaultLineItemFields.addAll(new Set<String>{
              nsp + 'jsonattribute__c',
              'pricebookentry.product2.' + nsp + 'jsonattribute__c'
          });
        }

        return Database.query('SELECT ' + String.join(defaultLineItemFields, ',') +
                ' FROM ' + String.escapeSingleQuotes(String.valueOf(lineItemTypeForPage)) + ' WHERE ' + String.escapeSingleQuotes(String.valueOf(parentObjectTypeForPage)) + 'Id = :parentId');
    }
    
    global class CustomPricingPlanStepImplException extends Exception{}
}