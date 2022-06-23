all: helm-repos helm-openldap-install helm-cfk-install helm-cfk-telemetry helm-prometheus-install helm-grafana-install

helm-repos:
	helm repo add confluentinc https://packages.confluent.io/helm
	helm repo add stable https://charts.helm.sh/stable
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo add grafana https://grafana.github.io/helm-charts
	helm repo update

helm-cfk-install:
	helm upgrade --install confluent-operator \
		confluentinc/confluent-for-kubernetes \
	  	--namespace confluent \
	  	--create-namespace \
		--values helm/cfk/values.yml

helm-cfk-delete:
	helm delete confluent-operator --namespace confluent

helm-cfk-telemetry:
	kubectl create secret generic telemetry \
		--from-file=helm/cfk/telemetry.txt \
		--namespace confluent

helm-openldap-install:
	helm upgrade --install  test-ldap \
		helm/openldap \
		--namespace openldap \
	  	--create-namespace \
		--values helm/openldap/values.yaml
		#-f helm/openldap/ldaps-rbac.yaml \

helm-openldap-delete:
	helm delete test-ldap --namespace openldap

helm-prometheus-install:
	helm upgrade --install prometheus \
		prometheus-community/prometheus \
		--namespace monitoring \
		--create-namespace

helm-grafana-install:
	helm upgrade --install grafana \
		grafana/grafana \
		--namespace monitoring \
		--create-namespace \
		--set persistence.enabled=true \
		--values helm/grafana/values.yml

helm-grafana-password:
	kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
