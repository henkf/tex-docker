# Comprehensive TeX Docker with recommended tools [![Docker hub](https://img.shields.io/docker/pulls/hnkf/docker-tex.svg)](https://hub.docker.com/r/hnkf/docker-tex/)

## Features

* based on [ubuntu:latest](https://hub.docker.com/_/ubuntu)
* [texlive](https://www.tug.org/texlive/)-full (2020)
* [minted](https://github.com/gpoore/minted) w/ required [pygments](https://pygments.org)
* [anybadge](https://pypi.org/project/anybadge/)
* [Pandoc](https://pandoc.org)
* Ghostscript and Poppler-utils for additional PDF processing (e.g. automatically creating grayscale renderings for printing)

## Building

`docker build -t iib_tex .`

