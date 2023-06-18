FROM nikolaik/python-nodejs:latest as production

RUN pip install flask
RUN npm install pm2 -g


WORKDIR /app

COPY . /app

RUN yarn install

EXPOSE 5000

CMD ["pm2-runtime", "ecosystem.config.js"]

# Python Command Below but we will run the python scripts through NodeJS
#CMD ["python3", "app.py"]