# aws-101-workshop

## Como instalar terraform
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
https://developer.hashicorp.com/terraform/install

```bash
wget https://releases.hashicorp.com/terraform/1.11.0/terraform_1.11.0_darwin_arm64.zip
unzip terraform_1.11.0_darwin_arm64.zip
```

## Instalar AWS CLI
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

## Configurar las variables de entorno
https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-envvars.html

```bash
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```

## Comandos de terraform

### Inicializar
Para revisar que todo este correctamente descargado en mi local
```bash
terraform init
```

### Validar el codigo
Para verificar lo que se puede crear en AWS
```bash
terraform plan
```

### Desplegar el codigo
Para desplegar el codigo en los archivos .tf
```bash
terraform apply
# Si quiero hacerlo de forma rapida
terraform apply -auto-approve
```

### Destruir los recursos
Para borrar los recursos en AWS
```bash
terraform destroy
```