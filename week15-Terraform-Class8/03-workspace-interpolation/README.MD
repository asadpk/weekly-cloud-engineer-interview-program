> With the basics of Terraform workspaces in the background, it would make sense to use this knowledge within the Terraform configuration objects to identify the resources belonging to the respective workspaces.

> For example, the EC2 instances created using the same configuration in the previous example are created with the same name, i.e., with whatever value specified in the name_tag variable. When we look at these instances in the AWS console, it becomes difficult to quickly identify which EC2 instance belongs to which workspace.

> Terraform provides an interpolation sequence to reference the value of the currently selected workspace, as shown below.

```
${terraform.workspace}
```

> Let us use this to set our name tags according to the respective workspace being selected. In the configuration below, we have set our name_tag variable with a default value of EC2. The aws_instance resource block uses this variable in combination with the workspace interpolation sequence to set different and respective names.

> Note: the format() function is used to concatenate multiple strings to for a valid name value.

terraform workspace show — Show the name of the current workspace.

terraform workspace list — List your workspaces.

terraform workspace select <workspace name> — Select a specified workspace.

terraform workspace new <workspace name> — Create a new workspace with a specified name.

terraform workspace delete <workspace name> — Delete a specified workspace.

