FROM centos:7

WORKDIR /tmp

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    yum install -y wget && \
    wget -O OpenJDK.tar.gz https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u292-b10_openj9-0.26.0/OpenJDK8U-jdk_x64_linux_openj9_8u292b10_openj9-0.26.0.tar.gz && \
    tar xzf /tmp/OpenJDK.tar.gz && \
    mkdir /usr/local/jdk && \
    cp -rf /tmp/jdk8u292-b10/* /usr/local/jdk && \
    rm -f /tmp/OpenJDK.tar.gz
ENV JAVA_HOME=/usr/local/jdk
ENV CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
ENV PATH=$PATH:${JAVA_HOME}/bin

WORKDIR /
