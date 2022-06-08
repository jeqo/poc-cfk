all:

helm-cfk-repo:
	helm repo add confluentinc https://packages.confluent.io/helm
	helm repo update

helm-cfk-install-default:
	helm upgrade --install confluent-operator \
		confluentinc/confluent-for-kubernetes
