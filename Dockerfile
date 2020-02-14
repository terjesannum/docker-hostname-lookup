FROM perl:5.30.1-slim

ENV LOOKUP_HOSTNAME "google.com"
ENV LOOKUP_PAUSE "100"
ENV LOOKUP_STATS "10"
ENV LOOKUP_TIMEOUT "50"

ADD https://raw.githubusercontent.com/terjesannum/scripts/master/hostname-lookup.pl /usr/src
WORKDIR /usr/src
CMD [ "sh", "-c", "exec perl /usr/src/hostname-lookup.pl $LOOKUP_HOSTNAME $LOOKUP_PAUSE $LOOKUP_STATS $LOOKUP_TIMEOUT" ]
