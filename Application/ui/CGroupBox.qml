import QtQuick 2.15

Rectangle {
    property string groupTitleText: "Default Title"


    color: "transparent"
    border.color: options.secondaryColor
    border.width: 1
    radius: 8

    Rectangle{
        color: options.mainBackground
//            color: "red" // only test
        width: groupBoxTitle.width + 6
        height: groupBoxTitle.height

        Text{
            id: groupBoxTitle
            text: groupTitleText
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
            color: options.secondaryColor
        }

        anchors{
            left: parent.left
            leftMargin: 10
            top: parent.top
            topMargin: -6

        }
    }


}
