public without sharing class EUProgramSampleData {
    static final String thisYear = '' + Date.today().year();
    static final String nextYear =  (Date.today().year() + 1) + '';
    static final Map<String, List<Map<String,Object>>> ALL_DATA = new Map<String, List<Map<String,Object>>> {
        'ApplicationFormTemplate' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'EV Charger Rebate and Rate',
                'Description' => '',
                'ApplicationType' => 'EVCharger',
                'ApprovalFlowName' => 'Trigger_Application_Approval'
            },
            new Map<String, Object>{
                'Name' => 'New Rate Application template',
                'Description' => 'Switch rates flow as a current customer',
                'ApplicationType' => 'EVCharger',
                'ApprovalFlowName' => 'Trigger_Application_Approval'
            },
            new Map<String, Object>{
                'Name' => 'Simple Rebate',
                'Description' => 'Rebate only benefit',
                'ApplicationType' => 'EnergyEfficiency',
                'ApprovalFlowName' => 'Trigger_Application_Approval'
            }
        },
        'UnitOfMeasure' => new List<Map<String,Object>>{
            new Map<String, Object>{
                'Name' => 'US Dollars',
                'UnitCode' => 'USD',
                'Type' => 'Not Application'
            },
            new Map<String, Object>{
                'Name' => 'Kilowatt-hour',
                'UnitCode' => 'kWh',
                'Type' => 'Not Applicable'
            },
            new Map<String, Object>{
                'Name' => 'Meters Squared',
                'UnitCode' => 'Meters Squared',
                'Type' => 'Not Applicable'
            }
        },
        'BenefitType' => new List<Map<String,Object>>{
            new Map<String, Object>{
                'Name' => 'Rebate',
                'Category' => 'Incentive or Rebate',
                'ProcessType' => 'ProgramManagement',
                'Description' => 'Rebate Benefits',
                'Type' => 'Monetary',
                'UnitOfMeasureId' => 'US Dollars'
            },
            new Map<String, Object>{
                'Name' => 'Energy Savings',
                'Category' => 'Calculated Energy Savings',
                'ProcessType' => 'ProgramManagement',
                'Description' => 'Calcualted Energy Savings based on ETRM',
                'Type' => 'Service',
                'UnitOfMeasureId' => 'Kilowatt-hour'
            }
        },
        'Benefit' => new List<Map<String,Object>>{
            new Map<String, Object>{
                'Name' => 'Rebate up to $2,500 per charger',
                'ProgramId' => 'EV Charger Program: Commercial',
                'Description' => 'Rebate up to $2,500 per charger',
                'BenefitTypeId' => 'Rebate',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Battery Rebate Program Benefit',
                'ProgramId' => 'Battery Rebate Program',
                'Description' => 'Upto $500 rebate',
                'BenefitTypeId' => 'Rebate',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Themostat benefit',
                'ProgramId' => 'Smart Thermostat Rebate',
                'Description' => 'Upto $2,500 rebate',
                'BenefitTypeId' => 'Rebate',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Heater benefit',
                'ProgramId' => 'Heat pump water heater',
                'Description' => 'Upto $2,500 rebate',
                'BenefitTypeId' => 'Rebate',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Ice Machine Rebate Benefit',
                'ProgramId' => 'Ice Machine Rebate: Commercial',
                'Description' => 'Upto $2,500 rebate',
                'BenefitTypeId' => 'Rebate',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Insulation benefit',
                'ProgramId' => 'Insulation Rebate: Residential',
                'Description' => 'Upto $500 rebate',
                'BenefitTypeId' => 'Rebate',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Charger Rebate Benefit',
                'ProgramId' => 'EV charging rewards: Residential',
                'Description' => 'Upto $2,500 rebate',
                'BenefitTypeId' => 'Rebate',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Charger Rebate Benefit',
                'ProgramId' => 'EV Charger rate and rebate: Residential',
                'Description' => 'Upto $2,500 rebate',
                'BenefitTypeId' => 'Rebate',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'C&I Rebate Benefit',
                'ProgramId' => 'C&I New & Replacement Equipment',
                'Description' => 'Upto $500 rebate',
                'BenefitTypeId' => 'Rebate',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Thermostat Energy Savings',
                'ProgramId' => 'Energy Efficiency Program',
                'Product2Id' => 'Digital Thermostat',
                'Description' => 'Calculated energy savings for a digital thermostat',
                'BenefitTypeId' => 'Energy Savings',
                'Value' => 450,
                'UnitId' => 'Kilowatt-hour',
                'GoalDefinitionId' => 'Energy Savings for EE Programs FY24',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Heat Pump Energy Savings',
                'ProgramId' => 'Energy Efficiency Program',
                'Product2Id' => 'Heatpump',
                'Description' => 'Calculated Energy Savings for Heat Pumps for the EE Program',
                'BenefitTypeId' => 'Energy Savings',
                'UnitId' => 'Kilowatt-hour',
                'GoalDefinitionId' => 'Energy Savings for EE Programs FY24',
                'IsBenefitCalculated' => true,
                'Rule' => 'Heatpump_Energy_Savings_Benefit_Formula',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Insulation Energy Savings',
                'ProgramId' => 'Energy Efficiency Program',
                'Product2Id' => 'Insulation',
                'Description' => 'Insulation Calculated Energy Savings in EE Program',
                'BenefitTypeId' => 'Energy Savings',
                'UnitId' => 'Kilowatt-hour',
                'GoalDefinitionId' => 'Energy Savings for EE Programs FY24',
                'IsBenefitCalculated' => true,
                'Rule' => 'Insulation_Energy_Savings_Benefit_Formula',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Insulation Rebate',
                'ProgramId' => 'Energy Efficiency Program',
                'Product2Id' => 'Insulation',
                'Description' => 'Rebate for insulating your home in the EE Program',
                'BenefitTypeId' => 'Rebate',
                'UnitId' => 'US Dollars',
                'GoalDefinitionId' => 'Energy Savings for EE Programs FY24',
                'Value' => 500,
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Heat Pump Rebate',
                'ProgramId' => 'Energy Efficiency Program',
                'Product2Id' => 'Heatpump',
                'Description' => 'Heat Pump Rebate in EE Program',
                'BenefitTypeId' => 'Rebate',
                'UnitId' => 'US Dollars',
                'GoalDefinitionId' => 'Rebate budget',
                'IsBenefitCalculated' => true,
                'Rule' => 'Heatpump_Rebate_Benefit_Formula',
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Thermostat Rebate',
                'ProgramId' => 'Energy Efficiency Program',
                'Product2Id' => 'Digital Thermostat',
                'Description' => 'Rebate in Residential EE program for Thermostats',
                'BenefitTypeId' => 'Rebate',
                'UnitId' => 'US Dollars',
                'Value' => 200,
                'IsActive' => true,
                'BenefitStatus' => 'Active'
            }
        },
        'GoalDefinition' => new List<Map<String,Object>>{
            new Map<String, Object>{
                'Name' => 'Energy Savings for EE Programs FY24',
                'Description' => 'Energy savings for the Energy Efficiency program overall is $1MM.',
                'Type' => 'Strategic',
                'Status' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Rebate budget',
                'Description' => 'The do not exceed budget for the EE program\'s rebate program. $1MM',
                'Type' => 'Individual',
                'Status' => 'Active'
            }
        },
        'Product2' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Nest Smart Thermostat',
                'ProductCode' => 'VDK_EE_OFFER_CMC_SM_THEMROSTAT_E_NO_AC',
                'Description' => 'Google\'s Nest thermostat is an energy star thermostat that automatically creates a schedule by learning your routine and preferences, it has an easy set up with google home or the mobile app and can be controlled anywhere with the google nest mobile app.',
                'IsActive' => true,
                'Family' => 'Smart Thermostat',
                'ExternalDataSourceId' => '000000000000000AAA'
            },
            new Map<String, Object>{
                'Name' => 'Ecobee Smart Thermostat',
                'ProductCode' => 'VDK_EE_OFFER_CMC_SM_THEMROSTAT_Ecobee',
                'Description' => 'Eecobee3 lite heats and cools more efficiently over time by factoring in weather patterns and HVAC system performance. Plus, monthly energy reports show how much you saved and how to save even more.',
                'IsActive' => true,
                'Family' => 'Smart Thermostat',
                'ExternalDataSourceId' => '000000000000000AAA'
            },
            new Map<String, Object>{
                'Name' => 'Amazon Smart Thermostat',
                'ProductCode' => 'VDK_EE_OFFER_CMC_SM_THEMROSTAT_Amazon',
                'Description' => 'Amazon Smart Thermostat is an ENERGY STAR® certified thermostats that makes it easy to switch from a traditional thermostat and help reduce energy usage.',
                'IsActive' => true,
                'Family' => 'Smart Thermostat',
                'ExternalDataSourceId' => '000000000000000AAA'
            },
            new Map<String, Object>{
                'Name' => 'Level 1 EV Charger Rebate',
                'ProductCode' => 'VDO_EE_OFFERING_STANDARD_EV_CHARGER_REBATE1',
                'Description' => 'A rebate for a level 1 EV charger. Good for: Plug-in hybrid, such as the Kia Niro.  Miles/charge time: 5 miles per hour of charge.  Voltage: 110V',
                'IsActive' => true,
                'Family' => 'EV Charger',
                'ExternalDataSourceId' => '000000000000000AAA'
            },
            new Map<String, Object>{
                'Name' => 'Level 2 EV Charger Rebate',
                'ProductCode' => 'VDO_EE_OFFERING_STANDARD_EV_CHARGER_REBATE2',
                'Description' => 'A rebate for a Level 2 EV Charger. Good for: Battery EVs, such as the Ford MachE, Tesla 3.  Miles/charge time: 13 to 25 miles per hour of charge.  Voltage: 240V',
                'IsActive' => true,
                'Family' => 'EV Charger',
                'ExternalDataSourceId' => '000000000000000AAA'
            },
            new Map<String, Object>{
                'Name' => 'Level 3 EV Charger Rebate',
                'ProductCode' => 'VDO_EE_OFFERING_STANDARD_EV_CHARGER_REBATE3',
                'Description' => 'A rebate for a Level 3 EV Charger. Good for: Most battery EVs. .  Miles/charge time: 10 to 30 minutes for a full charge Voltage: 480V-500V',
                'IsActive' => true,
                'Family' => 'EV Charger',
                'ExternalDataSourceId' => '000000000000000AAA'
            },
            new Map<String, Object>{
                'Name' => 'Rate: Separate meter for EV Charger rate',
                'ProductCode' => 'EVCHARGER_RATENEWMETER',
                'Description' => 'You can install a separate residential meter solely to charge your electric vehicle, even if you live in an apartment complex. You?ll need to hire a licensed electrician to do the necessary wiring, and to install a new meter pan and panel. But if you do, you can separately meter your electric vehicle using a time-of-use rate, which can reduce off-peak charging cost.',
                'IsActive' => true,
                'Family' => 'EV Charger Rate',
                'ExternalDataSourceId' => '000000000000000AAA'
            },
            new Map<String, Object>{
                'Name' => 'Rate Time of Use Rate',
                'ProductCode' => 'EVCHARGER_RATE',
                'Description' => 'You can switch your whole home to our time-of-use rate for one year with no risk. After you?ve been billed on time-of-use for 12 months, we?ll compare what you paid under time-of-use rate with what you would have paid under our standard residential rate. If you paid more, we?ll credit your account for the difference.',
                'IsActive' => true,
                'Family' => 'EV Charger Rate',
                'ExternalDataSourceId' => '000000000000000AAA'
            },
            new Map<String, Object>{
                'Name' => 'Cap Inc',
                'ProductCode' => 'FA_CAP_INC',
                'Description' => 'Specialized in creative financial products and services.',
                'Family' => 'Financial Assistance',
                'IsActive' => true,
                'ExternalDataSourceId' => '000000000000000AAA'
            },
            new Map<String, Object>{
                'Name' => 'CIT',
                'ProductCode' => 'FA_CIT',
                'Description' => 'Empowers small, mid and large cap businesses by providing equipment financing solutions.',
                'Family' => 'Financial Assistance',
                'IsActive' => true,
                'ExternalDataSourceId' => '000000000000000AAA'
            },
            new Map<String, Object>{
                'Name' => 'Heatpump',
                'ProductCode' => 'HPUMP123',
                'Description' => 'Energy efficient air cooled heat pump for residential homes',
                'Family' => 'Financial Assistance',
                'IsActive' => true,
                'ExternalDataSourceId' => '000000000000000AAA',
                'BasedOnId' => 'HVAC Residential'
            },
            new Map<String, Object>{
                'Name' => 'Digital Thermostat',
                'ProductCode' => 'DIGTHERMOSTAT',
                'Description' => 'An energy star Thermostat with mobile app controls and alerts to reduce energy use.',
                'Family' => 'Financial Assistance',
                'IsActive' => true,
                'ExternalDataSourceId' => '000000000000000AAA'
            },
            new Map<String, Object>{
                'Name' => 'Insulation',
                'ProductCode' => 'INSU',
                'Description' => 'Insulation to keep your home warm during the winters and cool in the summers.',
                'Family' => 'Financial Assistance',
                'IsActive' => true,
                'ExternalDataSourceId' => '000000000000000AAA',
                'BasedOnId' => 'Insulation'
            }
        },
        'Program' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Smart Thermostat Rebate',
                'StartDate' => Date.newInstance(Date.today().year(),01,02),
                'EndDate' => Date.newInstance(Date.today().year(),12,29),
                'Status' => 'Active',
                'Summary' => 'Earn instant rebates at the time of purchase',
                'BusinessSector' => 'Residential',
                'ProgramDeliveryType' => 'Downstream',
                'Stakeholder' => 'Residential',
                'ProgramType' => 'Energy Efficiency',
                'IsRegulatoryProgram' => true,
                'RegulatoryProgramName' =>    'HVAC energy efficiency',
                'EffectiveYear' => thisYear,
                'ApplicationFormTemplateId' => 'Simple Rebate',
                'ShortForm' => 'Upgrade to a smart thermostat for energy savings. Get a rebate, making efficiency eco-friendly and cost-effective.',
                'IsActive' => true
            },
            new Map<String, Object>{
                'Name' => 'EV Charger rate and rebate: Residential',
                'StartDate' => Date.newInstance(Date.today().year()-1,12,01),
                'EndDate' => Date.newInstance(Date.today().year(),12,01),
                'Status' => 'Active',
                'Summary' => 'EV Charger Incentives, Rebates, & Service',
                'AdditionalContext' => 'Residential home owners in the following zip codes',
                'BusinessSector' => 'Residential',
                'ProgramDeliveryType' => 'Downstream',
                'Stakeholder' => 'Residential',
                'ProgramType' => 'Electrification',
                'IsRegulatoryProgram' => true,
                'EffectiveYear' => thisYear,
                'ApplicationFormTemplateId' => 'EV Charger Rebate and Rate',
                'ShortForm' => 'Get reduced EV charger prices and a tailored energy plan, saving costs and supporting EV charging at home.',
                'IsActive' => true
            },
            new Map<String, Object>{
                'Name' => 'EV Charger Program: Commercial',
                'StartDate' => Date.newInstance(Date.today().year()-1,12,01),
                'EndDate' => Date.newInstance(Date.today().year()+1,01,26),
                'Status' => 'Cancelled',
                'Summary' => 'EV charger rebates, a special EV rate and financing solutions are available within this program.',
                'AdditionalContext' => 'Commercial or Industrial customers in the Southern Region',
                'BusinessSector' => 'C&I',
                'Stakeholder' => 'C&I',
                'ProgramType' => 'Energy Efficiency',
                'IsRegulatoryProgram' => false,
                'RegulatoryProgramName' =>    'Electrification',
                'EffectiveYear' => thisYear,
                'ApplicationFormTemplateId' => 'EV Charger Rebate and Rate',
                'ShortForm' => 'Empower your business with EV chargers. Join for sustainability initiatives and special discounted prices.',
                'IsActive' => false
            },
            new Map<String, Object>{
                'Name' => 'Battery Rebate Program',
                'StartDate' => Date.newInstance(Date.today().year(),01,01),
                'EndDate' => Date.newInstance(Date.today().year(),12,31),
                'Status' => 'Active',
                'Summary' => 'Extend power for your home or business during an outage.',
                'AdditionalContext' => 'All customers are eligible.',
                'BusinessSector' => 'Residential',
                'ProgramDeliveryType' => 'Downstream',
                'Stakeholder' => 'Residential',
                'ProgramType' => 'Energy Efficiency',
                'IsRegulatoryProgram' => false,
                'RegulatoryProgramName' =>    'Load Balancing',
                'EffectiveYear' => thisYear,
                'ApplicationFormTemplateId' => 'Simple Rebate',
                'ShortForm' => 'Invest in energy storage, qualify for rebates, ensuring reliable backup power and resilient energy infrastructure.',
                'IsActive' => true
            },
            new Map<String, Object>{
                'Name' => 'Heat pump water heater',
                'StartDate' => Date.newInstance(Date.today().year(),01,02),
                'EndDate' => Date.newInstance(Date.today().year()+1,12,31),
                'Status' => 'Active',
                'Summary' => 'Rebates for heat pump water heaters, based on 14.0 EER and 4.6 COP',
                'AdditionalContext' => 'Residential customers in all zip codes',
                'BusinessSector' => 'Residential',
                'ProgramDeliveryType' => 'Downstream',
                'Stakeholder' => 'Residential',
                'ProgramType' => 'Energy Efficiency',
                'IsRegulatoryProgram' => false,
                'EffectiveYear' => nextYear,
                'ApplicationFormTemplateId' => 'Simple Rebate',
                'ShortForm' => 'Upgrade with a heat pump, save with a rebate, and enjoy long-term efficiency benefits.',
                'IsActive' => true
            },
            new Map<String, Object>{
                'Name' => 'Ice Machine Rebate: Commercial',
                'StartDate' => Date.newInstance(Date.today().year(),01,02),
                'EndDate' => Date.newInstance(Date.today().year(),06,15),
                'Status' => 'Active',
                'Summary' => 'Eligible businesses who switch to an ENERGY STAR® or CEE qualified commercial ice maker',
                'AdditionalContext' => 'Commercial businesses',
                'BusinessSector' => 'C&I',
                'ProgramDeliveryType' => 'Downstream',
                'Stakeholder' => 'C&I',
                'ProgramType' => 'Energy Efficiency',
                'IsRegulatoryProgram' => false,
                'ApplicationFormTemplateId' => 'Simple Rebate',
                'ShortForm' => 'Upgrade ice machines, earn rebates, and support energy-efficient practices in your business.',
                'IsActive' => true
            },
            new Map<String, Object>{
                'Name' => 'Insulation Rebate: Residential',
                'StartDate' => Date.newInstance(Date.today().year(),01,17),
                'EndDate' => Date.newInstance(Date.today().year(),12,07),
                'Status' => 'Active',
                'Summary' => 'Save money and stay comfortable year-round with professionally installed insulation and air sealing.',
                'AdditionalContext' => 'Residential customers in Utility zip codes',
                'BusinessSector' => 'Residential',
                'ProgramDeliveryType' => 'Downstream',
                'Stakeholder' => 'Residential',
                'ProgramType' => 'Energy Efficiency',
                'IsRegulatoryProgram' => false,
                'ShortForm' => 'Install insulation for instant rebates, generating savings in all seasons.',
                'IsActive' => true
            },
            new Map<String, Object>{
                'Name' => 'EV charging rewards: Residential',
                'StartDate' => Date.newInstance(Date.today().year(),01,02),
                'EndDate' => Date.newInstance(Date.today().year()+1,12,30),
                'Status' => 'Active',
                'Summary' => 'Earn cash rewards for charging your vehicle during off-peak times and get valuable data about your c',
                'AdditionalContext' => 'Residential customers with EV chargers',
                'BusinessSector' => 'Residential',
                'ProgramDeliveryType' => 'Downstream',
                'Stakeholder' => 'Residential',
                'ProgramType' => 'Electrification',
                'IsRegulatoryProgram' => false,
                'ApplicationFormTemplateId' => 'New Rate Application template',
                'ShortForm' => 'Join for off-peak EV charging rewards, making sustainable transportation more rewarding.',
                'IsActive' => true
            },
            new Map<String, Object>{
                'Name' => 'C&I New & Replacement Equipment',
                'StartDate' => Date.newInstance(Date.today().year(),02,02),
                'EndDate' => Date.newInstance(Date.today().year()+1,02,22),
                'Status' => 'Active',
                'Summary' => 'C&I New & Replacement Equipment',
                'BusinessSector' => 'C&I',
                'ProgramDeliveryType' => 'Downstream',
                'Stakeholder' => 'C&I',
                'ProgramType' => 'Energy Efficiency',
                'IsRegulatoryProgram' => false,
                'ShortForm' => 'Upgrade commercial and industrial equipment with incentives for efficient operations.',
                'IsActive' => true
            },
            new Map<String, Object>{
                'Name' => 'Energy Efficiency Program',
                'StartDate' => Date.newInstance(Date.today().year()-1,10,02),
                'EndDate' => Date.newInstance(Date.today().year()+1,9,30),
                'Status' => 'Active',
                'Summary' => 'Residential energy efficiency program to promote a reduction in energy use',
                'ShortForm' => 'Energy Efficiency Program for Residential Customers',
                'BusinessSector' => 'Residential',
                'ProgramDeliveryType' => 'Downstream',
                'ProgramType' => 'Energy Efficiency',
                'IsRegulatoryProgram' => false,
                'ShortForm' => 'Save money and the environment. Receive ongoing energy bill credits for making monthly energy-saving decisions.',
                'IsActive' => true
            }
        },
        'ProgramProduct' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Level 1 EV Charger Rebate',
                'Status' => 'Active',
                'ProgramId' => 'EV Charger rate and rebate: Residential',
                'ProductId' => 'Level 1 EV Charger Rebate'
            },
            new Map<String, Object>{
                'Name' => 'Level 2 EV Charger Rebate',
                'Status' => 'Active',
                'ProgramId' => 'EV Charger rate and rebate: Residential',
                'ProductId' => 'Level 2 EV Charger Rebate'
            },
            new Map<String, Object>{
                'Name' => 'Level 3 EV Charger Rebate',
                'Status' => 'Active',
                'ProgramId' => 'EV Charger rate and rebate: Residential',
                'ProductId' => 'Level 3 EV Charger Rebate'
            },
            new Map<String, Object>{
                'Name' => 'Separate meter for EV rate',
                'Status' => 'Active',
                'ProgramId' => 'EV Charger rate and rebate: Residential',
                'ProductId' => 'Rate: Separate meter for EV Charger rate'
            },
            new Map<String, Object>{
                'Name' => 'Time of Use Rate',
                'Status' => 'Active',
                'ProgramId' => 'EV Charger rate and rebate: Residential',
                'ProductId' => 'Rate Time of Use Rate'
            },
            new Map<String, Object>{
                'Name' => 'Cap Inc',
                'Status' => 'Active',
                'ProgramId' => 'EV Charger rate and rebate: Residential',
                'ProductId' => 'Cap Inc'
            },
            new Map<String, Object>{
                'Name' => 'CIT',
                'Status' => 'Active',
                'ProgramId' => 'EV Charger rate and rebate: Residential',
                'ProductId' => 'CIT'
            },
            new Map<String, Object>{
                'Name' => 'Cap Inc',
                'Status' => 'Active',
                'ProgramId' => 'EV Charger Program: Commercial',
                'ProductId' => 'Cap Inc'
            },
            new Map<String, Object>{
                'Name' => 'CIT',
                'Status' => 'Active',
                'ProgramId' => 'EV Charger Program: Commercial',
                'ProductId' => 'CIT'
            },
            new Map<String, Object>{
                'Name' => 'Cap Inc',
                'Status' => 'Active',
                'ProgramId' => 'Battery Rebate Program',
                'ProductId' => 'Cap Inc'
            },
            new Map<String, Object>{
                'Name' => 'CIT',
                'Status' => 'Active',
                'ProgramId' => 'Battery Rebate Program',
                'ProductId' => 'CIT'
            },
            new Map<String, Object>{
                'Name' => 'Nest Smart Thermostat',
                'Status' => 'Active',
                'ProgramId' => 'Smart Thermostat Rebate',
                'ProductId' => 'Nest Smart Thermostat'
            },
            new Map<String, Object>{
                'Name' => 'Ecobee Smart Thermostat',
                'Status' => 'Active',
                'ProgramId' => 'Smart Thermostat Rebate',
                'ProductId' => 'Ecobee Smart Thermostat'
            },
            new Map<String, Object>{
                'Name' => 'Amazon Smart Thermostat',
                'Status' => 'Active',
                'ProgramId' => 'Smart Thermostat Rebate',
                'ProductId' => 'Amazon Smart Thermostat'
            },
            new Map<String, Object>{
                'Name' => 'Cap Inc',
                'Status' => 'Active',
                'ProgramId' => 'Smart Thermostat Rebate',
                'ProductId' => 'Cap Inc'
            },
            new Map<String, Object>{
                'Name' => 'CIT',
                'Status' => 'Active',
                'ProgramId' => 'Smart Thermostat Rebate',
                'ProductId' => 'CIT'
            },
            new Map<String, Object>{
                'Name' => 'Cap Inc',
                'Status' => 'Active',
                'ProgramId' => 'Heat pump water heater',
                'ProductId' => 'Cap Inc'
            },
            new Map<String, Object>{
                'Name' => 'CIT',
                'Status' => 'Active',
                'ProgramId' => 'Heat pump water heater',
                'ProductId' => 'CIT'
            },
            new Map<String, Object>{
                'Name' => 'Cap Inc',
                'Status' => 'Active',
                'ProgramId' => 'Ice Machine Rebate: Commercial',
                'ProductId' => 'Cap Inc'
            },
            new Map<String, Object>{
                'Name' => 'CIT',
                'Status' => 'Active',
                'ProgramId' => 'Ice Machine Rebate: Commercial',
                'ProductId' => 'CIT'
            },
            new Map<String, Object>{
                'Name' => 'Cap Inc',
                'Status' => 'Active',
                'ProgramId' => 'Insulation Rebate: Residential',
                'ProductId' => 'Cap Inc'
            },
            new Map<String, Object>{
                'Name' => 'CIT',
                'Status' => 'Active',
                'ProgramId' => 'Insulation Rebate: Residential',
                'ProductId' => 'CIT'
            },
            new Map<String, Object>{
                'Name' => 'Cap Inc',
                'Status' => 'Active',
                'ProgramId' => 'EV charging rewards: Residential',
                'ProductId' => 'Cap Inc'
            },
            new Map<String, Object>{
                'Name' => 'CIT',
                'Status' => 'Active',
                'ProgramId' => 'EV charging rewards: Residential',
                'ProductId' => 'CIT'
            },
            new Map<String, Object>{
                'Name' => 'Cap Inc',
                'Status' => 'Active',
                'ProgramId' => 'C&I New & Replacement Equipment',
                'ProductId' => 'Cap Inc'
            },
            new Map<String, Object>{
                'Name' => 'CIT',
                'Status' => 'Active',
                'ProgramId' => 'C&I New & Replacement Equipment',
                'ProductId' => 'CIT'
            },
            new Map<String, Object>{
                'Name' => 'Heat Pump Systems',
                'Status' => 'Active',
                'ProgramId' => 'Energy Efficiency Program',
                'ProductId' => 'Heatpump'
            },
            new Map<String, Object>{
                'Name' => 'Digital Thermostat',
                'Status' => 'Active',
                'ProgramId' => 'Energy Efficiency Program',
                'ProductId' => 'Digital Thermostat'
            },
            new Map<String, Object>{
                'Name' => 'Insulation',
                'Status' => 'Active',
                'ProgramId' => 'Energy Efficiency Program',
                'ProductId' => 'Insulation'
            }
        },
        'UsageImpactFactor' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'kWh Reduction',
                'ShortForm' => 'REDKWH',
                'Type' => 'GrossAnnualkWh',
                'IsActive' => false
            },
            new Map<String, Object>{
                'Name' => 'Effective Useful Life',
                'ShortForm' => 'EUL',
                'Type' => 'UsefulLife',
                'IsActive' => true
            },
            new Map<String, Object>{
                'Name' => 'Free Rider',
                'ShortForm' => 'FR',
                'Type' => 'NetToGross',
                'IsActive' => false
            },
            new Map<String, Object>{
                'Name' => 'In Service Rate',
                'ShortForm' => 'ISR',
                'Type' => 'AdjustedGrossAnnual',
                'IsActive' => false
            },
            new Map<String, Object>{
                'Name' => 'Participant Spillover',
                'ShortForm' => 'SOP',
                'Type' => 'NetToGross',
                'IsActive' => false
            },
            new Map<String, Object>{
                'Name' => 'SEERBase',
                'ShortForm' => 'SEERBase',
                'IsActive' => true
            },
            new Map<String, Object>{
                'Name' => 'HSPFBase',
                'ShortForm' => 'HSPFBase',
                'IsActive' => true
            }
        },
        'UsageImpactGroup' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'EV charger Impact Group',
                'Type' => 'Production',
                'IsActive' => false
            },
            new Map<String, Object>{
                'Name' => 'Residential HVAC Impact group',
                'Description' => 'Residential HVAC Impact group in CA',
                'ShortForm' => 'Residential HVAC',
                'Type' => 'Production',
                'IsActive' => true
            }
        },
        'UsageImpactGroupFactor' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'HSPFBase',
                'UsageImpactGroupVersionId' => '2023ResidentialTCRM HVAC',
                'UsageImpactFactorId' => 'HSPFBase',
                'FactorValue' => 5,
                'IsActive' => true
            },
            new Map<String, Object>{
                'Name' => 'SEERBase',
                'UsageImpactGroupVersionId' => '2023ResidentialTCRM HVAC',
                'UsageImpactFactorId' => 'SEERBase',
                'FactorValue' => 13,
                'IsActive' => true
            }
        },
        'UsageImpactGroupVersion' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'v1 EV charger Impact Group',
                'EndDate' => Date.newInstance(Date.today().year(),01,04),
                'UsageImpactGroupId' => 'EV charger Impact Group',
                'isActive' => true
            },
            new Map<String, Object>{
                'Name' => '2023ResidentialTCRM HVAC',
                'Description' => '2023ResidentialTCRM for HVAC',
                'EndDate' => Date.newInstance(Date.today().year(),10,30),
                'UsageImpactGroupId' => 'Residential HVAC Impact group',
                'Version' => 1,
                'TechResourceManualCode' => 'TCRM',
                'isActive' => true
            }
        },
        'UsageImpactGroupPgmMeasure' => new List<Map<String,Object>> {
            new Map<String, Object>{
                'Name' => 'Level 1 EV charger',
                'UsageImpactGroupVersionId' => 'v1 EV charger Impact Group',
                'ProgramId' => 'EV Charger rate and rebate: Residential',
                'Product2Id' => 'Level 1 EV Charger Rebate'
            },
            new Map<String, Object>{
                'Name' => 'Level 2 EV charger',
                'UsageImpactGroupVersionId' => 'v1 EV charger Impact Group',
                'ProgramId' => 'EV Charger rate and rebate: Residential',
                'Product2Id' => 'Level 2 EV Charger Rebate'
            },
            new Map<String, Object>{
                'Name' => 'Level 3 EV charger',
                'UsageImpactGroupVersionId' => 'v1 EV charger Impact Group',
                'ProgramId' => 'EV Charger rate and rebate: Residential',
                'Product2Id' => 'Level 3 EV Charger Rebate'
            },
            new Map<String, Object>{
                'Name' => 'EEProgram Impact Measures 2023',
                'UsageImpactGroupVersionId' => '2023ResidentialTCRM HVAC',
                'Description' => 'EEProgram Impact Measures 2023',
                'ProgramId' => 'Energy Efficiency Program',
                'Product2Id' => 'Heatpump'
            }
        },
        'AttributeDefinition' => new List<Map<String, Object>> {
            new Map<String, Object>{
                'Name' => 'Capacity',
                'Label' => 'Tons',
                'Description' => 'HVAC capacity in Tons such as 1 ton, 5 tons, 7.5 tons, etc.',
                'DataType' => 'Number',
                'isActive' => true,
                'DefaultValue' => '5',
                'DefaultHelpText' => 'Input a number for the total HVAC capacity in tons',
                'DeveloperName' => 'Capacity_in_Tons'
            },
            new Map<String, Object>{
                'Name' => 'HSPFee',
                'Label' => 'HSPFee',
                'Description' => 'Heating seasonal performance factor, BTU/watt-hour, total heating output.  HSPF rates heat and SEER rates cooling.  Ratings from 5-7 are decent but the best most efficient heat pumps are a 10.',
                'DataType' => 'Number',
                'isActive' => true,
                'DefaultValue' => '7.5',
                'DefaultHelpText' => 'Heating seasonal performance factor, BTU/watt-hour, total heating output.  HSPF rates heat and SEER rates cooling.  Usually between 5-10',
                'DeveloperName' => 'HSPFee'
            },
            new Map<String, Object>{
                'Name' => 'SEERee',
                'Label' => 'SEERee',
                'Description' => 'Seasonal Average Energy Efficiency. Manufacturers give their equipment this rating, it is the particual serial number, model of equipment\'s seasonal average energy efficiency ratio over the cooling season, BTU/watthour, used for average U.S. location/region',
                'DataType' => 'Number',
                'isActive' => true,
                'DefaultValue' => '21',
                'DefaultHelpText' => 'Seasonal Average Energy Efficiency. Manufacturers give their equipment this rating, it is the particual serial number, model of equipment\'s seasonal average energy efficiency ratio over the cooling season, BTU/watthour, used for average U.S. location/region',
                'DeveloperName' => 'SEERee'
            },
            new Map<String, Object>{
                'Name' => 'Area',
                'UnitOfMeasureId' => 'Meters Squared',
                'Label' => 'Area',
                'DataType' => 'Number',
                'isActive' => true,
                'DeveloperName' => 'Area_of_Insulation'
            }
        },
        'AttributeCategory' => new List<Map<String, Object>> {
            new Map<String, Object>{
                'Name' => 'HVAC Capacity',
                'Code' => 'HVAC',
                'Description' => 'HVAC'
            },
            new Map<String, Object>{
                'Name' => 'Insulation Area',
                'Code' => 'Area'
            }
        },
        'AttributeCategoryAttribute' => new List<Map<String, Object>> {
            new Map<String, Object>{
                'AttributeCategoryId' => 'Insulation Area',
                'AttributeDefinitionId' => 'Area'
            },
            new Map<String, Object>{
                'AttributeCategoryId' => 'HVAC Capacity',
                'AttributeDefinitionId' => 'Capacity'
            },
            new Map<String, Object>{
                'AttributeCategoryId' => 'HVAC Capacity',
                'AttributeDefinitionId' => 'HSPFee'
            },
            new Map<String, Object>{
                'AttributeCategoryId' => 'HVAC Capacity',
                'AttributeDefinitionId' => 'SEERee'
            }
        },
        'ProductClassification' => new List<Map<String, Object>> {
            new Map<String, Object>{
                'Name' => 'HVAC Residential',
                'Code' => 'HVACResidential',
                'Status' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Insulation',
                'Code' => 'Building Envelope Insulation',
                'Status' => 'Active'
            }
        },
        'ProductClassificationAttr' => new List<Map<String, Object>> {
            new Map<String, Object>{
                'Name' => 'Area of Insulation',
                'ProductClassificationId' => 'HVAC Residential',
                'AttributeDefinitionId' => 'SEERee',
                'AttributeCategoryId' => 'HVAC Capacity',
                'Description' => 'Seasonal Average Energy Efficiency. Manufacturers give their equipment this rating, it is the particual serial number, model of equipment\'s seasonal average energy efficiency ratio over the cooling season, BTU/watthour, used for average U.S. location/region',
                'HelpText' => 'Seasonal Average Energy Efficiency. Manufacturers give their equipment this rating, it is the particual serial number, model of equipment\'s seasonal average energy efficiency ratio over the cooling season, BTU/watthour, used for average U.S. location/region',
                'Status' => 'Active',
                'AttributeNameOverride' => 'SEERee'
            },
            new Map<String, Object>{
                'Name' => 'Area of Insulation',
                'ProductClassificationId' => 'HVAC Residential',
                'AttributeDefinitionId' => 'HSPFee',
                'Description' => 'Heating seasonal performance factor, BTU/watt-hour, total heating output.  HSPF rates heat and SEER rates cooling.  Ratings from 5-7 are decent but the best most efficient heat pumps are a 10.',
                'HelpText' => 'Heating seasonal performance factor, BTU/watt-hour, total heating output.  HSPF rates heat and SEER rates cooling.  Usually between 5-10',
                'Status' => 'Active',
                'AttributeNameOverride' => 'HSPFee'
            },
            new Map<String, Object>{
                'Name' => 'Area of Insulation',
                'ProductClassificationId' => 'HVAC Residential',
                'AttributeDefinitionId' => 'Capacity',
                'AttributeCategoryId' => 'HVAC Capacity',
                'Description' => 'HVAC capacity in Tons such as 1 ton, 5 tons, 7.5 tons, etc.',
                'HelpText' => 'Input a number for the total HVAC capacity in tons',
                'Status' => 'Active',
                'AttributeNameOverride' => 'Capacity in Tons',
                'DefaultValue' => '5'
            },
            new Map<String, Object>{
                'Name' => 'Area of Insulation',
                'ProductClassificationId' => 'Insulation',
                'AttributeDefinitionId' => 'Area',
                'Status' => 'Active',
                'AttributeNameOverride' => 'Area of Insulation'
            }
        },
        'Outcome' => new List<Map<String, Object>> {
            new Map<String, Object>{
                'Name' => 'Overall Energy Savings',
                'IntendedDirection' => 'Increase',
                'Term' => 'Long-Term',
                'SourceName' => 'Regulatory Agency XYZ',
                'Description' => 'Obtain 10 GWh in annual calculated energy savings',
                'Status' => 'Active'
            }
        },
        'OutcomeActivity' => new List<Map<String, Object>> {
            new Map<String, Object>{
                'Name' => 'Energy Efficiency Program',
                'OutcomeId' => 'Overall Energy Savings',
                'OutcomeActivityType' => 'Program',
                'ProgramId' => 'Energy Efficiency Program'
            }
        },
        'TimePeriod' => new List<Map<String, Object>> {
            new Map<String, Object>{
                'Name' => 'EE Residential time period FY24',
                'StartDate' => Date.newInstance(Date.today().year()-1,10,02),
                'EndDate' => Date.newInstance(Date.today().year()+1,9,30)
            }
        },
        'IndicatorDefinition' => new List<Map<String, Object>> {
            new Map<String, Object>{
                'Name' => 'Overall Energy Savings',
                'UnitOfMeasureId' => 'Kilowatt-hour',
                'Status' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Incentive Budget Spent',
                'UnitOfMeasureId' => 'US Dollars',
                'Status' => 'Active'
            }
        },
        'IndicatorAssignment' => new List<Map<String, Object>> {
            new Map<String, Object>{
                'Name' => 'Overall Calculated Energy Savings',
                'IndicatorDefinitionId' => 'Overall Energy Savings',
                'IndicatorAssignmentType' => 'Program',
                'ProgramId' => 'Energy Efficiency Program',
                'OutcomeId' => 'Overall Energy Savings',
                'IntendedDirection' => 'Increase',
                'Status' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Overall Rebate Spend',
                'IndicatorDefinitionId' => 'Incentive Budget Spent',
                'IndicatorAssignmentType' => 'Program',
                'ProgramId' => 'Energy Efficiency Program',
                'IntendedDirection' => 'Maintain',
                'Status' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Heat Pump Energy Savings',
                'IndicatorDefinitionId' => 'Overall Energy Savings',
                'IndicatorAssignmentType' => 'Program Product',
                'ProgramProductId' => 'Heat Pump Systems',
                'IntendedDirection' => 'Increase',
                'Status' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Insulation Energy Savings',
                'IndicatorDefinitionId' => 'Overall Energy Savings',
                'IndicatorAssignmentType' => 'Program Product',
                'ProgramProductId' => 'Insulation',
                'IntendedDirection' => 'Increase',
                'Status' => 'Active'
            },
            new Map<String, Object>{
                'Name' => 'Thermostat Energy Savings',
                'IndicatorDefinitionId' => 'Overall Energy Savings',
                'IndicatorAssignmentType' => 'Program Product',
                'ProgramProductId' => 'Digital Thermostat',
                'IntendedDirection' => 'Increase',
                'Status' => 'Active'
            }
        },
        'IndicatorPerformancePeriod' => new List<Map<String, Object>> {
            new Map<String, Object>{
                'Name' => 'Overall Energy Savings - EE Program',
                'IndicatorAssignmentId' => 'Overall Calculated Energy Savings',
                'TimePeriodId' => 'EE Residential time period FY24',
                'TargetValue' => 10000
            },
            new Map<String, Object>{
                'Name' => 'Overall Rebate Spend - EE Program',
                'IndicatorAssignmentId' => 'Overall Rebate Spend',
                'TimePeriodId' => 'EE Residential time period FY24',
                'TargetValue' => 1000000
            },
            new Map<String, Object>{
                'Name' => 'Heat Pump Energy Savings - EE Program',
                'IndicatorAssignmentId' => 'Heat Pump Energy Savings',
                'TimePeriodId' => 'EE Residential time period FY24'
            },
            new Map<String, Object>{
                'Name' => 'Insulation Energy Savings - EE Program',
                'IndicatorAssignmentId' => 'Insulation Energy Savings',
                'TimePeriodId' => 'EE Residential time period FY24'
            },
            new Map<String, Object>{
                'Name' => 'Thermostat Energy Savings - EE Program',
                'IndicatorAssignmentId' => 'Thermostat Energy Savings',
                'TimePeriodId' => 'EE Residential time period FY24'
            }
        }
    };

    public static final Map<String, Schema.SObjectType> ENTITY_SOBJECT_TYPE_MAPPING = new Map<String, Schema.SObjectType>{
        'ApplicationFormTemplate' => ApplicationFormTemplate.SObjectType,
        'UnitOfMeasure' => UnitOfMeasure.SObjectType,
        'BenefitType' => BenefitType.SObjectType,
        'Benefit' => Benefit.SObjectType,
        // 'Budget' => Budget.SObjectType,
        // 'BudgetAllocation' => BudgetAllocation.SObjectType,
        'GoalDefinition' => GoalDefinition.SObjectType,
        'Product2' => Product2.SObjectType,
        'Program' => Program.SObjectType,
        'ProgramProduct' => ProgramProduct.SObjectType,
        'UsageImpactGroup' => UsageImpactGroup.SObjectType,
        'UsageImpactFactor' => UsageImpactFactor.SObjectType,
        'UsageImpactGroupVersion' => UsageImpactGroupVersion.SObjectType,
        'UsageImpactGroupFactor' => UsageImpactGroupFactor.SObjectType,
        'UsageImpactGroupPgmMeasure' => UsageImpactGroupPgmMeasure.SObjectType,
        'AttributeDefinition' => AttributeDefinition.SObjectType,
        'AttributeCategory' => AttributeCategory.SObjectType,
        'AttributeCategoryAttribute' => AttributeCategoryAttribute.SObjectType,
        'ProductClassification' => ProductClassification.SObjectType,
        'ProductClassificationAttr' => ProductClassificationAttr.SObjectType,
        'Outcome' => Outcome.SObjectType,
        'OutcomeActivity' => OutcomeActivity.SObjectType,
        'TimePeriod' => TimePeriod.SObjectType,
        'IndicatorDefinition' => IndicatorDefinition.SObjectType,
        'IndicatorAssignment' => IndicatorAssignment.SObjectType,
        'IndicatorPerformancePeriod' => IndicatorPerformancePeriod.SObjectType
    };   

    public static final List<String> ENTITY_SOBJECT_TYPES_2DELETE = new List<String>{
        'UsageImpactGroupPgmMeasure',
        'UsageImpactGroupVersion',
        'UsageImpactFactor',
        'UsageImpactGroup',
        'ProductClassificationAttr',
        'AttributeCategoryAttribute',
        'AttributeDefinition',
        'AttributeCategory',
        'IndicatorResult',
        'IndicatorPerformancePeriod',
        'IndicatorAssignment',
        'IndicatorDefinition',
        'Benefit',
        'BenefitType',
        'UnitOfMeasure',
        'TimePeriod',
        'OutcomeActivity',
        'Outcome',
        'ProgramProduct',
        'Product2',
        'ProductClassification',
        'Program',
        'ApplicationFormTemplate',
        'GoalDefinition'
    };

    public static final List<String> CREATION_ORDER = new List<String>{
        'Outcome',
        'OutcomeActivity',
        'TimePeriod',
        'IndicatorDefinition',
        'IndicatorAssignment',
        'IndicatorPerformancePeriod',
        'AttributeCategory',
        'AttributeDefinition',
        'AttributeCategoryAttribute',
        'ProductClassificationAttr'
    };
    
    public static List<SObject> getObjects(String objType) {
        List<Map<String,Object>> objs = ALL_DATA.get(objType);
        List<SObject> toReturn = new List<SObject>();
        Schema.SObjectType sobjType = ENTITY_SOBJECT_TYPE_MAPPING.get(objType);
        for (Map<String,Object> obj: objs) {
            SObject sobj = sobjType.newSObject();
            for (String key: obj.keySet()) {
                Object val = obj.get(key);
                //if (!String.isBlank((String)val)) {
                    sobj.put(key, val);
                //}
            }
            toReturn.add(sobj);
        }
        return toReturn;
    }
}