#!/bin/bash
#This file just add or remove port of firewalld
#first edition 2017-3-20        likilli

echo -e "请输入操作代码."
echo -e "1.添加防火墙端口      2.移除端口     3.列出已打开端口"
read -p "Plsease input: " choice
if [ "$choice" == "1" ]; then
	echo -e "Input "quit"  to terminate loop"
	
	while [ "$port_add" != "quit" ]
	do
		read -p "Please input the Port number you want to add: " port_add
		if [ "$port_add" == "quit" ]; then
			service firewalld restart
			exit 0;
		else
			firewall-cmd --permanent --zone=public --add-port=$port_add/tcp
		fi
    done
	
fi

if [ "$choice" == "2" ]; then
	echo -e "Input "quit" to finish loop too"
	
	while [ "$port_remove" != "quit" ]
	do
		read -p "Please input the Port number you want to remove: " port_remove
		if [ "$port_remove" == "quit" ]; then
			service firewalld restart
			exit 0;
		else
			firewall-cmd --permanent --zone=public --remove-port=$port_remove/tcp
		fi
	done
fi

if [ "$choice" == "3" ]; then
	firewall-cmd --list-ports
	exit 0
fi
