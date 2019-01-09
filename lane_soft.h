#ifndef LANE_SOFT_H
#define LANE_SOFT_H

#include <QObject>

class LS : public QObject
{
    Q_OBJECT

public:
    //off and on
    enum OffAndOn {
        OFF,
        ON
    };
    Q_ENUM (OffAndOn)

    //signalType
    enum signalType {
        KeyPress,
        Signal
    };
    Q_ENUM (signalType)

    //state machine
    enum MachineStatus {
        WaitingWork,
        WaitingPassCar,
        LogoutConfirm,
        EmergencyConfirm,
        Emergency,
        ExitEmergencyConfirm,
        HolidayConfirm,
        Holiday,
        ExitHolidayConfirm,
        AnalogMenu,
        IllegalCarHandle,


    };
    Q_ENUM (MachineStatus)

    //state machine signal oprate
    enum SignalOprate {
        PasswordAccepted,

    };
    Q_ENUM (SignalOprate)

    //login imp
    enum LoginImpVerifyStatus {
        UsernameWrongPasswordWrong,
        UsernameRightPasswordWrong,
        UsernameRightPasswordRight
    };
    Q_ENUM (LoginImpVerifyStatus)

};

#endif // LANE_SOFT_H
