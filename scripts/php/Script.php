<?php
#-------------------------------------#
# PHP test for our Haxe Engine!
# run from terminal as: php Script.php
#-------------------------------------#
include __DIR__ .'/../../bin/bestdeal.php/index.php';
echo 'Best Deal Result: $'.strval(BDAEngine::getBestDeal(1001, 9.99, 2));