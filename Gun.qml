import QtQuick 2.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Image {
    id: img
    width: 200
    height: 200
    property bool rounded: true
    property bool adapt: true

    source: "qrc:/new/prefix1/Graphics/gun-4.png"
}


//    transform: Rotation {
//        origin.x: 50
//        origin.y: 50
//        angle: 10
//    }

//    layer.enabled: rounded
//    layer.effect: OpacityMask {
//        maskSource: Item {
//            width: img.width
//            height: img.height

//            Rectangle {
//                anchors.centerIn: parent
//                width: img.adapt ? img.width : Math.min(img.width, img.height)
//                height: img.adapt ? img.height : width
//                radius: Math.min(width, height)
//            }
//        }
//    }
