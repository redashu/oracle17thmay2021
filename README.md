#  k8s revision 

<img src="rev.png">

## checking api resources 

```
❯ kubectl  get  all
NAME                       READY   STATUS    RESTARTS   AGE
pod/abhipodalp             1/1     Running   1          16h
pod/abhirc-1-lj4n2         1/1     Running   1          16h
pod/abhirc-1-rblvq         1/1     Running   1          16h
pod/ashupodalp             1/1     Running   1          16h
pod/ashurc-1-hcczx         1/1     Running   1          16h
pod/dhirajalp              1/1     Running   1          16h
pod/dhirajtomcatrc-74vng   1/1     Running   1          16h
pod/dhirajtomcatrc-t62t5   1/1     Running   1          16h
pod/dipsrc-1-m2cfn         1/1     Running   1          16h
pod/jazzpodalpine          1/1     Running   1          16h
pod/mahipodalp             1/1     Running   1          16h
pod/myyogiapp-gj8xq        1/1     Running   1          16h
pod/naveenrc-1-2799w       1/1     Running   1          16h
pod/nvnpodalp              1/1     Running   3          16h
pod/ramanpodalp            1/1     Running   1          16h
pod/sandip-1-94cdc         1/1     Running   1          16h
pod/swatipodalp            1/1     Running   1          16h
pod/swatirc-1-csknx        1/1     Running   1          16h

NAME                                   DESIRED   CURRENT   READY   AGE
replicationcontroller/abhirc-1         2         2         2       16h
replicationcontroller/ashurc-1         1         1         1       16h
replicationcontroller/dhirajtomcatrc   2         2         2       16h
replicationcontroller/dipsrc-1         1         1         1       16h
replicationcontroller/myyogiapp        1         1         1       16h
replicationcontroller/naveenrc-1       1         1         1       16h
replicationcontroller/sandip-1         1         1         1       16h
replicationcontroller/swatirc-1        1         1         1       16h

NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/abhisvc1     NodePort    10.97.63.182     <none>        2345:32710/TCP   16h
service/ashusvc2     NodePort    10.107.184.111   <none>        1234:31452/TCP   16h
service/dhirajsvc1   NodePort    10.96.66.205    

```


# Namespaces 

<img src="ns.png">

## understanding default namespaces 

<img src="dfns.png">

### creating namespaces

```
❯ kubectl  create  namespace   ashuspace  --dry-run=client  -o yaml
apiVersion: v1
kind: Namespace
metadata:
  creationTimestamp: null
  name: ashuspace
spec: {}
status: {}
❯ kubectl  create  namespace   ashuspace
namespace/ashuspace created
❯ kubectl   get   ns
NAME              STATUS   AGE
ashuspace         Active   3s
default           Active   44h
kube-node-lease   Active   44h
kube-public       Active   44h
kube-system       Active   44h

```

### setting default namesapce 

```
❯ kubectl  config set-context  --current  --namespace=ashuspace
Context "kubernetes-admin@kubernetes" modified.
❯ kubectl  config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   ashuspace
          minikube                      minikube     minikube           default
❯ kubectl  get  po
No resources found in ashuspace namespace.
❯ kubectl  get  svc
No resources found in ashuspace namespace.
❯ kubectl  get  rc
No resources found in ashuspace namespace.

```

# Deployment of opensource dashboard in k8s cluster

```
❯ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml
namespace/kubernetes-dashboard created
serviceaccount/kubernetes-dashboard created
service/kubernetes-dashboard created
secret/kubernetes-dashboard-certs created
secret/kubernetes-dashboard-csrf created
secret/kubernetes-dashboard-key-holder created
configmap/kubernetes-dashboard-settings created
role.rbac.authorization.k8s.io/kubernetes-dashboard created
clusterrole.rbac.authorization.k8s.io/kubernetes-dashboard created
rolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
clusterrolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
deployment.apps/kubernetes-dashboard created
service/dashboard-metrics-scraper created
deployment.apps/dashboard-metrics-scraper created

```

## for reading refer URL below 

[k8sdashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)


### dashboard more details 

```
❯ kubectl   get   po  -n kubernetes-dashboard
NAME                                         READY   STATUS    RESTARTS   AGE
dashboard-metrics-scraper-856586f554-7b8lh   1/1     Running   0          2m6s
kubernetes-dashboard-78c79f97b4-6nzjj        1/1     Running   0          2m8s
❯ kubectl   get   svc   -n kubernetes-dashboard
NAME                        TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
dashboard-metrics-scraper   ClusterIP   10.102.182.186   <none>        8000/TCP   2m26s
kubernetes-dashboard        ClusterIP   10.98.27.47      <none>        443/TCP    2m34s
❯ kubectl   edit   svc    kubernetes-dashboard    -n kubernetes-dashboard
service/kubernetes-dashboard edited
❯ kubectl   get   svc   -n kubernetes-dashboard
NAME                        TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)         AGE
dashboard-metrics-scraper   ClusterIP   10.102.182.186   <none>        8000/TCP        3m54s
kubernetes-dashboard        NodePort    10.98.27.47      <none>        443:31252/TCP   4m2s

```

