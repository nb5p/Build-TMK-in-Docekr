#!/bin/sh

git clone --depth=1 --branch=master https://github.com/tmk/tmk_keyboard.git && \
    cd tmk_keyboard && \
    git submodule init && \
    git submodule update && \
    cd ${TMK_PLATFORM}/${TMK_PROJECT} && \
    make -f Makefile.${TMK_VARIANT}

mv /tmk_keyboard/${TMK_PLATFORM}/${TMK_PROJECT}/*.hex /output