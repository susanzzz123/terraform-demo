# Terraform Demo
Time to get your hands dirty with Terraform! In this demo, you will learn how to use Terraform to create and manage a GitHub repository, similar to how we release your homeworks!

## Prerequisites

Before running this example, you will need the following:

- A GitHub account
- A GitHub personal access token with the following scopes: `repo`, `admin:org`, `admin:repo_hook`, `admin:org_hook`, and `read:user` ([Create GitHub PAT Instructions](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token))
  - You can store this somewhere safe for now, we'll be needing it very soon!
- Terraform installed on your computer ([Terraform Installation Page](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))

## Demo Time
First, look around you and find a partner (or two)! You'll be working together to try to figure out the second part of this demo.

We provided some terraform configuration files for you to use. You can find them in the `terraform` directory. Oftentimes, you want to keep all of your terraform configuration files in a single directory so that you can easily run terraform commands from that directory. In this case, we've provided the terraform configuration files for you, so you don't need to create any new files.

Starting from the `main.tf` file, take a look at the files and try to figure out what they do. You can also take a look at the [Terraform documentation](https://www.terraform.io/docs/index.html) if you need help.

## Demo Time, Part 2
Now that you've had a chance to look at the terraform configuration files, it's time to try to run them! You'll need to do the following:

1. Run the following command to initialize your Terraform project:

```bash
terraform init
```

2. Run the following command to preview the changes that Terraform will make:

```bash
terraform plan
```

3. Run the following command to apply the changes:

```bash
terraform apply
```

This will create a private repository named "cis1880-team-project" in your GitHub account. The collaborators specified in the `main.tf` file will be invited to the repository as well.

Check your GitHub account to make sure that the repository were created successfully.

Once you've verififed that Terraform performed all of the proper changes on GitHub, if we now run `terraform plan` again, Terraform will tell you that there are no more changes to be made:
```bash
No changes. Your infrastructure matches the configuration.
```
This is because Terraform is **declarative** and recognizes that you have already achieved the desired state outlined in your Terraform files. Likewise, if you were to run `terraform apply`, Terraform would not make any further changes because you are already in your desired state.

### Terraform Variables
Notice that when you run `terraform plan` and `terraform apply`, you are prompted to enter your Github personal access token. While this is fine for a demo, it's not ideal for a real project (where we want to keep track of the PAT somewhere instead of having to enter it every time we run terraform commands).

How do we fix this? We want to load it into a file called `terraform.tfvars`. Create a `terraform.tfvars` file in the `terraform` directory and add your GitHub personal access token to it.

> Learn more about Terraform Variables [here](https://www.terraform.io/docs/language/values/variables.html).

4. Run `terraform apply` again
Success, you don't have to enter your GitHub personal access token every time you run terraform commands!

## Write some terraform yourself
Now that you've seen how to use terraform to create a repository, it's time to try to write some terraform yourself!

### Add a TA/Instructor to the Repository
Let's add a TA or instructor to your repository, and give them read-only access. You can also remove members from the list if you'd like.

You can use the [Terraform Input Variables Documentation](https://www.terraform.io/docs/language/values/variables.html) to help you figure out how to do this.

### Secret Variables
Right now, the list of collaborators is stored in plain text in the main.tf file. In CIS 1880, we don't want to do that because we don't want to commit the PennKeys and GitHub usernames of all of our students for the world to see. Instead, we want to store the list of collaborators in a secret variable.

Modify the file so that the list of collaborators is also stored in `terraform.tfvars` and not in `main.tf`.

# Clean-up
When you're finished, you can run the following command to destroy the resources:

```bash
terraform destroy
```
