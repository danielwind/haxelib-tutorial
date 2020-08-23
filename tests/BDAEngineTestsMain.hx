package tests;

import utest.Runner;
import utest.ui.Report;
import tests.ValidationTestCases;
import tests.LunchTimeTestCases;
import tests.EligibleItemTestCases;

class BDAEngineTestsMain {

    static public function main():Void {
        var runner = new Runner();
        runner.addCase(new ValidationTestCases());
        runner.addCase(new LunchTimeTestCases());
        runner.addCase(new EligibleItemTestCases());
        runner.addCase(new BestDealTestCases());
        Report.create(runner);
        runner.run();
    }
}