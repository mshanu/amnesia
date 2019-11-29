FROM adoptopenjdk/openjdk11
RUN apt-get update && apt-get install wget -y && apt-get install zip -y
RUN curl -s "https://get.sdkman.io" | bash
RUN chmod +x /root/.sdkman/bin/sdkman-init.sh 
RUN bash  -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install gradle 6.0.1" 
COPY entry_point.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entry_point.sh
WORKDIR /app
ENTRYPOINT ["entry_point.sh"] 
