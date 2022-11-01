import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import "ui"
import "js/jsController.js" as JsHandler

Window {
    id: root
    width: 650
    height: 295
    color: options.mainBackground
    title: qsTr("Settings")

    CGroupBox {
        x: 13
        y: 12
        width: 228
        height: 244

        groupTitleText: "Port Configuration"

        Column {

            spacing: 20
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.horizontalCenter: parent.left
            anchors.horizontalCenterOffset: 40

            ListModel {
                id: comPortList
                ListElement {
                    text: "None"
                }

            }

            Text {
                text: "Port"
                anchors.right: parent.right
                font.pixelSize: 12
                color: options.textColor

                CComboBox {
                    id: combobox_port
                    height: 25
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.right
                        leftMargin: 30
                    }

                    model: comPortList
                }
            }

            Text {
                text: "Baud rate"
                anchors.right: parent.right
                font.pixelSize: 12
                color: options.textColor

                CComboBox {
                    id: combobox_baudrate
                    height: 25
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.right
                        leftMargin: 30
                    }

                    model: ["1200", "2400", "4800", "9600", "14400", "19200", "28800", "38400", "57600", "115200", "230400"]
                    currentIndex: 8
                }
            }

            Text {
                text: "Data bits"
                anchors.right: parent.right
                font.pixelSize: 12
                color: options.textColor

                CComboBox {
                    id: combobox_dataBits
                    height: 25
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.right
                        leftMargin: 30
                    }

                    model: ["5", "6", "7", "8"]
                    currentIndex: 3
                }
            }

            Text {
                text: "Stop bits"
                anchors.right: parent.right
                font.pixelSize: 12
                color: options.textColor

                CComboBox {
                    id: combobox_stopBits
                    height: 25
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.right
                        leftMargin: 30
                    }

                    model: ["1", "1.5", "2"]
                    currentIndex: 0
                }
            }

            Text {
                text: "Parity"
                anchors.right: parent.right
                font.pixelSize: 12
                color: options.textColor

                CComboBox {
                    id: combobox_parity
                    height: 25
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.right
                        leftMargin: 30
                    }

                    model: ["None", "Even", "Odd", "Mark", "Space"]
                    currentIndex: 0
                }
            }

            Text {
                text: "Flow control"
                anchors.right: parent.right
                font.pixelSize: 12
                color: options.textColor

                CComboBox {
                    id: combobox_flowControl
                    height: 25
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.right
                        leftMargin: 30
                    }

                    model: ["None", "RTS/CTS", "DTR/DSR", "XON/XOFF"]
                    currentIndex: 0
                }
            }

            Text {
                text: "Forward"
                anchors.right: parent.right
                font.pixelSize: 12
                color: options.textColor

                ListModel {
                    id: comForwardPortList
                    ListElement {
                        text: "None"
                    }

                }

                CComboBox {
                    id: combobox_forwardPort
                    height: 25
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.right
                        leftMargin: 30
                    }

                    model: comForwardPortList
                    currentIndex: 0
                }
            }
        }
    }

    CGroupBox {
        x: 247
        y: 12
        width: 190
        height: 121
        groupTitleText: "Transmitted Text"

        CRadioButton {
            id: radiobutton_appendnothing
            x: 8
            y: 8
            width: 137
            height: 20

            text: "Append nothing"
        }

        CRadioButton {
            id: radiobutton_appendCR
            x: 8
            y: 30
            width: 137
            height: 20

            text: "Append CR"
        }
        CRadioButton {
            id: radiobutton_appendLF
            x: 8
            y: 52
            width: 137
            height: 20

            text: "Append LF"
        }
        CRadioButton {
            id: radiobutton_appendCRLF
            x: 8
            y: 74
            width: 137
            height: 20

            text: "Append CR+LF"
        }

        CCheckBox {
            id: checkbox_localEcho
            x: 8
            y: 96
            width: 137
            height: 20

            text: "Local echo"
        }
    }

    CGroupBox {
        x: 443
        y: 12
        width: 193
        height: 121
        groupTitleText: "Options"

        CCheckBox {
            id: checkbox_stayOnTop
            x: 8
            y: 8
            width: 176
            height: 20

            text: "Stay on top"
        }

        CCheckBox {
            id: checkbox_quitOnEscape
            x: 8
            y: 30
            width: 176
            height: 20

            text: "Quit on Escape"
        }

        CCheckBox {
            id: checkbox_autocompleteEditLine
            x: 8
            y: 52
            width: 176
            height: 20

            text: "Autocomplete edit line"
        }

        CCheckBox {
            id: checkbox_keepHistory
            x: 8
            y: 74
            width: 176
            height: 20

            text: "Keep history"
        }

        CCheckBox {
            id: checkbox_closePortWhenInactive
            x: 8
            y: 96
            width: 176
            height: 20

            text: "Close port when inactive"
        }
    }

    CGroupBox {
        x: 247
        y: 139
        width: 190
        height: 117
        groupTitleText: "Received Text"

        Text {
            id: text1
            x: 8
            y: 11
            text: qsTr("Polling")
            font.pixelSize: 12
            color: options.textColor
        }

        Text {
            id: text2
            x: 8
            y: 37
            text: qsTr("Max. lines")
            font.pixelSize: 12
            color: options.textColor
        }

        Text {
            id: text3
            x: 8
            y: 64
            text: qsTr("Font")
            font.pixelSize: 12
            color: options.textColor
        }

        CCheckBox {
            id: checkbox_enableWordWrap
            x: 8
            y: 89
            width: 174
            height: 20

            text: "Enable word wrap"
        }

        CTextEditArea {
            id: textinput_polling
            x: 82
            y: 5
            width: 100
            height: 25

            text: "100"
            cursorVisible: true
            textFormat: Text.PlainText
        }

        CTextEditArea {
            id: textinput_maxLines
            x: 82
            y: 31
            width: 100
            height: 25

            text: "0"
            textFormat: Text.PlainText
            cursorVisible: true
        }

        CComboBox {
            id: combobox_font
            x: 82
            y: 58
            width: 100
            height: 25

            model: ["Verdana", "Consolas"]
            // currentText: "Verdana"
        }
    }

    CGroupBox {
        x: 443
        y: 139
        width: 193
        height: 117
        groupTitleText: "Plug-ins"
    }

    CButton {
        id: button_cancel
        x: 470
        y: 262
        width: 80
        height: 25

        buttonText: "Cancel"

        area.onClicked: {
            JsHandler.cancelButton()
        }
    }

    CButton {
        id: button_ok
        x: 556
        y: 262
        width: 80
        height: 25

        buttonText: "OK"

        area.onClicked: {
            JsHandler.okButton()
            root.close()
        }
    }

    Text {
        id: text4
        x: 13
        y: 268
        text: qsTr("User interface language")
        font.pixelSize: 12
        color: options.textColor
    }

    CComboBox {
        id: combobox_language
        x: 153
        y: 263
        width: 120
        height: 25

        model: ["English", "Turkish"]
        // currentText: "English"
    }

    Component.onCompleted: {
        JsHandler.updateComList();
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}
}
##^##*/
