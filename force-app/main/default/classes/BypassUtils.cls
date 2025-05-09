/**
 * @description       : Bypass utility class to check if bypass is enabled for a specific automation or globally
 * @author            : Sumant
 * @group             : 
 * @last modified on  : 02-10-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class BypassUtils {
    public static Boolean isGlobalBypassEnabled(String bypassField) {
        try {
            Bypass_Settings__c setting = Bypass_Settings__c.getInstance(); // Get org-wide defaults
            if (setting == null) {
                return false;
            }
            return (Boolean) setting.get(bypassField);
        } catch (Exception e) {
            System.debug('Error in isGlobalBypassEnabled: ' + e.getMessage());
            return false;
        }
    }

    public static Boolean isSpecificAutomationBypassed(String automationName) {
        try {
            Bypass_Settings__c setting = Bypass_Settings__c.getInstance(); // Get org-wide defaults
            if (setting == null || String.isEmpty(setting.Specific_Automation_Bypass__c)) {
                return false;
            }
            return setting.Specific_Automation_Bypass__c.contains(automationName.trim());
        } catch (Exception e) {
            System.debug('Error in isSpecificAutomationBypassed: ' + e.getMessage());
            return false;
        }
    }
}
