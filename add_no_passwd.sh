#!/bin/bash
file_name=$1
[ -z $file_name ]&&file_name="machine.txt"
line_num=$(cat $file_name|wc -l)
i=1
while [ $i -le $line_num ]
do
line=$(sed -n "$i"p $file_name)
IP=`echo "$line" | awk '{print $1}'`
USER=`echo "$line" | awk '{print $2}'`
PASSWD=`echo "$line" | awk '{print $3}'`
#./sshpass -p $PASSWD ssh $IP -o StrictHostKeyChecking=no "sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config"
#./sshpass -p $PASSWD ssh -t $IP "service sshd restart"
./sshpass -p $PASSWD ssh root@$IP -o StrictHostKeyChecking=no "uname -a" 
./sshpass -p $PASSWD ssh-copy-id  -i /root/.ssh/id_rsa.pub root@$IP 
#echo "$i:$IP"
[ -z $IP ]&&echo "param ip not exists"&&exit -1
i=$(($i+1))
done 
