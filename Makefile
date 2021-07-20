#############################
#     Ubuntu packages       #
#############################
create_symlinks:
	./create_links.sh

#############################
#     Ubuntu packages       #
#############################
ubuntu: apt_update apt_install_my_favorite

apt_update:
	sudo apt-get update

apt_install_my_favorite:
	sudo apt-get install xclip
	sudo add-apt-repository ppa:jonathonf/vim
	sudo apt-get install vim


#############################
#         Docker            #
#############################
# run docker, after restart test_docker
docker: install_docker postinstall_docker install_docker_compose

install_docker:
	curl -fsSL https://get.docker.com -o get-docker.sh
	sh ./get-docker.sh
	rm ./get-docker.sh

postinstall_docker:
	sudo groupadd docker
	sudo usermod -aG docker $USER
	newgrp docker 

install_docker_compose:
	sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# run this after restart
test_docker:
	docker run hello-world

#############################
#    Python compile         #
#############################

# after installation add python to path:
# PATH=/opt/python/<PYTHON-VERSION>/bin/:$PATH

PYTHON_VERSION=3.9.0
PYTHON_MAJOR=3
py_install_dependencies:
	sudo apt-get update
	sudo apt-get build-dep python3
	sudo apt-get install build-essential gdb lcov libbz2-dev libffi-dev \
	      libgdbm-dev liblzma-dev libncurses5-dev libreadline6-dev \
	      libsqlite3-dev libssl-dev lzma lzma-dev tk-dev uuid-dev zlib1g-dev


py_download:
	curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz
	tar -xvzf Python-${PYTHON_VERSION}.tgz

py_configure:
	cd Python-${PYTHON_VERSION}
	./configure \
	    --prefix=/opt/python/${PYTHON_VERSION} \
	    --enable-shared \
	    --enable-ipv6 \
	    LDFLAGS=-Wl,-rpath=/opt/python/${PYTHON_VERSION}/lib,--disable-new-dtags

py_compile:
	cd Python-${PYTHON_VERSION}
	make -j5

py_install:
	cd Python-${PYTHON_VERSION}
	make install

py_install_pip_and_venv:
	curl -O https://bootstrap.pypa.io/get-pip.py
	sudo /opt/python/${PYTHON_VERSION}/bin/python${PYTHON_MAJOR} get-pip.py
	sudo /opt/python/${PYTHON_VERSION}/bin/pip install virtualenv

py_verify:
	/opt/python/${PYTHON_VERSION}/bin/python${PYTHON_MAJOR} --version


