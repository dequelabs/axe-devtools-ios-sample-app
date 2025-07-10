#!/bin/sh

#  ci_post_xcodebuild.sh
#  axe-devtools-ios-sample-app
#
#  Created by Kate Owens on 7/8/25.
#
# Note: script will run after xcodebuild command even if the xcodebuild command fails
cd "$CI_WORKSPACE" || exit 1

PLIST_PATH="YourApp/Info.plist"

# Configure Git
git config user.name "kateowens12"
git config user.email "kate.owens@deque.com"
git remote set-url origin "https://x-access-token:$GH_TOKEN@github.com/dequelabs/axe-devtools-ios-sample-app.git"

CURRENT_VERSION=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "$PLIST_PATH")
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"

# Bump patch (you can make this configurable)
PATCH=$((PATCH + 1))
NEW_VERSION="$MAJOR.$MINOR.$PATCH"

# Set new version in Info.plist
/usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString $NEW_VERSION" "$PLIST_PATH"

# Commit and tag
git add "$PLIST_PATH"
git commit -m "ci: bump version to v$NEW_VERSION"
git tag "v$NEW_VERSION"

# Push to GitHub
git push origin "$CI_BRANCH"
git push origin "v$NEW_VERSION"

# Optional: create GitHub release
gh release create "v$NEW_VERSION" \
  --title "v$NEW_VERSION" \
  --generate-notes \
  --draft

# MARK: Testing out interacting with Agora through Xcode Cloud workflow
LIST_ENDPOINT="https://agora.dequecloud.com/artifactory/api/storage/Attest-iOS/axeDevToolsXCUI/frameworks"

# List all files in framework directory
LIST_RESPONSE=$(curl -s -X GET "$LIST_ENDPOINT" -H "X-JFrog-Art-Api: $DQ_AGORA_KEY")
echo "$LIST_RESPONSE"

# Check if the response contains any files
FILE_COUNT=$(echo "$LIST_RESPONSE" | jq '.files | length')
echo "$FILE_COUNT"
