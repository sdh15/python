#!/bin/bash
#printf 命令不用加括号
#format-string 可以没有引号，但最好加上，单引号双引号均可。
#参数多于格式控制符(%)时，format-string 可以重用，可以将所有参数都转换。
#arguments 使用空格分隔，不用逗号。


printf "%d %s\n" 1 abc

# format-string为双引号
printf "%d %s\n" 1 "abc"
#1 abc


# 单引号与双引号效果一样
printf '%d %s\n' 1 "abc"
#1 abc


# 没有引号也可以输出
printf %s abcdef
#abcdef


# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf %s abc def
#abcdef


printf "%s\n" abc def
#abc
#def


printf "%s %s %s\n" a b c d e f g h i j
#a b c
#d e f
#g h i
#j


# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
printf "%s and %d \n"
#and 0


# 如果以 %d 的格式来显示字符串，那么会有警告，提示无效的数字，此时默认置为 0
printf "The first program always prints'%s,%d\n'" Hello Shell
#-bash: printf: Shell: invalid number
#The first program always prints 'Hello,0'