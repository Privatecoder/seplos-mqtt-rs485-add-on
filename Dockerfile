# Use Home Assistant Base Image
ARG BUILD_FROM
FROM $BUILD_FROM

# Install Python and required packages
RUN apk add --no-cache \
    python3 \
    py3-pip \
    socat \
    bash \
    jq \
    py3-paho-mqtt \
    py3-pyserial

# Set the working directory
WORKDIR /usr/src/app

# Application files kopieren
COPY src/fetch_bms_data.py ./
COPY src/ha_auto_discovery.py ./
COPY run.sh /

# Make sure entrypoint is executable
RUN chmod a+x /run.sh

# Run Startup-Script
CMD [ "/run.sh" ]