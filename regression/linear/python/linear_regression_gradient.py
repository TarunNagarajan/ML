import numpy as np
# version: gradient descent
class LinearRegression:
    def __init__(self):
        self.w = None # weight
        self.b = 0.0 # bias

    def predict(self, X):
        return X @ self.w + self.b
    
    def fit(self, X, y, lr = 0.01, num_iterations = 1000):
        n_samples, n_features = X.shape
        self.w = np.zeros(n_features)
        self.b = 0.0

        for i in range(num_iterations):
            y_pred = self.predict(X)
            error = y_pred - y

            dw = (2 / n_samples) * (X.T @ error)
            db = (2 / n_samples) * np.sum(error)

            self.w -= lr * dw
            self.b -= lr * db

            if (i % 50 == 0):
                loss = np.mean(error ** 2)
                print(f"Iteration {i}, Loss: {loss:.4f}")

    def score(self, X, y):
        y_pred = self.predict(X)

        ss_total = np.sum((y - np.mean(y)) ** 2)
        ss_res = np.sum((y - y_pred) ** 2)

        return 1 - (ss_res / ss_total)
    
np.random.seed(0)
X = np.random.rand(100, 1)
y = 4.5 * X.squeeze() + 2 + np.random.randn(100) * 0.5

# Train
model = LinearRegression()
model.fit(X, y, lr=0.1, num_iterations=1000)

# Predict and evaluate
print("R^2 score:", model.score(X, y))
