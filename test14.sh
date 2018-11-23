#grep的查找、sed的编辑、awk对数据进行分析并生成报告
#使用方法
awk 'pattern {action}' filename

#awk程序由3部分组成
初始化（处理输入前做的准备，放在BEGIN块中）
数据处理（处理输入数据）
收尾处理（处理输入完成后要进行的处理，放到END块中）

#awk调用方式
命令行方式
    awk [-F field-separator] 'commands' filename
使用-f选项调用awk程序
    awk -f awk-script-file filename
利用命令解释器调用awk程序
    #!/bin/awk -f

#awk详细语法
awk [-F re] [parameter...] ['prong'] [-f progfile] [in_file...]

#awk脚本编写
awk的内置变量
    FS RS  OFS ORS
pattern/action模式
awk与Shell使用
    通过"'$变量名'"的方式读取Shell程序中的变量

#awk内置变量
    ARGC ARGV ENVIRON FILENAME FNR FS NF NR OFS ORS RS

#awk中的print和printf
    print函数的参数可以是变量、数值或字符串，字符串必须用双引号引用，参数用逗号分隔
    printf可以格式化字符串，输出复杂结果时，printf的显示结果更加人性化

#示例
ps -aux|grep init|grep -v grep|awk '{print $2}'
ifconfig eth0|grep "inet addr:"|awk -F: '{print $2}'|awk '{print $1}'
chkconfig --list|grep 3:on|awk '{print $1}'
vmstat 1 4|egrep -v "io|free"|awk '{sum+=$4} END {print sum/4}'
cat /xxx/xxx.log |awk -F '|' 'BEGIN{count=0} $2>0 {count=count+$9} END {print count}'