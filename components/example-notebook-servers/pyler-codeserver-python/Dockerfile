FROM asia-northeast3-docker.pkg.dev/pyler-mlops/pyler-kubeflow-notebooks/codeserver-python:v1.2.1

USER root

# CHANGE APT SOURCE TO KAKAO SERVER
RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list \
    && apt-get update

# GIVE SUDO PERMISSION TO JOVYAN
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    apt-utils \
    && usermod -aG sudo ${NB_USER} \
    && echo ${NB_USER}:${NB_USER} | chpasswd \
    && echo "${NB_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# INSTALL GCLOUD CLI
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] \
    http://packages.cloud.google.com/apt cloud-sdk main" \
    | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
    && apt-get update -y && apt-get install google-cloud-cli -y

# INSTALL ZSH
RUN apt-get update \
    && apt-get install -y zsh \
    && chsh -s `which zsh` \
    && curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

RUN git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

COPY zshrc.zsh-template ${HOME}/.zshrc
RUN conda init zsh

# s6 - copy scripts
COPY --chown=jovyan:users s6/ /etc

# s6 - 01-copy-tmp-home
USER root
RUN mkdir -p /tmp_home \
    && cp -r ${HOME} /tmp_home \
    && chown -R ${NB_USER}:users /tmp_home
USER ${NB_UID}

ENV SHELL /bin/zsh
SHELL [ "/bin/zsh", "-c"]

USER jovyan
