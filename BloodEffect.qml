import QtQuick 2.0
import QtQuick.Window 2.2
import "Logic.js" as Logic
import QtMultimedia 5.0

Image {
    id: root
    width: 80
    height: 80

    transform: Translate {
        x: -width / 2
        y: -height / 2
    }

//    SoundEffect {
//        id: soundEffect
//        source: "qrc:/new/prefix2/Sounds/sound_shot.wav"
//    }

    source: "qrc:/new/prefix1/Graphics/blood.png"

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
