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
npm install \
    @adobe/css-tools@4.3.2 \
    @aws-crypto/sha256-js@^5.2.0 \
    @capacitor/android@^5.6.0 \
    @capacitor/core@^5.6.0 \
    @capacitor/filesystem@^5.2.0 \
    @dqbd/tiktoken@^1.0.7 \
    @huggingface/jinja@^0.2.2 \
    @mlc-ai/web-tokenizers@^0.1.2 \
    @risuai/ccardlib@^0.4.1 \
    @smithy/protocol-http@^3.0.12 \
    @smithy/signature-v4@^2.0.19 \
    @tauri-apps/api@1.5.3 \
    @xenova/transformers@^2.17.1 \
    blueimp-md5@^2.19.0 \
    body-parser@^1.20.2 \
    buffer@^6.0.3 \
    codemirror@^5.65.16 \
    core-js@^3.35.0 \
    cors@^2.8.5 \
    crc@^4.3.2 \
    dompurify@^3.0.8 \
    eventsource-parser@^1.1.2 \
    exifr@^7.1.3 \
    express@^4.18.2 \
    fflate@^0.8.1 \
    gpt-3-encoder@^1.1.4 \
    gpt3-tokenizer@^1.1.5 \
    html-to-image@^1.11.11 \
    isomorphic-dompurify@^1.13.0 \
    jszip@^3.10.1 \
    libsodium-wrappers-sumo@^0.7.13 \
    localforage@^1.10.0 \
    lodash@^4.17.21 \
    lucide-svelte@^0.292.0 \
    marked@^5.1.2 \
    ml-distance@^4.0.1 \
    mobile-drag-drop@3.0.0-rc.0 \
    msgpackr@^1.10.1 \
    node-html-parser@^6.1.12 \
    ollama@^0.5.0 \
    pdfjs-dist@^4.0.379 \
    peerjs@^1.5.2 \
    png-chunk-text@^1.0.0 \
    png-chunks-encode@^1.0.0 \
    png-chunks-extract@^1.0.0 \
    rollup@^3.29.4 \
    showdown@^2.1.0 \
    sortablejs@^1.15.2 \
    streamsaver@^2.0.6 \
    svelte-awesome-color-picker@^3.1.0 \
    three@^0.154.0 \
    tippy.js@^6.3.7 \
    uuid@^9.0.1 \
    wasmoon@^1.16.0 \
    wavefile@^11.0.0 \
    web-streams-polyfill@^3.3.2

# devDependencies 설치
npm install --save-dev \
    @capacitor/assets@^3.0.4 \
    @capacitor/cli@^5.6.0 \
    @sveltejs/vite-plugin-svelte@^3.0.1 \
    @swc/core@1.5.7 \
    @tailwindcss/typography@^0.5.10 \
    @tauri-apps/cli@1.5.11 \
    @tsconfig/svelte@^3.0.0 \
    @types/blueimp-md5@^2.18.2 \
    @types/codemirror@^5.60.15 \
    @types/dompurify@^3.0.5 \
    @types/libsodium-wrappers-sumo@^0.7.8 \
    @types/lodash@^4.14.202 \
    @types/lodash.isequal@^4.5.8 \
    @types/marked@^5.0.2 \
    @types/node@^18.19.7 \
    @types/showdown@^2.0.6 \
    @types/sortablejs@^1.15.7 \
    @types/streamsaver@^2.0.4 \
    @types/three@^0.154.0 \
    @types/uuid@^9.0.7 \
    @types/wicg-file-system-access@^2020.9.8 \
    autoprefixer@^10.4.16 \
    internal-ip@^7.0.0 \
    postcss@^8.4.33 \
    svelte@^4.2.8 \
    svelte-check@^3.6.3 \
    svelte-preprocess@^5.1.3 \
    tailwindcss@^3.4.1 \
    tslib@^2.6.2 \
    typescript@^5.3.3 \
    vite@^5.2.12 \
    vite-plugin-top-level-await@^1.4.1 \
    vite-plugin-wasm@^3.3.0

# 스크립트 완료 메시지
echo "npm 패키지 설치가 완료되었습니다."

# risuai 설치
npm i @swc/core-android-arm64 && export NODE_OPTIONS=--max-old-space-size=6144 && bash server.sh 
