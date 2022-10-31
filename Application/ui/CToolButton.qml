import QtQuick 2.15
import "."

CButton {
    buttonText: ""
    buttonHeight: 34
    buttonWidth: 36
    z: 9

    Image {
        source: "qrc:/resource/send-one.png"
        fillMode: Image.PreserveAspectFit
        height: 24
        width: 24
        z: 10

        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
    }
}
