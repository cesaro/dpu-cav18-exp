#! /usr/bin/env python


import os
import sys
import subprocess
from os import path
import errno
from shutil import copy2
import shutil
import threading
import re
import time


def mkdir_p(path):
    try:
        os.makedirs(path)
    except OSError as exc: # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(path):
            pass
        else: raise

print "run.py: priting sys.arg"
print sys.argv
startdir = path.abspath(path.curdir)
basename = sys.argv[1] 
os.chdir(path.join("obj",basename, "run"))
ex = basename + ".x"
cmd = ["runner", path.join(os.curdir,ex)] + sys.argv[2:]
print "run.py: going to call cmd"
print cmd
subprocess.call(cmd)

