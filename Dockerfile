## https://github.com/bhannigan/baseimage/Dockerfile

## set base image
#

  FROM debian
  
## install packages
#

  ARG DEBIAN_FRONTEND=noninteractive

  RUN apt-get update               \
   && apt-get upgrade -y           \
   && apt-get install -y --no-install-recommends ca-certificates wget git \
   && apt-get clean                \
   && rm -rf /var/lib/apt/lists/*


##

  RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
  #\
  # && echo "Port 5022" >> /etc/ssh/sshd_config

## add a user account

  RUN useradd --shell /bin/bash --home-dir /home/user --no-create-home --password password user
