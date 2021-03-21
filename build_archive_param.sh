#!/bin/sh
DERIVED_DATA="DerivedData"

echo "Creating derived data..."
mkdir -p $DERIVED_DATA

echo "Setting parameters..."
APP_NAME="CIExample"
echo "APP_NAME = $APP_NAME"

APP_SCHEME="CIExample"
echo "APP_SCHEME = $APP_SCHEME"

APP_CONFIG="DEBUG"
echo "APP_CONFIG = $APP_CONFIG"

APP_ARCHIVE_PATH="$DERIVED_DATA/$APP_NAME.xcarchive"
echo "APP_ARCHIVE_PATH = $APP_ARCHIVE_PATH"

EXPORT_OPTION="export_development.plist"
echo "EXPORT_OPTION = $EXPORT_OPTION"

DSYM_ZIP="$DERIVED_DATA/$APP_NAME.app.dSYM.zip"
echo "DSYM_ZIP = $DSYM_ZIP"

echo "Archiving..."
xcodebuild archive \
    -project $APP_NAME.xcodeproj \
    -configuration $APP_CONFIG \
    -scheme $APP_SCHEME \
    -archivePath $APP_ARCHIVE_PATH

echo "Exporting..."
xcodebuild -exportArchive \
    -archivePath $APP_ARCHIVE_PATH \
    -exportOptionsPlist $EXPORT_OPTION \
    -exportPath $APP_ARCHIVE_PATH
    
echo "Zip Dsym file for upload..."
zip -r $DSYM_ZIP $APP_ARCHIVE_PATH/dSYMs/*.dSYM

echo "Extracting IPA..."
mv $APP_ARCHIVE_PATH/*.ipa $DERIVED_DATA/${APP_NAME}_${APP_CONFIG}.ipa
