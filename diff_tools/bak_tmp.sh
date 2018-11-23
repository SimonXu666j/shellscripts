#!/bin/sh
today=`date '+%Y%m%d'`
#echo $today
#备份上个版本的生产包,并创建两个比较的临时目录
dist_path="/app/ocnosql/webapp/deploy_drquery";
mv $dist_path/drbill.tar drbill-$today.tar  
mkdir old_dir
mkdir new_dir
