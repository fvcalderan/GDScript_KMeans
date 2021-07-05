# GDScript_KMeans
K-Means clustering algorithm implemented in GDScript

```
  __                _     _
 / _|_   _____ __ _| | __| | ___ _ __ __ _ _ __
| |_\ \ / / __/ _` | |/ _` |/ _ \ '__/ _` | '_ \
|  _|\ V / (_| (_| | | (_| |  __/ | | (_| | | | |
|_|   \_/ \___\__,_|_|\__,_|\___|_|  \__,_|_| |_|

BSD 3-Clause License
Copyright (c) 2021, Felipe V. Calderan
All rights reserved.
See the full license inside LICENSE file
```

![Image](https://github.com/fvcalderan/GDScript_KMeans/blob/main/example_items/example_out.png?raw=true)

### The implementation

It's a very basic implementation of the naive K-Means algorithm, so its
performance can be improved by applying more sophisticated methods.

### How to use it

Include the `KMeans` with something like:
```gdscript
const KMeans = preload("PATH/TO/KMeans.gd")
```

Then, call `KMeans.fit([DATASET], [K])`. The arguments are:

#### DATASET
A dataset formatted like this:
```gdscript
var dataset : Array = [[1, 1, 2], [1, 2, 1], [8, 7, 8], [7, 6, 9], [5, 4, 6]]
```
It must be a 2D Array, but each element can have as many dimensions as you
want, 3 is just an example.

#### K
The number `K` of clusters to be found by KMeans (consequently the number of
starting seeds)

The file `example.gd` shows an easy example on how to load a JSON file as the
dataset and feed it correctly formatted into KMeans.

## Supporting tools

Inside the folder `tools` you can find two small Python 3 scripts: one to
generate a dataset and dump it as a JSON and the other to plot the KMeans
clustered data (as shown in the image above). Notice that `Matplotlib`,
`scikit-learn` and `pandas` (also `numpy` and other stuff
indirectly) are required to run the scripts.
