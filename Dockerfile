FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
COPY requirements.txt ./

RUN npm install --legacy-peer-deps && \
    npm install cors --legacy-peer-deps && \
    pip3 install --no-cache-dir -r requirements.txt

COPY . .

RUN echo '#!/bin/bash\n\
# Start Node.js application in the background\n\
npm start &\n\
NODE_PID=$!\n\
\n\
# Start Python application in the foreground\n\
python3 -m uvicorn main:app --host 0.0.0.0 --port 8000 &\n\
PYTHON_PID=$!\n\
\n\
# Handle termination signals\n\
trap "kill $NODE_PID $PYTHON_PID; exit" SIGINT SIGTERM\n\
\n\
# Wait for any process to exit\n\
wait -n\n\
\n\
# Exit with status of process that exited first\n\
exit $?' > /app/start.sh && \
    chmod +x /app/start.sh

EXPOSE 8000 3000

CMD ["/app/start.sh"]
