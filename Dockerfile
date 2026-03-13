FROM node:22

WORKDIR /app

# Copy project
COPY . .

# Install ALL dependencies (including dev)
RUN npm install --legacy-peer-deps

# Install turbo globally
RUN npm install -g turbo rimraf

# Build project
RUN npx turbo run build --filter=@medplum/server

# Expose port
EXPOSE 3000

# Start server
CMD ["node","--require","./packages/server/dist/otel/instrumentation.js","packages/server/dist/index.js","--config","/app/medplum/medplum.config.json"]
