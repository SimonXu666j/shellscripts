1)删除行首空格
sed 's/^[]*//g' filename
sed 's/^*//g' filename
sed 's/^[[:space:]]*//g' filename

2)在行后和行前添加新行（&代表pattern，插入空白行）
sed 's/pattern/&\n/g' filename   #行后加
sed 's/pattern/\n&/g' filename   #行前加

3)使用变量替换（使用双引号）
sed -e "s/$var1/$var2/g" filename

4)在第一行插入字符串
sed -i '$ a\插入字符串' filename

5)在最后一行插入字符串
sed -i '$ a\插入字符串' filename

6)在匹配行前插入字符串
sed -i '/pattern/ i "插入字符串"' filename

7)在匹配行后插入字符串
sed -i '/pattern/ a "插入字符串"' filename

8)删除文本中的空行、以空格组成的行及#号注释的行
grep -v ^# filename |sed /^[[:space:]]*$/d |sed /^$/d

9)将目录/modules下面所有文件中的zhangsan都修改成list
sed -i 's/zhangsan/list/g' `grep zhangsan -rl /modules` 

10)在指定行前（后）插入内容content
sed -i ""$line_number"i(a) content" filename



sed的基本语法模式 
sed [-nefri] [n1,n2] 动作[acdipsg]
注：动作最好用''括起来，防止因空格导致错误。
	-e表示直接在命令行模式上进行sed操作，是默认选项；
	-i表示直接修改读取的文件内容，而不是输出到终端。


sed结合正则表达式批量修改文件名


sed -i '31,36s/^#//' test.txt
sed -i '31,36s/^#//g' test.txt
上面两者的区别在于，加了g,表示每一行所有与之匹配的都会被换掉。
