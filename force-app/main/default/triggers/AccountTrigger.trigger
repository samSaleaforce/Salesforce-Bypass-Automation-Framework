/**
 * @description       : Trigger for Account object
 * @author            : Sumant
 * @group             : 
 * @last modified on  : 04-20-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AccountTrigger on Account (before insert, before update) {
    if (BypassUtils.isGlobalBypassEnabled('Bypass_Triggers__c') || 
        BypassUtils.isSpecificAutomationBypassed('AccountTrigger')) {
            System.debug('Bypassed');
        return; // Exit if bypass is enabled
    }

    // Your trigger logic here
    AccountTriggerHandlerBypass handler = new AccountTriggerHandlerBypass();
    if(handler.isFirstTime)
    {
        handler.isFirstTime = false;
        switch on Trigger.operationType {
            when BEFORE_INSERT {
                handler.beforeInsert(Trigger.New);
            }
            when BEFORE_UPDATE {
                handler.beforeUpdate(Trigger.New,Trigger.Old, Trigger.newMap, Trigger.oldMap);
            }
        }
    }
}
