#include "soundcore.h"

SoundCore::SoundCore(QObject *parent) : QObject(parent)
{
    playerShot = new QMediaPlayer(this);
    playlistShot = new QMediaPlaylist(playerShot);

    playerShot->setPlaylist(playlistShot);
    playlistShot->addMedia(QUrl("qrc:/new/prefix2/Sounds/sound_shot.wav"));
    playlistShot->setPlaybackMode(QMediaPlaylist::CurrentItemOnce);
    playerShot->setVolume(20);
}

void SoundCore::playSound()
{
    playerShot->play();
}
