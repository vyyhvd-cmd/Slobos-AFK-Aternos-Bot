FROM node:18-slim

# Instalacja zależności systemowych, jeśli bot używa zaawansowanych bibliotek
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Kopiowanie plików konfiguracyjnych i instalacja paczek
COPY package*.json ./
RUN npm ci --only=production

# Kopiowanie reszty plików bota
COPY . .

# Uruchomienie bota
CMD ["node", "index.js"]
