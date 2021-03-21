#!/bin/sh

BUILD_PATH="build"

echo "Archiving..."
xcodebuild archive \
    -project CIExample.xcodeproj \
    -scheme CIExample \
    -configuration Debug \
    -archivePath $BUILD_PATH/CIExample.xcarchive

echo "Exporting..."
xcodebuild -exportArchive \
    -archivePath $BUILD_PATH/CIExample.xcarchive \
    -exportOptionsPlist export_development.plist \
    -exportPath $BUILD_PATH/CIExample.xcarchive
    
echo "Zip Dsym file for upload..."
zip -r $BUILD_PATH/CIExample.app.dSYM.zip $BUILD_PATH/CIExample.xcarchive/dSYMs/*.dSYM

echo "Extracting IPA..."
mv $BUILD_PATH/CIExample.xcarchive/*.ipa $BUILD_PATH/CIExample.ipa

echo "Application Location = "$BUILD_PATH/CIExample.ipa
