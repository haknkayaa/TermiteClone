import QtQuick 2.15
import QtQuick.Controls 2.15
import "."

RadioButton {
    id: control
    text: qsTr("RadioButton")
    checked: false

    indicator: Rectangle {
        implicitWidth: 20
        implicitHeight: 20
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 13
        border.color: options.primaryColor
        color: control.checked ? options.primaryColor : "white"
        anchors.verticalCenter: parent.verticalCenter

        Image{
            source: "qrc:/resource/tick.png"
            fillMode: Image.PreserveAspectFit
            visible: control.checked ? true : false

            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    contentItem: Text {
        text: control.text
        font.pixelSize: 12
        color: options.textColor
        opacity: enabled ? 1.0 : 0.3
        verticalAlignment: Text.AlignVCenter
        leftPadding: control.indicator.width + control.spacing
    }

    MouseArea{
        anchors.fill: parent

        onClicked: {
            control.checked = !control.checked
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:4}
}
##^##*/
