#!/bin/bash
sudo yum install -y
sudo yum install -y java-17-amazon-corretto
wget -O /opt/apache-tomcat-10.1.55-windows-x64.zip
https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.55/bin/apache-tomcat-10.1.55-windows-x64.zip
cd /opt
unzip apache-tomcat-10.1.55-windows-x64.zip
mv apache-tomcat-10.1.55 tomcat10
rm -f apache-tomcat-10.1.55-windows-x64.zip
