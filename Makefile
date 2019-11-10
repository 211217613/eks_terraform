.PHONY: apply destroy plan validate fmt clean

apply: fmt plan
	terraform apply --auto-approve tfplan

destroy:
	terraform destroy -auto-approve -state=terraform.tfstate

init: fmt
	terraform init


plan: init fmt
	terraform plan --out tfplan -input=false

validate: fmt init
	terraform validate

fmt:
	terraform fmt

clean:
	find . -type f -name 'terraform.tfstate*' -exec rm {} \;
	find . -type d -name '*terraform' -exec rm -rf {} \;
	find . -type f -name tfplan -exec rm {} \;

