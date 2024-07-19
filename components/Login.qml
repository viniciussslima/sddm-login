
import QtQuick 2.2
import QtQuick.Controls 2.15

import "."

Column {
    spacing: 25

    property string selectedUser
    property var onSubmit
    property var onCancel

    function handleLogin(password) {
        onSubmit(password)
    }

    Avatar {
        size: 172
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: selectedUser
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
        text: "Back to user selection"
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