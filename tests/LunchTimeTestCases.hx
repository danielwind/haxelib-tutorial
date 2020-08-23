package tests;

import utest.Assert;
import BDAEngine;

class LunchTimeTestCases extends utest.Test {

    var fridayBeforeLunch = Date.fromString("2020-08-21 11:30:00");
    var fridayAtLunch = Date.fromString("2020-08-21 12:30:00");
    var fridayAfterLunch = Date.fromString("2020-08-21 13:30:00");
    
    function testLunchTime() {
        var isLunchTime = BDAEngine.checkTimeIsLunch(fridayAtLunch);
        Assert.equals(isLunchTime, true);
    }

    function testBeforeLunch() {
        var isLunchTime = BDAEngine.checkTimeIsLunch(fridayBeforeLunch);
        Assert.equals(isLunchTime, false);
    }

    function testAfterLunch() {
        var isLunchTime = BDAEngine.checkTimeIsLunch(fridayAfterLunch);
        Assert.equals(isLunchTime, false);
    }
}