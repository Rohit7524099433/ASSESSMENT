# Use an official Ubuntu runtime as a parent image
FROM ubuntu:latest

# Update the repository and install necessary packages
RUN apt-get update 
RUN apt-get install -y software-properties-common 
RUN apt-add-repository --yes --update ppa:ansible/ansible 
RUN apt-get install -y ansible sshpass

# Copy your Ansible playbook and inventory file into the container
COPY playbook.yml /playbook.yml
COPY inventory.ini /inventory.ini

# Run the Ansible playbook
CMD ["ansible-playbook", "-i", "inventory.ini", "playbook.yml"]

