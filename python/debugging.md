# How to debug Python at the command line

To debug Python code at the command line, you can use the built-in Python debugger called pdb. Here's a step-by-step guide to debug a Python script:

Add a breakpoint: In your Python script, add the following line where you want to set a breakpoint:

```python
import pdb; pdb.set_trace()
```

This line imports the pdb module and sets a breakpoint at that location in your code.

# Run your script

Run your Python script from the command line as you normally would:

```shell
python your_script.py
```

When the script reaches the breakpoint, the execution will pause, and you'll enter the interactive debugger session in the command line.

# Debugging commands

You can now use various debugging commands to step through the code, inspect variables, and more. Some useful pdb commands include:

n (next): Execute the current line and move to the next one.
s (step): Step into a function call.
c (continue): Continue the execution until the next breakpoint or the end of the script.
q (quit): Quit the debugger and exit the script.
l (list): List the source code around the current line.
p <variable> (print): Print the value of the specified variable.
pp <variable> (pretty print): Pretty print the value of the specified variable.
h (help): Display the list of available commands.

For more information and commands, refer to the official Python pdb documentation.