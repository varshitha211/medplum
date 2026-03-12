FROM node:20

WORKDIR /app

COPY . .

RUN npm install --legacy-peer-deps
RUN npm install ws
RUN npm run build

EXPOSE 3000

CMD ["node","--require","ws","packages/server/dist/index.js"]