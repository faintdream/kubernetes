kubectl run alpaca-test --image=gcr.io/kuar-demo/kuard-amd64:green --replicas=1 --labels="ver=2,app=alpaca,env=test"
