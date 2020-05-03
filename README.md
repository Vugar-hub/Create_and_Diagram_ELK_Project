# Create_and_Diagram_ELK_Project
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
(Images/Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - filebeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

- Load balancing ensures that the application will be highly accessible, in addition to restricting attacks to the network. Also, load balancing improves application responsiveness. It also increases availability of applications and websites for users. 
  Jump Box is the VM that I use as a gateway. That help me easily jump to my related VM's by using Jump Box. How I do that? I configure docker container and run ansible. This way creates flexibility to SSH my VMs on Azure environment. Furthermore, Jump Box locates between Internet and VMs which is plays valuable role to protect data in trusted zone. Main reason is that requares multiple SSH sessions to get to the data that important to me. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- Filebeat help for centralizing and forwarding log data. Filebeat monitors log files and loctions that we specify, collects log events and forwards to the Elasticsearch that configured on ELK-Server.
- Metricbeat is also a log shipper that collects and ships various system and service metrics to the ELK-Server. This specific beat helps us analyzing and monitoring performance, as well as that of different external services running on them. It helps us to identify unfamiliar processes and services.

The configuration details of each machine may be found below.

|    Name    |   Function  | Private IP Address | Operating System |
|:----------:|:-----------:|:------------------:|:----------------:|
| Jump Box   |   Gateway   |      10.0.0.4      |       Linux      |
| ELK-Server |  Log Server |      10.0.0.5      |       Linux      |
| DVWA-1     | Create Logs |      10.0.0.8      |       Linux      |
| DVWA-2     | Create Logs |      10.0.0.9      |       Linux      |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the ELK-Server machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
99.228.162.120

Machines within the network can only be accessed by SSH connection.
- Connection to ELK-Server is allowed only from Jump Box (10.0.0.4) from trusted inner network and from my personal Windows machine (99.228.162.120).

A summary of the access policies in place can be found in the table below.

|    Name    | Publicly Accessible | Allowed IP Addresses       |
|:----------:|---------------------|----------------------------|
| Jump Box   |          No         |             N/A            |
| ELK-Server |         Yes         | 99.228.162.120 10.0.0.0/24 |
| DVWA-1     |          No         |          10.0.0.4          |
| DVWA-2     |          No         |          10.0.0.4          |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it helps to achive our goals to deploy and operate services on servers automatively.
The playbook implements the following tasks:
- Install docker.io
- Install pip
- Install Docker python module
- Increase virtual memory
- Download and launch a docker elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
(Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- DVWA-1 & DVWA-2

We have installed the following Beats on these machines:
- Filebeat & Metricbeat installed and running perfectly.

These Beats allow us to collect the following information from each machine:
- Filebeat collects audit, server, event, authentication ..ect logs. For example, if we will analize auth.log and see too many authentication attempts then we can realize that someone want to get in.
- Metricbeat collect performance and unfamiliar service logs. For example, if CPU performance getting slow that gives us an idea about maybe outsource service running in the server.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the YAML file to /etc/ansible.
- Update the "hosts" file to include IP addresses associated to specific VMs. -- In hosts file you must specify Server groups and add IP addresses associatedto this servers.
- Run the playbook, and navigate to "http://40.78.8.159:5601/" to check that the installation worked as expected. --This is my ELK-Server URL and Elasticsearch runs on it.

