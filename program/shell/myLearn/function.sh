#!/bin/bash
# Define your function here
#函数返回值，可以显式增加return语句；如果不加，会将最后一条命令运行结果作为返回值。

#Shell 函数返回值只能是整数，一般用来表示函数执行成功与否，0表示成功，其他值表示失败。如果 return 其他数据，比如一个字符串，往往会得到错误提示：“numeric argument required”。

#如果一定要让函数返回字符串，那么可以先定义一个变量，用来接收函数的计算结果，脚本在需要的时候访问这个变量来获得函数返回值。

Hello () {
   echo "Url is http://see.xidian.edu.cn/cpp/shell/"
}
# Invoke your function
Hello

funWithReturn(){
    echo "The function is to get the sum of two numbers..."
    echo -n "Input first number: "
    read aNum
    echo -n "Input another number: "
    read anotherNum
    echo "The two numbers are $aNum and $anotherNum !"
    return $(($aNum+$anotherNum))
}
funWithReturn
# Capture value returnd by last command
ret=$?
echo "The sum of two numbers is $ret !"



# Calling one function from another
number_one () {
   echo "Url_1 is http://see.xidian.edu.cn/cpp/shell/"
   number_two
}
number_two () {
   echo "Url_2 is http://see.xidian.edu.cn/cpp/u/xitong/"
}
number_one

#像删除变量一样，删除函数也可以使用 unset 命令，不过要加上 .f 选项
$unset .f function_name