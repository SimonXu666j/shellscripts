#shell中的数组
array_name=(1 2 34 4 5)
echo ${array_name[0]}
echo ${array_name[*]}     #获取所有元素
echo ${array_name[@]}     #获取所有元素
echo ${#array_name[@]}    #获取所有元素个数
echo ${#array_name[2]}    #获取单个元素的长度

#字符串截取
a="hello simon"
j1=${a##*l}
j2=${a#*l}
j3=${a%%l*}
j4=${a%l*}
j5=${a:0:4}
echo $j1
echo $j2
echo $j3
echo $j4
echo $j5
#ls -al|cut -d "."-f2   利用cut获取文件后缀名