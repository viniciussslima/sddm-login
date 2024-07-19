import QtQuick 2.2

Item {
    width: 172
    height: 172
    anchors.horizontalCenter: parent.horizontalCenter

    ShaderEffect {
        anchors.centerIn: parent
        width: 172
        height: 172

        property variant source: ShaderEffectSource {
            sourceItem: Image {
                source: "../images/person.png" // TODO: get the user avatar
                width: 172
                height: 172
                fillMode: Image.PreserveAspectCrop
            }
            width: 172
            height: 172
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