FROM node:19.1-slim

EXPOSE 8001
EXPOSE 8002

RUN npm install -g anyproxy

CMD anyproxy --intercept --ws-intercept
