FROM node:17-slim
WORKDIR /usr/app

# Install dependencies and TypeScript compiler
COPY package.json package-lock.json ./
RUN npm install
RUN npm install -g typescript

COPY . .
RUN npm run build

# Run the web service on container startup.
CMD ["node", "dist/server.js"]
