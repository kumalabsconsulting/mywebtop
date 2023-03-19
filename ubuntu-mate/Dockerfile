FROM lscr.io/linuxserver/webtop:ubuntu-mate  AS BUILDER

LABEL maintainer="Jeremie CUADRADO"

# Ma touche personnel....
ARG SWITCHER_VERSION="0.7.2"
ARG SWITCHER_OS=linux
ARG DEBIAN_FRONTEND="noninteractive"
USER root:root

COPY code-server-terraform/ /
COPY code-server-ansible/ /
COPY code-server-kubectl/ /

## FROM linuxserver.io
## https://github.com/linuxserver/docker-openvscode-server/blob/main/Dockerfile
ARG OPENVSCODE="/app/openvscode-server/bin/openvscode-server"
RUN \
  echo "**** install runtime dependencies ****" && \
  apt-get update && \
  apt-get install -y \
    git \
    jq \
    libatomic1 \
    nano \
    net-tools \
    netcat \
    sudo && \
  echo "**** install openvscode-server ****" && \
  if [ -z ${CODE_RELEASE+x} ]; then \
    CODE_RELEASE=$(curl -sX GET "https://api.github.com/repos/gitpod-io/openvscode-server/releases/latest" \
      | awk '/tag_name/{print $4;exit}' FS='[""]' \
      | sed 's|^openvscode-server-v||'); \
  fi && \
  mkdir -p /app/openvscode-server && \
  curl -o \
    /tmp/openvscode-server.tar.gz -L \
    "https://github.com/gitpod-io/openvscode-server/releases/download/openvscode-server-v${CODE_RELEASE}/openvscode-server-v${CODE_RELEASE}-linux-x64.tar.gz" && \
  tar xf \
    /tmp/openvscode-server.tar.gz -C \
    /app/openvscode-server/ --strip-components=1 && \
  echo "**** clean up ****" && \
  apt-get clean && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*
  #exts=(\
  #      # From https://open-vsx.org/ registry directly
  #      gitpod.gitpod-theme \
  #      #redhat.ansible \
  #      #redhat.vscode-yaml \
  #      #hashicorp.terraform \
  #      #mhutchie.git-graph \
  #      #redhat.vscode-yaml \
  #      #mechatroner.rainbow-csv \
  #      #formulahendry.auto-close-tag \
  #      #formulahendry.auto-rename-tag \
  #      #anteprimorac.html-end-tag-labels \
  #      #abusaidm.html-snippets \
  #      #sndst00m.vscode-native-svg-preview \
  #      #pranaygp.vscode-css-peek \
  #      #anseki.vscode-color \
  #      #armandphilippot.coldark \
  #      #RobbOwen.synthwave-vscode \
  #      #nadim-vscode.infinity-dark-theme \
  #      #emroussel.atomize-atom-one-dark-theme \
  #      #teabyii.ayu \
  #      #wesbos.theme-cobalt2 \
  #      #github.github-vscode-theme \
  #      #armandphilippot.coldark \
  #      #radiolevity.search-lights \
  #      #vladeeg.vscode-theme-vlight \
  #      #akamud.vscode-theme-onelight \
  #      #akamud.vscode-theme-onedark \
  #      #rubjo.ultimate-dark-neo \
  #      #sainnhe.edge \
  #      #circleci.circleci \
  #      #lakshitsomani.best-themes-redefined \
  #      #usernamehw.prism \
  #      #ms-azuretools.vscode-docker \
  #      #emroussel.atom-icons \
  #      #laurenttreguier.vscode-simple-ico \
  #      # From filesystem, .vsix that we downloaded (using bash wildcard '*')
  #      "${tdir}"/* \
  #)\
  #  # Install the $exts
  #&& for ext in "${exts[@]}"; do /app/openvscode-server/bin/openvscode-server --install-extension "${ext}"; done

COPY code-server-openvscode/ /

#  && echo "------------------------------------------------------ Allow users to install packages with apt" \
#  && echo "# Allow non-admin users to install packages" >> /etc/sudoers \
#  && echo "abc ALL = NOPASSWD : /usr/bin/apt, /usr/bin/apt-get, /usr/bin/aptitude, /usr/bin/add-apt-repository, /usr/local/bin/pip, /usr/local/bin/systemctl, /usr/bin/dpkg, /usr/sbin/dpkg-reconfigure" >> /etc/sudoers \
#  && chown abc /etc/apt/sources.list.d \
#  && chown abc /etc/apt/trusted.gpg.d \
#  && echo "------------------------------------------------------ GIT" \
#  && apt-get install -y git git-flow
#
#
#RUN echo "------------------------------------------------------ switcher" \
#  && curl -L -o /usr/local/bin/switcher https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switcher_${SWITCHER_OS}_amd64 \
#  && chmod +x /usr/local/bin/switcher \
#  && curl -L -o  /usr/local/bin/switch.sh https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switch.sh \
#  && chmod +x /usr/local/bin/switch.sh

##RUN echo "source /usr/local/bin/switch.sh" >> /config/.bashrc

# ports and volumes
EXPOSE 3000
VOLUME /config

