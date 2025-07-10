#!/bin/sh

#  ci_pre_xcodebuild.sh
#  axe-devtools-ios-sample-app
#
#  Created by Kate Owens on 7/8/25.
#  

set -e

brew install gh
gh auth status
gh pr list --state open
