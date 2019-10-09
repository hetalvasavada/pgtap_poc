FROM postgres:9.4.5

MAINTAINER hetal.vasavada<hvasavada@planittesting.com>


RUN apt-get update \
    && apt-get install -y build-essential git-core libv8-dev curl postgresql-server-dev-$PG_MAJOR --force-yes \
    && rm -rf /var/lib/apt/lists/*

ENV PLV8_BRANCH r1.4
RUN cd /tmp && git clone -b $PLV8_BRANCH https://github.com/plv8/plv8.git \
  && cd /tmp/plv8 \
  && make all install

# install pg_prove
RUN curl --insecure -LO http://xrl.us/cpanm \
    && chmod +x cpanm \
    && ./cpanm TAP::Parser::SourceHandler::pgTAP

RUN rm -rf pgtap_install

# install pgtap
ENV PGTAP_VERSION v0.95.0
RUN git config --global http.sslverify false
RUN git clone --branch v0.97.0 https://github.com/theory/pgtap.git && \
  cd pgtap && \
  make && \
  make install && \
  make installcheck && \
  cd /
#    && cp pgtap--0.95.0.sql /usr/share/postgresql/9.4/extension/pgtap--1.1.0.sql \

RUN apt update && apt install -y build-essential git cpanminus curl wget unzip

RUN cpanm --notest File::Copy::Recursive Perl::OSType Module::Metadata version TAP::Harness CGI TAP::Harness::Archive TAP::Parser::Source

#ADD ./db_prereqs.sh /db_prereqs.sh

#RUN chmod +x /db_prereqs.sh

RUN git config --global http.sslverify false

EXPOSE 5432