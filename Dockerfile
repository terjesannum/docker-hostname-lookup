FROM perl:5.32.0

# Hostname to lookup
ENV LOOKUP_HOSTNAME "google.com"
# Nameserver to use
ENV LOOKUP_NAMESERVER ""
# Pause between lookups in milliseconds
ENV LOOKUP_PAUSE "100"
# Number of lookups between printing stats
ENV LOOKUP_STATS "10"
# Lookup timeout in milliseconds
ENV LOOKUP_TIMEOUT "50"
# Set LOOKUP_USEVC to "--usevc" to enable usevc
ENV LOOKUP_USEVC ""

RUN cpan -i Net::DNS

ADD https://raw.githubusercontent.com/terjesannum/scripts/f3a09df257d94197393ba5881b1e733550b3e534/hostname-lookup.pl /usr/src
RUN chmod 755 /usr/src/hostname-lookup.pl

WORKDIR /usr/src
CMD [ "sh", "-c", "exec /usr/src/hostname-lookup.pl --host=$LOOKUP_HOSTNAME --nameserver=$LOOKUP_NAMESERVER --sleep=$LOOKUP_PAUSE --stats=$LOOKUP_STATS --timeout=$LOOKUP_TIMEOUT $LOOKUP_USEVC"]
