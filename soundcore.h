#ifndef SOUNDCORE_H
#define SOUNDCORE_H

#include <QObject>
#include <QMediaPlayer>
#include <QMediaPlaylist>

class SoundCore : public QObject
{
    Q_OBJECT
public:
    explicit SoundCore(QObject *parent = nullptr);

public slots:
    void playSound();

private:
    QMediaPlayer *playerShot;
    QMediaPlaylist *playlistShot;
};

#endif // SOUNDCORE_H
