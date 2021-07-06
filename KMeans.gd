#! /bin/godot -s

#    __                _     _
#   / _|_   _____ __ _| | __| | ___ _ __ __ _ _ __
#  | |_\ \ / / __/ _` | |/ _` |/ _ \ '__/ _` | '_ \
#  |  _|\ V / (_| (_| | | (_| |  __/ | | (_| | | | |
#  |_|   \_/ \___\__,_|_|\__,_|\___|_|  \__,_|_| |_|
#
# BSD 3-Clause License
# Copyright (c) 2021, Felipe V. Calderan
# All rights reserved.
# See the full license inside LICENSE.txt file */

extends Object


class_name KMeans


static func euclidean_dist(a : Array, b : Array) -> float:
    """Compute the Euclidean Distance between 2 arbitrary sized arrays"""
    var total_sqr_terms : float = 0.0
    for i in range(a.size()):
        total_sqr_terms += pow(b[i] - a[i], 2)
    return sqrt(total_sqr_terms)


static func fit(dataset : Array, k : int) -> Array:
    """Compute K-Means clustering for a given dataset"""
    # setup variables
    var num_elems : int = dataset.size()
    var dimension : int = dataset[0].size()
    var rng := RandomNumberGenerator.new()
    rng.randomize()
    var labels : Array = []
    var centroids : Array = []
    var old_centroids : Array = []

    # generate initial centroids
    while centroids.size() < k:
        var rnd: int = rng.randi_range(0, num_elems-1)
        var new_centroid: Array = dataset[rnd]
        if not new_centroid in centroids:
            centroids.append(new_centroid)

    while old_centroids != centroids:
        # update old_centroids
        old_centroids = centroids.duplicate()
        # clear labels
        labels.clear()

        # assign each element to the closest centroid
        for i in range(num_elems):
            var closest_i : int = -1
            var closest_d : float = INF
            for j in range(k):
                var actual_d : float = euclidean_dist(dataset[i], centroids[j])
                if actual_d < closest_d:
                    closest_d = actual_d
                    closest_i = j
            labels.append(closest_i)

        # recompute centroids as the center of mass of clusters
        for clus_n in range(k):
            # create temporary centroid as an array of 0
            var temp_centroid : Array = []
            var total_elems_in_clus : int = 0
            for _i in range(dimension):
                temp_centroid.append(0)

            # calculate the new centroid
            for i in range(num_elems):
                if labels[i] == clus_n:
                    total_elems_in_clus += 1
                    for j in range(dimension):
                        temp_centroid[j] += dataset[i][j]
            for i in dimension:
                temp_centroid[i] /= total_elems_in_clus
            centroids[clus_n] = temp_centroid.duplicate()

    return labels
