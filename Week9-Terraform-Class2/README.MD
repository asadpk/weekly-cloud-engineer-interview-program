# Terraform Variable







# Boolean Variable

To represent true or false values, we can use the Boolean type—for example, one variable to enable or not a verbose mode for some process.

variable "enable_debug" {
  default = false
}

We didn’t specify the variable type in the example above, and it works perfectly. Also, we can override the "enable_debug" value at any moment.

```
terarform apply -var enable_debug="true"
```

The Terraform Variable Type Boolean supports another approach to specify “true” or “false.”

We can specify zero “0” with double quotes, and the Terraform will automatically convert it to false. The same idea happens for “true,” we can specify “1,” and it will be converted to “true.”


- go to 4-boolean-variable folder

> first default = true and execute it
> go to aws console and see ec2 has been created with public IP or not ?






