FROM mcr.microsoft.com/mssql/server
LABEL maintainer="Chad Jones <cj@patientsky.com>"
ENV ACCEPT_EULA Y
USER root
RUN apt-get update \
  && apt-get install -y supervisor wget \
  && wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
  && dpkg -i packages-microsoft-prod.deb \
  && apt-get update \
  && apt-get install -y apt-transport-https dotnet-sdk-3.1 apt-transport-https aspnetcore-runtime-3.1
COPY supervisord.conf /etc/supervisord.conf
CMD /usr/bin/supervisord -n -c /etc/supervisord.conf
