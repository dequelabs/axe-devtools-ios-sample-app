#!/bin/sh

#  ci_post_xcodebuild.sh
#  axe-devtools-ios-sample-app
#
#  Created by Kate Owens on 7/8/25.
#  

# This would be a good place to handle sending things to Agora/any actions that happen in the release process after tests succeed
# Note: script will run after xcodebuild command even if the xcodebuild command fails
LIST_ENDPOINT="https://agora.dequecloud.com/artifactory/api/storage/Attest-iOS/axeDevToolsXCUI/frameworks"

# List all files in beta directory
LIST_RESPONSE=$(curl -s -X GET "$LIST_ENDPOINT" -H "X-JFrog-Art-Api: $DQ_AGORA_KEY")
echo "$LIST_RESPONSE"
# Check if the response contains any files
FILE_COUNT=$(echo "$LIST_RESPONSE" | jq '.files | length')
echo "$FILE_COUNT"
