#!/bin/sh
:<<!
today=`date '+%Y%m%d'`
#echo $today
#��ѹ�°��;ɰ�����ʱ�Ƚ�Ŀ¼
cd oldjar_dir;tar -xf ../drbill-$today.tar;find . -name "*.jar">../old_jar.txt 
cd ../newjar_dir;tar -xf ../drbill.tar;find . -name "*.jar">../new_jar.txt
cd ../;diff old_jar.txt new_jar.txt>difference.txt
!
today=`date '+%Y%m%d'`
#echo $today
read -p "please input package_type :" pkg_type
read -p "please input package_name :" pkg_name
#��ѹ�°��;ɰ�����ʱ�Ƚ�Ŀ¼
diff_jar(){
  cd old_dir;jar -xf ../$2-$3.$1;find . -name "*.jar">../old.txt
  cd ../new_dir;jar -xf ../$2.$1;find . -name "*.jar">../new.txt
  cd ../;diff old.txt new.txt>difference.txt
}
if [ $pkg_type = 'jar' ]
then
#�Ƚ�jar��
   diff_jar $pkg_type $pkg_name $today 
elif [ $pkg_type = 'ear' ]
then
#�Ƚ�ear��
   diff_jar $pkg_type $pkg_name $today
elif [ $pkg_type = 'war' ]
then
   diff_jar $pkg_type $pkg_name $today
#�Ƚ�war��
elif [ $pkg_type = 'tar' ]
then
   cd old_dir;tar -xf ../$pkg_name-$today.tar;find . -name "*.jar">../old.txt 
   cd ../new_dir;tar -xf ../../$pkg_name.tar;find . -name "*.jar">../new.txt
   cd ../;diff old.txt new.txt>difference.txt
else
   echo "package_type is wrong!"
fi
