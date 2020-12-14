from datetime import datetime
import importlib
import inspect
from IPython.display import display, HTML
from tweetbench.notebook_loader import NotebookLoader
import os
import pandas as pd
from pprint import pprint
import re
from sklearn import metrics
from sklearn.pipeline import Pipeline
from time import time

exp_dir = 'expirements'
META = 'META'

py_pattern = "^.+\.ipynb$|^.+\.py$"
py = re.compile(py_pattern)

def gather(source_dir=exp_dir):
    """Gather pipelines and metadata from notebooks and python scripts in the 'exp' folder"""

    contents =  os.listdir(exp_dir) # ['baseline.ipynb','001.ipynb']
    sources = [name for name in contents if py.match(name)]

    expirements = []

    for name in sources:

        module_name, module_type = os.path.splitext(name)

        meta = None
        pipeline = None
        module = importlib.import_module(f'{exp_dir}.{module_name}')

        for (k,v) in module.__dict__.items():

            if k == META:
                meta = getattr(module, k)

            if type(v) == Pipeline:
                pipeline = getattr(module, k)

        if pipeline is None:
            continue

        if meta is None:
            meta = {}

        if not 'name' in meta:
            meta['name'] = module_name

        if not 'baseline' in meta:
            meta['baseline'] = module_name.lower() == 'baseline'

        if not 'description' in meta:
            # this is a bit hacky
            meta['description'] = ' '.join([str(x[1]).split()[0] for x in pipeline.named_steps.items()])

        steps = {}; s = ''

        for (name,obj) in pipeline.named_steps.items():
            class_name = obj.__class__.__name__
            params = obj.get_params()
            for (k,v) in params.items():
                s += f'{k}={v}, '
            class_params = f'{class_name}({s})'
            steps[name]=class_params

        meta['steps'] = steps

        expirements.append((module_name, meta, pipeline))

    return expirements

nice_names = {
  "AdaBoostClassifier":"AdaBoost-SAMME",
  "DecisionTreeClassifier":"Decision Tree",
  "GradientBoostingClassifier":"Gradient Boosting",
  "LinearSVC":"Linear SVC",
  "LogisticRegression":"Logistic Regression",
  "MLPClassifier":"MLP Classifier",
  "MultinomialNB":"Multinomial NB",
  "RandomForestClassifier":"Random Forest",
  "SGDClassifier":"SGD",
  "SVC":"SVC"
}

def run(expirement, split):

    filename, meta, pipeline = expirement
    X_train, X_test, y_train, y_test = split

    print('_' * 80)
    print("Training: ")
    pprint(meta['steps'])

    t0 = time()
    pipeline.fit(X_train, y_train)

    train_time = time() - t0
    print("train time: %0.3fs" % train_time)

    t0 = time()
    predictions = pipeline.predict(X_test)
    probabilities = pipeline.predict_proba(X_test)

    test_time = time() - t0
    print("test time:  %0.3fs" % test_time)

    mcc_score = metrics.matthews_corrcoef(y_test, predictions)
    prc_score = metrics.precision_score(y_test, predictions, average="macro")
    rec_score = metrics.recall_score(y_test, predictions, average="macro")
    acc_score = metrics.accuracy_score(y_test, predictions)

    print("\nmcc:   %0.3f,   prec:   %0.3f,   rec:   %0.3f,   acc:   %0.3f\n" % (
        mcc_score,
        prc_score,
        rec_score,
        acc_score))

    print(f"confusion matrix:\n{metrics.confusion_matrix(y_test, predictions)}\n\n")


    data = {
        "expirement": filename,
        "mcc": [mcc_score],
        "precision": [prc_score],
        "recall": [rec_score],
        "accuracy": [acc_score],
        "train time": [train_time],
        "test time": [test_time],
    }
    return pd.DataFrame.from_dict(data), X_test, predictions, probabilities

def make_table(a, caption="Classifier Performance", name=None):

    a = a.sort_index(ascending=True)
    tmp = a.copy()
    tmp.reset_index(level=0, inplace=True)

    def highlight_max(s):
        '''
        highlight the maximum in a Series with bold text.
        '''          
        is_max = s == s.max()

        if s.dtype == object:
          return ['' for v in is_max]

        return ['font-weight: bold' if v else '' for v in is_max]

    format_dict = {'mcc':'{0:.2f}', 'precision':'{0:.2f}', 'recall':'{0:.2f}'}
    # html_table = (a[["pattern","mcc","precision","recall"]]
    html_table = (tmp[["expirement","mcc","precision","recall"]]
      .style
      .format(format_dict)
      .bar(color='coral', vmin=0, vmax=1, subset=['mcc'])
      .bar(color='lightgrey', vmin=0, vmax=1, subset=['precision'])
      .bar(color='darkgrey', vmin=0, vmax=1, subset=['recall'])
      .set_table_styles([
            {'selector': 'th', 'props': [('height', '36px'),('text-align', 'left'),('font-size', '130%'),('font-weight', 'bold')]},
            {'selector': 'td', 'props': [('height', '36px'),('width', '160px'),('font-size', '130%')]},
            {'selector': 'td.col0', 'props': [('height', '36px'),('width', '260px'),('font-size', '130%')]},
            {'selector': 'caption', 'props': [('font-size', '130%'), ('height', '44px'),('font-weight', 'bold'),('padding-top','30px')]},
            #{'selector': 'th.index_name', 'props': [('padding-bottom', '10px')]},
            {'selector': '*', 'props': [('background-color', '#f0f0f0')]},
      ])
      .apply(highlight_max)
      .set_caption(caption)
      .hide_index()
      .render())

    display(HTML(html_table))

    #if name:
    #  filename = f"{name}_table.png"
    #else:
    #  filename = f"{datetime.now().strftime('%m-%d %H:%M:%S')}_table.png"

    #print(filename)

    #virtual_display = Display()
    #try:
    #  virtual_display.start()
    #  imgkit.from_string(html_table, filename, options={'quality':100, 'width': 780})
    #  files.download(filename)
    #finally:
    #  virtual_display.stop()

    a = a.sort_index(ascending=False)
