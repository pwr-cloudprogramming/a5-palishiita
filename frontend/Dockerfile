FROM node:18-alpine
WORKDIR /app
COPY /src/package.json package.json
RUN npm install
COPY /src .
# RUN npm run build
EXPOSE 5173
CMD [ "npm", "run", "dev", "--", "--host", "0.0.0.0"]