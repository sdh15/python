#!/bin/bash
start=1
total=0
while [ $start -le 1000 ]
do
    if [ $(($start%2))==0 ]
    then
        total=$(($total+$start))
    fi
    start=$(($start+1))
done
echo $total


#seq [OPTION]... LAST
#seq [OPTION]... FIRST LAST
#seq [OPTION]... FIRST INCREMENT LAST

#seq 1000 ‘起始默认是 1，间隔默认也是1
#seq 2 1000 ‘间隔默认是1
#seq 1 3 10 '从1开始，到10 间隔为3 结果是：1 4 7 10

#说明：默认间隔是“空格” 如果想换成其它的可以带参数：-s

#seq -s'#' 1 3 10
#   1#4#7#10

#$(seq start delta end)

start=0
total=0
for i in $(seq $start 2 1000);do
    total=$(($total+$i))
done
echo $total
