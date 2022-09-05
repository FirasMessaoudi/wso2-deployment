
KUBECTL=`which kubectl`

${KUBECTL} apply -f ../services/elasticsearch-deployment.yaml -n wso2
${KUBECTL} apply -f ../services/wso2apim-deployment.yaml -n wso2
${KUBECTL} apply -f ../services/kibana-deployment.yaml -n wso2
