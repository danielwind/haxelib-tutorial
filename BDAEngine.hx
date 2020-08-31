@:expose  // <- makes the class reachable from plain JavaScript
@:keep    // <- avoids accidental removal by dead code elimination
class BDAEngine { 
  private static var VALID_TIMES = [12, 13];

  private static var APPLICABLE_ITEMS = "[{\"id\":1001,\"name\":\"Hamburger\", \"price\": 9.99 },{\"id\":1002,\"name\":\"Taco\", \"price\": 5.99},{\"id\":1003,\"name\":\"Burrito\", \"price\": 8.99},{\"id\":1004,\"name\":\"Pizza\", \"price\": 2.99},{\"id\":1005,\"name\":\"Falafel\", \"price\": 3.99},{\"id\":1006,\"name\":\"Gyro\", \"price\": 4.99}]";

  static public function main(itemId:Int, price:Float, previousPurchases:Int):Void {
    trace("BDAEngine result: " + getBestDeal(itemId, price, previousPurchases));
  }

  public static function getBestDeal(itemId:Int, price:Float, previousPurchases:Int):Float{
      try{
        if (!validateInput(itemId, price, previousPurchases)) { 
          trace("BDAEngine - getBestDeal | Validation failed. No best deal can be performed.");
          return price; 
        }
        return process(itemId, price, previousPurchases);

      }catch(e:haxe.Exception){
        //in case of any processing error, just return the original price
        trace('BDAEngine - getBestDeal | Error while attempting to process best deal. Ignoring. Error: $e');
        return price;
      }
  }

  private static function process(itemId:Int, price:Float, purchases:Int):Float {
    //---------------------------------------------------------
    //1. Check if item id is entitled for best deal
    //2. Check if time is noon (normal lunch time: 12pm - 1pm)
    //3. If noon, then give best deal!
    //---------------------------------------------------------
    if(checkTimeIsLunch()) {
      var item = checkItemIsEligible(itemId);
      if(item != null){
        return applyBestDeal(item, purchases);
      }
    }
    return price;
  }

  public static function applyBestDeal(item:Item, purchases:Int):Float {
    return item.price - (0.5 * purchases);
  }

  public static function checkItemIsEligible(itemId:Int):Item {
    var items:Array<Item> = haxe.Json.parse(APPLICABLE_ITEMS);
    var item:Array<Item> = items.filter(item -> item.id == itemId);
    if(item.length > 0) { return item[0]; }
    return null;
  }

  public static function checkTimeIsLunch(?date:Null<Date>):Bool {
    var today = Date.now();
    var time = today.getHours();
    if(date != null) { time = date.getHours();}
    if( time >= VALID_TIMES[0] && time < VALID_TIMES[1]){
      return true;
    }
    return false;
  }

  private static function validateInput(itemId:Int, price:Float, previousPurchases:Int):Bool{
      if (previousPurchases <= 0) { return false; }
      if(itemId <= 0){ return false; }
      if(price <= 0) {return false; }
      return true;
  }
}

//type definitions
typedef Item = {
  var id:Int;
  var name: String;
  var price: Float;
}