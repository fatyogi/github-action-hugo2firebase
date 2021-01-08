FROM pulimento/alpine-hugo-firebase

# Download and install latest hugo
ENV HUGO_VERSION latest
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb && rm /tmp/hugo.deb

# Things to do!
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
