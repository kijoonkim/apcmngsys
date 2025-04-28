---
title: "Frontend Build Guide"
description: "APCSS 프로젝트 프론트엔드 빌드 및 모듈 추가 가이드"
author: "손민성"
date: 2025-04-28
tags: ["node.js", "npm", "webpack", "frontend"]
---

# 🛠️ Frontend 빌드 가이드

---

# 1. Node.js 설치

## [Mac 사용자]

- https://nodejs.org/ko/ 에서 LTS 버전 다운로드 및 설치
- 또는 Homebrew 사용

brew install node

설치 완료 후:

node -v  
npm -v

✅ 버전이 정상 출력되면 완료.

---

## [Windows 사용자]

- https://nodejs.org/ko/ 에서 LTS 버전 다운로드 및 설치
- 설치 중 옵션 변경 없이 기본값으로 진행
- 설치 완료 후:

node -v  
npm -v

✅ 버전이 정상 출력되면 완료.

---

# 2. 프로젝트 초기 세팅

git clone <레포지토리 URL>  
cd <프로젝트 폴더>  
npm install

- package.json 기반으로 의존성 자동 설치
- node_modules 폴더 생성

---

# 3. 빌드 생성

npm run build

- Webpack을 통해 bundle.js 생성
- 생성된 파일 위치: src/main/resources/static/js/out/bundle.js
- JSP 파일에서 다음과 같이 사용:

<script src="${pageContext.request.contextPath}/js/out/bundle.js"></script>

---

# 4. 모듈 추가 방법

1. npm install로 추가

npm install <패키지명> --save

2. src/index.js 파일에 import 추가

import _ from 'lodash';

3. 다시 빌드 실행

npm run build

✅ 이렇게 해야 bundle.js에 새로운 모듈이 포함됩니다.

---

# ✅ 전체 요약

- Node.js 설치
- npm install
- index.js 수정 후 항상 npm run build
- JSP에서는 bundle.js 사용

---
