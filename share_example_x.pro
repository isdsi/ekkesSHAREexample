# ekke (Ekkehard Gentz) @ekkescorner
TEMPLATE = app
TARGET = share_example_x

QT += qml quick core

CONFIG += c++11

HEADERS += \

SOURCES += cpp/main.cpp \


lupdate_only {
    SOURCES +=  qml/main.qml
}

OTHER_FILES += data_assets/*.png \
    data_assets/*.pdf \
    translations/*.* \
    *.md \
    ios/*.png \
    docs/*.png \
    LICENSE \
    COPYRIGHT

# IMPORTANT must be included before extensions/vendor
# Default rules for deployment.
# include(deployment.pri)


# Make version info available to C++ and QML
VERSION = 1.0.0

message("QtShareUtils $$VERSION")


# Includes QtFirebase:
include(extensions/QtShareUtils/qtshareutils.pri)



RESOURCES += qml.qrc \
    data_assets.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/res/xml/filepaths.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    data_assets/ekke.jpg

android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
}

ios {
    QMAKE_INFO_PLIST = ios/Info.plist

    QMAKE_IOS_DEPLOYMENT_TARGET = 10.0

    disable_warning.name = GCC_WARN_64_TO_32_BIT_CONVERSION
    disable_warning.value = NO
    QMAKE_MAC_XCODE_SETTINGS += disable_warning

    # see https://bugreports.qt.io/browse/QTCREATORBUG-16968
    # ios_signature.pri not part of project repo because of private signature details
    # contains:
    # QMAKE_XCODE_CODE_SIGN_IDENTITY = "iPhone Developer"
    # MY_DEVELOPMENT_TEAM.name = DEVELOPMENT_TEAM
    # MY_DEVELOPMENT_TEAM.value = your team Id from Apple Developer Account
    # QMAKE_MAC_XCODE_SETTINGS += MY_DEVELOPMENT_TEAM

    include(ios_signature.pri)

    MY_BUNDLE_ID.name = PRODUCT_BUNDLE_IDENTIFIER
    MY_BUNDLE_ID.value = org.ekkescorner.share_example_x
    QMAKE_MAC_XCODE_SETTINGS += MY_BUNDLE_ID

    # Note for devices: 1=iPhone, 2=iPad, 1,2=Universal.
    QMAKE_APPLE_TARGETED_DEVICE_FAMILY = 1,2
}

INCLUDEPATH += \
    $$PWD/extensions/QtShareUtils/cpp
