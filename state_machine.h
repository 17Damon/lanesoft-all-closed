#ifndef STATE_MACHINE_H
#define STATE_MACHINE_H

#include <QKeyEvent>
#include <QObject>
#include "imp/login_imp.h"
#include "lane_soft.h"

class StateMachine : public QObject
{
    Q_OBJECT

signals:
    void changeToStatus(int _status);

    void showLogin_0();
    void hideLogin_0();
    void loginVerify_0(const int _code, const QString _username);

    void noticeOffCanopy_1();
    void turnCanopyLed_1();

    void logout_2();

public slots:
    void eventListener(QVariantMap _obj);
    int getStatus();
    int getCanopyLed();
public:
    StateMachine()
    {
        status = LS::WaitingWork;
        canopyLed = LS::OFF;
    }

protected:

private:
    int status;
    int canopyLed;

    void setStatus(int _status);
    void setCanopyLed(int _canopyLed);
    void key(QVariantMap _obj);
    void signal(QVariantMap _obj);
    void key_0(QVariantMap _obj);
    void signal_0(QVariantMap _obj);
    void signal_0_0(QVariantMap _obj);
    void key_1(QVariantMap _obj);
    void key_2(QVariantMap _obj);

};

#endif // STATE_MACHINE_H
