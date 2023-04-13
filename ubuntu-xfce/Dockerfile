FROM lscr.io/linuxserver/webtop:ubuntu-xfce AS stage

COPY packages.sh vscode.sh /tmp/
RUN \
  chmod 777 /tmp/packages.sh /tmp/vscode.sh && \
  /tmp/packages.sh
RUN /tmp/vscode.sh


