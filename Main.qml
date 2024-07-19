import QtQuick 2.0
import SddmComponents 2.0

import "./components"

Rectangle {
    id: container
    anchors.fill : parent

    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    property int sessionIndex: session.index
    property string selectedUser: ""

    TextConstants { id: textConstants }

    function selectUser(username) {
        selectedUser = username
    } 

    function loginAction(password) {
        sddm.login(selectedUser, password, sessionIndex)
    }

    function removeSelectedUser() {        
        selectedUser = ""
    }


    Connections {
        target: sddm

        onLoginSucceeded: {
            errorMessage.color = "steelblue"
            errorMessage.text = textConstants.loginSucceeded
        }

        onLoginFailed: {
            password.text = ""
            errorMessage.color = "red"
            errorMessage.text = textConstants.loginFailed
        }

        onInformationMessage: {
            errorMessage.color = "red"
            errorMessage.text = message
        }
    }

    Background {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
        onStatusChanged: {
            if (status == Image.Error && source != config.defaultBackground) {
                source = config.defaultBackground
            }
        }
    }

    Rectangle {
        anchors.right: parent.right; anchors.verticalCenter: parent.verticalCenter; anchors.rightMargin : 110 
        width: 500
        height: 500
        color: "transparent"

        Column {
            anchors.fill: parent
            spacing: 25

            UsersList {
                onSelect: container.selectUser
                visible: container.selectedUser === ""
                width: parent.width
                height: 150
            }


            Login {
                visible: container.selectedUser !== ""
                width: parent.width
                selectedUser: container.selectedUser
                onSubmit: container.loginAction
                onCancel: container.removeSelectedUser
            }
                
            PowerButtons {}
        }
    }
}