/**
 * This class provides high level config related to the Org.
 *  
 * @author  Joe McMaster (joe.mcmaster@salesforce.com)
 * @version  1.0
 *
 *
 * History
 * -------
 * v1.0 - May 14, 2021 - Initial Version for Multiplay Demo
 * v1.1 - Sep 10, 2021 - Added get
 */
global with sharing class DemoOrgUtils implements vlocity_cmt.VlocityOpenInterface2,Callable {
    
    public Object call(String action, Map<String, Object> args) {

     Map<String,Object> inputMap = (Map<String,Object>)args.get('input');
     Map<String,Object> outputMap = (Map<String,Object>)args.get('output');
     Map<String,Object> options = (Map<String,Object>)args.get('options');
        
     return invokeMethod(action, inputMap, outputMap, options);
   }


    // For caching so we don't constantly have to fetch the namespace in the more complicated way!
    static String namespace = 'vlocity_cmt';

    // Generic Exception class we can use anywhere
    public class DemoException extends Exception {}

    /**
     * Returns the Vlocity/SFI Namespace for this org
     * 
     * @return The namespace
     */
    public static String getNamespace() {

        if (namespace == null) {

            List<PackageLicense> packages = [SELECT NamespacePrefix FROM PackageLicense];
            for (PackageLicense pkg : packages) {

                if (pkg.NamespacePrefix == 'vlocity_cmt' || pkg.NamespacePrefix == 'vlocity_ins' || pkg.NamespacePrefix == 'vlocityins2' || pkg.NamespacePrefix == 'vlocity_ps') {
                    namespace = pkg.NamespacePrefix;
                    break;
                }
            }
        }        

        return namespace;       
    }

    /**
     * Gets the latest API version from this org
     * 
     * @return The latest API version
     */
    public static Double getApiVersion() {

        // There isn't an easy way to do this, but the following should work
        AggregateResult versionQuery = [SELECT MAX(ApiVersion) MaxVersion FROM ApexClass][0];
        return (Double)versionQuery.get('MaxVersion');
    }
    
    /**
     * Top level call by a Remote Action
     *
     * @param method  The method to execute
     * @param input   The input data provided in the call to this method
     * @param output  The output object where any results will be stored
     * @param options Any options to aid in the execution of this class
     *
     * @return true if the method completes successfully, false otherwise
     */ 
    global Boolean invokeMethod(String methodName, Map<String,Object> input, Map<String,Object> output, Map<String,Object> options) {
        
        try {      
            if (methodName == 'getURLs') return getURLs(input, output, options);
        }
        catch (Exception e) {
                        
            output.put('error', e.getMessage() + ':' + e.getStackTraceString());
        }
        return false;
    }
    
    /**
     * Returns the various base Salesforce URLs for this Org
     * 
     * @param input   The input data provided in the call to this method
     * @param output  The output object where any results will be stored
     * @param options Any options to aid in the execution of this class
     * 
     * @return true if the function completed successfully, false otherwise
     */
    private Boolean getURLs(Map<String,Object> input, Map<String,Object> output, Map<String,Object> options) {

        output.put('baseUrl', URL.getSalesforceBaseUrl().toExternalForm());
        output.put('domainUrl', URL.getOrgDomainUrl().toExternalForm());
    output.put('siteUrl', Site.getBaseUrl());
        
        return true;
    }    
}