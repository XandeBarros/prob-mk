import keyboard
import os

os.system('clear')

var_ta_int = 0
var_certo_int = 0
var_ne_int = 0

os.system('clear')
while True:
  if keyboard.read_key() == "q":
    os.system('clear')
    print(f"{var_ta_int} Tás e {var_certo_int} Certos e {var_ne_int} Nés na aula hoje")
    break

  elif keyboard.read_key() == "t":
    os.system('clear')
    var_ta_int += 1

  elif keyboard.read_key() == "c":
    os.system('clear')
    var_certo_int += 1

  elif keyboard.read_key() == "n": 
    os.system('clear')
    var_ne_int += 1
  
  

  print(f"# Tá: {var_ta_int} | # Certo: {var_certo_int} | # Né: {var_ne_int}")
  print("Press 't' to add 'Tá' or 'c' to add 'Certo' or 'n' to add 'Né'")
  



