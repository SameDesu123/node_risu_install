#!/bin/bash

# Termux 기본 작업
termux-setup-storage # 저장공간 권한 허용
pkg update # termux 기본 패키지 확인

# Termux 패키지 설치
pkg install -y \
  apt autoconf automake bash bc binutils-bin binutils-libs binutils \
  bison brotli build-essential bzip2 c-ares ca-certificates-java \
  ca-certificates cgif clang cmake command-not-found coreutils curl \
  dash debianutils dialog diffutils dos2unix dpkg ed fftw findutils \
  flex fontconfig freetype fribidi gawk gdbm gdk-pixbuf giflib git \
  glib gnupg golang gperf gpgme gpgmepp gpgv grep gzip harfbuzz \
  imagemagick imath inetutils jq jsoncpp krb5 ldns less \
  libandroid-execinfo libandroid-glob libandroid-posix-semaphore \
  libandroid-shmem libandroid-spawn libandroid-support \
  libandroid-utimes libaom libarchive libassuan libbz2 libc++ \
  libcairo libcap-ng libcompiler-rt libcrypt libcurl libdav1d libdb \
  libde265 libedit libevent libexif libexpat libffi libgcrypt libgmp \
  libgnutls libgpg-error libgraphite libheif libiconv libicu libidn2 \
  libimagequant libjpeg-turbo libjxl libksba libllvm libltdl liblz4 \
  liblzma liblzo libmd libmpfr libnettle libnghttp2 libnghttp3 libnpth \
  libnspr libnss libpixman libpng librav1e libresolv-wrapper librsvg \
  libsmartcols libsqlite libssh2 libtiff libtirpc libtool libunbound \
  libunistring libuuid libuv libvips libwebp libx11 libx265 libxau \
  libxcb libxdmcp libxext libxft libxi libxml2 libxrender libxtst \
  littlecms lld llvm lsof m4 make nano ncurses-ui-libs ncurses-utils \
  ncurses ndk-sysroot net-tools nodejs-lts oniguruma openexr \
  openjdk-17-x openjdk-17 openjpeg openssh-sftp-server openssh \
  openssl pango patch pcre2 perl pinentry pkg-config poppler procps \
  psmisc pup python-ensurepip-wheels python-pip python readline \
  resolv-conf rhash sed tar termux-am-socket termux-am termux-auth \
  termux-exec termux-keyring termux-licenses termux-tools ttf-dejavu \
  unzip util-linux wget x11-repo xorg-util-macros xorgproto xxhash \
  xz-utils zlib zstd


## https://github.com/Automattic/node-canvas/issues/1447#issuecomment-506507145

# 프로젝트 디렉토리로 이동
git clone https://github.com/kwaroran/RisuAI # RisuAI 소스코드 다운로드
cd # 만일을 대비해서 최상위 디렉토리로 이동
cd RisuAI # 다운로드 받은 RisuAI 폴더로 이동

# npm 초기화 및 설치
npm init -y

# dependencies 설치
npm install -g pnpm
pnpm install

# 스크립트 완료 메시지
echo "npm 패키지 설치가 완료되었습니다."

# risuai 설치
pnpm run build
npm i @swc/core-android-arm64 && pnpm run runserver
