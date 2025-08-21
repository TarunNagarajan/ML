import numpy as np

def kld(p, q):
    epsilon = 1e-10
    p_safe = p + epsilon
    q_safe = q + epsilon
    
    return np.sum(p_safe * np.log(p_safe / q_safe))

