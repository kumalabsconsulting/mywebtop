FROM lscr.io/linuxserver/webtop:ubuntu-mate

LABEL maintainer="Jeremie CUADRADO"

# Ma touche personnel....
ARG SWITCHER_VERSION="0.7.2"
ARG SWITCHER_OS=linux
USER root

RUN  apt update \
  && apt upgrade -y \
  && apt-get install wget gpg -y \
  && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg \
  && install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg \
  && sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' \
  && rm -f packages.microsoft.gpg \
  && apt install apt-transport-https -y \
  && apt update \
  && apt install code -y

RUN echo "------------------------------------------------------ switcher" \
  && curl -L -o /usr/local/bin/switcher https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switcher_${SWITCHER_OS}_amd64 \
  && chmod +x /usr/local/bin/switcher \
  && curl -L -o  /usr/local/bin/switch.sh https://github.com/danielfoehrKn/kubeswitch/releases/download/${VERSION}/switch.sh \
  && chmod +x /usr/local/bin/switch.sh
USER abc
RUN echo "source /usr/local/bin/switch.sh" >> ~/.bashrc
# Install codeserver extensions 
RUN echo "------------------------------------------------------ common extensions" \
    && code --install-extension  mhutchie.git-graph \
    && code --install-extension  redhat.vscode-yaml \
    && code --install-extension  mechatroner.rainbow-csv \
    && code --install-extension  formulahendry.auto-close-tag \
    && code --install-extension  formulahendry.auto-rename-tag \
    && code --install-extension  anteprimorac.html-end-tag-labels \
    && code --install-extension  abusaidm.html-snippets \
    && code --install-extension  sndst00m.vscode-native-svg-preview \
    && code --install-extension  pranaygp.vscode-css-peek \
    && code --install-extension  anseki.vscode-color \
    && echo "------------------------------------------------------ themes" \
    && code --install-extension  armandphilippot.coldark \
    && code --install-extension  RobbOwen.synthwave-vscode \
    && code --install-extension  nadim-vscode.infinity-dark-theme \
    && code --install-extension  emroussel.atomize-atom-one-dark-theme \
    && code --install-extension  teabyii.ayu \
    && code --install-extension  wesbos.theme-cobalt2 \
    && code --install-extension  github.github-vscode-theme \
    && code --install-extension  armandphilippot.coldark \
    && code --install-extension  radiolevity.search-lights \
    && code --install-extension  vladeeg.vscode-theme-vlight \
    && code --install-extension  akamud.vscode-theme-onelight \
    && code --install-extension  akamud.vscode-theme-onedark \
    && code --install-extension  rubjo.ultimate-dark-neo \
    && code --install-extension  sainnhe.edge \
    && code --install-extension  circleci.circleci \
    && code --install-extension  lakshitsomani.best-themes-redefined \
    && code --install-extension  usernamehw.prism \
    && code --install-extension  ms-azuretools.vscode-docker \
    && echo "------------------------------------------------------ icons" \
    && code --install-extension  emroussel.atom-icons \
    && code --install-extension  laurenttreguier.vscode-simple-icons 


# ports and volumes
EXPOSE 3000
VOLUME /config
