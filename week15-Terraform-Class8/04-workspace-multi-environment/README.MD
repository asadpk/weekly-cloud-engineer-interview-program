# IAM POlicy creation in multi environment

Apply this configuration using the following command:

```
terraform apply
```

This creates the policy in AWS and names it "s3_policy_for_dev". Let's run it again, but this time provide a different value for the environment variable, like so:

```
terraform apply -var "environment=prod"
```