#!/bin/bash

dbt run
cp storage/database.db storage/database_reading.db