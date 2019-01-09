import QtQuick 2.11
import QtQuick.Controls 2.4
import LS 1.0

Item {
    id: dialogComponent
    anchors.fill: parent
    property alias usernameFocus: username.focus
    property alias usernameText: username.text
    property alias passwordText: password.text
    property alias usernameTipsText: usernameTips.text
    property alias passwordTipsText: passwordTips.text
    signal accepted(variant _obj)

    function clearAndClose(){
        dialogComponent.usernameText="";
        dialogComponent.passwordText="";
        dialogComponent.usernameTipsText="";
        dialogComponent.passwordTipsText="";
        dialogComponent.visible = false;
    }

    // Add a simple animation to fade in the popup
    // let the opacity go from 0 to 1 in 400ms
    PropertyAnimation { target: dialogComponent; property: "opacity";
        duration: 400; from: 0; to: 1;
        easing.type: Easing.InOutQuad ; running: true }

    // This rectange is the a overlay to partially show the parent through it
    // and clicking outside of the 'dialog' popup will do 'nothing'
    Rectangle {
        anchors.fill: parent
        id: overlay
        color: "#000000"
        opacity: 0.6
        // add a mouse area so that clicks outside
        // the dialog window will not do anything
        MouseArea {
            anchors.fill: parent
        }

    }

    // This rectangle is the actual popup
    Rectangle {
        id: dialogWindow
        width: parent.width/2
        height: parent.height/12*5
        radius: 10
        anchors.centerIn: parent

        Rectangle {
            width: parent.width/8*5
            height: parent.height/5*2
            anchors.centerIn: parent

            Column {
                anchors.fill: parent
                spacing: 3

                Rectangle {
                    width: parent.width
                    height: 30

                    Row {
                        anchors.fill:parent
                        spacing: 3

                        Rectangle {
                            width: parent.width/4
                            height: parent.height

                            Text {
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                text: "用户名"
                                color: "black"
                                font.capitalization: Font.AllLowercase
                            }

                        }



                        Rectangle {
                            width: parent.width/4*3-3
                            height: parent.height
                            border.color: "silver"

                            TextInput{
                                id:username
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height/2
                                validator:  RegExpValidator { regExp: /^[0-9]*$/ }
                                maximumLength: 8

                                onTextEdited: function() {
                                    //more than 8 chars auto go password input
                                    if(username.text.length === 8){
                                        password.focus = true
                                    }
                                    //clear tips before edit input
                                    if(usernameTips.text !== "" || passwordTips.text !== "" ){
                                        usernameTips.text = ""
                                        passwordTips.text = ""
                                    }

                                }

                                Keys.onPressed: {

                                    switch (event.key){
                                        //press Enter to go password input
                                    case Qt.Key_Enter:
                                        password.focus = true
                                        break;
                                    }

                                }

                            }

                        }

                    }

                }

                Rectangle {
                    width: parent.width
                    height: 20

                    Label {
                        id: usernameTips
                        x: parent.width/5
                        anchors.verticalCenter: parent.verticalCenter
                        color: "red"
                        font.capitalization: Font.AllLowercase
                    }

                }

                Rectangle {
                    width: parent.width
                    height: 30

                    Row {
                        anchors.fill:parent
                        spacing: 3

                        Rectangle {
                            width: parent.width/4
                            height: parent.height

                            Text {
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                text: "密码"
                                color: "black"
                                font.capitalization: Font.AllLowercase
                            }
                        }


                        Rectangle {
                            width: parent.width/4*3-3
                            height: parent.height
                            border.color: "silver"

                            TextInput{
                                id:password
                                anchors.centerIn: parent
                                width: parent.width
                                height: parent.height/2
                                validator:  RegExpValidator { regExp: /^[0-9]*$/ }
                                maximumLength: 8

                                onTextEdited: function() {
                                    if(usernameTips.text !== "" || passwordTips.text !== "" ){
                                        usernameTips.text = ""
                                        passwordTips.text = ""
                                    }
                                }

                                onAccepted:{
                                    let obj = {
                                        type: LS.Signal,
                                        signalType: LS.PasswordAccepted,
                                        username: username.text,
                                        password: password.text
                                    }

                                    dialogComponent.accepted(obj);
                                }

                            }

                        }

                    }

                }

                Rectangle {
                    width: parent.width
                    height: 20

                    Label {
                        id: passwordTips
                        x: parent.width/5
                        anchors.verticalCenter: parent.verticalCenter
                        color: "red"
                        font.capitalization: Font.AllLowercase

                    }

                }

            }

        }

    }

}
