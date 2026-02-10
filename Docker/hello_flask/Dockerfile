FROM python:3.8-slim
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libmariadb-dev \
    pkg-config
RUN pip install flask mysqlclient 
EXPOSE 5002 
CMD ["python", "app.py"]



#this is a stage 1
FROM python:3.8-slim as Build 

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libmariadb-dev \
    pkg-config
COPY . . 

RUN pip install flask mysqlclient 

#stage 2: production state 


FROM python:3.8-slim as Build 

WORKDIR /app

COPY --from=Build /app /app/

EXPOSE 5002

CMD ["python", "app.py"]
