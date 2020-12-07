Create AWS Lambda layer with pandas module.

# Objective
Create a Lambda Layer with Pandas to use in your lambda functions. This project can be easily changed to create different layers.

# Requirements
I've been using this script in my Windows 10 environment with WSL 2 running Ubuntu.
In order to run it locally, you will need:
- Python 3.8
- virtualenv
- AWS CLI

# Usage
To create the lambda layer automatically, all you need to do is execute create-pandas-lambda-layer.sh file:
```bash
./create-pandas-lambda-layer.sh
```
It will create a folder called pandas-lambda-layer, install pandas module, package and upload it to your AWS account.

Below are the commands executed by the script:

## Prepare Python virtual env
```bash
mkdir pandas-lambda-layer
cd pandas-lambda-layer
virtualenv v-env
source ./v-env/bin/activate
pip install pandas
deactivate
```

## Prepare lambda package
```bash
mkdir python
cd python
cp -r ../v-env/lib/python3.8/site-packages/* .
cd ..
zip -r panda_layer.zip python
```

## Upload lambda layer to AWS
```bash
aws lambda publish-layer-version --layer-name pandas --zip-file fileb://panda_layer.zip --compatible-runtimes python3.8
```

