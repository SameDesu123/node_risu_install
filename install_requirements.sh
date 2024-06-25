#!/bin/bash

# Termux 기본 작업
termux-setup-storage # 저장공간 권한 허용
pkg update # termux 기본 패키지 확인

# Termux 패키지 설치
pkg install -y \
  build-essential x11-repo xorgproto golang libvips \
  python git nodejs-lts install binutils

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
