import QtQuick 2.0
import "Logic.js" as Logic
import SoundCore 1.0
import QtMultimedia 5.0

Rectangle {
    id: greed
    property int squareSize: 64
    property int widthCell: width / cols
    property int heightCell: height / rows
    property int rows: Logic.numberRows
    property int cols: Logic.numberCols
    property int scores: 0
    property int xPos: 0

    width: parent.width
    height: parent.height
    //color: "black"
//    Logic.widthCell: widthCell
//    Logic.heightCell: heightCell
//    width: rows * squareSize
//    height: cols * squareSize
//    widthCell: width / cols
//    heightCell: height / rows

    SoundCoreModel {
        id: soundModel
    }

    InfoBar {
        id: infoBar
        scores: greed.scores
    }

    Gun {
        id: gun
        x: MouseArea.mouseX
        y: MouseArea.mouseY
    }

    SoundEffect {
        id: soundEffect
        source: "qrc:/new/prefix2/Sounds/sound_shot.wav"
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged: {
            gun.x = mouse.x
            gun.y = mouse.y
        }

        onClicked: {
            soundEffect.play()
            Logic.createBullet(greed, mouse.x, mouse.y);
            greed.scores--;
        }
    }

    Timer {
        id: createTargetsTimer
        interval: 1000; running: true; repeat: true

        onTriggered: {
            var targetRow = Logic.getRandomRound(0, rows - 1)
            var targetCol = Logic.getRandomRound(0, cols - 1)

            if(Logic.checkEmptyField(targetRow, targetCol)) {
                Logic.createTarget(greed, targetRow, targetCol, widthCell, heightCell);
            }
        }
    }
}


