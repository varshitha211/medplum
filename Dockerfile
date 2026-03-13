FROM node:22

WORKDIR /app
COPY . .

RUN npm install --legacy-peer-deps
RUN npm install -g turbo rimraf
RUN npx turbo run build --filter=@medplum/server

EXPOSE 3000

CMD ["node","--require","./packages/server/dist/otel/instrumentation.js","packages/server/dist/index.js","--config","/app/medplum.config.json"]