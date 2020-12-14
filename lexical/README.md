# TweetBench

TweetBench allows you to queue, run, and benchmark Tweet classification expirements with minimal configuration. TweetBench imorts libraries and utilities, loads data, gathers expirements, executes pipeline on five different train/test splits, evaluates, averages, and compares scores to baseline, and generates a submission file for you. All you have to do is add and modify the pipelines in the ```./expirements/``` folder (Jupyter Notebook or Python scripts) with your parameters.

### Prerequisites

* Python 3
* steuptools
* wheel
* virtualenv (optional)

### Requirements (included in installation)

* Jupyter Notebook
* mapplotlib
* pandas
* scikit-learn

### Installation

Clone this repository

> git clone git@git.txstate.edu:CS7311/a-m730.git # or https://git.txstate.edu/CS7311/a-m730.git

> cd a-m730/Project/source

It is recommended that you work in a virtual environment:

> python -m virtualenv tweetbench_env && source tweetbench_env

Run installation:

> python3 -m pip install --index-url https://test.pypi.org/simple/ --no-deps TweetBench-andrewmagill

### Run Benchmark Pipeline

Start Jupyter Notebook:

> jupyter notebook

Open and execute benchmark.ipynb to run the expirements contained in ```./exprements/```. To add a new expirement to the queue, simply add another Jupyter Notebook or python script to the ```./expirements/``` directory and re-run the notebook. Results will be displayed in the benchmark.ipynb Notebook, and written to the ```./output/``` directory.

### Creating New Expriments

TweetBench will run pipelines found in any Jupyter Notebook or python script (.py file) in the expirements folder. There are some requirements, in order for an expirement to run, it must be written as a [scikit-learn Pipeline](https://scikit-learn.org/stable/modules/generated/sklearn.pipeline.Pipeline.html) (documentation and examples can be found [here](https://scikit-learn.org/stable/modules/generated/sklearn.pipeline.Pipeline.html)) 

Example, the simplest possible pipeline, which should be run as the baseline for most of your expirements:

> pipeline = Pipeline([('vectorizer', CountVectorizer()), ('classifier', LogisticRegression()))

You may also want to include metadata for your expirement. This is an optional step, but necessary if you want to designate a pipeline as your baseline for comparison. Your metadata variable must be named *META* and must be structured in the form of a Python dictionary and optionally contain the following fields: **name**:str, **desription**: str, **baselinei**: bool. Your pipeline's parameters will be inserted into the metadata, and output along with your expirement evaluation scores and predictions.

Example metadata:

>META = {  
>    "name": "fine-grained logreg text classifier",  
>    "description": "Fine grained four classification: 5G Conspiracy, Other-Conspiracy, Non-conspiracy, Indeterminate",  
>    "baseline": False  
>}  

### MediaEval 2020: FakeNews

The code used for the coarse and fine grained text classification, and classification augmented by OCR on Tweet images, as well as Lia Nogueria's community labels are included in the ```./expirements/``` folder.

* [001 - Fine-grained text classification](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/expirements/001.ipynb)
* [002 - Fine-grained text classification with OCR](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/expirements/002.ipynb)
* [004 - Fine-grained text classification with community labels](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/expirements/004.ipynb)
* [011 - Coarse-grained text classification](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/expirements/011.ipynb)
* [012 - Coarse-grained text classification with OCR](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/expirements/012.ipynb)
* [014 - Coarse-grained text classification with community labels](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/expirements/014.ipynb)

**Note: These expirements are run in the [benchmark.ipynb]() notebook that imports libraries, loads data, gathers pipelines, and outputs results.**
