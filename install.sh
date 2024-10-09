#!/bin/bash
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
.venv/python3 generate_raw_models.py
source update.sh
.venv/bin/python3 visualizer.py