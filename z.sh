#0
mv $HOME/.kube/config $HOME/.kube/config.old
docker build . -t egoomoy/custom_auth
minikube stop && minikube delete --all && minikube start


# 1-1. DB
$HOME/codecode/kong_plug/1.upstreamAPI/mariadb
kubectl apply -f mariadb
# kubectl apply -f db-pv.yml
# kubectl apply -f db-pvc.yml
# kubectl apply -f db-secret.yml
# kubectl apply -f db-maria-deployment.yml
# kubectl apply -f db-maria-svc.yml
# kubectl apply -f db-conf.yml
kubectl get pods -l app=mariadb
kubectl exec -it mariadb-c5bd659b8-g9zkm -- bash

#1-2 upstream 배포
$HOME/codecode/kong_plug/1.upstreamAPI
kubectl apply -f backend
kubectl apply -f backend/userservice.yml


#2 플러그인 만들기
$HOME/codecode/kong_plug/2.plugin_configMap
kubectl create namespace kong
kubectl create configmap kong-plugin-myheader --from-file=myheader -n kong
kubectl create configmap kong-plugin-custom-auth --from-file=custom-auth -n kong
# kubectl delete configmap kong-plugin-custom-auth  -n kong

#3
$HOME/codecode/kong_plug/3.kong_install
kustomize build manifest | kubectl apply -f -

#4
$HOME/codecode/kong_plug/4.ingress
kubectl apply -f user_plugin-apply-ingress-single-host.yml

#kubectl apply -f ingress-single-host.yaml
#kubectl apply -f plugin-apply-ingress-single-host.yml

# 삭제
kubectl delete all -l project=snackbar
kubectl delete all -l app=mariadb 

# etc
kubectl get pods -l app=mariadb
kubectl exec -it mariadb-c5bd659b8-g9zkm -- bash
kubectl port-forward  mariadb-c5bd659b8-w9gh7 3307:3306
mysql -u root -p

