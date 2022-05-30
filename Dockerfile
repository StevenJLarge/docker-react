# Update from medium post: AWS interprest FROM X as Y as two arguments and errors out
# FROM node:16-alpine as builder
FROM node:16-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

# /app/build <-- all the stuff we want in the container
FROM nginx
EXPOSE 80
# COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html
