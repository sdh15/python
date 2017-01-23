#!/bin/bash
#单引号中不能识别变量，而双引号可以识别变量
DATE=`date`
echo 'I am $DATE'
echo "I am $DATE"

#index必须跟着用双引号包含的带$的引用变量
str="alibaba is a great company"
in=`expr index "$str" is`
echo $in
expr substr "this is a test" 3 5