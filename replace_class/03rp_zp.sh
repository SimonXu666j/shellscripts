#!/bin/sh
#Ìæ»»crm.jar²¢Ñ¹Ëõear°ü
read -p "please input enviroment :" env
dist_qa_path=/app/aideploy/deploy_cscrm/dist
dist_pub_path=/app/aideploy/deploy_fb/dist
dist_prod_path=/app/aideploy/deploy_crm_prod/dist
zip_ear(){
   #cd $dist_path
   cd $1
   for i in 0 1 2 3 4
   do
       tmp="$i"_ear
       cd $tmp;rm crm.jar;cp ../crm.jar .; 
       jar -cf crm_app_$i.ear .;
       echo "zip successful!"
       mv crm_app_$i.ear ../;
       cd ../;
   done
}
if [ $env = 'qa' ]
then
   dist_path=$dist_qa_path
   zip_ear $dist_path
elif [ $env = 'pub' ]
then
   dist_path=$dist_pub_path
   zip_ear $dist_path
elif [ $env = 'prod']
then
   dist_path=$dist_prod_path
   zip_ear $dist_path
else:
   echo "input wrong!"
fi
