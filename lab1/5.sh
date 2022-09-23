#!bin/bash
awk '$2 == "INFO" {print $0}' utils/table > info.log
