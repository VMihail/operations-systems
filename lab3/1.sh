#!/bin/bash
today=$(date '+%d.%m.%y_%H:%M:%S')
mkdir test && echo "catalog test was created successfully" >> report && touch test/$today
ping -c 3 "www.net_nikogo.ru" || echo "www.net_nikogo.ru : host unavailable" >> report
