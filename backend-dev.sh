#!/bin/sh

# since webupd8 repo is broken: download manually and run this script
FILE="jdk-7u51-linux-x64.tar.gz"
JDK="jdk1.7.0_51"

tar zxvf /vagrant/$FILE

sudo mkdir -p /usr/local/java
sudo mv $JDK /usr/local/java

JAVA_HOME="/usr/local/java/$JDK"

sudo cat << EOF > /etc/profile.d/java.sh
JAVA_HOME=$JAVA_HOME
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME
export PATH
EOF

# update alternatives
sudo update-alternatives --install "/usr/bin/java" "java" "$JAVA_HOME/bin/java" 1
sudo update-alternatives --set java $JAVA_HOME/bin/java
sudo update-alternatives --install "/usr/bin/javac" "javac" "$JAVA_HOME/bin/javac" 1
sudo update-alternatives --set javac $JAVA_HOME/bin/javac

# ubuntu 13.10 has serious problems installing maven 3
# install also maven from source
wget http://apache.mirrors.timporter.net/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz
tar -xzvf apache-maven-3.1.1-bin.tar.gz
sudo mkdir -p /usr/local/apache-maven
sudo mv apache-maven-3.1.1 /usr/local/apache-maven/

sudo tee /etc/profile.d/maven.sh << 'EOF'
export M2_HOME=/usr/local/apache-maven/apache-maven-3.1.1
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=$M2:$PATH
EOF

