#0
mv $HOME/.kube/config $HOME/.kube/config.old
docker build . -t egoomoy/custom_auth
minikube stop && minikube delete --all && minikube start

# 1-1. DB/Users/plant/CodeFactory/kongPlugin/1.upstreamAPI
$HOME/CodeFactory/kongPlugin/1.upstreamAPI
kubectl apply -f mariadb
# kubectl apply -f db-pv.yml
# kubectl apply -f db-pvc.yml
# kubectl apply -f db-secret.yml
# kubectl apply -f db-maria-deployment.yml
# kubectl apply -f db-maria-svc.yml
# kubectl apply -f db-conf.yml
kubectl get pods -l app=mariadb
kubectl exec -it mariadb-c5bd659b8-g9zkm -- bash
# kubectl delete PersistentVolume db-pv-volume
# kubectl delete PersistentVolumeClaim db-pv-claim

#1-2 upstream 배포
$HOME/CodeFactory/kongPlugin/1.upstreamAPI
kubectl apply -f backend
kubectl apply -f backend/authmodule.yml


#2 플러그인 만들기
$HOME/CodeFactory/kongPlugin/2.plugin_configMap
kubectl create namespace kong
kubectl create configmap kong-plugin-myheader --from-file=myheader -n kong
kubectl create configmap kong-plugin-custom-auth --from-file=custom-auth -n kong
# kubectl delete configmap kong-plugin-custom-auth  -n kong

kubectl delete configmap kong-plugin-custom-auth  -n kong

#3
$HOME/CodeFactory/kongPlugin/3.kong_install
kustomize build manifest | kubectl apply -f -

#4
$HOME/CodeFactory/kongPlugin/4.ingress
kubectl apply -f user_plugin-apply-ingress-single-host.yml

#kubectl apply -f ingress-single-host.yaml
#kubectl apply -f plugin-apply-ingress-single-host.yml

# 삭제
kubectl delete all -l project=snackbar
kubectl delete all -l app=mariadb 

# etc
kubectl get pods -l app=mariadb
kubectl exec -it mariadb-c5bd659b8-g9zkm -- bash
kubectl port-forward  mariadb-c5bd659b8-fz4x6 3307:3306
mysql -u root -p


