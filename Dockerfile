FROM node:22

WORKDIR /app
COPY . .

RUN npm install --legacy-peer-deps
RUN npm install -g turbo rimraf
RUN npx turbo run build --filter=@medplum/server

# Debug
RUN ls -R /app

CMD ["sh","-c","echo MEDPLUM_CONFIG=$MEDPLUM_CONFIG && echo DATABASE_URL=$DATABASE_URL && node --require ./packages/server/dist/otel/instrumentation.js packages/server/dist/index.js"]