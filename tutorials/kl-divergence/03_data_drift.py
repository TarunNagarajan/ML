import numpy as np
import matplotlib.pyplot as plt
import scipy

from scipy.stats import entropy, norm

# bi-modal distribution for training data
p_data_peak_01 = np.random.normal(3, 0.5, 5000)
p_data_peak_02 = np.random.normal(7, 0.8, 5000)

p_data = np.concatenate([p_data_peak_01, p_data_peak_02])

q1_data_peak_01 = np.random.normal(3, 0.5, 5000)
q1_data_peak_02 = np.random.normal(7, 0.8, 5000)

q1_data = np.concatenate([q1_data_peak_01, q1_data_peak_02])

q2_data_peak_01 = np.random.normal(3, 0.5, 5000)
q2_data_peak_02 = np.random.normal(8.5, 0.8, 5000)

q2_data = np.concatenate([q2_data_peak_01, q2_data_peak_02])

# combining for the purpose of using the same bins for histo
combined_data = np.concatenate([p_data, q1_data, q2_data])
bins = np.linspace(np.min(combined_data), np.max(combined_data), 100)

p_hist, _ = np.histogram(p_data, bins = bins, density = True)
q1_hist, _ = np.histogram(q1_data, bins = bins, density = True)
q2_hist, _ = np.histogram(q2_data, bins = bins, density = True)

p_dist = p_hist / np.sum(p_hist)
q1_dist = q1_hist / np.sum(q1_hist)
q2_dist = q2_hist / np.sum(q2_hist)

epsilon = 1e-10
p_dist += epsilon
q1_dist += epsilon
q2_dist += epsilon

kl_drift_no = entropy(p_dist, q1_dist)
kl_drift_yes = entropy(p_dist, q2_dist)

print(" --- Data Drift Detection with KL Divergence --- ")
print(f"KLD (P || Q1) -> no drift: {kl_drift_no:.4f}")
print(f"KLD (P || Q2) -> drift: {kl_drift_yes:.4f}")

# clarity: bins holds the edges of the non-overlapping intervals
plt.figure(figsize = (12, 6))
plt.title("Data Drift")
plt.plot(bins[:-1], p_dist, label = 'P (original training distribution)')
plt.plot(bins[:-1], q1_dist, label = 'Q1 (live data with no drift)')
plt.plot(bins[:-1], q2_dist, label = 'Q2 (live data with drift)')
plt.xlabel("Feature value")
plt.ylabel("Probability")
plt.legend()
plt.grid(True)
plt.show()  

