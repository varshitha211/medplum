FROM node:22

ENV NODE_ENV=production

WORKDIR /app

COPY . .

RUN npm install --legacy-peer-deps
RUN npm run build

EXPOSE 3000

CMD ["node","--require","./packages/server/dist/otel/instrumentation.js","packages/server/dist/index.js"]