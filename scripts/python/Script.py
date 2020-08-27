#----------------------------------------
# Python test for our Haxe Engine!
# run from terminal as: python3 Script.py
#----------------------------------------
import sys
import os
os.chdir('../../')
sys.path.insert(1, os.getcwd())
from bin.bestdeal import BDAEngine
print("Best Deal Result: $" + str(BDAEngine.getBestDeal(1001, 9.99, 2)))


