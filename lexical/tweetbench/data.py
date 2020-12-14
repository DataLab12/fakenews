import os
import pandas as pd
from sklearn.model_selection import train_test_split

default_inputs = [
    (os.path.join('data','5g_corona_conspiracy.json'),1),
    (os.path.join('data','other_conspiracy.json'),2),
    (os.path.join('data','non_conspiracy.json'),3),
]

default_states = [1058, 1236, 1966, 674, 336]

def get_splits(inputs=None, train_ratio=0.8, random_states=None, text_field='full_text'):
    if inputs is None:
        inputs = default_inputs

    print('reading in data...')

    dataframes = []

    for (path, label) in inputs:
        dataframes.append(pd.read_json(path))
        dataframes[-1]['label'] = label

    df = pd.concat(dataframes)

    if random_states is None:
        random_states = default_states

    test_size = 1-train_ratio

    splits = []

    for state in random_states:
        X = df[text_field]
        y = df['label']
        splits.append(
            train_test_split(
                X, y, test_size=test_size, random_state=state
            )
        )

    return splits
