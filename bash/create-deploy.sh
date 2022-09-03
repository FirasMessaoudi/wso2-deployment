KUBECTL=`which kubectl`

${KUBECTL} apply -f ../deployment/elasticsearch-deployment.yaml -n wso2
${KUBECTL} apply -f ../deployment/wso2apim-deployment.yaml -n wso2
${KUBECTL} apply -f ../deployment/kibana-deployment.yaml -n wso2
