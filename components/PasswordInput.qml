import QtQuick 2.2
import SddmComponents 2.0

import "."

Row {
    property var onSubmit

    function handleSubmit() {
        onSubmit(passwordField.text)
    }

    PasswordBox {
        id: passwordField
        width: 414; height: 43
        font.pixelSize: 16
        focus: true

        Keys.onPressed: {
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                handleSubmit()
                event.accepted = true
            }
        }
    }

    ImageButton {
        size: 43
        backgroundColor: "#2F80ED"
        hoverColor: "#97BFF6"
        imageSource: Qt.resolvedUrl("../images/right.png")
        onClickAction: handleSubmit
    }
}