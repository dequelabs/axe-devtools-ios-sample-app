#!/bin/sh

#  ci_pre_xcodebuild.sh
#  axe-devtools-ios-sample-app
#
#  Created by Kate Owens on 7/8/25.
#  

set -e

echo "✅ Pre-Xcodebuild Script Starting"

cd "$CI_WORKSPACE" || exit 1

brew install gh
gh auth status


#cd "$CI_WORKSPACE" || exit 1
echo "📂 Current working directory: $(pwd)"
ls -la

PLIST_PATH=$(find . -name Info.plist) #"axe-devtools-ios-sample-app/axe-devtools-ios-sample-app/Info.plist"
echo "$(PLIST_PATH)"
