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

extends SceneTree

const KMeans = preload("KMeans.gd")

# Your JSON dataset path here
const DATASET_PATH : String = "example_items/example_data.json"


func load_dataset() -> Dictionary:
    """Load and parse json file to use as a dataset"""
    # load text file into variable
    var file = File.new()
    file.open(DATASET_PATH, file.READ)
    var text : String = file.get_as_text()

    # parse the variable as json
    var dataframe : Dictionary = {}
    var result_json = JSON.parse(text)
    if result_json.error == OK:
        dataframe = result_json.result
    else:
        print("Error while trying to load data.json")

    # close loaded file and return dataframe dictionary
    file.close()
    return dataframe


func to_array(dataframe : Dictionary) -> Array:
    """Convert dataframe dictionary to correctly formatted array"""
    var columns : int = dataframe.values().size()
    var rows : int = dataframe.values()[0].size()
    var transposed : Array = []

    # transpose the array
    for row in range(rows):
        var temp_item : Array = []
        for col in range(columns):
            temp_item.append(dataframe.values()[col].values()[row])
        transposed.append(temp_item)

    return transposed


func _init():
    # load and parse dataset
    var dataframe : Dictionary = load_dataset()
    # transform it into an array
    var arrays : Array = to_array(dataframe)
    # get the clustering labels
    var labels : Array = KMeans.fit(arrays, 4)
    # print them
    print(labels)

    quit()
