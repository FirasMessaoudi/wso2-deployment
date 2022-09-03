KUBECTL=`which kubectl`

${KUBECTL} create configmap logstash-conf --from-file=../configs/logstash/logstash.conf -n wso2
${KUBECTL} create configmap logstash-yml --from-file=../configs/logstash/logstash.yml -n wso2
${KUBECTL} create configmap kibana-yml --from-file=../configs/kibana/kibana.yml -n wso2
${KUBECTL} create configmap deployment-toml --from-file=../configs/apim/deployment.toml -n wso2