#include <QtDebug>
#include "login_imp.h"
#include "lane_soft.h"

int LoginImp::loginVerify(QString _username, QString _password)
{    
    int code = LS::UsernameWrongPasswordWrong;
    if(_username == "88888888") {
        if(_password == "123456"){
            code = LS::UsernameRightPasswordRight;
        }else {
            code = LS::UsernameRightPasswordWrong;
        }
    }else {
        code = LS::UsernameWrongPasswordWrong;
    }

    return code;
}
