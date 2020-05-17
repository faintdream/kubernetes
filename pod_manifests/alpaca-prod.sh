kubectl run alpaca-prod  --image=gcr.io/kuar-demo/kuard-amd64:blue  --replicas=2  --labels="ver=1,app=alpaca,env=prod"
