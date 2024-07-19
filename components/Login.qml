
import QtQuick 2.2
import QtQuick.Controls 2.15

import "."

Rectangle {
    property string selectedUsername
    property string selectedUserIcon
    property var onSubmit
    property var onCancel

    anchors.centerIn: parent

    function handleLogin(password) {
        onSubmit(password)
    }

    Column {
        anchors.centerIn: parent
        spacing: 25

        Avatar {
            size: 172
            imageSource: selectedUserIcon
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: selectedUsername
            color: "white"
            font.pixelSize : 36
        }

        PasswordInput {
            onSubmit: handleLogin
        }

        Text {
            id: errorMessage
            text: ""
            color: "white"
            font.pixelSize: 24
        }

        Text {
            text: "Go back to user selection"
            color: "#2F80ED"
            font.pixelSize: 16
            font.underline: true

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    onCancel()
                }
            }
        }
    }
}