global class SampleResolveRefDateImpl implements vlocity_cmt.VlocityOpenInterface,Callable
{
    static Map<Id, Datetime> refDateByIdMap = new Map<Id, Datetime>();
    global Boolean call(String action, Map<String,Object> args)
    {
        Map<String,Object> inputMap = (Map<String,Object>)args.get('input');
        Map<String,Object> outMap = (Map<String,Object>)args.get('output');
        Map<String,Object> options = (Map<String,Object>)args.get('options');
        return invokeMethod(action, inputMap, outMap, options);
    }

    global Boolean invokeMethod(String methodName, Map<String, Object> input, Map<String, Object> output, Map<String, Object> options)
    {
        Id parentItemId = null;
        Id parentXliId = null;
        if(input.get('parentItemId') != null)
         parentItemId = Id.valueOf(String.valueOf(input.get('parentItemId')));
        if(input.get('parentXliId') != null)
         parentXliId = Id.valueOf(String.valueOf(input.get('parentXliId')));
         DateTime refDateTime = null;
         if (refDateByIdMap.containsKey(parentItemId))
        {
            refDateTime = refDateByIdMap.get(parentItemId);
            output.put('referenceDate', refDateTime);
        }
        else if(refDateByIdMap.containsKey(parentXliId))
        {
            refDateTime = refDateByIdMap.get(parentXliId);
            output.put('referenceDate', refDateTime);
        }
        else
        {
            vlocity_cmt.DefaultResolveRefDateImplementation impl = new vlocity_cmt.DefaultResolveRefDateImplementation();
            impl.invokeMethod('getReferenceDate', input, output, options);
            if(input.get('parentItemId') != null)
                refDateByIdMap.put(Id.valueOf(String.valueOf(input.get('parentItemId'))),(Datetime)output.get('referenceDate'));
            if(input.get('parentXliId') != null)
                refDateByIdMap.put(Id.valueOf(String.valueOf(input.get('parentXliId'))),(Datetime)output.get('referenceDate'));
        }
        return false;
    }
}