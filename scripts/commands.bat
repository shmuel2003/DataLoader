REM Login to OpenShift
oc login <openshift-url> --token=<token>

REM Create project
oc delete project data-loader --ignore-not-found
oc new-project data-loader

REM Create secret for MySQL password
oc create secret generic mysql-secret --from-literal=password=MyStrongPassword

REM Apply PVC, MySQL deployment, and service
oc apply -f infrastructure/k8s/mysql-deployment.yaml
oc apply -f infrastructure/k8s/mysql-service.yaml

REM Build Docker image
docker build -t <dockerhub-username>/fastapi-data-loader:latest .
docker push <dockerhub-username>/fastapi-data-loader:latest

REM Deploy FastAPI
oc apply -f infrastructure/k8s/fastapi-deployment.yaml
oc apply -f infrastructure/k8s/fastapi-service.yaml
oc apply -f infrastructure/k8s/fastapi-route.yaml