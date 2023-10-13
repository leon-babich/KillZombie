import QtQuick 2.0
import QtQuick.Window 2.2
import "Logic.js" as Logic
import QtMultimedia 5.0

Image {
    id: root
    width: 40
    height: 40

    transform: Translate {
        x: -width / 2
        y: -height / 2
    }

    SoundEffect {
        id: soundEffect
        source: "qrc:/new/prefix2/Sounds/sound_shot.wav"
    }

    property variant bullets: [ "qrc:/new/prefix1/Graphics/bullet-1.png", "qrc:/new/prefix1/Graphics/bullet-2.png",
        "qrc:/new/prefix1/Graphics/bullet-3.png", "qrc:/new/prefix1/Graphics/bullet-4.png",
        "qrc:/new/prefix1/Graphics/bullet-5.png", "qrc:/new/prefix1/Graphics/bullet-6.png" ]

    source: bullets [Logic.getRandomRound(0, 5)]

    Timer {
        interval: Logic.getRandomRound(3500, 10000); running: true; repeat: false
        onTriggered: root.opacity = 0.0
    }

    onOpacityChanged: {
        if(opacity == 0.0) {
            root.destroy()
        }
    }

    Behavior on opacity { PropertyAnimation { duration: 100 } }
}
