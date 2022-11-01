#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>

#include "SerialHandler.h"
#include "SettingsHandler.h"

class Controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool ConnectionStatus READ ConnectionStatus WRITE setConnectionStatus NOTIFY ConnectionStatusChanged)
    Q_PROPERTY(QList<QString> AvailablePorts READ AvailablePorts WRITE setAvailablePorts NOTIFY AvailablePortsChanged)

public:
    explicit Controller(QObject *parent = nullptr);

    bool ConnectionStatus() const;
    const QList<QString> &AvailablePorts() const;


public slots:
    void setConnectionStatus(bool newConnectionStatus);
    void setAvailablePorts(const QList<QString> &newAvailablePorts);
    void setParameters(QString jsonValue);
    void sendMessage(QString msg);
    void openSerialPort();
    void closeSerialPort();

signals:
    void ConnectionStatusChanged();
    void AvailablePortsChanged();
    void receivedMessage(QString msg);

private:
    bool m_ConnectionStatus;
    QList<QString> m_AvailablePorts;

    SerialHandler* m_serialHandler;
    SettingsHandler* m_settingsHandler;

};

#endif // CONTROLLER_H
