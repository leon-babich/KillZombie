import QtQuick 2.12
//import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import "Logic.js" as Logic

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Target")
    property int minSide: Math.min(width, height)

    GameArea {
        id: gameArea
        anchors.centerIn: parent
        //anchors.fill: parent

        squareSize: minSide / Logic.numberCols
    }

    Component.onCompleted: {
        Logic.newGameState(gameArea)
    }
}
