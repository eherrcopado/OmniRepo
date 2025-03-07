global inherited sharing class SfiEnergyConsoleFSAPIFactory implements Callable{
    public static final String GET_SLOTS_VAL = 'getSlotsVal';
    public static final String SLOTS_VALUE = 'slotsValue';
    public static final String GET_ADJACENT_SLOTS = 'getAdjacentSlots';
    public static final String BOOK_FS_APPOINTMENT = 'bookFSAppointment';
    public static final String IS_APPOINTMENT_BOOKED = 'appointmentBooked';
    public static final String ACCOUNTID = 'accountId';
    public static final String OPERATING_HOURS_ID = 'operatingHoursId';
    public static final String CONTACT_ID = 'contactId';
    public static final String SERVICE_TERRITORY = 'serviceTerritory';
    public static final String WORK_TYPE = 'workType';
    public static final String SERVICE_TYPE_DESC = 'servTypeDesc';
    public static final String SERVICE_LOCATION_ID = 'serviceLocationID';
    public static final String SCHEDULING_POLICY = 'schedulingPolicy'; 
    public static final String MAX_DUE_DAYS = 'maxDueDays';
    public static final String SLOT_FOR_DAYS = 'slotsForDays';
    public static final String SORT_BY = 'sortBy';
    public static final String SERVICE_ADDRESS = 'serviceAddress';
    public static final String ACTION = 'action';
    public static final String SERVICE_APPT_VAL = 'serviceAppointmentValue';
    public static final String SCHEDULING_POLICY_ID = 'schedulingPolicyId';
    public static final String WORK_ORDER_ID = 'workOrderId';
    public static final String CURRENT_RANGE_DT = 'currentRangeDT';
    public static final String NEXT = 'next';
    public static final String CONTACT_KEY = 'contactKey';    
    public static final String START_TIME_VAL = 'startTimeVal';    
    public static final String END_TIME_VAL = 'endTimeVal';
    public static final String STREET = 'street';
    public static final String STATE = 'state';
    public static final String CITY = 'city';
    public static final String POSTAL_CODE = 'postalCode';
    public static final String COUNTRY = 'country';
    public static final String API_CALL_OUT = 'APICallout';
    public static final String TIME_ZONE = 'timeZone';
    
    public Boolean call(String action, Map<String,Object> args)
    {   
        Map<String,Object> inputMap = (Map<String,Object>)args.get('input');
        Map<String,Object> outMap = (Map<String,Object>)args.get('output');
        Map<String,Object> options = (Map<String,Object>)args.get('options');
        return invokeMethod(action, inputMap, outMap, options);
    }
    
    public boolean invokeMethod (String methodName, Map<String, Object> inputMap, Map<String, Object> outMap, Map<String, Object> options ) 
    {
        try
        {   if(!inputMap.isEmpty() && (!String.isEmpty(methodName) || !String.isBlank(methodName))) 
            {   
                if(methodName == GET_SLOTS_VAL) 
                {
                    outMap.put(SLOTS_VALUE, fetchAppointmentSlots(methodName,inputMap));
                }
                if(methodName == GET_ADJACENT_SLOTS) 
                {
                    outMap.put(SLOTS_VALUE, handlePreviousNextSlots(methodName,inputMap));
                }
                if(methodName == BOOK_FS_APPOINTMENT) 
                {   
                    outMap.put(IS_APPOINTMENT_BOOKED, bookAppointment(methodName,inputMap));
                }
                if(!outMap.isEmpty())
                {
                    return true;
                } 
                else 
                {
                    return false;
                }
            }
            else 
            {
                return false;
            }
        }
        catch(exception ex)
        {
            System.debug(ex.getMessage());
        }
        return false;
    }
    
    public Object fetchAppointmentSlots(String methodName, Map<String,Object> inputMap)
    {    vlocity_cmt.SfiEnergyConsoleFSAPIWrapper.CreateSlotsParam slotsParam = new vlocity_cmt.SfiEnergyConsoleFSAPIWrapper.CreateSlotsParam();
         OperatingHours abOperatingHours = new OperatingHours();
         workType wr = new workType();
         serviceTerritory serviceTerr = new serviceTerritory();
         WorkOrder workorderNew = new WorkOrder();
         ServiceAppointment serviceAppointmentNew = new ServiceAppointment();
         List<FSL.AppointmentBookingSlot> slots = new List<FSL.AppointmentBookingSlot>();
         Timezone tz;
         Id schedulingPolicyId;
         try{
            Id accountId = (Id)inputMap.get(ACCOUNTID);
            String operatingHoursId = String.valueOf(inputMap.get(OPERATING_HOURS_ID));
            Id contactId = (Id)inputMap.get(CONTACT_ID);
            String servTypeDesc = (String)inputMap.get(SERVICE_TYPE_DESC);
            String serviceTerritoryName = String.valueOf(inputMap.get(SERVICE_TERRITORY)); 
            String workTypeName = String.valueOf(inputMap.get(WORK_TYPE)); 
            String schedulingPolicy = String.valueOf(inputMap.get(SCHEDULING_POLICY));
            String sortBy = String.valueOf(inputMap.get(SORT_BY));
            Integer days = Integer.valueOf(inputMap.get(MAX_DUE_DAYS));
            Integer slotForDays = Integer.valueOf(inputMap.get(SLOT_FOR_DAYS)); 
            Decimal duration;
            String durationType;
            //String addr = (String)inputMap.get(SERVICE_ADDRESS);
            //System.Debug('SERVICE_ADDRESS Print' + addr);
            //MAP<String,Object> addr = (MAP<String,Object>)inputMap.get(SERVICE_ADDRESS);
            List<String> serviceApptFields = new List<String> {'EarliestStartTime','DueDate','ParentRecordId','Duration','DurationType'};
            List<String> workOrderFields = new List<String> {'AccountId','Status','StartDate','EndDate','ContactId','Duration','State',
                                                             'FSL__VisitingHours__c','WorkTypeId','ServiceTerritoryId','Street','City',
                                                             'PostalCode','Country','Description'};
            if(String.isNotBlank(operatingHoursId))
            {
                abOperatingHours = [SELECT Name, Id, TimeZone, (SELECT EndTime, StartTime, Type, DayOfWeek FROM TimeSlots) 
                                    FROM OperatingHours 
                                    WHERE Id = :operatingHoursId
                                    WITH SECURITY_ENFORCED limit 1];
            }else
            {
                abOperatingHours = [SELECT Name, Id,TimeZone, (SELECT EndTime, StartTime, Type, DayOfWeek FROM TimeSlots) 
                                    FROM OperatingHours 
                                    WHERE Name = 'Gold Appointments Calendar'
                                    WITH SECURITY_ENFORCED limit 1];
            }
            if(String.isNotBlank(workTypeName))
            {
                wr = [SELECT Id,Name,EstimatedDuration,DurationType 
                      FROM workType
                      WHERE Name = :workTypeName
                      WITH SECURITY_ENFORCED limit 1];    
            }
            if(String.isNotBlank(serviceTerritoryName))
            {
                serviceTerr = [SELECT Id,Name
                               FROM ServiceTerritory
                               WHERE Name = :serviceTerritoryName
                               WITH SECURITY_ENFORCED limit 1];
            }
            if(String.isNotBlank(schedulingPolicy))
            {
                schedulingPolicyId = [SELECT Id 
                                      FROM FSL__Scheduling_Policy__c 
                                      WHERE Name = :schedulingPolicy
                                      WITH SECURITY_ENFORCED limit 1].Id;
            }
            if( wr != null && serviceTerr != null && schedulingPolicyId != null && abOperatingHours != null)
            {   duration = wr.EstimatedDuration;
                durationType = wr.DurationType;
                tz = Timezone.getTimeZone(abOperatingHours.TimeZone);
                if(fieldIsCreateable(WorkOrder.sObjectType, workOrderFields))
                {
                    workorderNew = new WorkOrder(AccountId=accountId, Status='New',StartDate=system.now(),EndDate=system.now().AddDays(days),ContactId=contactId, 
                                             Duration=duration,FSL__VisitingHours__c=abOperatingHours.Id,WorkTypeId=wr.Id,ServiceTerritoryId=serviceTerr.Id,
                                             Street=(String)inputMap.get(STREET),City=(String)inputMap.get(CITY),State=(String)inputMap.get(STATE),
                                             PostalCode=(String)inputMap.get(POSTAL_CODE),Country=(String)inputMap.get(COUNTRY),Description=servTypeDesc);
                    insert workorderNew;    
                }    
                if(fieldIsCreateable(ServiceAppointment.sObjectType, serviceApptFields))
                {
                    serviceAppointmentNew = new ServiceAppointment(EarliestStartTime = system.now(),DueDate= system.now().AddDays(days),
                                                               ParentRecordId=workorderNew.id,Duration=duration,DurationType=durationType );
                    insert serviceAppointmentNew;    
                }
                
                slots = FSL.AppointmentBookingService.GetSlots(serviceAppointmentNew.Id,schedulingPolicyId,abOperatingHours, 
                                                               tz,sortBy,false);
                System.debug(slots.size()+'slots: '+slots);
                
                slotsParam.serviceAppointmentId = serviceAppointmentNew.Id ;
                slotsParam.workOrderId = workorderNew.Id ;
                slotsParam.schedulingPolicyId = schedulingPolicyId ;
                slotsParam.serviceTerritory = serviceTerritoryName ;
                slotsParam.workType = workTypeName;
                slotsParam.slotForDays = slotForDays;
                slotsParam.servApptDueDate = serviceAppointmentNew.DueDate;
                slotsParam.servApptStartDate = serviceAppointmentNew.EarliestStartTime;
                
            }
        }catch(exception ex)
        {   System.debug('Exception: '+ex.getMessage()+ 'at Line: '+ ex.getLineNumber());
            vlocity_cmt.SfiEnergyConsoleFSAPIWrapper wrSlots = new vlocity_cmt.SfiEnergyConsoleFSAPIWrapper();
            wrSlots.isError = true;
            wrSlots.errorMessage = ex.getMessage();
            return wrSlots;
        }
        return createSlotsWrapper(slots, slotsParam, abOperatingHours);
    }    
    
    public Object createSlotsWrapper(List<FSL.AppointmentBookingSlot> slots, vlocity_cmt.SfiEnergyConsoleFSAPIWrapper.CreateSlotsParam slotsParam, OperatingHours abOperatingHours){
        Integer slotsSize;
        Set<String> slotGroups = new Set<String>();
        List<vlocity_cmt.SfiEnergyConsoleFSAPIWrapper.SlotsWrapper> myslotsList = new  List<vlocity_cmt.SfiEnergyConsoleFSAPIWrapper.SlotsWrapper>();
        vlocity_cmt.SfiEnergyConsoleFSAPIWrapper.SlotsWrapper slotsWrapper = new vlocity_cmt.SfiEnergyConsoleFSAPIWrapper.SlotsWrapper();
        vlocity_cmt.SfiEnergyConsoleFSAPIWrapper wrapperSlots = new vlocity_cmt.SfiEnergyConsoleFSAPIWrapper();
        String intervalDate;
        String intervalDateDT;
        String dT;
        String slotDT;
        String startTimeVal;
        String endTimeVal;
        try{
            for(FSL.AppointmentBookingSlot slot : slots){
                
                vlocity_cmt.SfiEnergyConsoleFSAPIWrapper.SlotsWrapper myslots = new vlocity_cmt.SfiEnergyConsoleFSAPIWrapper.SlotsWrapper();
                if(slot.Interval != null && slot.Interval.Start != null)
                {
                    intervalDate = slot.Interval.Start.formatGmt('MMMM dd, yyyy');
                    intervalDateDT = String.valueOf(slot.Interval.Start);
                    dT = slot.Interval.Start.format('dd-MM-yyyy');
                    slotDT = slot.Interval.Start.format('EEEE, MMMM dd');
                    startTimeVal = String.valueOf(slot.Interval.Start.formatGmt('hh:mm a'));
                    myslots.startTimeVal = String.valueOf(slot.Interval.Start);
                    if(slot.Interval.Finish != null)
                    {
                        endTimeVal = String.valueOf(slot.Interval.Finish.formatGmt('hh:mm a'));
                        myslots.endTimeVal = String.valueOf(slot.Interval.Finish);    
                    }    
                }
                
                myslots.grade = slot.grade;
                myslots.timeSlot = String.valueOf(startTimeVal+' - '+ endTimeVal);
                myslots.timeVal = String.valueOf(startTimeVal+' To '+ endTimeVal);
                myslots.DateSlot = slotDT;
                myslots.intervalDate = intervalDate;
                myslots.intervalDateDT = intervalDateDT;
                if(!slotGroups.contains(dT))
                {
                    slotGroups.add(dT);
                    myslots.newGroupStarts = true;
                }
                if(!slotGroups.isEmpty() && slotGroups.size()<=slotsParam.slotForDays){
                    System.debug('myslots## '+myslots);
                    myslotsList.add(myslots);
                }else{
                    break;
                }
            }
            slotsSize = myslotsList.size();
            wrapperSlots.slotsValue = myslotsList;
            if(slotsParam != null)
            {   wrapperSlots.servApptDueDate = slotsParam.servApptDueDate;
                wrapperSlots.servApptStartDate = slotsParam.servApptStartDate;
                wrapperSlots.serviceAppointmentValue = slotsParam.serviceAppointmentId;
                if(slotsSize >0 && myslotsList.get(0) != null && myslotsList.get(slotsSize-1) != null)
                {
                    wrapperSlots.currentRange = myslotsList.get(0).intervalDate + ' - '+myslotsList.get(slotsSize-1).intervalDate;
                    wrapperSlots.currentRangeDT = myslotsList.get(0).intervalDateDT + ' _ '+myslotsList.get(slotsSize-1).intervalDateDT;
                    
                }else if(slotsSize == 0){
                    wrapperSlots.currentRange = slotsParam.servApptStartDate.formatGmt('MMMM dd, yyyy')+ ' - '+slotsParam.servApptDueDate.formatGmt('MMMM dd, yyyy');
                    wrapperSlots.currentRangeDT = slotsParam.servApptStartDate+ ' _ '+slotsParam.servApptDueDate;
                }
                wrapperSlots.timeZone = abOperatingHours.timeZone;
                wrapperSlots.operatingHoursId = abOperatingHours.Id;
                wrapperSlots.schedulingPolicyId = slotsParam.schedulingPolicyId;
                wrapperSlots.workOrderId = slotsParam.workOrderId;
                wrapperSlots.serviceTerritory = slotsParam.serviceTerritory;
                wrapperSlots.workType = slotsParam.workType; 
            }    
        }catch(exception ex)
        {   System.debug('Exception: '+ex.getMessage()+ 'at Line: '+ ex.getLineNumber());
            vlocity_cmt.SfiEnergyConsoleFSAPIWrapper wrSlots = new vlocity_cmt.SfiEnergyConsoleFSAPIWrapper();
            wrSlots.isError = true;
            wrSlots.errorMessage = ex.getMessage();
            return wrSlots;
        }    
        return wrapperSlots;
    }
    
    public object handlePreviousNextSlots(String methodName, Map<String,Object> inputMap){
        List<FSL.AppointmentBookingSlot> slots = new List<FSL.AppointmentBookingSlot>();
        vlocity_cmt.SfiEnergyConsoleFSAPIWrapper.CreateSlotsParam slotsParam = new vlocity_cmt.SfiEnergyConsoleFSAPIWrapper.CreateSlotsParam();
        OperatingHours abOperatingHours = new OperatingHours();
        try{
            Id serviceAppointmentId = (Id)inputMap.get(SERVICE_APPT_VAL);
            Id operatingHoursId = (Id)inputMap.get(OPERATING_HOURS_ID); 
            Id schedulingPolicyId = (Id)inputMap.get(SCHEDULING_POLICY_ID);
            Id workOrderId = (Id)inputMap.get(WORK_ORDER_ID);
            String sortBy = String.valueOf(inputMap.get(SORT_BY));
            String currentRange = String.valueOf(inputMap.get(CURRENT_RANGE_DT));
            String serviceTerritoryName = String.valueOf(inputMap.get(SERVICE_TERRITORY)); 
            String workTypeName = String.valueOf(inputMap.get(WORK_TYPE));
            Integer days = Integer.valueOf(inputMap.get(MAX_DUE_DAYS));
            Integer slotForDays = Integer.valueOf(inputMap.get(SLOT_FOR_DAYS)); 
            List<String> ranges = new List<String>();
            ServiceAppointment saRecord;
            WorkOrder woRecord;
            Timezone tz;
            DateTime earliestStartDate;
            DateTime dueDate;
            if(workOrderId != null && serviceAppointmentId != null && String.isNotBlank(operatingHoursId) && String.isNotBlank(currentRange) && currentRange.contains('_')){
                abOperatingHours = [SELECT Name, Id, TimeZone, (SELECT EndTime, StartTime, Type, DayOfWeek FROM TimeSlots) 
                                    FROM OperatingHours 
                                    WHERE Id = :operatingHoursId 
                                    LIMIT 1];
                
                if(String.isNotBlank(abOperatingHours.TimeZone))
                {
                    tz = Timezone.getTimeZone(abOperatingHours.TimeZone);
                }
                
                ranges = currentRange.split('_',2);
                if(ranges.size() == 2){
                    DateTime startRange = DateTime.valueOf(ranges[1].trim());
                    startRange = DateTime.valueOf(startRange.format('YYYY-MM-dd 00:00:00'));
                    earliestStartDate = startRange.addDays(1);
                    dueDate = earliestStartDate.addDays(days);
                    List<String> serviceApptFields = new List<String> {'EarliestStartTime','DueDate'};
                    List<String> workOrderFields = new List<String> {'StartDate','EndDate'};
                    if(fieldIsUpdateable(WorkOrder.sObjectType, workOrderFields))
                    {   woRecord = new WorkOrder(Id=workOrderId,StartDate=earliestStartDate.addSeconds(tz.getOffset(earliestStartDate) / -1000),
                                                 EndDate=dueDate.addSeconds(tz.getOffset(dueDate) / -1000));
                        update woRecord;
                    } 
                    if(fieldIsUpdateable(ServiceAppointment.sObjectType, serviceApptFields))
                    {
                        saRecord = new ServiceAppointment(Id=serviceAppointmentId,EarliestStartTime=earliestStartDate.addSeconds(tz.getOffset(earliestStartDate) / -1000),
                                                          DueDate=dueDate.addSeconds(tz.getOffset(dueDate) / -1000));
                        update saRecord; 
                    }    
                    slots = FSL.AppointmentBookingService.GetSlots(serviceAppointmentId,schedulingPolicyId,
                                                                   abOperatingHours,tz,sortBy,false);
                    system.debug(slots.size()+' slots### '+slots); 
                    slotsParam.serviceAppointmentId = serviceAppointmentId;
                    slotsParam.workOrderId = workOrderId;
                    slotsParam.schedulingPolicyId = schedulingPolicyId;
                    slotsParam.serviceTerritory = serviceTerritoryName;
                    slotsParam.workType = workTypeName;
                    slotsParam.slotForDays = slotForDays;
                    slotsParam.servApptDueDate = saRecord.DueDate;
                    slotsParam.servApptStartDate = saRecord.EarliestStartTime;
                }
            }    
        }catch(exception ex)
        {   System.debug('Exception: '+ex.getMessage()+ 'at Line: '+ ex.getLineNumber());
            vlocity_cmt.SfiEnergyConsoleFSAPIWrapper wrSlots = new vlocity_cmt.SfiEnergyConsoleFSAPIWrapper();
            wrSlots.isError = true;
            wrSlots.errorMessage = ex.getMessage();
            return wrSlots;
        } 
        return createSlotsWrapper(slots, slotsParam, abOperatingHours);
    }
    
    public object bookAppointment(String methodName, Map<String,Object> inputMap)
    {   FSL.ScheduleResult scheduleResult;
        List<String> ranges = new List<String>();
        String response;
        try
        {
            Boolean isAPICallOut = Boolean.valueOf(inputMap.get(API_CALL_OUT));
            Id serviceAppointmentId = (Id)inputMap.get(SERVICE_APPT_VAL);
            Id schedulingPolicyId = (Id)inputMap.get(SCHEDULING_POLICY_ID);
            Id workOrderId = (Id)inputMap.get(WORK_ORDER_ID);
            String servTypeDesc = (String)inputMap.get(SERVICE_TYPE_DESC);
            String currentRange = String.valueOf(inputMap.get(CURRENT_RANGE_DT));
            String startTime = String.valueOf(inputMap.get(START_TIME_VAL));
            String endTime = String.valueOf(inputMap.get(END_TIME_VAL));
            DateTime StartTimeVal = DateTime.valueOf(startTime);
            DateTime EndTimeVal = DateTime.valueOf(endTime);
            String tZone = String.valueOf(inputMap.get(TIME_ZONE));
      
            ranges = currentRange.split('_',2);
            if(!isAPICallOut && ranges.size() == 2)
            {   DateTime earliestStartDate = DateTime.valueOf(ranges[0].trim());
                DateTime dueDate = DateTime.valueOf(ranges[1].trim()).addDays(1);
                Timezone tz = Timezone.getTimeZone(tZone);
                List<String> serviceApptFields = new List<String> {'EarliestStartTime','DueDate'};
                List<String> workOrderFields = new List<String> {'StartDate','EndDate'};
                if(fieldIsUpdateable(WorkOrder.sObjectType, workOrderFields))
                {
                    WorkOrder woRecord = new WorkOrder(Id=workOrderId,StartDate=earliestStartDate.addSeconds(tz.getOffset(earliestStartDate) / -1000),
                                                       EndDate=dueDate.addSeconds(tz.getOffset(dueDate) / -1000),Description=servTypeDesc);
                    update woRecord;    
                }    
                if(fieldIsUpdateable(ServiceAppointment.sObjectType, serviceApptFields))
                {
                    ServiceAppointment saRecord = new ServiceAppointment(Id=serviceAppointmentId,EarliestStartTime=earliestStartDate.addSeconds(tz.getOffset(earliestStartDate) / -1000),
                                                                         DueDate=dueDate.addSeconds(tz.getOffset(dueDate) / -1000),Description=servTypeDesc,
                                                                         ArrivalWindowStartTime=StartTimeVal.addSeconds(tz.getOffset(StartTimeVal) / -1000),
                                                                         ArrivalWindowEndTime=EndTimeVal.addSeconds(tz.getOffset(EndTimeVal) / -1000));
                    update saRecord;
                }
            }
            if(isAPICallOut && String.isNotBlank(schedulingPolicyId) && String.isNotBlank(serviceAppointmentId))
            {
                scheduleResult = FSL.ScheduleService.schedule(schedulingPolicyId,serviceAppointmentId);  
                //System.debug('appointment number is1 ' + scheduleResult);
            }    
            
            if(scheduleResult != null && scheduleResult.Service != null)
            {
            //System.debug('appointment number is2 ' + scheduleResult);
                response = scheduleResult.Service.AppointmentNumber;
            }
        }
        catch(exception ex)
        {   System.debug('Exception: '+ex.getMessage()+ 'at Line: '+ ex.getLineNumber());
            return response; 
        }
        return response;
    }
/*
* @Date: 17/06/2021
* @Description: This method is used to check FLS for fields used in insert DML
* @Params : Schema.SObjectType (objectType) , List<String> (fields)
* @Return : Boolean
* @Revision(s): [Date] - [Change Reference] - [Changed By] - [Description]   
*/
    public static Boolean fieldIsCreateable(Schema.SObjectType objectType, List<String> fields)
    {
        Boolean isFieldAccessible = false;
        Map<String, SObjectField > fieldsMap = objectType.getDescribe().fields.getMap();
        for(String fieldName: fields)
        {
            if(!fieldsMap.containsKey(fieldName) || fieldsMap.get(fieldName).getDescribe().isCreateable())
            {
                isFieldAccessible = true;
            } 
            else 
            {
                return false;
            }
        }
        return isFieldAccessible;
    }  
    
/*
* @Date: 17/06/2021
* @Description: This method is used to check FLS for fields used in update DML
* @Params : Schema.SObjectType (objectType) , List<String> (fields)
* @Return : Boolean
* @Revision(s): [Date] - [Change Reference] - [Changed By] - [Description]   
*/
    public static Boolean fieldIsUpdateable(Schema.SObjectType objectType, List<String> fields)
    {
        Boolean isFieldAccessible = false;
        Map<String, SObjectField > fieldsMap = objectType.getDescribe().fields.getMap();
        for(String fieldName: fields)
        {
            if(!fieldsMap.containsKey(fieldName) || fieldsMap.get(fieldName).getDescribe().isUpdateable())
            {
                isFieldAccessible = true;
            } 
            else 
            {
                return false;
            }
        }
        return isFieldAccessible;
    }    
}