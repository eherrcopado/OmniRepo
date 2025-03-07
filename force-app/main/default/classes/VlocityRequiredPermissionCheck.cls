global class VlocityRequiredPermissionCheck implements Callable
{
    global Boolean call(String action, Map<String, Object> args)
    {
        if (action == 'checkPermission')
        {
            return checkPermission((String)args.get('requiredPermission'));
        }
        return false;
    }

    @TestVisible
    private Boolean checkPermission(String requiredPermission)
    {
        Boolean hasCustomPermission = false;
        List<String> customPermissionsName = requiredPermission.split(',');
        for (String permissionName : customPermissionsName)
        {
            Boolean hasPermission = FeatureManagement.checkPermission(permissionName.normalizeSpace());
            if (hasPermission == true)
            {
                hasCustomPermission = true;
                break;
            }
        }
        return hasCustomPermission;
    }
}