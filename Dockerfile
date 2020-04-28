FROM ubuntu:latest
MAINTAINER Henk Freimuth <henk.freimuth@gmail.com>

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update -q \
      && apt-get install -qy --no-install-recommends \
      && apt-get install -qy nano apt-utils wget build-essential libfontconfig1 ghostscript poppler-utils python3-pip gsfonts fontconfig git rsync tex-common texinfo equivs perl-tk perl-doc \
      && fc-cache -f \
      && pip3 install pygments \
      && pip3 install anybadge \
      && rm -rf /var/lib/apt/lists/*

# Install TexLive with scheme-basic
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
    mkdir /install-tl-unx; \
    tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1; \
    echo "selected_scheme scheme-full" >> /install-tl-unx/texlive.profile; \
    echo "tlpdbopt_create_formats 1" >> /install-tl-unx/texlive.profile; \
    echo "tlpdbopt_install_docfiles 0" >> /install-tl-unx/texlive.profile; \
    echo "tlpdbopt_install_srcfiles 0" >> /install-tl-unx/texlive.profile; \
    /install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile; \
    rm install-tl-unx.tar.gz;

ENV PATH="/usr/local/texlive/2020/bin/x86_64-linux:${PATH}"

# pandoc setup
ENV PANDOC_DL https://github.com/jgm/pandoc/releases/download/2.9.2.1/pandoc-2.9.2.1-linux-amd64.tar.gz
ENV PANDOC_FILENAME pandoc.tar.gz
ENV PANDOC_DEST /usr/local/
ENV PATH $PATH:$PANDOC_DEST/bin
RUN wget $PANDOC_DL -O /tmp/$PANDOC_FILENAME; \
    tar xvzf /tmp/$PANDOC_FILENAME --strip-components 1 -C $PANDOC_DEST;

ENTRYPOINT bash

