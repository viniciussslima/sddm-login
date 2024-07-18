import QtQuick 2.0
import SddmComponents 2.0

import "./components"

Rectangle {
    id: container
    anchors.fill : parent

    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    property int sessionIndex: session.index

    TextConstants { id: textConstants }

    function loginAction(password) {
        sddm.login("viniciussslima", password, sessionIndex)
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

            Avatar {}

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "viniciussslima"
                color: "white"
                font.pixelSize : 36
            }

            PasswordInput {
                onSubmit: container.loginAction
            }

            Text {
                id: errorMessage
                text: ""
                color: "white"
                font.pixelSize: 24
            }

            PowerButtons {}

        }
    }
}