/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-09-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public without sharing class AccountTriggerHandlerBypass{
    public AccountTriggerHelper helper;
    public Boolean isFirstTime=true;
    public AccountTriggerHandlerBypass() {
        this.helper = new AccountTriggerHelper();
    }

    public void beforeInsert(List<Account> newAccounts) {
        System.debug('beforeInsert');
        helper.method1();
    }
    public void beforeUpdate(List<Account> newAccounts, List<Account> oldAccounts, Map<Id,Account> newAccountsMap, Map<Id,Account> oldAccountsMap) {
        System.debug('beforeUpdate');
        helper.method2();
    }
}