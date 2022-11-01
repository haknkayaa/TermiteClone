#ifndef SERIALHANDLER_H
#define SERIALHANDLER_H

#include <QObject>
#include <QSerialPortInfo>
#include <QtSerialPort/QSerialPort>
#include <QDebug>


class SerialHandler : public QObject
{
    Q_OBJECT
public:
    explicit SerialHandler(QObject *parent = nullptr);

public slots:
    QList<QString> getAvailableSerialPorts();
    bool updateParameters(QString comPort, QString baudrate, QString dataBits, QString parity, QString stopBits, QString flowControl);
    bool openSerialPort();
    bool closeSerialPort();
    void readyRead();
    void destroyed();
    void write(QString msg);
private:
    QSerialPort* m_serialPort;

    QString m_comPort;
    int m_baudrate;
    QSerialPort::DataBits m_dataBits;
    QSerialPort::Parity m_parity;
    QSerialPort::StopBits m_stopBits;
    QSerialPort::FlowControl m_flowControl;

signals:
    void connectedPort();
    void disconnectedPort();
    void receivedMessage(QString msg);
};

#endif // SERIALHANDLER_H
