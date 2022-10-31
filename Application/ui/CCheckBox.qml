import QtQuick 2.15
import QtQuick.Controls 2.15
import "."

CheckBox {
    id: control
    text: qsTr("CheckBox")
    checked: true

    indicator: Rectangle {
        implicitWidth: 20
        implicitHeight: 20
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: 3
        border.color: options.primaryColor
        color: control.checked ? options.primaryColor : "white"

        Image{
            source: "qrc:/resource/tick.png"
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    contentItem: Text {
        text: control.text
        opacity: enabled ? 1.0 : 0.3
        font.pixelSize: 12
        color: options.textColor
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
    D{i:0;formeditorZoom:1.5}
}
##^##*/
