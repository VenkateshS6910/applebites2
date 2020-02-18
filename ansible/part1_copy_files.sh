#!/bin/bash

# Constants - CHANGE ME!
readonly PROJECT='<project_id>'
readonly ZONE='us-central1-a'


time yes | gcloud compute ssh web-test --zone us-central1-a --command 'sudo yum-config-manager \ --add-repo \  https://download.docker.com/linux/centos/docker-ce.repo'.
time yes | gcloud compute ssh web-test --zone us-central1-a --command 'sudo systemctl start docker'.
time yes | gcloud compute ssh web-test --zone us-central1-a --command 'sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'.
time yes | gcloud compute ssh web-test --zone us-central1-a --command 'sudo chmod +x /usr/local/bin/docker-compose'.
time yes | gcloud compute ssh web-test --zone us-central1-a --command 'git clone https://github.com/VenkateshS6910/applebites.git'.


