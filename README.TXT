ELK STACK
Create Multi AZ VPC
    - 2 Public Subnets across AZa and AZb
    - 2 Private Subnets across AZz and Azb
    - Create route table and associate with IGW
    - Associate public subnet with route tabel with IGW where ELB for web server will live.
    - Create main route table and associate with priavet subnets.

Create ELB and place in public subnet and lock down access to cidr_block variable
Create webinstance in multi AZ config with terraform module and lock down access to ELB SG.
Create ELB instances in multi AZ config and restrict access to WEBSG.

Next steps,

Boot strap instance with Ansible using dynamic inventory and tagging to identify instance role. Local exec command would run playbook and be invoked from
inside terraform modules.

In theory this could be executed from 1 command - terraform apply.








