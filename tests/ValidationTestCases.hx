package tests;

import BDAEngine;
import utest.Test;
import utest.Assert;

class ValidationTestCases extends utest.Test {

    private var itemId:Int;
    private var itemPrice:Float;
    private var previousPurchases:Int;

    public function setup() {
        itemId            = 1001;
        itemPrice         = 20.0;
        previousPurchases = 5;
      }

	function testInvalidItemId() {
    var bestPrice:Float = BDAEngine.getBestDeal(0, itemPrice, previousPurchases);
    //no deal!
    Assert.equals(itemPrice, bestPrice);
  }
  
  function testInvalidItemPrice() {
    var bestPrice:Float = BDAEngine.getBestDeal(itemId, -1.00, previousPurchases);
    //no deal!
    Assert.equals(-1.00, bestPrice);
  }

  function testInvalidPreviousPurchases() {
    var bestPrice:Float = BDAEngine.getBestDeal(itemId, itemPrice, -10);
    //no deal!
    Assert.equals(itemPrice, bestPrice);
  }
}