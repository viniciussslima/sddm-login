import QtQuick 2.2

Item {
    property int size
    property string imageSource

    width: size
    height: size
    anchors.horizontalCenter: parent.horizontalCenter

    ShaderEffect {
        anchors.centerIn: parent
        width: size
        height: size

        property variant source: ShaderEffectSource {
            sourceItem: Image {
                source: imageSource
                width: size
                height: size
                fillMode: Image.PreserveAspectCrop
            }
            width: size
            height: size
        }

        fragmentShader: "
            varying highp vec2 qt_TexCoord0;
            uniform sampler2D source;
            void main() {
                highp vec2 pos = qt_TexCoord0 * 2.0 - 1.0;
                highp float dist = length(pos);
                if (dist < 1.0) {
                    gl_FragColor = texture2D(source, qt_TexCoord0);
                } else {
                    discard;
                }
            }
        "
    }
}