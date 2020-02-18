#!/bin/bash

# Constants - CHANGE ME!
readonly PROJECT='<project_id>'
readonly ZONE='us-central1-a'

time yes | gcloud compute instances delete web-test \
  --project $PROJECT --zone $ZONE --quite

