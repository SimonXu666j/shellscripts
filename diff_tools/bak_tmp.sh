#!/bin/sh
today=`date '+%Y%m%d'`
#echo $today
#�����ϸ��汾��������,�����������Ƚϵ���ʱĿ¼
dist_path="/app/ocnosql/webapp/deploy_drquery";
mv $dist_path/drbill.tar drbill-$today.tar  
mkdir old_dir
mkdir new_dir
