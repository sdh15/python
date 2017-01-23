#!/bin/bash
for i in $(seq 1 300);do
#	echo $i
	keyword=`head -$i  keyword_doc.txt |tail -1| jq ".log.keyword"`
	`echo $keyword|sed  's/"//g'>>keywords.txt`
#	curl -s "http://lc1.haproxy.yidian.com:8902/service/assistant?word="$keyword|jq '.channels[].name'
done
python keyword2fromids.py
