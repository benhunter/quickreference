### Python 3 Quick Reference

## pip
$ pip freeze > requirements.txt
$ pip install -r requirements.txt

## venv Virtual Environments in Python 3 Standard Library
$ python -m venv my-venv
$ source my-venv/bin/activate
$ pip install 

# Activate virtual environment on Windows PowerShell:
PS >.\my-venv\Scripts\Activate.ps1

# comparison of virtual enviroment tools: 
# https://stackoverflow.com/questions/41573587/what-is-the-difference-between-venv-pyvenv-pyenv-virtualenv-virtualenvwrappe

## execute python commands directly
>python -c "print('A'*65)"

## print without a newline character:
print(text, end=' ')

## lowest possible number for comparisons
float('-inf')

## open pdb anywhere in code
import pdb; pdb.set_trace()

## pytest testing framework
# pytest mocking input() with test class
# https://stackoverflow.com/questions/35851323/pytest-how-to-test-a-function-with-input-call
import module  # The module which contains the call to input

class TestClass:

    def test_function_1(self):
        # Override the Python built-in input method
        module.input = lambda: 'some_input'
        # Call the function you would like to test (which uses input)
        output = module.function()
        assert output == 'expected_output'

    def test_function_2(self):
        module.input = lambda: 'some_other_input'
        output = module.function()
        assert output == 'another_expected_output'

    def teardown_method(self, method):
        # This method is being called after each test case, and it will revert input back to original function
        module.input = input


## using unittest.mock mocking input() with test function
import unittest.mock
import builtins

def test_function():
    with unittest.mock.patch.object(builtins, 'input', lambda: 'some_input'):
        assert module.function() == 'expected_output'


## pytest monkeypatch
def test_something_that_involves_user_input(monkeypatch):
    # monkeypatch the "input" function, so that it returns "Mark".
    # This simulates the user entering "Mark" in the terminal:
    monkeypatch.setattr('builtins.input', lambda x: "Mark")

    # go about using input() like you normally would:
    i = input("What is your name?")
    assert i == "Mark"


## yield groups of specific size from a sequence
def groups(seq, length):
    '''
    Yield groups of specified length from a sequence. The final yield will provide whatever data is left in the
    sequence, without padding. Useful in a for statement:
        for pair in groups('abcdefg', 2):
            do_the_thing(pair)
    :param seq: A slicable object like string or list.
    :param length: The length of each group (ie. 2 for pairs)
    :return:
    '''
    for i in range(0, len(seq), length):
        # print(i)
        yield seq[i:i + length]


## Unicode / Encodings
# view the encodings and non-printable characters in a string:
s = '\xa0'
s.encode('raw_unicode_escape')


## Unique User ID
import uuid

user_id = uuid.uuid4()
print(user_id)


## logging
import logging
# Configure logging with timestamp and log level. Name the log file by date.
logging.basicConfig(format='%(asctime)s %(levelname)s:%(message)s',
                        level=logging.DEBUG,
                        filename=time.strftime('%Y_%m_%d') + '.log',
                        filemode='a+')
logging.info('Message')


## __repr__
class Something:
    def __repr__(self):
        return "<description>"

instance = Something()
print(instance)


## pprint
from pprint import pprint
import requests

pprint([x**2 for x in range(10)])


## requests TODO
## Async IO TODO
## coverage.py TODO

## Paths, Directories
from pathlib import Path
here = Path(__file__).absolute().parent
conf_dir = Path.home().joinpath('.config')
with here.joinpath('requirements.txt').open() as reqs:
    return list([req.strip() for req in reqs if req.strip()])


## Getting all the lines from a file and removing the '\n'
# 1 - pull the whole file into memory and split into lines without '\n':
with open(filename) as f:
    mylist = f.read().splitlines()

# 2 - iterate the lines and strip the whitespace
with open(filename) as f:
    alist = [line.rstrip() for line in f]

## Check the existence of a variable
# To check the existence of a local variable:
if 'myVar' in locals():
  # myVar exists.
# To check the existence of a global variable:
if 'myVar' in globals():
  # myVar exists.
# To check if an object has an attribute:
if hasattr(obj, 'attr_name'):
  # obj.attr_name exists.



