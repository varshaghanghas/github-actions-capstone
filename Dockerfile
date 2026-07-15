# --- Build Phase ---
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci

# --- Production Runtime Phase ---
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY --from=builder /app/node_modules ./node_modules
COPY src/ ./src/

EXPOSE 3000
CMD ["npm", "start"]
