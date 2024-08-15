APP_LOCATION="DerivedData/Build/Products/Debug-iphoneos"
APP_NAME="axe-devtools-ios-sample-app"
CLOUDNAME="<<perfecto-cloud-name>>" #E.g.: demo.perfectomobile.com where 'demo' to be replaced with your cloud name.
TOKEN="<<security-token>>"
JOBNUMBER="1"

rm -rf *.app
# Prepare app files
gradle buildForRealDevice
mv $APP_LOCATION/$APP_NAME.app .
mv $APP_LOCATION/"$APP_NAME"UITests-Runner.app .
# Run on Perfecto cloud
gradle perfecto-xctest -PconfigFileLocation=configFile.json -PcloudURL=$CLOUDNAME.perfectomobile.com -PsecurityToken=$TOKEN -PjobNumber=$JOBNUMBER --stacktrace --debug
rm -rf DerivedData
