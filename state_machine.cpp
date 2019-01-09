#include <QtDebug>
#include "state_machine.h"
#include "lane_soft.h"

void StateMachine::setStatus(int _state)
{
    this->status = _state;
    emit changeToStatus(this->status);
}

int StateMachine::getStatus()
{
    return this->status;
}

void StateMachine::setCanopyLed(int _canopyLed)
{
    this->canopyLed = _canopyLed;
}

int StateMachine::getCanopyLed()
{
    return this->canopyLed;
}

//eventListener
void StateMachine::eventListener(QVariantMap _obj)
{
    int type = _obj["type"].toInt();
    //select type
    switch (type) {
    //signalType KeyPress start
    case LS::KeyPress:
        //select Key Value
        key(_obj);
        break;
        //signalType Signal
    case LS::Signal:
        signal(_obj);
        break;
    }

}

void StateMachine::key(QVariantMap _obj)
{
    //select status
    switch (getStatus()) {
    //LS.WaitingWork
    case LS::WaitingWork:
        key_0(_obj);
        break;
    case LS::WaitingPassCar:
        key_1(_obj);
        break;
    case LS::LogoutConfirm:
        key_2(_obj);
        break;

    }
}

void StateMachine::signal(QVariantMap _obj)
{
    //select status
    switch (getStatus()) {
    //LS.WaitingWork
    case LS::WaitingWork:
        signal_0(_obj);
        break;

    }

}

//LS.WaitingWork
void StateMachine::key_0(QVariantMap _obj)
{
    int keyValue = _obj["keyValue"].toInt();
    //select Key Value
    qDebug() << "keyValue: " << keyValue;
    switch (keyValue) {
    //press A start to login
    case Qt::Key_A:
        emit showLogin_0();
        break;
        //press ESC to close login
    case Qt::Key_Escape:
        emit hideLogin_0();
        break;
    }
}

//LS.WaitingWork
void StateMachine::signal_0(QVariantMap _obj)
{
    int signalType = _obj["signalType"].toInt();
    switch (signalType){
    //password accepted
    case LS::PasswordAccepted:
        signal_0_0(_obj);
        break;
    }
}

void StateMachine::signal_0_0(QVariantMap _obj)
{
    LoginImp logimp;
    QString username = _obj["username"].toString();
    QString password = _obj["password"].toString();
    int code = logimp.loginVerify(username, password);
    if (code == LS::UsernameRightPasswordRight){
        setStatus(LS::WaitingPassCar);
    }
    emit loginVerify_0(code, username);
}

//LS.WaitingPassCar
void StateMachine::key_1(QVariantMap _obj)
{
    int keyValue = _obj["keyValue"].toInt();
    //select Key Value
    qDebug() << "keyValue: " << keyValue;
    switch (keyValue) {
    //press A start to login
    // turn on/off canopy led
    case Qt::Key_H:
        if(getCanopyLed() == LS::ON) {
           setCanopyLed(LS::OFF);
        }else if (getCanopyLed() == LS::OFF){
            setCanopyLed(LS::ON);
        }
        emit turnCanopyLed_1();
        break;
        //check canopy led and logout
    case Qt::Key_B:
        if (getCanopyLed() == LS::OFF){
            setStatus(LS::LogoutConfirm);
        }
        emit noticeOffCanopy_1();
        break;
    }
}

//LS.LogoutConfirm
void StateMachine::key_2(QVariantMap _obj)
{
    int keyValue = _obj["keyValue"].toInt();
    //select Key Value
    qDebug() << "keyValue: " << keyValue;
    switch (keyValue){
    // turn on/off canopy led
    case Qt::Key_Enter:
        setStatus(LS::WaitingWork);
        emit logout_2();
        break;
        //check canopy led and logout
    case Qt::Key_Escape:
        setStatus(LS::WaitingPassCar);
        break;
    }
}

