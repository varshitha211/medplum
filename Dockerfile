# Medplum production Dockerfile

# This Dockerfile depends on files created by scripts/build-docker-server.sh:
#  1. `medplum-server-metadata.tar.gz` - contains package.json and package-lock.json files
#  2. `medplum-server-runtime.tar.gz` - contains the compiled JavaScript files and other runtime assets

# The archive files are decompressed and extracted into the specified destinations.
# We do this to preserve the folder structure in a single layer.
# See: https://docs.docker.com/reference/dockerfile/#adding-local-tar-archives

# Uses Docker "Hardened Images":
# https://hub.docker.com/hardened-images/catalog/dhi/node/guides
# It does not include any development dependencies.

# Builds multiarch docker images
# https://docs.docker.com/build/building/multi-platform/
# https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/

# Supported architectures:
# linux/amd64, linux/arm64
# https://github.com/docker-library/official-images#architectures-other-than-amd64

# Stage 1: Build the application and install production dependencies
FROM node:20

WORKDIR /app

COPY . .

RUN npm install --legacy-peer-deps

# Build all workspaces (core, definitions, server, etc.)
RUN npm run build

EXPOSE 8103

CMD ["npm", "run", "start", "--workspace=@medplum/server"]
