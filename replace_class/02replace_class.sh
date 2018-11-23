#!/bin/sh 
#替换jar包内class文件
read -p "please input enviroment :" env
read -p "please input class_name :" class_name
#class替换功能实现
replace_class(){
where_class=`find . -name "$class_name.class"`
#echo ${where_class%/*}
cd ${where_class%/*};rm "$class_name.class";cp /app/aideploy/xuming/"$class_name.class" .;
#cd $unzip_dir;jar -cvf crm.jar .;
#cd $dist_path;rm crm.jar;cp $unzip_dir/crm.jar .;
cd $1;jar -cf crm.jar .;
echo "zip successful"
cd $2;rm crm.jar;cp $unzip_dir/crm.jar .;
}
unzip_dir='/app/aideploy/xuming/rep_dir'
#解压并替换crm.jar
if [ $env = 'qa' ]
then
   echo "qa"
   dist_path="/app/aideploy/deploy_cscrm/dist"
   cd $unzip_dir;jar -xf ../../deploy_cscrm/dist/crm.jar;echo "unzip successful!"
   replace_class $unzip_dir $dist_path
elif [ $env = 'pub' ]
then
   echo "pub"
   dist_path="/app/aideploy/deploy_fb/dist"
   cd $unzip_dir;jar -xf ../../deploy_fb/dist/crm.jar;echo "unzip successful!"
   replace_class $unzip_dir $dist_path
elif [ $env = 'prod' ]
then 
   echo "prod"
   dist_path="/app/aideploy/deploy_crm_prod/dist"
   cd $unzip_dir;jar -xf ../../deploy_crm_prod/dist/crm.jar;echo "unzip successful!"
   replace_class $unzip_dir $dist_path
else 
   echo "input wrong env!"
   exit 1
fi
