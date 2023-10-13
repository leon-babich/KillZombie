import QtQuick 2.0
import QtQuick.Layouts 1.1

RowLayout {
    height: 40
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.leftMargin: 6
    anchors.rightMargin: 6
    spacing: 6
    z: 100

    property alias scores: scores.text
//    property alias xPos: xPos.text

    Text {
        text: qsTr("Scores")

        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: scores

        font.pixelSize: 20
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

//    Text {
//        text: qsTr("Pos X")

//        font.pixelSize: 20
//        verticalAlignment: Text.AlignVCenter
//        horizontalAlignment: Text.AlignHCenter
//    }

//    Text {
//        id: xPos

//        font.pixelSize: 20
//        verticalAlignment: Text.AlignVCenter
//        horizontalAlignment: Text.AlignHCenter
//    }

    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}
