KUBECTL=`which kubectl`

${KUBECTL} apply -f ../ingress/elasticsearch-ingress.yaml -n wso2
${KUBECTL} apply -f ../ingress/wso2-gateway-ingress.yaml -n wso2
${KUBECTL} apply -f ../ingress/wso2-ingress.yaml -n wso2
${KUBECTL} apply -f ../ingress/kibana-ingress.yaml -n wso2
${KUBECTL} apply -f ../ingress/prometheus-ingress.yaml -n monitoring
${KUBECTL} apply -f ../ingress/grafana-ingress.yaml -n monitoring
${KUBECTL} apply -f ../ingress/alertmanager-ingress.yaml -n monitoring