#!/bin/sh

#  ci_post_clone.sh
#  axe-devtools-ios-sample-app
#
#  Created by Kate Owens on 7/8/25.
#  

# Things we could do in this file during our CI/CD process:
# Install GH CLI tool via homebrew
# Add dependencies

set -e

curl --compressed -H "X-JFrog-Art-Api: $DQ_AGORA_KEY" "https://agora.dequecloud.com/artifactory/axe-devtools-reporter-cli/prod/4.8.0/pkgs/@axe-devtools/reporter-cli-macos" --output ci_post_clone.sh
chmod +x ci_post_clone.sh
