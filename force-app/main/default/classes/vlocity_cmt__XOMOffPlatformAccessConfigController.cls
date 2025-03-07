/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class XOMOffPlatformAccessConfigController {
    global String encryptUIServicesUrl {
        get;
    }
    @AuraEnabled
    @RemoteAction
    global static Boolean areThorNamedCredentialsEnabled() {
        return null;
    }
    @RemoteAction
    global static Boolean cleanupAccessKeys(String accessKey) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static String getOffplatformUrl() {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Boolean isHybridMode() {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Boolean isOffplatformMode() {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Boolean isOnplatformMode() {
        return null;
    }
    @RemoteAction
    global static Boolean rotateAccessKeys() {
        return null;
    }
    @RemoteAction
    global static Object rotateAccessKeysAndReturnObject() {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object rotateAccessKeysOfNamedCredentials() {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static Object rotateAwsAccessKeysOfNamedCredentials() {
        return null;
    }
    @RemoteAction
    global static String saveXOMSetupCustomSettings(String keyCSPairStr) {
        return null;
    }
    @AuraEnabled
    @RemoteAction
    global static void uploadOMPLUIJWTPrivateKey(String pem) {

    }
global class InvalidPEMException extends Exception {
}
}
