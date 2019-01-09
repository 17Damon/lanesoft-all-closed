
import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4
import LS 1.0
import "./components"
import "./Status.js" as Status
import "./jsImp/generic_imp.js" as GenericImp

Window {

    id: mianWindow;
    color: "#696969";
    title: "lane software";
    width: 800;
    height: 600;
    //visibility: Window.FullScreen;
    minimumWidth: 800;
    minimumHeight: 600;
    maximumWidth: 800;
    maximumHeight: 600;
    visible: true;

    /**
    * width and height use scale
    * width  30
    * height 22
    */


    Item {
        id: laneSoft
        width: 800;
        height: 600;
        //width: parent.width;
        //height: parent.height;
        anchors.left: parent.left
        anchors.top: parent.top
        focus: true
        property string username: "未登录"
        property int code: StateMachine.getStatus()

        Keys.onPressed: {
            let obj = {
                type: LS.KeyPress,
                keyValue:event.key
            };
            StateMachine.eventListener(obj);
        }

        // Define actions for custom slots
        Connections
        {
            id: stateMachineConnection
            target: StateMachine
            ignoreUnknownSignals: true

            //generic
            //change to spacial Status
            onChangeToStatus: function(_status){
                console.log("onChangeToStatus: ");
                GenericImp.changeToStatus(_status);
            }

            //LS.WaitingWork
            onShowLogin_0: function(){
                console.log("onShowLogin_0: ");
                GenericImp.showLogin_0();
            }

            onHideLogin_0: function(){
                console.log("onHideLogin_0: ");
                GenericImp.hideLogin_0();
            }

            onLoginVerify_0: function(_code, _username){
                console.log("onLoginVerify_0: ");
                GenericImp.loginVerify_0(_code, _username);
            }

            //LS.WaitingPassCar
            onTurnCanopyLed_1: function(){
                console.log("onTurnCanopyLed_1: ");
                GenericImp.turnCanopyLed_1();
            }

            onNoticeOffCanopy_1: function(){
                console.log("onNoticeOffCanopy_1: ");
                GenericImp.noticeOffCanopy_1();
            }

            //LS.LogoutConfirm
            onLogout_2: function(){
                console.log("onLogout_2: ");
                GenericImp.logout_2();
            }


        }

        //head
        Rectangle {
            id: head
            anchors.top: parent.top
            color: "steelblue"
            width: laneSoft.width
            height: laneSoft.height/22

            Text {
                anchors.centerIn: parent
                text: "站名：[吉木萨尔] 车道：[X01] 工号：["+ laneSoft.username +"] [status: "+laneSoft.code+"]"
                color: "white"
                font.capitalization: Font.AllLowercase
            }
        }

        //content1
        Rectangle {
            id: content1
            anchors.top: head.bottom
            color: "#696969";
            width: laneSoft.width
            height: laneSoft.height/22*6

            Row {
                anchors.fill: parent
                spacing: 3
                topPadding: 3
                leftPadding: 3

                //vehicle
                Rectangle {
                    id: vehicle
                    color: content1.color
                    width: laneSoft.width/30*6
                    height: parent.height

                    Column {
                        anchors.fill: parent
                        spacing: 3

                        Rectangle {
                            id: vehicleHead
                            color: "#f5f5f5"
                            width: parent.width
                            height: parent.height/6

                            Text {
                                anchors.centerIn: parent
                                text: "车辆"
                                color: "black"
                                font.capitalization: Font.AllLowercase
                            }
                        }

                        Rectangle {
                            id: vehicleContent
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6*4-12

                        }

                        Rectangle {
                            id: vehicleBottom
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6
                        }
                    }

                }

                //enterInfo
                Rectangle {
                    id: enterInfo
                    color: content1.color
                    width: laneSoft.width/30*6
                    height: parent.height

                    Column {
                        anchors.fill: parent
                        spacing: 3

                        Rectangle {
                            id: enterInfoHead
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6

                            Text {
                                anchors.centerIn: parent
                                text: "入口信息"
                                color: "black"
                                font.capitalization: Font.AllLowercase
                            }
                        }

                        Rectangle {
                            id: enterInfoContent
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6*4-12

                        }

                        Rectangle {
                            id: enterInfoBottom
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6
                        }
                    }

                }

                //amount
                Rectangle {
                    id: amount
                    color: content1.color
                    width: laneSoft.width/30*4
                    height: parent.height

                    Column {
                        anchors.fill: parent
                        spacing: 3

                        Rectangle {
                            id: amountHead
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6

                            Text {
                                anchors.centerIn: parent
                                text: "金额"
                                color: "black"
                                font.capitalization: Font.AllLowercase
                            }
                        }

                        Rectangle {
                            id: amountContent
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6*4-12

                        }

                        Rectangle {
                            id: amountBottom
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6
                        }
                    }

                }

                //payMethod
                Rectangle {
                    id: payMethod
                    color: content1.color
                    width: laneSoft.width/30*4
                    height: parent.height

                    Column {
                        anchors.fill:parent
                        spacing: 3

                        Rectangle {
                            id: payMethodHead
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6

                            Text {
                                anchors.centerIn: parent
                                text: "支付方式"
                                color: "black"
                                font.capitalization: Font.AllLowercase
                            }
                        }

                        Rectangle {
                            id: payMethodContent
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6*4-12

                        }

                        Rectangle {
                            id: payMethodBottom
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6
                        }
                    }

                }

                //deviceStatus
                Rectangle {
                    id: deviceStatus
                    color: content1.color
                    width: laneSoft.width/30*10-18
                    height: parent.height

                    Column {
                        anchors.fill: parent
                        spacing: 3

                        Rectangle {
                            id: deviceStatusHead
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6

                            Text {
                                anchors.centerIn: parent
                                text: "设备状态"
                                color: "black"
                                font.capitalization: Font.AllLowercase
                            }
                        }

                        Rectangle {
                            id: deviceStatusContent
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/6*4-12

                            Row {
                                anchors.fill: parent
                                spacing: 0

                                Rectangle {
                                    id: deviceStatusContent1
                                    color: vehicleHead.color
                                    width: parent.width/8*2
                                    height: parent.height

                                    Column {
                                        anchors.fill: parent
                                        spacing: 0

                                        Rectangle {
                                            id: dSC1Top
                                            color: vehicleHead.color
                                            width: parent.width
                                            height: parent.height/2

                                            Image {
                                                id: dSC1TopImage
                                                anchors.centerIn: parent
                                                width: parent.width
                                                height: parent.height
                                                fillMode: Image.PreserveAspectFit
                                                source: "./images/BaojingA.gif"
                                                //source: "./images/bmPrinterG.png"
                                            }
                                        }

                                        Rectangle {
                                            id: dSC1Bottom
                                            color: vehicleHead.color
                                            width: parent.width
                                            height: parent.height/2

                                            Image {
                                                id: dSC1BottomImage
                                                anchors.centerIn: parent
                                                width: parent.width
                                                height: parent.height
                                                fillMode: Image.PreserveAspectFit
                                                source: "./images/JiaotongR.gif"
                                                //source: "./images/bmPrinterG.png"
                                            }

                                        }

                                    }
                                }

                                Rectangle {
                                    id: deviceStatusContent2
                                    color: vehicleHead.color
                                    width: parent.width/8*3
                                    height: parent.height

                                    Image {
                                        id: dSC2Image
                                        anchors.centerIn: parent
                                        width: parent.width
                                        height: parent.height
                                        fillMode: Image.PreserveAspectFit
                                        //                                        source: "./images/AutoLanganDown.gif"
                                        source: "./images/AutoLanganUp.gif"
                                    }

                                }

                                Rectangle {
                                    id: deviceStatusContent3
                                    color: vehicleHead.color
                                    width: parent.width/8*3
                                    height: parent.height

                                    Column {
                                        anchors.fill: parent
                                        spacing: 0

                                        Rectangle {
                                            id: dSC3Top
                                            color: vehicleHead.color
                                            width: parent.width
                                            height: parent.height/2

                                            Row {
                                                anchors.fill: parent
                                                spacing: 0

                                                Rectangle {
                                                    id: dSC3TopLeft
                                                    color: vehicleHead.color
                                                    width: parent.width/3
                                                    height: parent.height

                                                    Text {
                                                        anchors.centerIn: parent
                                                        text: "到达"
                                                        color: "black"
                                                        font.capitalization: Font.AllLowercase
                                                    }
                                                }

                                                Rectangle {
                                                    id: dSC3TopRight
                                                    color: vehicleHead.color
                                                    width: parent.width/3*2
                                                    height: parent.height

                                                    Image {
                                                        id: dSC3TopImage
                                                        anchors.centerIn: parent
                                                        width: parent.width/10*8
                                                        height: parent.height/10*8
                                                        fillMode: Image.PreserveAspectFit
                                                        //                                                        source: "./images/CarGo.gif"
                                                        source: "./images/CarArrive.gif"
                                                    }

                                                }

                                            }

                                        }

                                        Rectangle {
                                            id: dSC3Bottom
                                            color: vehicleHead.color
                                            width: parent.width
                                            height: parent.height/2



                                            Row {
                                                anchors.fill: parent
                                                spacing: 0

                                                Rectangle {
                                                    id: dSC3BottomLeft
                                                    color: vehicleHead.color
                                                    width: parent.width/3
                                                    height: parent.height

                                                    Text {
                                                        anchors.centerIn: parent
                                                        text: "离开"
                                                        color: "black"
                                                        font.capitalization: Font.AllLowercase
                                                    }
                                                }

                                                Rectangle {
                                                    id: dSC3BottomRight
                                                    color: vehicleHead.color
                                                    width: parent.width/3*2
                                                    height: parent.height

                                                    Image {
                                                        id: dSC3BottomImage
                                                        anchors.centerIn: parent
                                                        width: parent.width/10*8
                                                        height: parent.height/10*8
                                                        fillMode: Image.PreserveAspectFit
                                                        source: "./images/CarGo.gif"
                                                        //source: "./images/CarArrive.gif"
                                                    }

                                                }

                                            }

                                        }

                                    }

                                }

                            }

                        }

                        Rectangle {
                            id: deviceStatusBottom
                            color: content1.color
                            width: parent.width
                            height: parent.height/6

                            //weight
                            Row {
                                anchors.fill: parent
                                spacing: 3

                                Rectangle {
                                    id: weightContent1
                                    color: vehicleHead.color
                                    width: parent.width/9*2
                                    height: parent.height

                                }

                                Rectangle {
                                    id: weightLabel
                                    color: vehicleHead.color
                                    width: parent.width/9*3
                                    height: parent.height

                                    Text {
                                        anchors.centerIn: parent
                                        text: "重量"
                                        color: "black"
                                        font.capitalization: Font.AllLowercase
                                    }

                                }

                                Rectangle {
                                    id: weightContent2
                                    color: vehicleHead.color
                                    width: parent.width/9*4-6
                                    height: parent.height

                                }

                            }
                        }
                    }
                }

            }

        }

        //content2
        Rectangle {
            id: lastVehicle
            anchors.top: content1.bottom
            color: content1.color
            width: parent.width
            height: parent.height/22

            Row {
                anchors.fill: parent
                spacing: 3
                leftPadding: 3

                Rectangle {
                    id: lastVContent1
                    color: vehicleHead.color
                    width: parent.width/29*13
                    height: parent.height-3

                }

                Rectangle {
                    id: lastVContent2
                    color: vehicleHead.color
                    width: parent.width/29*6-4.5
                    height: parent.height-3

                    Text {
                        anchors.centerIn: parent
                        text: "运营"
                        color: "black"
                        font.capitalization: Font.AllLowercase
                    }

                }

                Rectangle {
                    id: lastVContent3
                    color: vehicleHead.color
                    width: parent.width/29*6-4.5
                    height: parent.height-3

                    Text {
                        id: lastVContent3Text
                        anchors.centerIn: parent
                        text: "人工"
                        color: "black"
                        font.capitalization: Font.AllLowercase
                    }

                }

                Rectangle {
                    id: lastVContent4
                    color: vehicleHead.color
                    width: parent.width/29*4-6
                    height: parent.height-3

                }

            }
        }

        //content3
        Rectangle {
            id: operateInfo
            anchors.top: lastVehicle.bottom
            color: content1.color
            width: parent.width
            height: parent.height/22*14

            Row {
                anchors.fill: parent
                spacing: 3
                leftPadding: 3

                Rectangle {
                    id: info
                    color: content1.color
                    width: parent.width/29*13
                    height: parent.height-3

                    Column {
                        anchors.fill: parent
                        spacing: 3

                        Rectangle {
                            id: infoTop
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/13*5

                            Text {
                                id: tipsText
                                anchors.top: parent.top
                                anchors.left: parent.left
                                text: "提示:\n"+Status.statusList()[laneSoft.code].topis
                                color: "black"
                                font.capitalization: Font.AllLowercase
                            }

                        }

                        Rectangle {
                            id: infoBottom
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/13*8-3
                        }
                    }
                }

                Rectangle {
                    id: operate
                    color: content1.color
                    width: parent.width/29*16-9
                    height: parent.height-3

                    Column {
                        anchors.fill: parent
                        spacing: 3

                        Rectangle {
                            id: operateTop
                            color: content1.color
                            width: parent.width
                            height: parent.height/14*11-3

                            Row {
                                anchors.fill: parent
                                spacing: 3

                                Rectangle {
                                    id: operateTLeft
                                    color: content1.color
                                    width: parent.width/16*12+0.5
                                    height: parent.height

                                    Column {
                                        anchors.fill: parent
                                        spacing: 3

                                        Rectangle {
                                            id: operateTLTop
                                            color: vehicleHead.color
                                            width: parent.width
                                            height: parent.height/11*10-3
                                        }

                                        Rectangle {
                                            id: operateTLBottom
                                            color: vehicleHead.color
                                            width: parent.width
                                            height: parent.height/11
                                        }

                                    }
                                }

                                Rectangle {
                                    id: operateTRight
                                    color: vehicleHead.color
                                    width: parent.width/16*4-3.5
                                    height: parent.height
                                }

                            }
                        }

                        Rectangle {
                            id: operateBottom
                            color: vehicleHead.color
                            width: parent.width
                            height: parent.height/14*3

                            Row {
                                anchors.fill: parent
                                spacing: 0

                                Rectangle {
                                    id: canopyLed
                                    color: vehicleHead.color
                                    width: parent.width/80*13
                                    height: parent.height

                                    Image {
                                        id: canopyImage
                                        anchors.centerIn: parent
                                        width: parent.width/10*8
                                        height: parent.height/10*8
                                        fillMode: Image.PreserveAspectFit
                                        source: "./images/YupengR.gif"
                                    }
                                }

                                Rectangle {
                                    id: printer
                                    color: vehicleHead.color
                                    width: parent.width/80*13
                                    height: parent.height

                                    Image {
                                        id: printerImage
                                        anchors.centerIn: parent
                                        width: parent.width/10*9
                                        height: parent.height/10*9
                                        fillMode: Image.PreserveAspectFit
                                        source: "./images/bmPrinterR.png"
                                        //                                        source: "./images/bmPrinterG.png"
                                    }
                                }

                                Rectangle {
                                    id: cardBox
                                    color: vehicleHead.color
                                    width: parent.width/80*12
                                    height: parent.height

                                    Column {
                                        anchors.fill: parent
                                        spacing: 0

                                        Rectangle {
                                            id: cardBoxTitle
                                            color: vehicleHead.color
                                            width: parent.width
                                            height: parent.height/16*3

                                            Text {
                                                id: cardBoxTitleText
                                                anchors.centerIn: parent
                                                text: "卡箱信息"
                                                color: "black"
                                                font.capitalization: Font.AllLowercase
                                            }

                                        }

                                        Rectangle {
                                            id: cardBoxContentBox
                                            color: vehicleHead.color
                                            width: parent.width
                                            height: parent.height/16*13

                                            Rectangle {
                                                id: cardBoxContent
                                                anchors.top: parent.top
                                                color: "LightSteelBlue"
                                                width: parent.width-3
                                                height: parent.height/9*8

                                                Text {
                                                    id: cardBoxContentText
                                                    anchors.centerIn: parent
                                                    text: "00008\n1/500"
                                                    color: "MediumBlue"
                                                    font.capitalization: Font.AllLowercase
                                                }

                                            }
                                        }
                                    }

                                }

                                Rectangle {
                                    id: noticeBox
                                    color: vehicleHead.color
                                    width: parent.width/80*42
                                    height: parent.height

                                    Column {
                                        anchors.fill: parent
                                        spacing: 0

                                        Rectangle {
                                            id: noticeTitle
                                            color: vehicleHead.color
                                            width: parent.width
                                            height: parent.height/16*3

                                            Text {
                                                id: noticeTitleText
                                                objectName: "noticeTitleText"
                                                anchors.centerIn: parent
                                                text: "通知信息"
                                                color: "black"
                                                font.capitalization: Font.AllLowercase
                                            }

                                        }

                                        Rectangle {
                                            id: noticeContentBox
                                            color: vehicleHead.color
                                            width: parent.width
                                            height: parent.height/16*13

                                            Rectangle {
                                                id: noticeContent
                                                anchors.top: parent.top
                                                color: "MediumSpringGreen"
                                                width: parent.width-3
                                                height: parent.height/9*8

                                                Text {
                                                    id: noticeContentText
                                                    anchors.top: parent.top
                                                    anchors.left: parent.left
                                                    text: ""
                                                    color: "black"
                                                    font.capitalization: Font.AllLowercase
                                                }

                                            }
                                        }
                                    }
                                }
                            }
                        }

                    }

                }
            }

        }

        LoginDialog {
            id: loginDialog
            visible: false

            onAccepted:function(_obj){
                StateMachine.eventListener(_obj);
            }

            onVisibleChanged: function() {
                if(loginDialog.visible === false)
                    console.log("onVisibleChanged: ", loginDialog.visible )

            }

        }

    }

}
