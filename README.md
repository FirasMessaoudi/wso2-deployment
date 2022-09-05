# Deploying wso2 api manager,elk stack  and prometheus operator in azure kuberenetes service

## Steps
### 1- Create an organisation an generate an on-prem-key from https://console.choreo.dev/
### 1-install ingress controller

```bash
NAMESPACE=ingress-basic

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm install ingress-nginx ingress-nginx/ingress-nginx \
  --create-namespace \
  --namespace $NAMESPACE \
  --set controller.service.externalTrafficPolicy=Local \
  --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz
```

### 2-get exeternal ip

```bash
kubectl get svc -n ingress-basic
```

### 3-Replace the ip adress in all ingress.yaml files under  the ingress folder with the externa_ip you get in step 2
### 4- Update the properties in deployment.toml file under configs/apim/deployment.toml
```bash
hostname = "wso2apim-portal.YOUR_EXTERNAL_IP.nip.io"
service_url = "https://wso2apim-gateway.YOUR_EXTERNAL_IP.nip.io/services/"
http_endpoint = "http://wso2apim-gateway.YOUR_EXTERNAL_IP.nip.io"
https_endpoint = "https://wso2apim-gateway.YOUR_EXTERNAL_IP.nip.io"
[apim.analytics]
enable = true
config_endpoint = "https://analytics-event-auth.choreo.dev/auth/v1"
auth_token = "YOUR GENERATED ON-PREM-KEY"
```
### 4-Create the resources under bash folder in that order
```bash
./create-namespace
./create-configs
./create-deploy
./create-service
./create-ingress
```
### 4- install prometheus operator
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring
```

## License
[MIT](https://choosealicense.com/licenses/mit/)
