FROM debian:jessie
MAINTAINER jiri

# Base Environment Variables
ENV FLYWAY_HOME /flyway
ENV PATH $FLYWAY_HOME:$PATH
ENV APP /app

#ENV FLYWAY_TARBALL https://bintray.com/artifact/download/business/maven/flyway-commandline-3.2.1-linux-x64.tar.gz
ENV FLYWAY_TARBALL https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.0.3/flyway-commandline-4.0.3-linux-x64.tar.gz


# Base Packages
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

# Setup flyway
RUN mkdir ${FLYWAY_HOME} && \
    curl -L ${FLYWAY_TARBALL} | tar --strip-components=1 -xz -C ${FLYWAY_HOME}

RUN mkdir $APP
WORKDIR $APP

