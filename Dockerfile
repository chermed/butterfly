<<<<<<< HEAD
FROM ubuntu:14.04.4
=======
FROM ubuntu:16.04
>>>>>>> upstream/master

RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    build-essential \
    libffi-dev \
    libssl-dev \
    python-dev \
    python-setuptools \
<<<<<<< HEAD
=======
    ca-certificates \
 && easy_install pip \
 && pip install --upgrade setuptools \
>>>>>>> upstream/master
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

WORKDIR /opt
ADD . /opt/app
WORKDIR /opt/app

RUN python setup.py build \
 && python setup.py install

ADD docker/run.sh /opt/run.sh

EXPOSE 57575

CMD ["butterfly.server.py", "--unsecure", "--host=0.0.0.0"]
ENTRYPOINT ["docker/run.sh"]
