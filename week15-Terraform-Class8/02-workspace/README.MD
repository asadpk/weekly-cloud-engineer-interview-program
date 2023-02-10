> As we can see from the output, the EC2 instance was successfully created. Run the plan command again, and see if Terraform wants to perform any additional actions at this point. Most probably, no.

> To check the current workspace we are in, run the below command.

```
terraform workspace show
```

default

> The output here shows that we are currently in the workspace named default. To be sure about no other workspaces currently exist, run the list command as shown below.

```
terraform workspace list
```

```
terraform plan
```

```
terraform apply
```


> The list command lists all the currently created workspaces, including the default workspace. The start mark beside the default workspace indicates the currently selected workspace we are in.

> Let us create another workspace and select the same. We can do this by running the new command with the desired name of the new workspace as below.

```
terraform workspace new sit
```

Here, I have selected the name of the new Terraform workspace as “test_workspace”. Note that running this command has created and switched to the new workspace. We can verify this selection is made by running the show command as below.

```
terraform workspace show
```

> Of course, another way to verify it would be to run the list command and see where the asterisk (*) is pointing to.

```
terraform workspace list
```

> now terminate the created resources from each work spaces

```
terraform workspace select <workspace name>
```