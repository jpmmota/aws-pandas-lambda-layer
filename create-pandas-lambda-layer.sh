#!/bin/bash

mkdir pandas-lambda-layer
cd pandas-lambda-layer
virtualenv v-env
source ./v-env/bin/activate
pip install pandas
deactivate

mkdir python
cd python
cp -r ../v-env/lib/python3.8/site-packages/* .
cd ..
zip -r panda_layer.zip python

aws lambda publish-layer-version --layer-name pandas --zip-file fileb://panda_layer.zip --compatible-runtimes python3.8
