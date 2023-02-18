#!/bin/bash
script=1.sh
report=report
at -f $script now +2 minutes
tail -f $report
