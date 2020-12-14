## Directions for running data pipeline scripts:

All scripts were written in R (4.0.2) and executed in RStudio (1.2.1335).  Necessary libraries are included at the top of each 
script.  If it is your first time using any of these packages, they can be installed with the R command by running 
'install.packages("[package name]").

The input data can be found *[here](https://git.txstate.edu/DataLab/twitterAnalysis/tree/master/FakeNews/dataset/graphs)*.
It is formatted as a folder for each class of label, with subfolders for each graph.  Each subfolder contains 'nodes.csv', 
'edges.txt', and an image of the graph saved as a PNG. Clone the directory and save the data locally.  Note that 'test_graphs' 
is the test data set, not part of the developmental data set.

Filepaths for input and output must be modified for each user. 

**adjacency_generator.R** can cycle through the developmental graph subfolders in the data directory, create adjacency 
matrices for each graph, and save them to the graph's subfolder as a CSV file. 

**adjacency_generator_test.R** does the same thing, but for the test data set.

**feature_vector_generator.R** can cycle through the developmental graph subfolders in the data directory, create feature 
vectors for each graph, and save them to the label's folder as a CSV file. 

**feature_vector_generator_test.R** does the same thing, but for the test data set.
