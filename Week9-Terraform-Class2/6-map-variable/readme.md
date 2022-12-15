
- https://developer.hashicorp.com/terraform/language/functions/lookup

If you have some situation where multiple environment with various values then map and loookup will be used.




> lookup({a="ay", b="bee"}, "a", "what?")
ay
> lookup({a="ay", b="bee"}, "c", "what?")
what?

eu-west-1 = "ami-012345" # appserver image in eu-west-1
eu-east-2 = "ami-012345" # appserver image in eu-east-2
us-west-3 = "ami-012345" # appserver image in us-west-3
eu-west-4 = "ami-012345" # appserver image in eu-west-4
eu-west-5 = "ami-012345" # appserver image in eu-west-5


lookup(var.ec2_ami, var.region)

eu-west-1 = "ami-012345"

eu-west-1 --> map
"ami-012345" --> key

- https://awstip.com/terraform-accessing-data-from-maps-and-list-in-the-variable-4a22c0507a5b