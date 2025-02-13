#!/bin/bash

# use awk to print all rows of a file that start with - [ ]

awk '/^- \[ \]/' ~/dmp/todo.md
