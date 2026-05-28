use da2;

# Velocity Audit : This identifies accounts where money enters and leaves almost instantly, suggesting the owner is just a middleman.
SELECT 
    Account_ID, 
    Txn_Velocity_Mins, 
    Txn_Value_INR
FROM da2.cleaned_mule_risk_assessment
WHERE Txn_Velocity_Mins < 15
ORDER BY Txn_Value_INR DESC;


# Device Fingerprinting : It finds Shared Devices. If one device is managing multiple accounts, it’s a red flag for an organized fraud ring
SELECT 
    Device_ID, 
    COUNT(Account_ID) AS Accounts_Linked,
    GROUP_CONCAT(Account_ID) AS Account_List
FROM da2.cleaned_mule_risk_assessment
GROUP BY Device_ID
HAVING Accounts_Linked > 1
ORDER BY Accounts_Linked DESC;


# The "Sleeper-to-Active" Deep Dive : This query isolates the specific accounts that stayed idle for a long time and then moved money instantly—your most suspicious group.
SELECT 
    Account_ID, 
    Idle_Days, 
    Txn_Velocity_Mins, 
    Txn_Value_INR,
    Risk_Level
FROM da2.cleaned_mule_risk_assessment
WHERE Idle_Days > 60 
  AND Txn_Velocity_Mins < 15
ORDER BY Txn_Value_INR DESC;


# Account Age Sensitivity : Very new accounts moving large sums of money are a classic sign of "Fast Muling" where the account is used and discarded quickly.
SELECT 
    Account_ID, 
    Total_Age_Days, 
    Txn_Value_INR
FROM da2.cleaned_mule_risk_assessment
WHERE Total_Age_Days < 30 
AND Txn_Value_INR > 40000;