import QtQuick
import QtQuick.Controls
import "./Src"
import "./Src/basic"
import "./Src/commonUI"
ZYYWindow{
       id: mainWindow
        // 底部播放栏 - 先定义
        PlayMusic{
            id:bottomRect
            height: BasicConfig.playerBarHeight
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            color: BasicConfig.colorPlayerBarBg
        }
        
        // 左侧面板
        LeftPage{
            id:leftRect
            width: BasicConfig.leftPaneWidth
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: bottomRect.top
            color: BasicConfig.colorWindowLeftBg
        }
        
        // 右侧面板
        RightPage{
            id:rightRect
            anchors.left: leftRect.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: bottomRect.top
            color: BasicConfig.colorWindowRightBg
        }
    }
