FROM jmenga/todobackend-base:latest
MAINTAINER Thomas Hjert <thomas.hjert@knowit.se>

# Install dev/build dependencies
RUN apt-get update && \
    apt-get install -qy python-dev libmysqlclient-dev

# Activate virtual environment and install wheel support
RUN . /appenv/bin/activate && \
    pip install wheel --upgrade


# PIP environment variables (NOTE: must be set after installing wheel)

ENV WHEELHOUSE=/wheelhouse PIP_WHEEL_DIR=/wheelhouse PIP_FINS_LINKS=/wheelhouse XDG_CACHE_HOME=/cache


VOLUME /wheelhouse

VOLUME /reports

COPY scripts/test.sh /usr/local/bin/test.sh
RUN chmod +x /usr/local/bin/test.sh

ENTRYPOINT ["test.sh"]

CMD ["python", "manage.py", "test", "--noinput"]

# Add application source

COPY src /application
WORKDIR /application
