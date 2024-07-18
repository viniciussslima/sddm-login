import QtQuick 2.2

Rectangle {
    property int size
    property color backgroundColor
    property string hoverColor
    property string imageSource
    property var onClickAction
    property color borderColor: "transparent"
    property int borderRadius: 0

    width: size
    height: size
    color: backgroundColor
    border.color: borderColor
    radius: borderRadius

    Image {
        source: imageSource
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
    }

    Behavior on color {
        ColorAnimation {
            duration: 200 
        }
    }

    MouseArea {
        anchors.fill: parent
	    onClicked: {
		    onClickAction()
	    }
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onEntered: {
            parent.color = hoverColor
        }
        onExited: {
            parent.color = backgroundColor
        }
    }

}
