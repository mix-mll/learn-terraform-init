# terraform tutorial 


# define a list in file like variables.tf
variable "x" {
  type        = list(string)
  default     = [
    "10.0.101.0/24",
    "10.0.102.0/24",
  ]
}


# Open a console with the terraform console command.
```
    terraform console
```

# explore a variable, an element using [i] or a slice
The slice() function takes three arguments: the list to slice, the start index, and the end index (exclusive).
```
    terraform console
    var.x
    var.x[0]
    slice(var.x, 0, 2)
```

# Leave the console by typing exit or pressing Control-D.
```
    exit
```

# map variable Setting the type to map(string) tells Terraform to expect strings for the values in the map. Map keys are always strings. 
```
  variable "resource_tags" {
    description = "Tags to set for all resources"
    type        = map(string)
    default     = {
      project     = "project-alpha",
      environment = "dev"
    }
  }
```

# explor the map
```
  terraform console
  var.resource_tags["environment"]
```

# Apply this configuration now, using the -var command line flag
```
  terraform apply -var ec2_instance_type=t2.micro
```


# using a variable file
Terraform automatically loads all files in the current directory with the exact name terraform.tfvars or matching *.auto.tfvars. You can also use the -var-file flag to specify other files by name.


# string interpolation
Terraform configuration supports string interpolation — inserting the output of an expression into a string. This allows you to use variables, local values, and the output of functions to create strings in your configuration.

```tf
  name = "web-sg-${var.resource_tags["project"]}-${var.resource_tags["environment"]}"
```


# variable validatiions
The regexall() function takes a regular expression and a string to test it against, and returns a list of matches found in the string. In this case, the regular expression will match a string that contains anything other than a letter, number, or hyphen.
```tf
variable "r_tag" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {
    id     = "my-project",
    env = "dev"
  }

  validation {
    condition     = length(var.r_tag["id"]) <= 16 && length(regexall("[^a-zA-Z0-9-]", var.r_tag["id"])) == 0
    error_message = "The id tag must be no more than 16 characters, and only contain letters, numbers, and hyphens."
  }

}

```

Now test the validation rules by specifying an environment tag that is too long. Notice that the command will fail and return the error message specified in the validation block.
```
terraform apply -var='resource_tags={project="my-project",environment="development"}'
```