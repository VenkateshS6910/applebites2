#!/bin/bash

# Constants - CHANGE ME!
readonly PROJECT='busyqa'
readonly ZONE='us-central1-a'

time yes | gcloud compute instances delete web-test \
  --project $PROJECT --zone $ZONE --quite

