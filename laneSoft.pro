TEMPLATE = app
TARGET = laneSoft
INCLUDEPATH += .
QT += qml quick

SOURCES += main.cpp \
    imp/login_imp.cpp \
    lane_soft.cpp \
    state.cpp \
    state_machine.cpp

RESOURCES += \
    laneSoft.qrc

OTHER_FILES += \
    qml/main.qml \
    qml/Status.js \
    qml/components/LoginDialog.qml \
    qml/jsImp/generic_imp.js

target.path = $$[QT_INSTALL_EXAMPLES]/quick/laneSoft

INSTALLS += target

DISTFILES +=

HEADERS += \
    imp/login_imp.h \
    lane_soft.h \
    state.h \
    state_machine.h
