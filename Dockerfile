FROM crdant/serverless-image:latest

COPY assets/check /opt/resource/check
COPY assets/in /opt/resource/in
COPY assets/out /opt/resource/out
COPY assets/common.sh /opt/resource/common.sh

RUN apt-get update && apt-get install jq && apt-get clean
