import QtQuick 2.15



Rectangle{
    id: root

    property int buttonHeight: 35
    property int buttonWidth: 80
    property string buttonText: "Button"
    property string buttonTextColor: options.textColor
    property string buttonBackgroundColor : "transparent"
    property alias area: mouseArea

    height: buttonHeight
    width: buttonWidth

    Text{
        text: buttonText
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 12
        color: buttonTextColor
        z: 10
    }

    Rectangle{
        id: backgroundRect
        color: buttonBackgroundColor
        border.width: 1
        border.color: options.primaryColor
        radius: options.componentRadius

        anchors.fill: parent
        z: 8
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent

        onClicked:{
            console.log("button clicked")

        }

        onPressed: {
            backgroundRect.color = "#BCB7B7"
            backgroundRect.border.color = "#BCB7B7"
        }

        onReleased: {
            backgroundRect.color = buttonBackgroundColor
            backgroundRect.border.color = options.primaryColor
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}
}
##^##*/
