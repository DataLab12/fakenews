import setuptools

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setuptools.setup(
    name="TweetBench-andrewmagill",
    version="0.0.2",
    author="Andrew MAgill",
    author_email="andrewmagill@txstate.edu",
    description="TweetBench allows you to queue, run, and benchmark Tweet classification expirements with minimal configuration.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://git.txstate.edu/CS7311/a-m730/tree/master/Project/source",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    install_requires=['emoji','matplotlib','nltk','notebook','opencv-python','pandas','pytesseract','scikit-learn'],
    python_requires='>=3.6',
)
