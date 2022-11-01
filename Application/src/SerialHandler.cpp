#include "SerialHandler.h"

SerialHandler::SerialHandler(QObject *parent)
        : QObject{parent} {

    m_serialPort = new QSerialPort();
    connect(m_serialPort, &QSerialPort::readyRead, this, &SerialHandler::readyRead);
    connect(m_serialPort, &QSerialPort::destroyed, this, &SerialHandler::destroyed);
}

QList<QString> SerialHandler::getAvailableSerialPorts() {
    QList<QString> list;

    Q_FOREACH(QSerialPortInfo port, QSerialPortInfo::availablePorts()) {
            list.append(port.portName());
        }

    return list;
}

bool SerialHandler::updateParameters(QString comPort, QString baudrate, QString dataBits, QString parity, QString stopBits, QString flowControl) {
    qDebug() << "Updating parameters";

    m_comPort = comPort;
    m_baudrate = baudrate.toInt();

    m_dataBits = QSerialPort::UnknownDataBits;
    if (dataBits == "5") {
        m_dataBits = QSerialPort::Data5;
    } else if (dataBits == "6") {
        m_dataBits = QSerialPort::Data6;
    } else if (dataBits == "7") {
        m_dataBits = QSerialPort::Data7;
    } else if (dataBits == "8") {
        m_dataBits = QSerialPort::Data8;
    }

    m_parity = QSerialPort::UnknownParity;
    if (parity == "None") {
        m_parity = QSerialPort::NoParity;
    } else if (parity == "Even") {
        m_parity = QSerialPort::EvenParity;
    } else if (parity == "Odd") {
        m_parity = QSerialPort::OddParity;
    } else if (parity == "Space") {
        m_parity = QSerialPort::SpaceParity;
    } else if (parity == "Mark") {
        m_parity = QSerialPort::MarkParity;
    }

    m_stopBits = QSerialPort::UnknownStopBits;
    if (stopBits == "1") {
        m_stopBits = QSerialPort::OneStop;
    } else if (stopBits == "1.5") {
        m_stopBits = QSerialPort::OneAndHalfStop;
    } else if (stopBits == "2") {
        m_stopBits = QSerialPort::TwoStop;
    }

    m_flowControl = QSerialPort::UnknownFlowControl;
    if (flowControl == "None") {
        m_flowControl = QSerialPort::NoFlowControl;
    } else if (flowControl == "DTR/DSR") {
        m_flowControl = QSerialPort::HardwareControl;
    } else if (flowControl == "RTS/CTS") {
        m_flowControl = QSerialPort::SoftwareControl;
    }

    return true;
}

bool SerialHandler::openSerialPort() {
    qDebug() << "Opening serial port: " << m_comPort;

    m_serialPort->setPortName(m_comPort);
    m_serialPort->setBaudRate(m_baudrate);
    m_serialPort->setDataBits(m_dataBits);
    m_serialPort->setParity(m_parity);
    m_serialPort->setStopBits(m_stopBits);
    m_serialPort->setFlowControl(m_flowControl);

    if (m_serialPort->open(QIODevice::ReadWrite)) {
        emit connectedPort();
        return true;
    } else {
        emit disconnectedPort();
        return false;
    }
}

bool SerialHandler::closeSerialPort() {
    qDebug() << "Closing serial port: " << m_comPort;

    if (m_serialPort->isOpen()) {
        qDebug() << "Serial port is open, closing it";
        m_serialPort->close();
        emit disconnectedPort();
        return true;
    }
    return false;
}

void SerialHandler::readyRead() {
    QByteArray data = m_serialPort->readAll();
    QString str = QString(data);
    emit receivedMessage(str);
}

void SerialHandler::write(QString msg) {
    m_serialPort->write(msg.toLocal8Bit());
}

void SerialHandler::destroyed() {
    emit disconnectedPort();
}
