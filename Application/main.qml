import QtQuick 2.15
import QtQuick.Window 2.15
import "ui"

Window {
    id: root
    width: 580

    height: 390
    visible: true
    title: qsTr("Termite Clone (with Qt/QML)")
    color: "#F5F5F5"

    ThemeOptions{
        id: options
    }

    CButton {
        id: btn_settings
        x: 251
        y: 9
        width: 75
        height: 35

        buttonHeight: 35
        buttonWidth: 80
        buttonText: "Settings"

        area.onClicked: {
            console.log("hello main.qml")

            var component = Qt.createComponent("OptionDialog.qml")
            var window    = component.createObject(root)
            window.show()
        }
    }



    CTextEditArea {
        id: textEditArea
        x: 10
        y: 50
        width: 557
        height: 291

        text: "Program is initialized and ready.
Type a string in the edit line (below) and press 'Enter'"
    }

    CTextEditArea {
        id: textEditLine
        x: 10
        y: 347
        width: 516
        height: 35


        text: "Your message..."
    }

    CButton {
        id: btn_connect
        x: 10
        y: 9
        width: 235
        height: 35

        buttonText: "COM1, 57600 bps, 8N1, No Handshake"
        buttonTextColor: "white"
        buttonBackgroundColor: options.primaryColor

    }

    CButton {
        id: btn_clear
        x: 330
        y: 9
        width: 75
        height: 35

        buttonText: "Clear"
    }

    CButton {
        id: btn_about
        x: 411
        y: 9
        width: 75
        height: 35

        buttonText: "About"
    }

    CButton {
        id: btn_close
        x: 492
        y: 9
        width: 75
        height: 35

        buttonText: "Close"
    }

    CToolButton {
        id: btn_send
        x: 532
        y: 347

        buttonWidth: 35
        buttonHeight: 35
    }




}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
