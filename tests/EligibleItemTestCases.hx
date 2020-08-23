package tests;

import BDAEngine;
import utest.Test;
import utest.Assert;

class EligibleItemTestCases extends utest.Test {

    var validItemId:Int = 1001;

    var invalidItemId:Int = 999;

    function testEligibleItem() {
        var isEligible = BDAEngine.checkItemIsEligible(validItemId);
        Assert.notNull(isEligible);
    }

    function testIneligibleItem() {
        var isEligible = BDAEngine.checkItemIsEligible(invalidItemId);
        Assert.equals(isEligible, null);
    }
}