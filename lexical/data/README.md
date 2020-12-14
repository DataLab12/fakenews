# Twitter JSON data

This is the directory contains the input data for the pipeline as well as original data from MediaEval 2020. The input is labeled depending on the run being executed, coarse grained or fine grained.

    * Coarse-grained (Two Class):
        * -1: Missing (tweet was deleted from Twitter before retreival)
        * 0: Other-Conspiracy, Non-Conspiracy, Indeterminate
        * 1: 5G Conspiracy
    * Fine-grained (Four Class):
        * -1: Missing (tweet was deleted from Twitter before retreival)
        * 0: Indeterminate
        * 1: 5G Conspiracy
        * 2: Other-Conspiracy
        * 3: Non-Conspiracy

Corpus of tweets downloaded for the [MediaEval 2020 FakeNews benchmark](https://multimediaeval.github.io/editions/2020/tasks/fakenews/). Tweets are broken into three classes: tweets promoting a coronavirus isn't real, 5G is killing us conspiracy, some other coronavirus related conspiracy, and tweets that contain similar keywords ("5G", "corona", etc.), but do not promote any conspiracy theory.

* 5G Conspiracy
  * Downloaded tweets: [5g_corona_conspiracy.json](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/data/5g_corona_conspiracy.json)

* Other Conspiracy
  * Downloaded tweets: [other_corona_conspiracy.json](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/data/other_corona_conspiracy.json)

* Non-Conspiracy
  * Downloaded tweets: [non_conspiracy.json](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/data/non_conspiracy.json)

* Test Data 
  * Downloaded tweets: [test_tweets.json](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/data/test_tweets.json)

[Repository with code and original data](https://git.txstate.edu/CS7311/a-m730/tree/master/Project)

* 5G Conspiracy
  * [Tweet IDs](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/data/5g_corona_conspiracy_ids.json)

* Other Conspiracy
  * [Tweet IDs](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/data/other_corona_conspiracy_ids.json)

* Non-Conspiracy
  * [Tweet IDs](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/data/non_conspiracy_ids.json)

* Test Data
  * [Tweet IDs](https://git.txstate.edu/CS7311/a-m730/blob/master/Project/source/data/test_tweet_ids.json)

