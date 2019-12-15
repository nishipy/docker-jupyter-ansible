FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
        vim screen \
        wget curl git \
        make build-essential python-dev \
        python3-pip libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev \
        language-pack-ja-base language-pack-ja \
        jq glances iotop ibus-mozc \
        libffi-dev && \
    apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# https://blowup-bbs.com/docker-ubuntu-python-jupyter/
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

# install Python
ENV PATH $PATH:/root/.pyenv/bin
RUN pyenv install 3.7.2 && pyenv global 3.7.2

RUN pip3 install --no-cache-dir \
        ipykernel \
        jupyter \
        ansible

RUN mkdir -p /etc/ansible/ && \
    echo 'localhost' > /etc/ansible/hosts

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh