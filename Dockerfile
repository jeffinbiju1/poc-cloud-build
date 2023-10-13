FROM docker.io/library/perl
RUN cpan install File::HomeDir && apt-get update && apt-get install -y libstring-shellquote-perl &&  apt-get install -y libwww-perl &&  apt-get install -y python3-pycurl &&  apt-get install -y python3-requests
               &&  apt-get install -y python3-debian
               &&  apt-get install -y equivs
               &&  apt-get install -y apt-utils
               &&  apt-get install -y mmdebstrap
