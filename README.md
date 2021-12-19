<!--
SPDX-FileCopyrightText: 2021 moderncv maintainers <github.com/moderncv>

SPDX-License-Identifier: CC0-1.0
-->

# debian-texlive-docker [![Publish Docker images](https://github.com/moderncv/debian-texlive-docker/actions/workflows/publish-docker-image.yml/badge.svg)](https://github.com/moderncv/debian-texlive-docker/actions/workflows/publish-docker-image.yml) [![REUSE status](https://api.reuse.software/badge/github.com/moderncv/moderncv)](https://api.reuse.software/info/github.com/moderncv/moderncv)

This repository contains a `Dockerfile` to build a debian-based Docker image with TeXLive installed. It uses Debian Testing with the `texlive-full` package.

The image is published to GitHub Packages [gchr.io](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry).

To pull the image:

```sh
docker pull ghcr.io/moderncv/debian-texlive-docker:main
```

To use the image in a GitHub action (example):

```yml
name: Build PDF

on:
  push:
    branches:
      - main
  pull_request:
  registry_package:

jobs:
  build-pdf:
    name: Build PDF
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/moderncv/debian-texlive-docker:main

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Build PDF
        run: latexmk ./main.tex

      - name: Upload PDF
        uses: actions/upload-artifact@v2
        with:
          name: main.pdf
          path: ./main.pdf

      - name: Upload log
        if: ${{ always() }}
        uses: actions/upload-artifact@v2
        with:
          name: main.log
          path: ./main.log
```
