#!/bin/sh
#创建临时目录并解压缩
read -p "please input enviroment :" env
dist_qa_path='/app/aideploy/deploy_cscrm/dist'
dist_pub_path='/app/aideploy/deploy_fb/dist'
dist_prod_path='/app/aideploy/deploy_crm_prod/dist'
mktmp_zip(){
   #cd $dist_path
   cd $1
   cp crm.jar crm_bak.jar
   for i in 0 1 2 3 4
   do
      tmp="$i"_ear
      mkdir $tmp;
      cd $tmp;jar -xf $1/crm_app_$i.ear;
      cd ../;mv crm_app_$i.ear crm_app_bak_$i.ear
   done
}
if [ $env = 'qa' ]
then
   dist_path=$dist_qa_path
   mktmp_zip $dist_path
   echo "qa successful!"
elif [ $env = 'pub' ]
then
   mktmp_zip $dist_path
   echo "pub successful!" 
elif [ $env = 'prod']
then
   mktmp_zip $dist_path
   echo "prod successful!"
else:
   echo "input wrong!"
fi
