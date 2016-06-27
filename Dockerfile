# Creates distributed hadoop 2.7.1
#
# docker build -t billy7074396/bimsj-hadoop2.7.1-base .

# Pull base image.
FROM ubuntu:14.04
MAINTAINER bimsj

ENV DEBIAN_FRONTEND noninteractive

# install
RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common 
RUN apt-get install ssh -y

# set SSH
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -P ""
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

# install openjdk8
RUN add-apt-repository ppa:openjdk-r/ppa -y && \
    apt-get update -y && \
    apt-get install openjdk-8-jdk -y
	
# Add Hadoop2.7.1
ADD hadoop-2.7.1 /opt/hadoop-2.7.1
# set java
RUN ln -s /usr/lib/jvm/java-8-openjdk-amd64/ /opt/java-8-openjdk

# environment configuration
RUN echo 'export PATH=$PATH:/opt/hadoop-2.7.1/bin/'>>  /etc/profile
RUN echo 'HADOOP_PREFIX=/opt/hadoop-2.7.1'>>  /etc/profile
RUN echo 'HOSTNAME=`/bin/hostname 2>/dev/null`'>>  /etc/profile

# Set HDFS
RUN mkdir /hadoop
RUN mkdir /hadoop/hdfs
RUN mkdir /hadoop/hdfs/dfs
RUN mkdir /hadoop/hdfs/tmp
RUN mkdir /hadoop/hdfs/dfs/name
RUN mkdir /hadoop/hdfs/dfs/data

#docker run -it billy7074396/bimsj-hadoop2.7.1-base bash
