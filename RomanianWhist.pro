#
# Copyright (c) 2017 Alex Spataru <alex_spataru@outlook.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

#-------------------------------------------------------------------------------
# Make options
#-------------------------------------------------------------------------------

UI_DIR = uic
MOC_DIR = moc
RCC_DIR = qrc
OBJECTS_DIR = obj

#-------------------------------------------------------------------------------
# Qt configuration
#-------------------------------------------------------------------------------

TEMPLATE = app
TARGET = romanian-whist

CONFIG += qtc_runnable
CONFIG += resources_big

QT += xml
QT += svg
QT += core
QT += quick
QT += multimedia
QT += quickcontrols2

DEFINES += QTADMOB_QML

#-------------------------------------------------------------------------------
# Include libraries
#-------------------------------------------------------------------------------

include ($$PWD/lib/QtAdMob/QtAdMob.pri)
include ($$PWD/lib/ShareUtils-QML/ShareUtils-QML.pri)

#-------------------------------------------------------------------------------
# Import source code, QML and resources
#-------------------------------------------------------------------------------

HEADERS += \
    $$PWD/src/AdInfo.h \
    $$PWD/src/Version.h \
    $$PWD/src/Translator.h

SOURCES += \
    $$PWD/src/main.cpp \
    $$PWD/src/Translator.cpp

RESOURCES += \
    $$PWD/assets/qml/qml.qrc \
    $$PWD/assets/icons/icons.qrc \
    $$PWD/assets/images/images.qrc

OTHER_FILES += \
    $$PWD/assets/qml/*.qml \
    $$PWD/assets/qml/Pages/*.qml \
    $$PWD/assets/qml/Components/*.qml

#-------------------------------------------------------------------------------
# Deploy configurations
#-------------------------------------------------------------------------------

linux:!android {
    target.path = /usr/bin
    icon.path = /usr/share/pixmaps
    desktop.path = /usr/share/applications
    icon.files += $$PWD/deploy/linux/blackout-scores.png
    desktop.files += $$PWD/deploy/linux/blackout-scores.desktop
    INSTALLS += target desktop icon
}

android {
    #android:DEFINES += NO_ADS
    #android:DEFINES += REAL_ADS
    #android:DEFINES += TEST_ADS

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/deploy/android
    android:DISTFILES += \
        $$PWD/deploy/android/AndroidManifest.xml \
        $$PWD/deploy/android/build.gradle \
}

win32* {
    RC_FILE = $$PWD/deploy/windows/resources/info.rc
}
