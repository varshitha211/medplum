FROM node:22

WORKDIR /app
COPY . .

RUN npm install --legacy-peer-deps
RUN npm install -g turbo rimraf
RUN npx turbo run build --filter=@medplum/server

# DEBUG
RUN ls -R /app
CMD ["sh","-c","echo MEDPLUM_CONFIG=$MEDPLUM_CONFIG && echo DATABASE_URL=$DATABASE_URL && node packages/server/dist/index.js"]