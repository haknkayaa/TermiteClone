import QtQuick 2.15
import QtQuick.Controls 2.15
import "."

TextArea {
    id: control
    color: "#4f4f4f"
    wrapMode: Text.WordWrap
    textFormat: Text.RichText
    font.family: "Inter"
    font.pixelSize: 12
    placeholderText: ""
    placeholderTextColor: options.textColor

    background: Rectangle {
        color: "white"
        implicitWidth: 200
        implicitHeight: 40
        border.color: control.focus ? options.primaryColor : options.secondaryColor
        radius: options.componentRadius
    }
}
