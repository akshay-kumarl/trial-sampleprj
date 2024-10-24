# Sample project 



```
my-realtime-project/
├── app/
│   ├── src/
│   │   ├── index.js           # Entry point for your Node.js app
│   │   └── ...                # Other app files
│   ├── package.json           # Node.js dependencies and scripts
│   └── Dockerfile             # Docker configuration for the app
├── infra/
│   ├── terraform/
│   │   ├── main.tf            # Main Terraform configuration
│   │   ├── variables.tf       # Terraform variables
│   │   ├── outputs.tf         # Terraform outputs
│   │   └── ...                # Other Terraform modules or files
│   ├── kubernetes/
│   │   ├── deployment.yaml    # Kubernetes deployment configuration
│   │   ├── service.yaml       # Kubernetes service configuration
│   │   └── ingress.yaml       # Ingress configuration
│   └── jenkins/
│       └── Jenkinsfile        # Jenkins pipeline configuration
├── .gitignore                 # Files to ignore in Git
└── README.md                  # Project documentation

```

---

 terraform apply -f ./samplegitlab/*  <br/>
 docker build -t mysample:v1 -f ./samplegitlab/Dockerfile . <br/>
 kubectl apply -f ./sample/sa.yml
