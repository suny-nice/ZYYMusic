import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Dialogs
import "../basic"

Popup {
    id: colorPopup
    width: 360
    height: 260
    modal: true
    focus: true
    anchors.centerIn: Overlay.overlay
    
    property string playState: "finished"

    property color currentUpColor: BasicConfig.finishedLyricsUpColor
    property color currentDownColor: BasicConfig.finishedLyricsDownColor
    property color currentBorderColor: BasicConfig.finishedLyricsBorderColor
    
    onPlayStateChanged: {
        if (playState === "finished") {
            currentUpColor = BasicConfig.finishedLyricsUpColor
            currentDownColor = BasicConfig.finishedLyricsDownColor
            currentBorderColor = BasicConfig.finishedLyricsBorderColor
        } else {
            currentUpColor = BasicConfig.unFinishedLyricsUpColor
            currentDownColor = BasicConfig.unFinishedLyricsDownColor
            currentBorderColor = BasicConfig.unFinishedLyricsBorderColor
        }
    }
    
    background: Rectangle {
        color: "#25262c"
        radius: 8
        border.width: 1
        border.color: "#3f4350"
    }
    
    // 颜色选择对话框
    ColorDialog {
        id: colorDialog
        title: "选择颜色"
        onAccepted: {
            // 根据当前选中的类型更新对应颜色
            if (currentEditType === "up") {
                colorPopup.currentUpColor = colorDialog.selectedColor
            } else if (currentEditType === "down") {
                colorPopup.currentDownColor = colorDialog.selectedColor
            } else if (currentEditType === "border") {
                colorPopup.currentBorderColor = colorDialog.selectedColor
            }
        }
    }
    
    // 当前正在编辑的颜色类型
    property string currentEditType: ""
    
    // 取消按钮（右上角）
    MouseArea {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 12
        anchors.rightMargin: 12
        width: 20
        height: 20
        onClicked: colorPopup.close()
        
        Image {
            anchors.centerIn: parent
            source: "qrc:/img/quxiao.png"
            width: 16
            height: 16
        }
    }
    
    Column {
        anchors.fill: parent
        anchors.topMargin: 50
        anchors.bottomMargin: 20
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        spacing: 30
        
        // 标题（居中）
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: `更改「${colorPopup.playState === "finished" ? "已播放" : "未播放"}」配色方案`
            color: "#f2f4f8"
            font.pixelSize: 18
            font.bold: true
        }
        
        // 颜色预览行（水平居中）
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            
            // 带渐变的矩形（根据渐变上和渐变下动态更新）
            Rectangle {
                width: 65
                height: 65
                radius: 4
                
                gradient: Gradient {
                    GradientStop { position: 0; color: colorPopup.currentUpColor }
                    GradientStop { position: 1; color: colorPopup.currentDownColor }
                }
            }
            
            // 渐变上、渐变下、描边（使用Repeater）
            Repeater {
                model: [
                    { label: "渐变上", type: "up", color: colorPopup.currentUpColor },
                    { label: "渐变下", type: "down", color: colorPopup.currentDownColor },
                    { label: "描边", type: "border", color: colorPopup.currentBorderColor }
                ]
                
                delegate: Rectangle {
                    width: 65
                    height: 28
                    radius: 14
                    color: "#3a3e4c"
                    anchors.verticalCenter: parent.verticalCenter
                    Row {
                        anchors.centerIn: parent
                        spacing: 5
                        
                        // 显示当前颜色的小方块
                        Rectangle {
                            width: 11
                            height: 11
                            radius: 2
                            color: modelData.type === "up" ? colorPopup.currentUpColor : 
                                   modelData.type === "down" ? colorPopup.currentDownColor : 
                                   colorPopup.currentBorderColor
                        }
                        
                        Text {
                            text: modelData.label
                            color: "#f2f4f8"
                            font.pixelSize: 12
                        }
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                                // 设置当前编辑类型并打开颜色对话框
                                colorPopup.currentEditType = modelData.type
                                colorDialog.selectedColor = modelData.type === "up" ? colorPopup.currentUpColor : 
                                                          modelData.type === "down" ? colorPopup.currentDownColor : 
                                                          colorPopup.currentBorderColor
                                colorDialog.open()
                            }
                    }
                }
            }
        }
        
        // 确认按钮
        Rectangle {
            width: 120
            height: 36
            radius: 18
            color: "#ff4a55"
            anchors.horizontalCenter: parent.horizontalCenter
            
            Text {
                anchors.centerIn: parent
                text: "确认"
                color: "white"
                font.pixelSize: 14
                font.bold: true
            }
            
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    // 根据播放状态更新 BasicConfig 中的颜色配置
                    if (colorPopup.playState === "finished") {
                        BasicConfig.finishedLyricsUpColor = colorPopup.currentUpColor
                        BasicConfig.finishedLyricsDownColor = colorPopup.currentDownColor
                        BasicConfig.finishedLyricsBorderColor = colorPopup.currentBorderColor
                    } else {
                        BasicConfig.unFinishedLyricsUpColor = colorPopup.currentUpColor
                        BasicConfig.unFinishedLyricsDownColor = colorPopup.currentDownColor
                        BasicConfig.unFinishedLyricsBorderColor = colorPopup.currentBorderColor
                    }
                    colorPopup.close()
                }
            }
        }
    }
}