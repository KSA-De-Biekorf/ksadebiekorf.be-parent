#!/usr/bin/env zsh

# Upload files naar de repository. De verschillende projecten moeten dus al gebuild
# zijn. Op de server zal moet je nog via de terminal de nieuwe repository

set -e

NPM="${NPM:-bun}" # can be npm, pnpm, bun, etc.

# if [[ $1 == "" ]]; then
#   echo "Missing commit message"
#   exit
# fi

# Build website
cd ksadebiekorf.be
$NPM run build

# Publish website
./publish.sh

# Copy .htaccess file
cd ..
cp staticFiles/.htaccess ksadebiekorf.be-dist

# Generate error pages
ruby generate_error_pages.rb

# Copy dashboard
cd ksadebiekorf.be-dist
mkdir -p cgi-bin/mails
chmod 755 cgi-bin
chmod 644 cgi-bin/**/*
# cp ../mailingdashboard cgi-bin/mails

# Git push
# cd ksadebiekorf.be-dist
# git add .
# git commit -m "$1"
# git push
