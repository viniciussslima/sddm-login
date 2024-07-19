
import QtQuick 2.2

import "."

Column {
    spacing: 25

    property string selectedUser

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
        onSubmit: container.loginAction
    }

    Text {
        id: errorMessage
        text: ""
        color: "white"
        font.pixelSize: 24
    }
}