This is the directory where TweetBench will output pipeline scores and predictions formatted for submission.

Contents:

* **run.log** - log generated for each run, includes metadata about pipeline (name, description, parameters)
* **scores.csv** - Comma delimited file with five columns: **model**, **mcc**, **precision**, **recall**, **accuracy**, **description** 
* **submission.csv** - Comma delimited files with two unnamed columns, the first column contains the Tweet ID, the second the numeral representation of the prediction:
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
* **[image_terms_fiveg.csv](image_terms_fiveg.csv)**
* **[image_terms_nocon.csv](image_terms_nocon.csv)**
* **[image_terms_other.csv](image_terms_other.csv)**
* **[image_terms_test.csv](image_terms_test.csv)**
