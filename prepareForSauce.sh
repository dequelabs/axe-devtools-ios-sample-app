APP_LOCATION="DerivedData/Build/Products/Debug-iphoneos"
APP_NAME="axe-devtools-ios-sample-app"

rm -rf *.ipa

xcodebuild build-for-testing -configuration Debug \
       -scheme "axe-devtools-ios-sample-app" \
       -target "axe-devtools-ios-sample-appUITests" \
       -sdk iphoneos \
       -derivedDataPath "./DerivedData"

mkdir Payload
mkdir apps

mv $APP_LOCATION/$APP_NAME.app Payload
zip -r "apps/$APP_NAME.ipa" Payload
rm -rf Payload/*

mv $APP_LOCATION/axe-devtools-ios-sample-appUITests-Runner.app Payload
zip -r "apps/axe-devtools-ios-sample-appUITests-Runner.ipa" Payload


#  curl -u "$SAUCE_USERNAME:$SAUCE_ACCESS_KEY.ipa" --location \
#     --request POST 'https://api.us-west-1.saucelabs.com/v1/storage/upload' \
#    --form 'payload=@""' \
#     --form 'name=$APP_NAME'

saucectl run

#rm -rf apps
rm -rf Payload
rm -rf DerivedData
