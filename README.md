# Terraform Learning Journey

This repository documents my journey learning **Terraform** and **Infrastructure as Code (IaC)**.

The goal is to learn Terraform by building and managing real infrastructure, mainly on **AWS**, while understanding the concepts behind it.

## What I'm Learning

- Terraform fundamentals
- Providers and resources
- Variables and outputs
- Terraform state
- Terraform modules
- AWS infrastructure
- Dependency management
- Terraform workflow
- Infrastructure as Code best practices
- Remote state
- Terraform security

## Terraform Workflow

The basic workflow I'm practicing is:

```text
Write Configuration
       ↓
terraform init
       ↓
terraform plan
       ↓
terraform apply
       ↓
Infrastructure Created
       ↓
terraform destroy
```
# Terraform Variables

## What are Variables?

Variables allow us to pass values to Terraform without hard-coding them directly into resources.

Instead of:

```hcl
instance_type = "t3.micro"
```

we use:

```hcl
instance_type = var.instance_type
```

## Defining Variables

In `variables.tf`:

```hcl
variable "instance_name" {
  description = "Name of ec2 instance"
  type        = string
}

variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
}
```

This only **defines** the variables and their types.

## Giving Variables Values

In `terraform.tfvars`:

```hcl
instance_name = "hello=world"
ami           = "ami-05bfa4a7765f38076"
instance_type = "t3.micro"
```

This provides the actual values (if it's contain securet keys make sure are ignored in .gitignore !!!!)

## Using Variables

In `main.tf`:

```hcl
resource "aws_instance" "my_instance" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name     = var.instance_name
    ExtraTag = local.extra_tag
  }
}
```

`var.ami`, `var.instance_type`, and `var.instance_name` refer to the variables defined in `variables.tf`.

## Outputs

In `outputs.tf`:

```hcl
output "instance_ip_addr" {
  value = aws_instance.my_instance.private_ip
}

output "instance_dns" {
  value = aws_instance.my_instance.public_dns
}
```

Outputs show information about the infrastructure after Terraform creates it.

You can see them with:

```bash
Outputs:

instance_dns = "ec2_id.your-region.compute.amazonaws.com"
instance_ip_addr = "your_ec2_ip"
```

