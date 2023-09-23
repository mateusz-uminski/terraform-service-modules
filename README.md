# terraform-service-modules

[![verify](https://github.com/mateusz-uminski/terraform-service-modules/actions/workflows/verify.yaml/badge.svg)](https://github.com/mateusz-uminski/terraform-service-modules/actions/workflows/verify.yaml)

This repo contains terraform modules for services not available through cloud providers that I use to provision my test environments. These modules are mainly used in [terragrunt-services](https://github.com/mateusz-uminski/terragrunt-services) and occasionally in [terragrunt-aws-infrastructes](https://github.com/mateusz-uminski/terragrunt-aws-infrastructures) or [terragrunt-aws-sandbox](https://github.com/mateusz-uminski/terragrunt-aws-sandbox).

Each module contains its own README file with a brief description. Further details can be found in commits and code comments.
<br><br>
Feel free to explore and utilize any content you find useful.
Enjoy!

## Module naming convention
The name of each module should start with the name of the service it is designed for (or with the name of the module provider). For instance:
- Modules related to github should have `github-` prefix.
- Modules related to grafana should have `grafana-` prefix.
- Modules related to hashicorp consul should have `consul-` prefix.
- Modules that uses `hashicorp/tls` provider should have `tls-` prefix.
