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
