APP_LOCATION="DerivedData/Build/Products/Debug-iphonesimulator"
APP_NAME="axe-devtools-ios-sample-app"

rm -rf *.zip

xcodebuild build-for-testing -configuration Debug \
  -scheme "axe-devtools-ios-sample-app" \
  -target "RegressionUITests" \
  -sdk iphonesimulator \
  -derivedDataPath "./DerivedData" \
  -quiet \
  EXCLUDED_ARCHS="" \
  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO

zip -r -qq axe-devtools-ios-sample-app.zip $APP_LOCATION/$APP_NAME.app
zip -r -qq RegressionUITests-Runner.zip $APP_LOCATION/RegressionUITests-Runner.app

saucectl run -c ./.sauce/configVirtual.yml

rm -rf DerivedData
