import QtQuick 2.15
import QtQuick.Controls 2.15

ComboBox {
    id: root
    model: ["First", "Second", "Third"]

    // Her bir item temsilcisi
    delegate: ItemDelegate {
        id: itemDlgt
        width: root.width
        contentItem: Text {
            text: root.textRole ? (Array.isArray(root.model) ? modelData[root.textRole] : model[root.textRole]) : modelData
            color: "#4F4F4F"
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        background: Rectangle {
            radius: 10
            color: itemDlgt.hovered ? "#F5F5F5" : "#FFFFFF"
            anchors.left: itemDlgt.left
            anchors.leftMargin: 0
            width: itemDlgt.width - 2
        }
        highlighted: root.highlightedIndex === index
    }

    // Sağdaki indikator
    indicator: Canvas {
        id: canvas
        x: root.width - width - root.rightPadding
        y: root.topPadding + (root.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {
            target: root
            function onPressedChanged() {
                canvas.requestPaint()
            }
        }

        onPaint: {
            context.reset()
            context.moveTo(0, 0)
            context.lineTo(width, 0)
            context.lineTo(width / 2, height)
            context.closePath()
            context.fillStyle = "#4F4F4F"
            context.fill()
        }
    }

    // Current item
    contentItem: Text {
        leftPadding: 10
        rightPadding: root.indicator.width + root.spacing
        text: root.displayText
        color: "#4F4F4F"
        verticalAlignment: Text.AlignVCenter
        font.family: "Inter"
        elide: Text.ElideRight
    }

    // Background
    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        border.color: "#4F4F4F"
        border.width: root.visualFocus ? 2 : 1
        radius: 10
    }

    // Popup
    popup: Popup {
        y: root.height + 5
        width: root.width
        implicitHeight: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: root.popup.visible ? root.delegateModel : null
            currentIndex: root.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator {}
        }

        background: Rectangle {
            border.color: "#4F4F4F"
            radius: 10
        }
    }
}
