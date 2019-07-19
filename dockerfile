FROM debian:jessie

LABEL maintainer="kento2github@gmail.com"


RUN echo ">>> apt-get install other modules"  && \
  apt-get update -y  &&  apt-get install --fix-missing      && \
  DEBIAN_FRONTEND=noninteractive         \
  apt-get install -y                     \
  python python-yaml sudo            \
  curl gcc python-pip python-dev libffi-dev libssl-dev  && \
  apt-get install -y sshpass openssh-client  && \
  apt-get -y --purge remove python-cffi

RUN echo ">>> pip install other modules"   && \
  pip install --upgrade setuptools         && \
  pip install --upgrade pycrypto           && \
  pip install --upgrade cffi pywinrm       && \
  echo ">>> Fix strange bug under Jessie: cannot import name IncompleteRead"  && \
  easy_install -U pip    && \
  pip install ansible

RUN echo ">>> Removing unused APT resources..."    && \
  apt-get -f -y --auto-remove remove \
  gcc python-pip python-dev libffi-dev libssl-dev  && \
  apt-get clean                                    && \
  rm -rf /var/lib/apt/lists/*  /tmp/*

RUN echo ">>> Adding hosts for convenience..."     && \
  mkdir -p /etc/ansible                            && \
  echo 'localhost' > /etc/ansible/hosts

CMD ["ansible-playbook", "--version"]
