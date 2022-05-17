import scipy.optimize as root_finder
import numpy as np
import matplotlib.pyplot as plt

m = 180 + 89
g = 9.81
d = 0.2
K = 10000
h = np.sqrt(0.5*0.5 - 0.2*0.2)

def f(x): 
  return (m*g - 2 * K * (1 - np.sqrt((d**2 + h**2)/(d**2 + x**2)))*x)

root = root_finder.bisect(f, -1, 1)

u_eq = h - root

print(u_eq)

def kef(x): 
  return (2 * K * (1 - np.sqrt((d**2 + h**2)/(d**2 + (h - x)**2)))*((h - x) / x))

x = np.linspace(-0.2, 0.2, 100)

fig = plt.figure()

fig, ax = plt.subplots()

ax.plot(x, kef(x), label='K_ef')

ax.set_xlabel('Deformação')  # Add an x-label to the axes.
ax.set_ylabel('K Efetivo')  # Add a y-label to the axes.
ax.set_title("K Efetivo X Deformação")  # Add a title to the axes.

plt.savefig('nome.png')
