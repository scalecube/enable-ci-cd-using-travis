FROM ruby as scalecube-travis-ci
RUN apt-get update -qy
RUN apt-get install -qy jq maven
RUN ruby -v
RUN mvn -version 
RUN gem install travis

ADD .gitignore /opt
ADD entrypoint.sh /opt
ADD travis-settings.xml /opt
ADD requirements.txt /opt
ADD fix.travis.yml /opt

ADD src /root/src
CMD chmod u+x /opt/entrypoint.sh && /opt/entrypoint.sh
