import subprocess


with open('winget_script.txt') as file, open('winget_script.log', 'a') as log_file:
    for program in file.read().split('\n'):
        if len(program) > 0:
            subprocess.run(r'c:\windows\system32\cmd.exe /C ' + 'winget install ' + program, stdout=log_file, check=True)
