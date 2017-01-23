
description(){
1.设定变量FILE的值为/etc/passwd
2.依次向/etc/passwd中的每个用户问好，并且说出对方的ID是什么
3.统计一个有多少个用户
}
#!/bin/bash
file="/etc/passwd"
helloUsers_1(){
lines=`cat $file |cut -d ":" -f1|wc -l`
for I in `seq 1 $lines`;do
	userid=`head -$I $file|tail -1|cut -d ":" -f3`
	username=`head -$I $file|tail -1|cut -d ":" -f1`
	echo "hello $username, your UID is $userid"
done
echo "there are $lines users"
}
helloUsers_2(){
let num=0
for I in `cat $file`;do
	username=`echo $I | cut -d ":" -f1`
	userid=`echo $I | cut -d ":" -f3`
	echo "Hello,$username,your UID is $userid"
	num=$[$num+1]
done
echo "there are $num users"
}
helloUsers_2