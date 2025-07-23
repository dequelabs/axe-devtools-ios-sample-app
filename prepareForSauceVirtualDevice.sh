APP_LOCATION="DerivedData/Build/Products/Debug-iphonesimulator"
APP_NAME="axe-devtools-ios-sample-app"
RUNNER_NAME="RegressionUITests-Runner"

rm -rf $APP_NAME.zip $RUNNER_NAME.zip

xcodebuild build-for-testing -configuration Debug \
  -scheme "axe-devtools-ios-sample-app" \
  -target "RegressionUITests" \
  -sdk iphonesimulator \
  -derivedDataPath "./DerivedData" \
  -quiet \
  EXCLUDED_ARCHS="" \
  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO

zip -r -qq $APP_NAME.zip $APP_LOCATION/$APP_NAME.app
zip -r -qq $RUNNER_NAME.zip $APP_LOCATION/$RUNNER_NAME.app

saucectl run -c ./.sauce/configVirtualDevice.yml

rm -rf DerivedData
