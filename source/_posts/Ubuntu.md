---
title: 加密Django代码

---

```python
"""


Usage:
   1. Put this file in a django project directory
   2. Execute: python3 setup.py build_ext --inplace
"""


import os
import sys
import re
import shutil

from distutils.core import setup
from py_compile import compile

from Cython.Build import cythonize

if not os.path.exists('manage.py'):
    sys.exit(1)

PROJECT_DIR = os.path.abspath(os.path.dirname(__file__))

print('PROJECT_DIR:', PROJECT_DIR)

COMPILE_FILES = [
    'models.py'
]

APP_LIST = [
    'foo',
    'bar',
]


def remove_pycache():
    for app in APP_LIST:
        dir_path = os.path.join(PROJECT_DIR, app, '__pycache__')
        if os.path.exists(dir_path):
            print('rm', dir_path)


def compile_cython():
    # compile
    file_Set = set()
    for app in APP_LIST:
        for filename in COMPILE_FILES:
            file_Set.add(os.path.join(app, filename))

    setup(
        ext_modules=cythonize(file_Set)
    )

    # clean
    for app in APP_LIST:
        for filename in COMPILE_FILES:
            file_path = os.path.join(app, filename)
            print('rm', file_path)
            os.remove(file_path)


def compile_pyc():
    # compile
    for app in APP_LIST:
        for filename in os.listdir(app):
            if filename.endswith('.py'):
                filepath = os.path.join(app, filename)
                try:
                    compile(filepath)
                    print("Success compile file: %s" % filepath)

                    # remove source
                    if os.path.exists(filepath):
                        os.remove(filepath)
                except:
                    print("Can't compile file: %s" % filepath)


def move_pyc():
    # move and rename pyc
    for app in APP_LIST:
        for filename in os.listdir(os.path.join(app, '__pycache__')):
            src = os.path.join(app, '__pycache__', filename)
            new_filename = re.sub(r'\.cpython-\d+', '', filename)
            dest = os.path.join(app, new_filename)
            print('mv', src, dest)
            shutil.move(src, dest)

            # remove source
            if os.path.exists(src):
                os.remove(src)


if __name__ == "__main__":
    compile_cython()
    compile_pyc()
    move_pyc()
    remove_pycache()

```

