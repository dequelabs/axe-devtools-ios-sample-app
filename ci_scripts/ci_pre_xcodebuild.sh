#!/bin/sh

#  ci_pre_xcodebuild.sh
#  axe-devtools-ios-sample-app
#
#  Created by Kate Owens on 7/8/25.
#  

set -e

gh auth login
gh pr list --state open
