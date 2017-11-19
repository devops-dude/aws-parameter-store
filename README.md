
# aws-parameter-store is a Ruby app for creating, deleting and retrieving a list of parameters


## Documentation

This project uses the [AWS Ruby sdk] https://aws.amazon.com/documentation/sdk-for-ruby/

Currently you can use the following commands:

```
rake create
```
Creates parameter store parameters and values from the parameter.yml file.

```
rake delete
```
Cleans up parameters created by the parameter.yml file.

```
rake check
```

Checks each parameter store in parameter store and ouputs their values.