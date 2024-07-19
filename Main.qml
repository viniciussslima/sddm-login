import QtQuick 2.0
import SddmComponents 2.0

import "./components"

Rectangle {
    id: container
    anchors.fill: parent
    color: "#27292C"

    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    property int sessionIndex: session.index
    property string selectedUsername: ""
    property string selectedUserIcon: ""

    TextConstants { id: textConstants }

    function selectUser(username, icon) {
        selectedUsername = username
        selectedUserIcon= icon
    } 

    function loginAction(password) {
        sddm.login(selectedUsername, password, sessionIndex)
    }

    function removeSelectedUser() {        
        selectedUsername = ""
        selectedUserIcon= ""
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


    Content {
        UsersList {
            onSelect: container.selectUser
            visible: container.selectedUsername === ""
        }
    
        Login {
            visible: container.selectedUsername !== ""
            width: parent.width
            selectedUsername: container.selectedUsername
            selectedUserIcon: container.selectedUserIcon
            onSubmit: container.loginAction
            onCancel: container.removeSelectedUser
        }
    }
}