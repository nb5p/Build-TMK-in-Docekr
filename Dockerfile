FROM alpine:3.9

ENV ALPINE_VERSION=3.9 DFU_VERSION=0.7.2 TMK_PLATFORM=converter TMK_PROJECT=usb_usb TMK_VARIANT=unimap

RUN sed -i 's/http:\/\/dl-cdn.alpinelinux.org/https:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk add git make gcc gcc-avr avr-libc libc-dev libusb-compat-dev && \
    ln -s libusb-1.0.so /usr/lib/libusb.so -f && \
    rm -vrf /var/cache/apk/* && \
    rm -vrf /var/lib/apk/* && \
    rm -vrf /etc/apk/cache/*

RUN wget -O dfu-programmer.tar.gz https://sourceforge.net/projects/dfu-programmer/files/dfu-programmer/${DFU_VERSION}/dfu-programmer-${DFU_VERSION}.tar.gz/download && \
    tar -zxvf dfu-programmer.tar.gz

RUN cd dfu-programmer-* && \
    ./configure --prefix=/opt/dfu-programmer && \
    make && make install && \
    rm -rf /dfu-programmer*

ENV PATH="/opt/dfu-programmer/bin:$PATH"
COPY build.sh /build.sh
VOLUME ["/output"]

CMD ["/bin/sh", "/build.sh"]
