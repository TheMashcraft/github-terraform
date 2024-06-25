# github-terraform
A repository to create Github repositories using Terraform.

## Github Actions

There are 3 different github actions workflows, catering to terraform CLI commands.

1) terraform plan - executes on push to any branch, except 'main' & 'destroy'.
2) terraform apply - executes only on 'main'. This will execute after a pull request is merged.
3) terraform destroy - executes only on 'destroy'. This will destroy all resources.

