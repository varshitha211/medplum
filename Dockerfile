FROM node:22

WORKDIR /app

COPY . .

RUN npm install --legacy-peer-deps
RUN npm run build

EXPOSE 3000

CMD ["node","--import","./packages/server/dist/otel/instrumentation.js","packages/server/dist/index.js"]