APP_LOCATION="DerivedData/Build/Products/Debug-iphoneos"
APP_NAME="axe-devtools-ios-sample-app"

rm -rf *.ipa

xcodebuild build-for-testing -configuration Debug \
       -scheme "axe-devtools-ios-sample-app" \
       -target "axe-devtools-ios-sample-appUITests" \
       -sdk iphoneos \
       -derivedDataPath "./DerivedData" \
       -quiet

mkdir Payload

mv $APP_LOCATION/$APP_NAME.app Payload
zip -r -qq "$APP_NAME.ipa" Payload
rm -rf Payload/*

mv $APP_LOCATION/axe-devtools-ios-sample-appUITests-Runner.app Payload
zip -r -qq "axe-devtools-ios-sample-appUITests-Runner.ipa" Payload

saucectl run

rm -rf Payload
rm -rf DerivedData
