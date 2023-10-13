import QtQuick 2.0
import "Logic.js" as Logic

Image {
    id: root
    property int row: 0
    property int col: 0
    property int gap: 4
    property int widthCell: 0
    property int heightCell: 0

//    width: Logic.sizeCell - gap * 2
//    height: Logic.sizeCell - gap * 2
    width: widthCell - gap * 2
    height: heightCell - gap * 2
    x: (col * (width + gap * 2)) + gap;
    y: (row * (height + gap * 2)) + gap;

    source: "qrc:/new/prefix1/Graphics/zomby-2.png"

    Timer {
        interval: Logic.getRandomRound(1500, 2500); running: true; repeat: false;
        onTriggered: root.opacity = 0.0
    }

    onOpacityChanged: {
        if(opacity == 0.0) {
            Logic.gameState.scores--
            Logic.destroyTarget(row, col);
            root.destroy()
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        propagateComposedEvents: true
        onClicked: {
            var scores = isHit(root.width / 2, root.height / 2, mouse.x, mouse.y);
            if(scores != 0) {
                Logic.gameState.scores += scores;
                Logic.destroyTarget(row, col);
                Logic.createBloodEffect(root, mouse.x, mouse.y);
//                root.destroy();
            }
            else {
                mouse.accepted = false;
            }
        }
    }

    Behavior on opacity { PropertyAnimation { duration: 250 } }

    function isHit(a, b, x, y) {
        var length = Math.sqrt(Math.pow(Math.abs(a - x), 2) + Math.pow(Math.abs(b - y), 2));

        if(length <= 5.6) {
            return 5;
        }
        else if(length <= 11.2) {
            return 4;
        }
        else if(length <= 16.8) {
            return 3;
        }
        else if(length <= 22.4) {
            return 2;
        }
        else if(length <= 28) {
            return 1;
        }
        else {
            return 0;
        }
    }
}
