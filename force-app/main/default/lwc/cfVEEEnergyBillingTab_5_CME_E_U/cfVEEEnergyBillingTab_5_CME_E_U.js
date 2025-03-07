import { FlexCardMixin } from "vlocity_cmt/flexCardMixin";
    import { CurrentPageReference } from 'lightning/navigation';
    import {interpolateWithRegex, interpolateKeyValue, loadCssFromStaticResource } from "vlocity_cmt/flexCardUtility";
    
          import { LightningElement, api, track, wire } from "lwc";
          import pubsub from "vlocity_cmt/pubsub";
          import { getRecord } from "lightning/uiRecordApi";
          
          import data from "./definition";
          
          import styleDef from "./styleDefinition";
              
          export default class cfVEEEnergyBillingTab_5_CME_E_U extends FlexCardMixin(LightningElement){
              currentPageReference;        
              @wire(CurrentPageReference)
              setCurrentPageReference(currentPageReference) {
                this.currentPageReference = currentPageReference;
              }
              @api debug;
              @api recordId;
              @api objectApiName;
              
              @track record;
              
              @track Label={VEEConsoleOverdueBillsFullMsg:"This customer has overdue bills",
        VEEConsoleOrLabel:"or",
        VEEConsoleAvoidDisconnectionMsg:"to avoid disconnection",
        VEEConsoleMakePaymentLabel:"Make Payment",
        VEEConsoleViewBillLabel:"View Bill",
        VEEConsoleUpdateBillingProfileLabel:"Update Billing Profile",
        VEEConsoleHighBillCase:"High Bill Case",
        VEEConsoleManageBillingDispute:"Manage Billing Dispute",
        VEEConsoleRequestBillCopy:"Request Bill Copy",
        VEEConsoleNoRecords:"No records to display"
        };
              pubsubEvent = [];
              customEvent = [];
              
              connectedCallback() {
                super.connectedCallback();
                this.setThemeClass(data);
                this.setStyleDefinition(styleDef);
                data.Session = {} //reinitialize on reload
                
                
                this.customLabels = this.Label;
                      
                          this.fetchUpdatedCustomLabels();
                      
                this.setDefinition(data);
 this.registerEvents();
                
                
              }
              
              disconnectedCallback(){
                super.disconnectedCallback();
                    
                    

                  this.unregisterEvents();
              }

              registerEvents() {
                
            this.customEventName0 = interpolateWithRegex(`notification`,this._allMergeFields,this._regexPattern,"noparse");
            this.customEvent[0] = this.handleEventAction.bind(this, data.events[0],0);

            this.template.addEventListener(this.customEventName0,this.customEvent[0]);

          
              }

              unregisterEvents(){
                
            this.template.removeEventListener(this.customEventName0,this.customEvent[0]);

              }
            
              renderedCallback() {
                super.renderedCallback();
                
              }
          }