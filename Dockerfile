FROM nitrousio/ubuntu:trusty
MAINTAINER Nitrous.IO <hello@nitrous.io>

RUN apt-get install -yy software-properties-common python-software-properties
RUN apt-add-repository -y ppa:fkrull/deadsnakes
RUN apt-get update

# Install all different versions of python
RUN apt-get install -yy \
    python2.5 \
    python2.6 \
    python2.7 \
    python3.2 \
    python3.3 \
    python-dev \
    python2.5-dev \
    python2.6-dev \
    python2.7-dev \
    python3.2-dev \
    python3.3-dev \
    python-setuptools \
    libmysqlclient-dev \
    libpq-dev

RUN apt-get clean

# Install pypy
RUN rm -rf /opt/pypy-1.9 && \
    rm -rf /usr/local/bin/pypy && \
    mkdir /opt/pypy-1.9 && \
    cd /tmp && \
    wget https://bitbucket.org/pypy/pypy/downloads/pypy-1.9-linux64.tar.bz2 && \
    tar -xf pypy-1.9-linux64.tar.bz2 && \
    mv pypy-1.9 /opt/pypy-1.9 && \
    ln -s /opt/pypy-1.9/pypy-1.9/bin/pypy /usr/local/bin/pypy && \
    rm pypy-1.9-linux64.tar.bz2

# Install pip
RUN easy_install pip

# Install virtualenv and other pip packages
RUN pip install \
    virtualenv \
    virtualenvwrapper \
    distribute==0.7.3 \
    Django==1.6.5 \
    Fabric==1.8.3 \
    Flask==0.10.1 \
    jinja2==2.7.2 \
    lxml==3.3.5 \
    markupsafe==0.23 \
    numpy==1.8.1 \
    PyAMF==0.6.1 \
    pycrypto==2.6.1 \
    setuptools==3.6 \
    webapp2==2.5.2 \
    webob==1.4 \
    PyYAML==3.11 \
    mysql-python==1.2.5 \
    psycopg2==2.5.3
