provider "aws" {
  region = "us-east-1"
}
provider "vault" {
 address = "http://100.26.136.95:8200"
 skip_child_token = true

 auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "306daf8b-3b14-2b79-39de-a80519c2d8b4"
      secret_id = "5b88c840-6976-d17c-3ac8-034712230e1c"
    }
 }

}

data "vault_kv_secret_v2" "my_secret" {
  mount = "secret"
  name = "test-secret"
}

/*resource "aws_instance" "my_example" {
  ami = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"

  tags = {
    my-secret = data.vault_kv_secret_v2.my_secret.data["currentsecret"]
  }
}*/
