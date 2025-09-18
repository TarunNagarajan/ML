import numpy as np
import pandas as pd

"""
Attention Scores:
           This   is  attention
This        1.0  0.0        0.0
is          0.0  1.0        0.0
attention   0.0  0.0        1.0

Attention Weights, Softmaxed:
           This    is  attention
This       0.58  0.21       0.21
is         0.21  0.58       0.21
attention  0.21  0.21       0.58

Token Vectors:
           out0  out1  out2
This       0.58  0.21  0.21
is         0.21  0.58  0.21
attention  0.21  0.21  0.58
"""

tokens = ["This", "is", "attention"]
n_tokens = len(tokens)

d_model = 3

embeddings = np.eye(n_tokens, d_model)

Q = K = V = embeddings

scores = Q @ K.T

def row_softmax(x):
    x = x - np.max(x, axis=1, keepdims=True)
    e = np.exp(x)

    return e / np.sum(e, axis=1, keepdims=True)

attn_weights = row_softmax(scores)

output = attn_weights @ V

print("Attention Scores:")
print(pd.DataFrame(scores, index=tokens, columns=tokens))

print("\nAttention Weights, Softmaxed:")
print(pd.DataFrame(attn_weights.round(2), index=tokens, columns=tokens))

print("\nToken Vectors:")
print(pd.DataFrame(output.round(2), index=tokens, columns=[f"out{i}" for i in range(d_model)]))
