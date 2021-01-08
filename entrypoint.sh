#!/bin/sh -x

# Show env info
node -v
hugo version

# Use input parameters
FIREBASE_TOKEN=$1

# Build site
hugo --minify

# Publish to Firebase
firebase use --token $FIREBASE_TOKEN
firebase deploy -m "Trigger: $GITHUB_EVENT_NAME, commit SHA: $GITHUB_SHA" --non-interactive --token $FIREBASE_TOKEN
