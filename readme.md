# Setup
1. [download](https://www.python.org/downloads/release/python-3113/) and install Python 3.11.3
2. clone the repo
3. open a terminal window and navigate to the framework's root directory
4. create a virtual environment: 
    ```commandline 
    python -m venv venv
    ```
5. activate the virtual environment:
   * POSIX:
     ```commandline 
     source venv/bin/activate
     ```
   * Windows:
     ```commandline 
     venv\Scripts\activate.bat
     ```
6. install the dependencies: 
     ```commandline 
     pip install -r requirements.txt
     ``` 

# Coding task
1. Run the script
     ```commandline 
     python coding_task/coding_task.py
     ``` 
2. Enter the number
3. Validate the output

# Automation Task
No need to download a web driver, it will be downloaded automatically to [drivers](drivers/) directory
1. Run the test
     ```commandline 
     robot --outputdir output --pythonpath ./ automation_task/automation_task.robot
     ``` 
2. The output will be saved to [output](output/) directory
3. navigate to ./output and open [report.html](output/report.html) in a browser
4. Click test "Automation Task"
5. Expand it
6. Expand the keyword "Capture Page Screenshot" that goes just before the "Teardown"
7. Validate the screenshot to make sure that 2 most expensive items are in the shopping cart