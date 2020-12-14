### MediaEval 2020: FakeNews

The code used for the coarse and fine grained text classification, and classification augmented by OCR on Tweet images, as well as Lia Nogueria's community labels are included in the ```./expirements/``` folder.

* [001 - Fine-grained text classification](notebooks/001.ipynb)
* [002 - Fine-grained text classification with OCR](notebooks/002.ipynb)
* [004 - Fine-grained text classification with community labels](notebooks/004.ipynb)
* [011 - Coarse-grained text classification](notebooks/011.ipynb)
* [012 - Coarse-grained text classification with OCR](notebooks/012.ipynb)
* [014 - Coarse-grained text classification with community labels](notebooks/014.ipynb)

**Note: These expirements are run in the [benchmark.ipynb](../benchmark.ipynb) notebook that imports libraries, loads data, gathers pipelines, and outputs results.**

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
