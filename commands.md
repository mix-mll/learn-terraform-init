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