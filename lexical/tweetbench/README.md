These are the modules that discover and gathers Pipelines in Python scripts and Jupyter Notebooks, loads, labels, and splits data into train and test sets, evaluates classifier performance, and outputs submission files.

* **notebookloader.py** - Loads Jupyter Notebooks as Python modules
* **expirements.py** - Discovers pipelines in the expirements folder and imports in the benchmark.ipynb Noetbook
* **data.py** - Loads json tweets from the ```./data/``` into one labeled Pandas DataFrame and splits into train and test sets
* **submit.py** - Writes submissio file to the ```./output/``` directory
