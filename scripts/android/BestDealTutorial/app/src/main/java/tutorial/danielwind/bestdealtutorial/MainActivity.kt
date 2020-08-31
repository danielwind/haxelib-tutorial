package tutorial.danielwind.bestdealtutorial

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import haxe.root.BDAEngine

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        println("BDAEngine result: " + BDAEngine.getBestDeal(1001, 9.99, 2))
    }
}