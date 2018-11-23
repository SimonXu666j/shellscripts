#!/bin/sh
read -p "please input enviroment :" env
dist_qa_path='/app/aideploy/deploy_cscrm/dist'
dist_pub_path='/app/aideploy/deploy_fb/dist'
dist_prod_path='/app/aideploy/deploy_crm_prod/dist'
cd /app/aideploy/xuming/rep_dir;rm -rf *;
clean_tmp(){ 
   cd $1
   rm -rf *_ear
}
if [ $env = 'qa' ]
then
   dist_path=$dist_qa_path
   clean_tmp $dist_path
   echo "clean successful!"
elif [ $env = 'pub' ]
then
   clean_tmp $dist_path
   echo "clean successful!" 
elif [ $env = 'prod']
then
   clean_tmp $dist_path
   echo "clean successful!"
else:
   echo "input wrong!"
fi
