import { LightningElement, wire, api, track } from 'lwc';

import communityId from '@salesforce/community/Id';
import getCarts from '@salesforce/apex/CartSwitcherController.getCarts';
import createCart from '@salesforce/apex/CartSwitcherController.createCart';
import setPrimaryCart from '@salesforce/apex/CartSwitcherController.setPrimaryCart';
import deleteCart from '@salesforce/apex/CartSwitcherController.deleteCart';

export default class B2bleCartSwitcher extends LightningElement {
    @api effectiveAccountId;
    @api cartTypes;

    @track carts = [];

    @track showDeleteModal = false;
    @track showCreateModal = false;

    orderOptions = [];

    connectedCallback() {
        if (this.cartTypes!=null) {
            //set the first dummy option
            this.orderOptions.push({label: "Don't know yet", value: "Cart"});
            var cartTypesList = this.cartTypes.split(",");
            for (var i=0; i<cartTypesList.length; i++) {
                var cartType = cartTypesList[i];
                this.orderOptions.push({label: cartType, value: cartType});
            } 
        } else {
            //setting some defaults
            this.orderOptions = [
                {label: "Don't know yet", value: "Cart"},
                {label:"OCP",value:"OCP"},
                {label:"Care Moto",value:"Care Moto"},
                {label:"Auto Refill",value:"Auto Refill"},
                {label:"Evasione",value:"Evasione"},
            ];
        }
        this.getAccountCarts();
    }

    getAccountCarts() {
        console.log("Effective account id: " + this.effectiveAccountId);
        getCarts({
            communityId: communityId,
            effectiveAccountId: this.effectiveAccountId
        }).then(result => {
            console.log("Got carts");
            console.log(result);
            this.carts = result;
        })
        .catch(err => {
            console.error("Error getting carts");
            console.error(err);
        })
    }    

    newCartData = {
        orderType: null
    }
    openCreateModal() {
        this.showCreateModal = true;
    }
    closeCreateModal() {
        this.showCreateModal = false;
    }
    onOrderTypeChange(evt) {
        this.newCartData.orderType = evt.target.value;
    }
    createNewCart() {
        //TODO: open a modal to request additional info before creating the cart
        //like the name and the order type
        console.log("Creating a new Cart");
        console.log("Order type: " + this.newCartData.orderType);
        createCart({
            communityId: communityId,
            effectiveAccountId: this.effectiveAccountId,
            cartName: this.newCartData.orderType
        }).then(result => {
            console.log("Created the new cart");
            console.log(result);
            //refreshing the carts
            this.getAccountCarts();
            this.closeCreateModal();
        }).catch(err => {
            console.error("Error creating the new cart");
            console.error(err);
        });
    }

    switchToCart(evt) {
        var cartId = evt.currentTarget.dataset.id;
        setPrimaryCart({
            communityId: communityId,
            effectiveAccountId: this.effectiveAccountId,
            cartId: cartId
        }).then(result => {
            console.log("activated cart");
            //if we are in the cart page we should reload the richt cart
            if (window.location.href.indexOf("/cart") >= 0) {
                var locParts = window.location.href.split("/");
                locParts[locParts.length-1] = cartId;
                var newUrl = locParts.join("/");
                window.location.replace(newUrl);
            } else {
                //in other pages we just refresh the location
                window.location.reload();
            }
            
        })
        .catch(err => {
            console.error("Error making the cart " + cartId + " primary");
            console.error(err);
        });
    }

    cartToBeDeleted = null;
    openDeleteModal(evt) {
        var cartId = evt.currentTarget.dataset.id;
        this.cartToBeDeleted = cartId;
        this.showDeleteModal = true;
    }
    closeDeleteModal() {
        this.cartToBeDeleted = null;
        this.showDeleteModal = false;
    }
    deleteAccountCart() {
        deleteCart({
            communityId: communityId,
            effectiveAccountId: this.effectiveAccountId,
            cartId: this.cartToBeDeleted
        }).then(result => {
            console.log("deleted cart");
            window.location.reload();
        })
        .catch(err => {
            console.error("Error deleting the cart " + cartId);
            console.error(err);
        });
    }

    viewCartItems() {
        //open a modal showing the cart items
    }

}