### getting. token for dashboard login 

```
❯ kubectl   get  secret  -n kubernetes-dashboard
NAME                               TYPE                                  DATA   AGE
default-token-5qt5t                kubernetes.io/service-account-token   3      9m12s
kubernetes-dashboard-certs         Opaque                                0      9m10s
kubernetes-dashboard-csrf          Opaque                                1      9m9s
kubernetes-dashboard-key-holder    Opaque                                2      9m8s
kubernetes-dashboard-token-4vh84   kubernetes.io/service-account-token   3      9m12s
❯ kubectl  describe  secret  kubernetes-dashboard-token-4vh84  -n  kubernetes-dashboard
Name:         kubernetes-dashboard-token-4vh84
Namespace:    kubernetes-dashboard
Labels:       <none>
Annotations:  kubernetes.io/service-account.name: kubernetes-dashboard
              kubernetes.io/service-account.uid: 92266d93-8478-487b-95e8-ee4070c84684

Type:  kubernetes.io/service-account-token

Data
====
ca.crt:     1066 bytes
namespace:  20 bytes
token:      eyJhbGciOiJSUzI1NiIsImtpZCI6IlpDZ3RXcVN0Wk9KUTdwVndRd293SjlQVE1jZTlSMldDV2swams3aDZPMnMifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJrdWJlcm5ldGVzLWRhc2

```

## users in k8s

<img src="users.png">

## everyname space has default serviceaccount 

```
❯ kubectl   get  sa
NAME      SECRETS   AGE
default   1         38m
❯ 

```

### chekcing service account and secret of k8s dashboard 

<img src="dash.png">

## roles and rolebindings 

### checking clusterrole 

```
❯ kubectl  get  clusterroles
NAME                                                                   CREATED AT
admin                                                                  2021-05-19T08:12:59Z
calico-kube-controllers                                                2021-05-19T08:14:13Z
calico-node                                                            2021-05-19T08:14:13Z
cluster-admin                                                          2021-05-19T08:12:59Z
edit                                                                   2021-05-19T08:12:59Z
kubeadm:get-nodes                                                      2021-05-19T08:13:00Z
kubernetes-dashboard                                                   2021-05-21T05:03:26Z
system:aggregate-to-admin                                              2021-05-19T08:12:59Z
system:aggregate-to-edit                                               2021-05-19T08:12:59Z
system:aggregate-to-view                                               2021-05-19T08:12:59Z
system:auth-delegator                                                  2021-05-19T08:12:59Z
system:basic-user                                                      2021-05-19T08:12:59Z
system:certificates.k8s.io:certificatesigningrequests:nodeclient       2021-05-19T08:12:59Z
system:certificates.k8s.io:certificatesigningrequests:selfnodeclient   2021-05-19T08:12:59Z
system:certificates.k8s.io:kube-apiserver-client-approver              2021-05-19T08:12:59Z
system:certificates.k8s.io:kube-apiserver-client-kubelet-approver      2021-05-19T08:12:59Z
system:certificates.k8s.io:kubelet-serving-approver                    2021-05-19T08:12:59Z
system:certificates.k8s.io:legacy-unknown-approver                     2021-05-19T08:12:59Z
system:controller:attachdetach-controller

```

# Deployment 

## deployment understanding 

<img src="dep.png">

### reality of deployent 

<img src="depreal.png">

### creating deployment using yaml 

```
❯ kubectl  create  deployment  ashuwebapp  --image=dockerashu/ashunginx:v1  --dry-run=client -o yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: ashuwebapp
  name: ashuwebapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ashuwebapp
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: ashuwebapp
    spec:
      containers:
      - image: dockerashu/ashunginx:v1
        name: ashunginx
        resources: {}

```

### 

```
 kubectl  create  deployment  ashuwebapp  --image=dockerashu/ashunginx:v1  --dry-run=client -o yaml   >ashudep.yml
 
```
### creating loadbalancer type service 

```
kubectl   create  service  loadbalancer  ashusvc1  --tcp  1234:80  --dry-run=client -o yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: ashusvc1
  name: ashusvc1
spec:
  ports:
  - name: 1234-80
    port: 1234
    protocol: TCP
    targetPort: 80
  selector:
    app: ashusvc1
  type: LoadBalancer
status:
  loadBalancer: {}
  
```





