import matplotlib.pyplot as plt
import pandas as pd

dataset = pd.read_json('data.json')

labels_arr = [
    # place K-Means output here
]

fig = plt.figure(figsize=(10,10))
x, y = zip(*dataset.to_numpy())
for i, labels in enumerate(labels_arr):
    ax = plt.subplot(3, 3, i+1)
    plt.xticks(()); plt.yticks(())
    ax.scatter(x, y, c=labels)
    ax.set_title(f'Iteration {i}')
plt.tight_layout()

plt.savefig(f'_output.png', dpi=400)
