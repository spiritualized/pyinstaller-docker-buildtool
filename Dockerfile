FROM bitnami/minideb:stretch

RUN 		install_packages libmediainfo0v5  binutils git ca-certificates  libglib2.0-0 libsm6 libxrender1 libxext6 libmagic1 curl gcc make xz-utils zlib1g-dev libffi-dev libssl-dev && \
			echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> /etc/bash.bashrc && \
			curl -O https://www.python.org/ftp/python/3.8.5/Python-3.8.5.tar.xz && \
			tar xvf Python-3.8.5.tar.xz && \
			cd Python-3.8.5 && \
			./configure --enable-shared && \
			make -j8 && \
			make install && \
			rm -R /Python-3.8.5 && \
			apt autoremove curl gcc make xz-utils zlib1g-dev libffi-dev libssl-dev -y && \
			LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

RUN			pip3 install --upgrade pip pyinstaller

#ENTRYPOINT ["bash"]
ENTRYPOINT ["/code/build.sh"]