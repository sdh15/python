#!/bin/bash
strs=("I","love","you","!")
echo "${strs[0]}"

#用空格分开才是多个元素
myStrs=("I" "love" "you" "!")
echo "${myStrs[0]}"

NAME[0]="Zara"
NAME[1]="Qadir"
NAME[2]="Mahnaz"
NAME[3]="Ayan"
NAME[4]="Daisy"
echo "First Method: ${NAME[*]}"
echo "Second Method: ${NAME[@]}"

# 取得数组元素的个数
length=${#array_name[@]}
# 或者
length=${#array_name[*]}
# 取得数组单个元素的长度
lengthn=${#array_name[n]}