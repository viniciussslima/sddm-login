import QtQuick 2.0

import "."

ListView {
    orientation: ListView.Horizontal
    spacing: 5

    property var onSelect

    model: userModel
    delegate: Rectangle {
        width: 150
        height: 150
        color: "transparent"

        Column {
            anchors.fill: parent
            spacing: 10

            Avatar {
                size: 100
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: name
                color: "white"
                font.pixelSize : 24
            }
        }

        MouseArea {
            width: parent.width
            height: parent.height
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                onSelect(name)
            }
        }
    }
}