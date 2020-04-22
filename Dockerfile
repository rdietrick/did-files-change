FROM alpine/git

LABEL "repository"="https://github.com/rdietrick/did-files-change"
LABEL "homepage"="https://github.com/rdietrick/did-files-change"

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
