# terraform-service-modules

[![verify](https://github.com/mateusz-uminski/terraform-service-modules/actions/workflows/verify.yaml/badge.svg)](https://github.com/mateusz-uminski/terraform-service-modules/actions/workflows/verify.yaml)

This repo contains terraform modules for services not available through cloud providers that I use to provision my test environment. These modules are primarily used in [terragrunt-services](https://github.com/mateusz-uminski/terragrunt-services) and occasionally in [terragrunt-aws-infrastructes](https://github.com/mateusz-uminski/terragrunt-aws-infrastructures).

Each module contains its own README file with a brief description. Further details can be found in commits and code comments.
<br><br>
Feel free to explore and utilize any content you find useful.
Enjoy!

## Module naming convention
The name of each module should start with the name of the service it is designed for. For instance:
- Modules related to github should have the prefix `github-`
- Modules related to grafana should have the prefix `grafana-`
- Modules related to hashicorp consul should have the prefix `consul-`
