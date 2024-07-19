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


    Content {
        UsersList {
            onSelect: container.selectUser
            visible: container.selectedUser === ""
        }
    
        Login {
            visible: container.selectedUser !== ""
            width: parent.width
            selectedUser: container.selectedUser
            onSubmit: container.loginAction
            onCancel: container.removeSelectedUser
        }
    }
}