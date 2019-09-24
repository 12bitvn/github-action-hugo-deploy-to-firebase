#!/bin/sh

# Show env info
node -v
hugo version

# Use input parameters
FIREBASE_DEPLOY_KEY=$1

# Build site
hugo

# Publish to Firebase
firebase use --token $FIREBASE_DEPLOY_KEY alias
firebase deploy -m "Trigger: $GITHUB_EVENT_NAME, commit SHA: $GITHUB_SHA" --non-interactive --token $FIREBASE_DEPLOY_KEY
mkdir .public
cp -r * .public
mv .public public
