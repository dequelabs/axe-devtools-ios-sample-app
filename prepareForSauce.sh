  APP_LOCATION="DerivedData/Build/Products/Debug-iphoneos"
  APP_NAME=“./apps/axe-devtools-ios-sample-app.ipa”
  xcodebuild -configuration Debug \
           -scheme "axe-devtools-ios-sample-app" \
           -sdk iphoneos \
           -derivedDataPath "./DerivedData"
  mkdir Payload
  mkdir apps
  mv $APP_LOCATION/$APP_NAME.app Payload
  zip -r $APP_NAME Payload
  rm -rf Payload/*
  curl -u "$SAUCE_USERNAME:$SAUCE_ACCESS_KEY" --location \
      --request POST 'https://api.us-west-1.saucelabs.com/v1/storage/upload' \
      --form 'payload=@""' \
      --form 'name=$APP_NAME'
echo $SAUCE_USERNAME
  rm -rf apps
  rm -rf DerivedData