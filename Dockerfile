# Use Node.js LTS
FROM node:20-alpine

# Install build dependencies
RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    gcc \
    sqlite-dev \
    python3-dev \
    git

# Set working directory
WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy all necessary files
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY patches ./patches
COPY packages ./packages
COPY scripts ./scripts
COPY tsconfig*.json ./
COPY turbo.json ./
COPY .npmrc ./
COPY vitest.workspace.ts ./

# Install dependencies
RUN pnpm install

# Build the application
RUN pnpm build

# Expose the port (adjust if needed)
EXPOSE 5678

# Start the application
CMD ["pnpm", "start"] 