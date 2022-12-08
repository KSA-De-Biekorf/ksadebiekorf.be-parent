#!/usr/bin/env zsh

# Upload files naar de repository. De verschillende projecten moeten dus al gebuild
# zijn. Op de server zal moet je nog via de terminal de nieuwe repository

set -e

if [[ $1 == "" ]]; then
  echo "Missing commit message"
  exit
fi

# Publish website
cd ksadebiekorf.be
./publish.sh

# Copy .htaccess file
cd ..
cp staticFiles/.htaccess ksadebiekorf.be-dist

cd ksadebiekorf.be-dist
git add .
git commit -m "$1"
git push
