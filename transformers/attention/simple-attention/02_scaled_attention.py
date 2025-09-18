import numpy as np
import pandas as pd

"""
Attention Scores:
              This       is  attention
This       0.57735  0.00000    0.00000
is         0.00000  0.57735    0.00000
attention  0.00000  0.00000    0.57735

Attention Weights, Softmaxed:
           This    is  attention
This       0.47  0.26       0.26
is         0.26  0.47       0.26
attention  0.26  0.26       0.47

Token Vectors:
           out0  out1  out2
This       0.47  0.26  0.26
is         0.26  0.47  0.26
attention  0.26  0.26  0.47
"""

tokens = ["This", "is", "attention"]
n_tokens = len(tokens)

d_model = 3

embeddings = np.eye(n_tokens, d_model)

Q = K = V = embeddings

scores = Q @ K.T
scale = np.sqrt(d_model)
scaled_scores = scores / scale

def row_softmax(x):
    x = x - np.max(x, axis=1, keepdims=True)
    e = np.exp(x)

    return e / np.sum(e, axis=1, keepdims=True)

attn_weights = row_softmax(scaled_scores)
output = attn_weights @ V

print("Attention Scores:")
print(pd.DataFrame(scaled_scores, index=tokens, columns=tokens))

print("\nAttention Weights, Softmaxed:")
print(pd.DataFrame(attn_weights.round(2), index=tokens, columns=tokens))

print("\nToken Vectors:")
print(pd.DataFrame(output.round(2), index=tokens, columns=[f"out{i}" for i in range(d_model)]))
