package tests;

import utest.Assert;
import utest.Test;
import BDAEngine;

class BestDealTestCases extends Test {
    
    var validItem:Item = { "id":1001,"name":"Hamburger", "price": 9.99 };

    function testValidBestDealTwoPurchases() {
        var discountedPrice = BDAEngine.applyBestDeal(validItem, 2);
        Assert.equals(discountedPrice, 8.99);
    }

    function testValidBestDealThreePurchases() {
        var discountedPrice = BDAEngine.applyBestDeal(validItem, 3);
        Assert.equals(discountedPrice, 8.49);
    }

    function testValidBestDealFourPurchases() {
        var discountedPrice = BDAEngine.applyBestDeal(validItem, 4);
        Assert.equals(discountedPrice, 7.99);
    }

    function testValidBestDealZeroPurchases() {
        var discountedPrice = BDAEngine.applyBestDeal(validItem, 0);
        Assert.equals(discountedPrice, 9.99);
    }
}