#!/bin/bash

wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

yum update -y

yum install -y java-21-amazon-corretto

yum install -y jenkins

systemctl start jenkins

systemctl enable jenkins

cd /opt

wget https://dlcdn.apache.org/maven/maven-3/3.9.16/binaries/apache-maven-3.9.16-bin.tar.gz
tar -xzvf apache-maven-3.9.16-bin.tar.gz
mv apache-maven-3.9.16 maven39
