locals {
  testvar = "Variable"
}

output "local_test_var" {
    value = local.testvar
}