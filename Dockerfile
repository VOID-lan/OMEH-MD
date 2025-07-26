# ⚡ OMEH MD WhatsApp Bot - Powered by Wicked Omeh
# 𝘿𝙤 𝙮𝙤𝙪 𝙠𝙣𝙤𝙬 𝙒𝙞𝙘𝙠𝙚𝙙𝙣𝙚𝙨𝙨? 🜏
# 𝐈’𝐌 𝐇𝐈𝐌.

FROM node:lts

# Install required packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg imagemagick webp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy dependency definitions
COPY package*.json ./

# Install app dependencies
RUN npm install && npm cache clean --force

# Copy all source code
COPY . .

# Expose app port
EXPOSE 3000

# Set environment variable
ENV NODE_ENV=production

# Start the bot
CMD ["npm", "run", "start"]
