FROM node:22-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y openssl

COPY package*.json ./
RUN yarn install

COPY . .

RUN npx prisma generate

RUN yarn build

FROM node:22-slim

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.env .env

EXPOSE 3000

CMD ["sh", "-c", "yarn start:prod"]
