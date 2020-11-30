#!/usr/bin/env python
# coding: utf-8

import os
import glob

prefix = 'e'
files = glob.glob('data/editions/*.xml')

for x in files:
    path, fname = os.path.split(x)
    if fname.startswith('e'):
        continue
    else:
        nn = fname.replace('-eintrag_vom', '')
        newname = os.path.join(path, f"{prefix}{nn}")
        os.rename(x, newname)
