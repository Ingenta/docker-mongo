# VERSION 0.0.1
# 中国科学项目- Mongo
FROM mongo

MAINTAINER 蒋凯 "kai.jiang@digitalpublishing.cn"

ADD resource /resource
RUN chown -R mongodb:mongodb /resource
RUN chmod +x /resource/entrypoint.sh
ENTRYPOINT ["/resource/entrypoint.sh"]

