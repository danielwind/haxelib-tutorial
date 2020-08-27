//--------------------------------------
// Javascript test for our Haxe Engine!
// run from terminal as: node Script.js
//--------------------------------------
const BestDeal = require('./../../bin/bestdeal');
console.log(`Best Deal Result: $${BestDeal.BDAEngine.getBestDeal(1001, 9.99, 2)}`);