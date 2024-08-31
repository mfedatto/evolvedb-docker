# EvolveDB Docker Image

Welcome to the [Evolve](https://evolve-db.netlify.app/) Docker image repository by MFedatto!
This project provides a Docker container for [Evolve](https://evolve-db.netlify.app/), a database
migration tool.
With this Docker image, you can seamlessly integrate [Evolve](https://evolve-db.netlify.app/) into
your CI/CD pipeline and manage database migrations in a standardized environment.

## Overview

The EvolveDB Docker image allows you to run EvolveDB commands in a containerized environment,
ensuring consistency across different development, testing, and production setups.
This image is built on the .NET runtime and includes [Evolve](https://evolve-db.netlify.app/) to
handle your database migrations efficiently.

## Docker Image

* GitHub Repository: [mfedatto/evolvedb-docker](https://github.com/mfedatto/evolvedb-docker)
* Docker Hub: [mfedatto/evolve-db](https://hub.docker.com/r/mfedatto/evolve-db)

## Features

* Pre-configured Environment: [Evolve](https://evolve-db.netlify.app/) with .NET runtime in a
  ready-to-use Docker container.
* Flexible Configuration: Pass environment variables to customize the behavior of
  [Evolve](https://evolve-db.netlify.app/).
* Cross-Platform: Supports multiple architectures including x86, amd64, armv8, and arm64.

## Getting Started

### Prerequisites

* Docker installed on your machine.
* Basic knowledge of Docker and Docker Compose.

### Pull the Docker Image

To get started, pull the Docker image from Docker Hub:

```sh
docker pull mfedatto/evolve-db
```

### Run the Docker Container

To run the container and perform database migrations, use the following command.
Make sure to replace the placeholders with your actual values:

```sh
docker run --rm \
  -e CONNECTION_STRING="your_connection_string" \
  -e LOCATIONS="/path/to/migrations" \
  -e DBMS="your_dbms" \
  -e COMMAND="migrate" \
  -e SCHEMA="optional_schema" \
  -e PLACEHOLDERS="key1=value1,key2=value2" \
  -e METADATA_TABLE="optional_metadata_table" \
  mfedatto/evolve-db
```

### Environment Variables

Here are the environment variables you can use to configure the EvolveDB Docker container:

* `CONNECTION_STRING`: Your database connection string. (Required)
* `LOCATIONS`: Paths to the migration scripts. (Required)
* `DBMS`: The type of database system (e.g., `sqlserver`, `postgres`). (Required)
* `COMMAND`: The EvolveDB command to execute (e.g., `migrate`). (Required)
* `SCHEMA`: Optional schema for the database.
* `PLACEHOLDERS`: Key-value pairs for placeholders in migration scripts. (Format: `key1=value1,key2=value2`)
* `METADATA_TABLE`: Optional table name for metadata tracking.

### Example

Here's an example of running the Docker container with all environment variables:

```sh
docker run --rm \
  -e CONNECTION_STRING="Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;" \
  -e LOCATIONS="/migrations" \
  -e DBMS="sqlserver" \
  -e COMMAND="migrate" \
  -e SCHEMA="dbo" \
  -e PLACEHOLDERS="env=production,version=1.0" \
  -e METADATA_TABLE="evolve_metadata" \
  mfedatto/evolve-db
```

## Building the Docker Image

If you wish to build the Docker image yourself, you can use the provided `Dockerfile`:

1. Clone the repository:

```sh
git clone https://github.com/mfedatto/evolvedb-docker.git
cd evolvedb-docker
```

2. Build the Docker image:

```sh
docker build -t mfedatto/evolve-db .
```

## Contributing

Contributions are welcome!
If you have suggestions or improvements, please submit a pull request or open an issue on GitHub.
For a list of contributors who have helped with this project, check out the [CONTRIBUTORS.md](CONTRIBUTORS.md).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for details.

## Contact

For any questions or support, please open an issue on the
[GitHub repository](https://github.com/mfedatto/evolvedb-docker) or contact us via the repository’s
discussions.
