
PROJECT_NAME="GodotShare"
TARGET_NAME="GodotShare"


RELEASE_MODE="Release"

rm -rf plugin/*.xcframework

# Build for iPhoneOS
xcodebuild -project ${PROJECT_NAME}.xcodeproj -target ${TARGET_NAME} -sdk iphoneos -configuration ${RELEASE_MODE}

# Build for iPhone Simulator
xcodebuild -project ${PROJECT_NAME}.xcodeproj -target ${TARGET_NAME} -sdk iphonesimulator -configuration ${RELEASE_MODE}

xcodebuild -create-xcframework \
    -library build/${RELEASE_MODE}-iphonesimulator/lib${TARGET_NAME}.a \
    -library build/${RELEASE_MODE}-iphoneos/lib${TARGET_NAME}.a \
    -output plugin/${PROJECT_NAME}.xcframework
