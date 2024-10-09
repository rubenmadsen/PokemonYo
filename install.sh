#!/bin/bash
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
python3 generate_raw_models.py
.venv/bin/bash update.sh
.venv/bin/python3 visualizer.py