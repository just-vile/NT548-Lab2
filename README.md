Prerequisites:
- You must have a AWS account. If you do, access the AWS CLI with your AWS access key.
- Then create a KeyPair and replace it in the main.tf file in root directory (I use 'mykey.pem')
- You should also replace the 'allowed_ssh_cidr' in main.tf with your IP address to allow your computer to ssh to EC2 machine.

Steps to run this repo:
1. Clone this repo: git clone https://github.com/just-vile/NT548-Lab2.git
2. Create two secrets in your repository (named 'AWS_ACCESS_KEY' and 'AWS_SECRET_KEY'). Just go to Settings -> Secrets and variables -> New repository secret -> create those secrets base on your AWS Access Key.
3. When you completed those above steps, the pipeline in /.github/workflows/ will automatically run and you should have your own AWS Infrastructure.
