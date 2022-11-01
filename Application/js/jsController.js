function connection(){
    // does not work
    if(Controller.ConnectingStatus == false){
        console.log("Connecting...")
        Controller.openSerialPort();
    }else{
        console.log("Disconnecting...")
        Controller.closeSerialPort();
    }
}

function clearTextArea() {
    textEditArea.text = ""
}

function closeApplication(){
    Qt.quit()
}

function sendMessage(){
    var currentText = textEditLine.text;
    textEditArea.text = textEditArea.text + "> " + currentText;

    textEditLine.text = ""

    Controller.sendMessage(currentText);
}

function showSettingsDialog(){
    var component = Qt.createComponent("qrc:/OptionDialog.qml")
    var window    = component.createObject(root)
    window.show()
}

function updateComList(){
    // for combobox_port
    comPortList.clear();

    comPortList.append({text: "None"});
    for (var i = 0; i < Controller.AvailablePorts.length; i++)  {
        console.log(Controller.AvailablePorts[i]);
        comPortList.append({text: Controller.AvailablePorts[i]});
    }

    combobox_port.currentIndex = 1;

    // for combobox_forwardPort
    comForwardPortList.clear();

    comForwardPortList.append({text: "None"});
    for (var j = 0; j < Controller.AvailablePorts.length; j++)  {
        comForwardPortList.append({text: Controller.AvailablePorts[j]});
    }

    combobox_forwardPort.currentIndex = 0;
}

function showAboutDialog(){
    console.log("Showing about...");
}

// OptionDialog --------------------------------------------
function cancelButton(){

}

function okButton(){
    console.log("\nPort Parameters -----------------------" +
                "\nPort       : " + combobox_port.currentText +
                "\nBaud rate  : " + combobox_baudrate.currentText +
                "\nDatabits   : " + combobox_dataBits.currentText +
                "\nStopbits   : " + combobox_stopBits.currentText +
                "\nParity     : " + combobox_parity.currentText +
                "\nFlowControl: " + combobox_flowControl.currentText +
                "\nForward    : " + combobox_forwardPort.currentText)

    var jsonObj = {
        'port': combobox_port.currentText,
        'baud rate': combobox_baudrate.currentText,
        'databits' : combobox_dataBits.currentText,
        'stopbits': combobox_stopBits.currentText,
        'parity': combobox_parity.currentText ,
        'flowcontrol': combobox_flowControl.currentText,
        'forward': combobox_forwardPort.currentText,
        'appendMode' : radiobutton_appendnothing.checked ? "nothing" : (radiobutton_appendCR.checked ? "CR": (radiobutton_appendLF.checked ? "LF" : (radiobutton_appendCRLF.checked ? "CRLF" : "null"))),
        'enableLocalEcho': checkbox_localEcho.checked,
        'enableStayOnTop' : checkbox_stayOnTop.checked,
        'enableQuitOnEscape': checkbox_quitOnEscape.checked,
        'enableAutocompleteEditLine' : checkbox_autocompleteEditLine.checked,
        'enableKeepHistory' : checkbox_keepHistory.checked,
        'enableClosePortWhenInactive' : checkbox_closePortWhenInactive.checked,
        'polling' : textinput_polling.text,
        'maxLines' : textinput_maxLines.text,
        'font': combobox_font.currentText,
        'enableWordWrap': checkbox_enableWordWrap.checked,
        'language': combobox_language.currentText
    };

    // console.log(JSON.stringify(jsonObj));
    Controller.setParameters(JSON.stringify(jsonObj));
}

