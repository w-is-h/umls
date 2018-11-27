FROM postgres:11.0

# Copy the scripts that we want to run during database init
COPY ./postgres/scripts /docker-entrypoint-initdb.d/
