FROM node:21-alpine AS base
RUN apk add --no-cache libc6-compat
RUN apk update

WORKDIR /app

COPY . .

FROM base as installer
WORKDIR /app

COPY package*.json ./
COPY vite.config.ts ./
COPY tsconfig.json tsconfig.json

WORKDIR /app

RUN npm install

RUN npm run build

FROM devforth/spa-to-http:latest as runner
WORKDIR /app

ARG PORT

ENV PORT $PORT

ENV NODE_ENV production


COPY --from=installer /app/dist .
