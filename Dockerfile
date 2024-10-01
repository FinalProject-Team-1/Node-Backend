FROM node:20-alpine

# 권한
RUN mkdir -p /usr/src/app && chown -R node:node /usr/src/app
WORKDIR /usr/src/app

# 사용자 전환
USER root

# 저장소 설정
ARG REGISTRY_NPM_URL
RUN npm set registry $REGISTRY_NPM_URL

# 패키지 설치
COPY --chown=node:node package*.json ./
RUN npm install --production

# 코드
COPY --chown=node:node . .

# pm2 설치
RUN npm install -g pm2

# 사용자 전환
USER node

EXPOSE 8000
CMD ["pm2-runtime", "start", "server-backend.js"]
