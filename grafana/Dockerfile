FROM grafana/grafana:6.3.6
LABEL maintainer=v.stone@163.com

USER root
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y tzdata \
    && /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' > /etc/timezone \
    && apt-get clean

USER grafana
WORKDIR /etc/grafana/provisioning

ENV GF_AUTH_PROXY_ENABLED=true \
    GF_AUTH_ANONYMOUS_ENABLED=true \
    GF_SECURITY_ALLOW_EMBEDDING="true" \
    GF_PATHS_PROVISIONING=/etc/grafana/provisioning \
    GF_SERVER_ROOT_URL="%(protocol)s://%(domain)s:%(http_port)s/board/" 

COPY provisioning/datasources ./datasources
COPY provisioning/dashboards ./dashboards
COPY health_check.sh /health_check.sh

EXPOSE 3000

HEALTHCHECK --interval=10s --timeout=5s --retries=3 CMD /health_check.sh
