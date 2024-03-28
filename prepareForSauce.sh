# Be sure to add your development team to the `axe-devtools-ios-sample-app`` and `RegressionUITests` Targets with 'automatic signing' enabled.
APP_LOCATION="DerivedData/Build/Products/Debug-iphoneos"
APP_NAME="axe-devtools-ios-sample-app"

rm -rf *.ipa

xcodebuild build-for-testing -configuration Debug \
       -scheme "axe-devtools-ios-sample-app" \
       -target "RegressionUITests" \
       -sdk iphoneos \
       -derivedDataPath "./DerivedData" \
       -quiet

mkdir Payload

mv $APP_LOCATION/$APP_NAME.app Payload
zip -r -qq "$APP_NAME.ipa" Payload
rm -rf Payload/*

mv $APP_LOCATION/RegressionUITests-Runner.app Payload
zip -r -qq "RegressionUITests-Runner.ipa" Payload

saucectl run

rm -rf Payload
rm -rf DerivedData
