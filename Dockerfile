FROM docker.io/library/perl

#RUN echo hello && cpan install File::HomeDir && apt-get update && apt-get install -y libstring-shellquote-perl libwww-perl python3-pycurl python3-requests python3-debian equivs apt-utils mmdebstrap

COPY . /build
#RUN cd /build && ./debrebuild.pl --buildresults=/artifacts --builder=mmdebstrap gzip_1.10-2_all-amd64-source.buildinfo
