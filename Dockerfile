FROM lambci/lambda:build-nodejs12.x as build
# COPY package-lock.json .
# COPY package.json .
# COPY LICENSE .
# COPY index.js .
COPY . .

RUN npm ci
RUN zip -9yr lambda.zip .

#############################################
FROM scratch
COPY --from=build /var/task/lambda.zip .
