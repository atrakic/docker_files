FROM alpine:latest
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.14.0/terragrunt_linux_amd64 terragrunt
RUN chmod +x terragrunt

FROM hashicorp/terraform:latest
COPY --from=0 terragrunt /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/terragrunt"]
