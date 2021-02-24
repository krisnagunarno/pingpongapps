FROM node 
WORKDIR /app 
COPY package.json /app
COPY yarn.lock /app
RUN yarn install  
COPY . /app
CMD yarn run start
EXPOSE 3000

