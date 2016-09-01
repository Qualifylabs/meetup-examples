# Qualify Meetup Code Samples
Example simple test execution templates for AWS and Qualify Labs.

Currently, repo include following samples:
- Python Local
- Robot Framework Local

Updated after: Meetup for *25 August 2016 Modern test solutions for mobile apps*

## Common Execution Pre-requirement

Best practice for all python based testing is to create a workspace first.
In your shell:
```shell
# install virtualenv
sudo pip install virtualenv
# create virtualenv 
virtualenv venv
```
Activate the workspace virtual environment:
```
source venv/bin/activate
```

> Make sure you have started Appium server in local machine with an Android device.  
> For the sake of simplicity we are using not using iOS


## Robot Framework Execution
- Install required packages. Samples in this repo already have *requirement.txt* files inside so use it:
```shell
cd robotframework
pip install -r requirements.txt
```

- Change ${DEVICE_NAME} variable in test_basic_resource.robot file with your device serial
```
# Use following command to list all Android devices
adb devices
```

- Execute test cases
```
python -m robot tests/
```


## Python Execution
- Install required packages. Samples in this repo already have *requirement.txt* files inside so use it:
```
cd robotframework
pip install -r requirements.txt
```

- Execute test cases
```
pytest tests/test_contacts.py
```


