# Project Details
xcodebuild -list

# Analyse
#xcodebuild -project CIExample.xcodeproj -scheme CIExample -sdk iphonesimulator clean analyze

# Build
#xcodebuild -project CIExample.xcodeproj -scheme CIExample build

# Test
#xcodebuild -project CIExample.xcodeproj -scheme CIExample -destination 'platform=iOS Simulator,name=iPhone 12,OS=14.4' test

# Archiving
#xcodebuild -project CIExample.xcodeproj -scheme CIExample -destination generic/platform=iOS archive
