## Magic School Bus Game
import numpy as np
import random

## Rider
human_name = input('Who''s riding the bus today? (enter name): ')
print('Welcome to the Magic School Bus Game:\n',human_name)

## Pick a number
number_input = input('Type Any Number:')
print(human_name,'selected',
    number_input,'\n')
# Build array from 1 to selected number
x = np.arange(1,int(number_input)+1,1)

# Randomly select a number from x
rand1 = random.choice(x)

## Guess the type of the random number
evenodd = input('Guess Whether the Next Randomly Selected Number is Even or Odd (type even or odd): ')

# Determine if even
even_vars = np.arange(2,int(number_input)+1,2)
print('\n',even_vars,'\n')
# Determine if odd
odd_vars = np.arange(1,int(number_input)+1,2)
print('\n',odd_vars,'\n')