
QTSHAREUTILS_VERSION = 1.0.0

HEADERS += $$PWD/cpp/shareutils.hpp \
    $$PWD/cpp/applicationui.hpp

SOURCES += \
    $$PWD/cpp/shareutils.cpp \
    $$PWD/cpp/applicationui.cpp

ios {
    # can be placed under ios only, but I prefer to see them always
    OTHER_FILES += $$PWD/ios/src/*.mm

    OBJECTIVE_SOURCES += $$PWD/ios/src/iosshareutils.mm \
        $$PWD/ios/src/docviewcontroller.mm

    HEADERS += $$PWD/cpp/ios/iosshareutils.hpp \
        $$PWD/cpp/ios/docviewcontroller.hpp

}

android {
    QT += androidextras

    SOURCES += $$PWD/cpp/android/androidshareutils.cpp

    HEADERS += $$PWD/cpp/android/androidshareutils.hpp

# can be placed under android only, but I prefer to see them always
OTHER_FILES += $$PWD/android/src/org/ekkescorner/utils/QShareUtils.java \
    $$PWD/android/src/org/ekkescorner/examples/sharex/QShareActivity.java \
    $$PWD/android/src/org/ekkescorner/utils/QSharePathResolver.java
}

# dsshin It cannot find 'cpp/shareutils.hpp'
INCLUDEPATH += \
    $$PWD
