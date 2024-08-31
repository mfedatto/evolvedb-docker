# Define .NET runtime version as a build argument
ARG DOTNET_VERSION=8.0

# Use the .NET runtime version specified by the build argument
FROM mcr.microsoft.com/dotnet/runtime:${DOTNET_VERSION}

# Set the working directory
WORKDIR /app

# Define environment variables without values; these can be overridden
# by docker-compose or at runtime
ENV CONNECTION_STRING=""
ENV LOCATIONS=""
ENV DBMS=""
ENV COMMAND=""
ENV SCHEMA=""
ENV PLACEHOLDERS=""
ENV METADATA_TABLE=""

# Install wget and unzip
RUN apt update && \
    apt install -y wget tar

# Set the version of EvolveDB to be downloaded
ENV EVOLVE_VERSION="3.2.0"

# Download and extract the EvolveDB artifact
RUN wget https://github.com/lecaillon/Evolve/releases/download/${EVOLVE_VERSION}/evolve_${EVOLVE_VERSION}_Linux-64bit.tar.gz -O evolve.tar.gz && \
    tar -xzf evolve.tar.gz -C /app && \
    rm evolve.tar.gz

# Copy the entrypoint script into the container and set executable permissions
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Removing list files to reduce image size
RUN rm -rf /var/lib/apt/lists/*

# Set the entrypoint for the container
ENTRYPOINT ["/app/entrypoint.sh"]
