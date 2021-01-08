FROM pulimento/alpine-hugo-firebase
MAINTAINER Olaf Andersen <fatyogi@gmail.com>

ENV HUGO_VERSION 0.80.0
ENV HUGO_EXTENDED_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit

# Upgrade hugo
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_EXTENDED_BINARY}.tar.gz /tmp/hugo.tar.gz
RUN rm -fR /usr/local/hugo && mkdir -p /usr/local/hugo \
	&& tar xzf /tmp/hugo.tar.gz -C /usr/local/hugo/ \
	&& rm /tmp/hugo.tar.gz
	
# Things to do!
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
