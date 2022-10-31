import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: control
    color: "#4f4f4f"
    placeholderText: qsTr("Enter description")

    font.bold: false
    font.family: "Inter"

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        color: "white"
        border.color: control.focus ? options.primaryColor : options.secondaryColor
        radius: options.componentRadius
    }
}
