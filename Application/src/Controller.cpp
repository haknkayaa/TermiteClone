#include "Controller.h"

Controller::Controller(QObject *parent)
        : m_ConnectionStatus(false), QObject{parent} {

    m_serialHandler = new SerialHandler();
    this->setAvailablePorts(m_serialHandler->getAvailableSerialPorts());

    connect(m_serialHandler, &SerialHandler::connectedPort, [=] {
        qDebug() << "Connected. Flag set to true";
        this->setConnectionStatus(true);
    });

    connect(m_serialHandler, &SerialHandler::disconnectedPort, [=] {
        qDebug() << "Disconnected. Flag set to false";
        this->setConnectionStatus(false);
    });

    connect(m_serialHandler, &SerialHandler::receivedMessage, [=](QString msg) {
        qDebug() << "Received message cpp: " << msg;
        emit receivedMessage(msg);
    });
}


bool Controller::ConnectionStatus() const {
    return m_ConnectionStatus;
}

void Controller::setConnectionStatus(bool newConnectionStatus) {
    qDebug() << "ConnectionStatus changed: " << newConnectionStatus;

    if (m_ConnectionStatus == newConnectionStatus)
        return;
    m_ConnectionStatus = newConnectionStatus;
    emit ConnectionStatusChanged();
}

void Controller::setParameters(QString jsonValue) {

    QJsonDocument doc = QJsonDocument::fromJson(jsonValue.toUtf8());
    QJsonObject obj = doc.object();

    m_serialHandler->updateParameters(
            obj["port"].toString(),
            obj["baud rate"].toString(),
            obj["databits"].toString(),
            obj["stopbits"].toString(),
            obj["parity"].toString(),
            obj["flowcontrol"].toString()
    );
}

void Controller::openSerialPort(){
    qDebug() << "Opening serial port";
    m_serialHandler->openSerialPort();
}

void Controller::closeSerialPort() {
    qDebug() << "Closing serial port";
    m_serialHandler->closeSerialPort();
}

const QList<QString> &Controller::AvailablePorts() const {
    return m_AvailablePorts;
}

void Controller::setAvailablePorts(const QList<QString> &newAvailablePorts) {
    if (m_AvailablePorts == newAvailablePorts)
        return;
    m_AvailablePorts = newAvailablePorts;
    emit AvailablePortsChanged();
}

void Controller::sendMessage(QString msg) {
    m_serialHandler->write(msg);
}