#!/bin/bash
#列表是一组值（数字、字符串等）组成的序列，每个值通过空格分隔。每循环一次，就将列表中的下一个值赋给变量。
#in 列表是可选的，如果不用它，for 循环使用命令行的位置参数。
for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done

for str in 'This is a string'
do
    printf "%s\n" $str
done

for str in "This is a string"
do
    printf "%s\n" $str
done

for FILE in $HOME/.bash*
do
   echo $FILE
done