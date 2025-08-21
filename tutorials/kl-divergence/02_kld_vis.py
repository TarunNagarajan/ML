import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm, entropy

def manual_kld(p, q):
    epsilon = 1e-10
    p_safe = p + epsilon
    q_safe = q + epsilon

    return np.sum(p_safe * np.log(p_safe / q_safe))

x_axis = np.linspace(-10, 10, 1000)

p_dist = norm.pdf(x_axis, 0, 2) # normal distribution with mean = 0, std = 2
p_dist /= np.sum(p_dist)

q_dist_test = norm.pdf(x_axis, 2, 2) # normal distribution with mean = 0, std = 2
q_dist_test /= np.sum(q_dist_test)

kl_manual = manual_kld(p_dist, q_dist_test)
kl_scipy = entropy(p_dist, q_dist_test)

print(f"Manual KLD (P || Q): {kl_manual:.4f}")
print(f"Scipy KLD (P || Q): {kl_scipy:.4f}")

q_means = np.linspace(-5, 5, 200)
kl_values = []

for mean in q_means:
    q_dist = norm.pdf(x_axis, mean, 2) # new Q distribution for every mean
    q_dist /= np.sum(q_dist)
    kld_val = entropy(p_dist, q_dist)
    kl_values.append(kld_val)

plt.figure(figsize = (12, 6))

plt.subplot(1, 2, 1)
plt.plot(q_means, kl_values, label = "KL(P || Q)")
plt.axvline(x = 0, color = "r", linestyle = "--", label = "Mean of P (KL = 0)")
plt.xlabel("Mean of Q Distribution")
plt.ylabel("KL Divergence")
plt.title("KL Divergence vs. Varying Mean")
plt.legend()
plt.grid(True)

plt.subplot(1, 2, 2)
plt.plot(x_axis, p_dist, label = "P (mean = 0, std = 2)")
plt.plot(x_axis, q_dist_test, label = "Q (mean = 2, std = 2)")
plt.xlabel("x")
plt.ylabel("Probability Density (normalized)")
plt.title("Distributions of P and Q")
plt.legend() 
plt.grid(True)

plt.tight_layout()
plt.show()

