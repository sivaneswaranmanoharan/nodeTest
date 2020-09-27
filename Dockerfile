
FROM node:latest

# create and set app directory
RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/

# install app dependencies
# this is done before the following COPY command to take advantage of layer caching
RUN pwd
COPY package.json .
RUN pwd && ls -ltr 
RUN npm install

# copy app source to destination container
COPY . .
RUN pwd && ls -ltr

# expose container port
EXPOSE 3000

CMD npm start
