/Users/edwin/codecode/kong_plug/99.etc/helm_test

kubectl create namespace kong 
kubectl create configmap kong-plugin-myheader --from-file=myheader -n kong 
helm install mykong kong/kong -n kong  -f values.yaml

helm uninstall kong-1694507833 kong/kong -n kong 
helm install  kong/kong --generate-name -n kong --create-namespace -f values.yaml
helm delete mykong -n kong 

kubectl apply -f order.yaml
kubectl apply -f myheadertoorder.yaml

kubectl get po -n kong
kubectl get svc -n kong

kubectl port-forward mykong-kong-5cb77c4475-ljbvq 8001:8001 -n kong

# konga 
kubectl get svc -n kong
kubectl create -f https://bit.ly/k8s-konga
kubectl port-forward konga-7c8785b95c-wl8x9 1337:1337 -n kong
kubectl port-forward  mykong-postgresql-0 5432:5432 -n kong
