FROM python

# install required pacakges
RUN apt update && apt install -y chromium xvfb

# create the app directory
WORKDIR /app

# clone the project
RUN git clone https://github.com/charlesbel/Microsoft-Rewards-Farmer.git ./

# install dependencies
RUN pip install -r requirements.txt

# copy over entrypoint script
COPY entrypoint.sh ./

#
ENTRYPOINT ["/app/entrypoint.sh"]

#
CMD ["python3", "main.py", "--visible"]
