/**
  * SfiEnergyCommunitiesLandingController 
  *
  * Author :: Vaibhav Gupta
  *
  * Description: An apex page controller that takes the user to the right start page based on credentials or lack thereof
 */
public with sharing class SfiEnergyCommunitiesLandingController {
    
    private String landingPageUrl = '/s/overview';
    
    // Code we will invoke on page load.
    public PageReference forwardToStartPage() {
        Site sspSite = [SELECT Id FROM Site WHERE Name = 'Self_Service_Portal'];
        SiteDetail sspSiteDetail = [SELECT SecureURL FROM SiteDetail WHERE DurableId = :sspSite.Id];
        return new PageReference(sspSiteDetail.SecureURL + landingPageUrl);
    }
    
    public SfiEnergyCommunitiesLandingController() {}
}