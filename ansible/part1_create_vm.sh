#!/bin/bash
#

# Constants - CHANGE ME!
readonly PROJECT='busyqa'
readonly SERVICE_ACCOUNT='busyqa-crm@busyqa.iam.gserviceaccount.com'
readonly ZONE='us-central1-a'

# Create GCE VM with disk storage
time gcloud compute instances create web-test \
  --project $PROJECT \
  --zone $ZONE \
  --machine-type n1-standard-1 \
  --network default \
  --subnet default \
  --network-tier PREMIUM \
  --maintenance-policy MIGRATE \
  --service-account $SERVICE_ACCOUNT \
  --scopes https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
  --tags apache-http-server \
  --image centos-7-v20190116 \
  --image-project centos-cloud \
  --boot-disk-size 50GB \
  --boot-disk-type pd-standard \
  --boot-disk-device-name compute-disk

