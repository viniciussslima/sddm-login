import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    property var onSelect

    anchors.fill: parent
    anchors.margins: 25
    color: "transparent"

    Clock {
        id: clock
        anchors.top: parent.top; anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
    }

    Image {
        source: "../images/arch.png"
        fillMode: Image.PreserveAspectFit
        anchors.left: parent.left; anchors.bottom: parent.bottom
    }

    PowerButtons {
        anchors.horizontalCenter: parent.horizontalCenter; anchors.bottom: parent.bottom
    }

    Image {
        source: "../images/arch.png"
        fillMode: Image.PreserveAspectFit
        anchors.right: parent.right; anchors.bottom: parent.bottom
    }
}