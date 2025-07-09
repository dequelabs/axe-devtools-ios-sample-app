#!/bin/sh

#  ci_post_xcodebuild.sh
#  axe-devtools-ios-sample-app
#
#  Created by Kate Owens on 7/8/25.
#
# Note: script will run after xcodebuild command even if the xcodebuild command fails

LIST_ENDPOINT="https://agora.dequecloud.com/artifactory/api/storage/Attest-iOS/axeDevToolsXCUI/frameworks"

# List all files in framework directory
LIST_RESPONSE=$(curl -s -X GET "$LIST_ENDPOINT" -H "X-JFrog-Art-Api: $DQ_AGORA_KEY")
echo "$LIST_RESPONSE"
# Check if the response contains any files
FILE_COUNT=$(echo "$LIST_RESPONSE" | jq '.files | length')
echo "$FILE_COUNT"
