#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickItem>
#include <QDebug>
#include "state_machine.h"
#include "lane_soft.h"

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    //register enum class LS
    qmlRegisterType<LS>("LS", 1, 0, "LS");

    //State machine instantiation
    StateMachine sm;

    // Load the QML and set the Context
    engine.rootContext()->setContextProperty("StateMachine", &sm);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

//    QObject  *someItem = engine.rootObjects().first()->findChild<QObject *>("noticeTitleText");
//    qDebug() << "engine.contextObject(): " << someItem->property("text");

    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();

}
