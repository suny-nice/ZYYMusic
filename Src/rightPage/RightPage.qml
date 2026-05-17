import QtQuick 2.15
import QtQuick.Controls
import "../basic"
import "../topTitle"

Rectangle{
    id:righttRect
    TopTitle{
        id:topTitle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 60
    }

    StackView{
        id:mainStackView
        anchors.top: topTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true
        initialItem: "qrc:/Src/rightPage/CloudMusicCherryPick.qml"
        
        Component.onCompleted: {
            BasicConfig.mainStackView = mainStackView
        }
    }
}