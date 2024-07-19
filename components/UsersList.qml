import QtQuick 2.0
import SddmComponents 2.0

import "."

ListView {
    property var onSelect
    property int itemWidth: 150

    id: list
    model: userModel
    orientation: ListView.Horizontal
    anchors.centerIn: parent
    width: itemWidth * model.count
    spacing: 5

    delegate: Rectangle {
        width: list.itemWidth
        height: list.itemWidth
        color: "transparent"

        Column {
            anchors.fill: parent
            spacing: 10

            Avatar {
                size: 100
                imageSource: icon
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
                onSelect(name, icon)
            }
        }
    }
}