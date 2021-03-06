FROM postgres:9.4.5
MAINTAINER Naina Prabhu and Hetal Vasavada

RUN apt-get update \
    && apt-get install -y build-essential git-core libv8-dev curl postgresql-server-dev-$PG_MAJOR  --force-yes \
    && rm -rf /var/lib/apt/lists/*

# install plv8
ENV PLV8_BRANCH r1.4

RUN cd /tmp && git clone -b $PLV8_BRANCH https://github.com/plv8/plv8.git \
  && cd /tmp/plv8 \
  && make all install

# install pg_prove
RUN curl -LO http://xrl.us/cpanm \
    && chmod +x cpanm \
    && ./cpanm TAP::Parser::SourceHandler::pgTAP

# install pgtap
ENV PGTAP_VERSION v0.95.0
RUN git clone https://github.com/theory/pgtap.git \
    && cd pgtap && git checkout tags/$PGTAP_VERSION \
    && make \
	&& make install 

RUN rm -rf pgtap

RUN git clone https://github.com/theory/pgtap.git \
    && cd pgtap && cp pgtap.control /usr/share/postgresql/9.4/extension/pgtap.control \
	&& cp /usr/share/postgresql/9.4/extension/pgtap--0.95.0.sql /usr/share/postgresql/9.4/extension/pgtap--1.2.0.sql 
	
ADD ./db_prereqs.sh /db_prereqs.sh
RUN chmod +x /db_prereqs.sh

RUN curl --insecure -LO http://xrl.us/cpanm \
    && chmod +x cpanm \
    && ./cpanm TAP::Parser::SourceHandler::pgTAP \
    && ./cpanm DBI \
    && ./cpanm DBD::Pg  

RUN git config --global http.sslverify false

EXPOSE 5432
