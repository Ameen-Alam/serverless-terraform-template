# skills-devops

- It is easier and faster to work with smaller number of resources
    -   ```terraform plan``` and ```terraform apply``` both make cloud API calls to verify the status of resources
    -   If you have your entire infrastructure in a single composition this can take many minutes

    [terraform best practices code structure](https://www.terraform-best-practices.com/code-structure)






#### Testing the Container Image Locally
$ gcloud docker -a
$ gcloud auth configure-docker
$ PORT=8050 && docker run -p 9090:${PORT} -e PORT=${PORT} gcr.io/PROJECT_ID/IMAGE


##### pass user token for terraform remote state
terraform init -backend-config='token=${params.TOKEN}'"