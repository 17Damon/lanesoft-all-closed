//generic function
//change to special Status
function changeToStatus(_status){
    laneSoft.code = _status;
}

//show login modal
function showLogin_0(){
    //display modal loginDialog
    loginDialog.visible = true;
    //set focus to username input
    loginDialog.usernameFocus = true;
}

//hide login modal
function hideLogin_0(){
    //clear && close the login dailog
    loginDialog.clearAndClose();
    //focus to lanSoft
    laneSoft.focus = true;
}

//login verify
function loginVerify_0(_code, _username){
    switch (_code){
    case LS.UsernameRightPasswordRight:
        //logined
        //change the head username
        laneSoft.username = _username;
        //clear && close the login dailog
        loginDialog.clearAndClose();
        //focus to lanSoft
        laneSoft.focus = true;
        //change system code
        laneSoft.code = LS.WaitingPassCar;
        //turn green
        content1.color = "MediumSpringGreen";
        break;
    case LS.UsernameRightPasswordWrong:
        loginDialog.passwordTipsText = "密码不正确";
        break;
    case LS.UsernameWrongPasswordWrong:
        loginDialog.usernameTipsText = "用户名不正确";
        loginDialog.passwordTipsText = "密码不正确";
        break;
    }
}

// turn on/off canopy led
function turnCanopyLed_1(){
    noticeContentText.text = "";
    if(StateMachine.getCanopyLed() === LS.ON) {
        canopyImage.source = "../images/YupengG.gif";
    }else if (StateMachine.getCanopyLed() === LS.OFF){
        canopyImage.source = "../images/YupengR.gif";
    }
}

//check canopy led and logout
function noticeOffCanopy_1(){
    if(StateMachine.getCanopyLed() === LS.ON){
       //topis turn off canopy led
        noticeContentText.text = "\n下班前请先关闭雨棚灯！";
    }
}

//logout
function logout_2(){
    laneSoft.username = "未登录";
    content1.color = "#696969";
}
