@isTest
private class VlocityRequiredPermissionCheckTest {
    
    private static testMethod void testPermission(){
        
        VlocityRequiredPermissionCheck vrPermissionCheck = new VlocityRequiredPermissionCheck();
        Map<String, Object> argMap = new Map<String, Object>{'requiredPermission' => 'VEEDigitalOrderPermission'} ;
        Test.startTest();
        vrPermissionCheck.call('checkPermission',argMap);
        Test.stopTest();
        
        System.assert(vrPermissionCheck.checkPermission('VEEDigitalOrderPermission') == true);
    }
    
}