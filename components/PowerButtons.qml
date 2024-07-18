import QtQuick 2.2

import "."

Row {
    spacing: 10
    anchors.horizontalCenter: parent.horizontalCenter

    ImageButton {
        id: shutdownButton
        size: 86
        backgroundColor: "#EB5757"
        hoverColor: "#F5ABAB"
        imageSource: Qt.resolvedUrl("../images/power.png")
        onClickAction: sddm.powerOff
        borderRadius: 10
    }

    ImageButton {
        id: rebootButton
        size: 86
        backgroundColor: "#E2B93B"
        hoverColor: "#F0DC9D"
        imageSource: Qt.resolvedUrl("../images/reboot.png")
        onClickAction: sddm.reboot
        borderRadius: 10
    }
}