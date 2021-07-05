from sklearn.datasets import make_blobs
import pandas as pd

X, y_true = make_blobs(n_samples=1000,
                       centers=4,
                       cluster_std=0.60,
                       random_state=0)
X = X[:, ::-1]

df = pd.DataFrame({'x' : X[:,0], 'y' : X[:,1]})
df.to_json('data.json', indent=4)
