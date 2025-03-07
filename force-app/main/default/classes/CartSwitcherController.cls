public class CartSwitcherController {

    @AuraEnabled(cacheable=false)
    public static List<CartWrapper> getCarts(String communityId, String effectiveAccountId) {
        String webstoreId = resolveCommunityIdToWebstoreId(communityId);
        
        List<WebCart> carts = [SELECT Id, Name, Order_Type__c 
                               FROM WebCart 
                               WHERE AccountId = :effectiveAccountId AND Status = 'Active' AND WebStoreId = :webstoreId];

        
        //TODO: for each cart return the cart summary to see which one is the primary
        List<CartWrapper> cartWrappers = new List<CartWrapper>();
        
        for (integer i=0; i<carts.size(); i++) {
            WebCart cart = carts[i];
            ConnectApi.CartSummary cartSummary = ConnectApi.CommerceCart.getCartSummary(webstoreId, effectiveAccountId, cart.Id);
            CartWrapper cw = new CartWrapper();
            cw.id = cart.Id;
            cw.cart = cart;
            cw.cartSummary = cartSummary;
            cartWrappers.add(cw);
        }
        return cartWrappers;
    }
    
    @AuraEnabled(cacheable=false)
    public static ConnectApi.CartSummary createCart(String communityId, String effectiveAccountId, String cartName) {
        ConnectApi.CartInput cart = new ConnectApi.CartInput();
        cart.effectiveAccountId = effectiveAccountId;
        cart.isSecondary = true;
        cart.name = cartName;
        String webstoreId = resolveCommunityIdToWebstoreId(communityId);
        
        ConnectApi.CartSummary cartSummary = ConnectApi.CommerceCart.createCart(webstoreId, cart);
        
        return cartSummary;
    }
    
    @AuraEnabled(cacheable=false)
    public static ConnectApi.CommerceActionResult setPrimaryCart(String communityId, String effectiveAccountId, String cartId) {
        String webstoreId = resolveCommunityIdToWebstoreId(communityId);
        ConnectApi.CommerceActionResult result = ConnectApi.CommerceCart.makeCartPrimary(webstoreId, cartId, effectiveAccountId);
        return result;
    }
    
    @AuraEnabled(cacheable=false)
    public static void deleteCart(String communityId, String effectiveAccountId, String cartId) {
        String webstoreId = resolveCommunityIdToWebstoreId(communityId);
		ConnectApi.CommerceCart.deleteCart(webstoreId, effectiveAccountId, cartId);
    }
    
    public class CartWrapper {
        @AuraEnabled
        public String id {get; set;}
        @AuraEnabled
        public WebCart cart {get; set;}
        @AuraEnabled
        public ConnectApi.CartSummary cartSummary {get; set;}
    }
    
    /**
     * Util class to get the webstore id
     */
    private static Map<String, String> communityIdToWebStoreIdCache = new Map<String, String>();
    
    public static String resolveCommunityIdToWebstoreId(String communityId) {
    if (communityIdToWebStoreIdCache.containsKey(communityId)) {
      return communityIdToWebStoreIdCache.get(communityId);
    } else {
      String webStoreId = [
        SELECT WebStoreId
        FROM WebStoreNetwork
        WHERE NetworkId = :communityId
        WITH SECURITY_ENFORCED
        LIMIT 1
      ]
      .WebStoreId;
      communityIdToWebStoreIdCache.put(communityId, webStoreId);
      return webStoreId;
    }
  }
}