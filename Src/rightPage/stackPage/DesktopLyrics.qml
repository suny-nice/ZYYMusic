import QtQuick 2.15
import QtQuick.Controls
import "../../basic"
import "../../commonUI"
import "../../topTitle"


Item {
    width: parent.width
    height: 450
    // 字体
    property  list<string> fonts : ["默认", "仿宋", "华文宋体", "华文仿宋", "华文新魏", "华文楷体", "华文细黑", "华文行书", "华文隶书", "宋体", "幼圆", "微软雅黑", "微软雅黑 Light", "新宋体", "方正姚体", "方正舒体"]
    
    // 根据index返回对应的model数组
    function getModelByIndex(idx) {
        if (idx === 0) {
            return fonts
        } else if (idx === 1) {
            var sizeList = []
            for (var i = 20; i <= 96; i++) {
                sizeList.push(String(i))
            }
            return sizeList
        } else if (idx === 2) {
            return ["标准", "加粗"]
        } else if (idx === 3) {
            return ["有描边", "无描边"]
        }
        return []
    }
    
    // 根据index返回默认选中的索引
    function getDefaultIndex(idx) {
        if (idx === 0) {
            return fonts.indexOf("默认")
        } else if (idx === 1) {
            return 3
        } else {
            return 0
        }
    }

    Label{
        id:desktopLyrics
        color: "white"
        font.bold: true
        text: "桌面歌词"
        font.pixelSize: 15
        width: 30
    }
    Column{
        anchors.left: desktopLyrics.right
        anchors.right: parent.right
        anchors.leftMargin: 70
        spacing: 20
        Row{
            spacing: 15
            Repeater{
                model: ["启用桌面歌词", "启用歌词总在前面", "外文歌词显示", "外文歌词显示音译"]
                ZYYCheckbox{
                    text:modelData
                    checked: false
                }
            }
        }
        Row{
            spacing: 20
            Repeater {
                model: ["字体", "字号", "字粗", "描边"]

                delegate: Column {
                    spacing: 15
                    Label {
                        text: modelData
                        color: "white"
                        font.pixelSize: 13
                    }

                    ZYYComboBox {
                        id: comboBox
                        width: 100
                        height: 30
                        
                        // 根据index设置对应的model
                        model: getModelByIndex(index)
                        
                        // 根据index设置默认选中项
                        currentIndex: getDefaultIndex(index)
                    }
                }
            }
        }
        
        // 调整样式
        Column{
            spacing: 15
            Label {
                text: "调整样式"
                color: "white"
                font.pixelSize: 14
            }
            Row{
                spacing: 20
                Repeater {
                    model: [
                        ["单行显示", "并排显示"],
                        ["横排显示", "竖排显示"],
                        ["居中", "左对齐", "右对齐"]
                    ]

                    ZYYComboBox {
                        width: 120
                        height: 30
                        model: modelData
                        currentIndex: 0
                    }
                }
            }
        }
        
        // 歌词颜色设置
        Column{
            spacing: 20
            
            // 自定义下拉框
            Label {
                text: "歌词颜色"
                color: "white"
                font.pixelSize: 14
            }
            Row {
                spacing: 20
                ZYYComboBox {
                    width: 120
                    height: 30
                    model: ["自定义", "周易红", "落日晖", "可爱粉", "天际蓝", "清新绿", "活力紫", "温柔黄", "低调灰"]
                    currentIndex: 0
                }

                // 歌词预览（使用Repeater）
                Repeater {
                    model: ["已播放", "未播放"]

                    delegate: Column {
                        spacing: 8


                        Rectangle {
                            id: previewBox
                            width: 100
                            height: 30
                            radius: 4
                            color: "#25262c"
                            border.width: 1
                            border.color: "#3f4350"

                            Row {
                                anchors.centerIn: parent
                                spacing: 10

                                // 颜色小方块（带渐变）
                                Rectangle {
                                    width: 12
                                    height: 12
                                    radius: 2
                                    anchors.verticalCenter: parent.verticalCenter

                                    gradient: Gradient {
                                        GradientStop {
                                            position: 0
                                            color: modelData === "已播放" ? BasicConfig.finishedLyricsUpColor : BasicConfig.unFinishedLyricsUpColor
                                        }
                                        GradientStop {
                                            position: 1
                                            color: modelData === "已播放" ? BasicConfig.finishedLyricsDownColor : BasicConfig.unFinishedLyricsDownColor
                                        }
                                    }
                                }

                                // 文字
                                Text {
                                    text: modelData
                                    color: "#f2f4f8"
                                    font.pixelSize: 13
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }

                            // 鼠标交互
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                hoverEnabled: true

                                onClicked: {
                                    colorSelectPopup.playState = modelData === "已播放" ? "finished" : "unfinished"
                                    colorSelectPopup.open()
                                }
                            }
                        }
                    }
                }

            }

        }
        
        // 歌词预览区域
        Column {
            width: parent.width
            spacing: 15
            
            Label {
                text: "预览"
                color: "white"
                font.pixelSize: 13
            }
            
            // 预览框
            Rectangle {
                width: parent.width - 50
                height: 120
                radius: 8
                color: "#25262c"
                border.width: 1
                border.color: "#3f4350"
                
                Item {
                    anchors.centerIn: parent
                    width: 180
                    height: 45
                    
                    // 左边Item：已播放渐变颜色（左对齐，截取左半）
                    Item {
                        width: 90
                        height: parent.height
                        anchors.left: parent.left
                        clip: true
                        
                        // 先绘制描边
                        Label {
                            anchors.left: parent.left
                            text: "网易云音乐"
                            font.pixelSize: 36
                            font.bold: true
                            color: BasicConfig.finishedLyricsBorderColor
                            style: Text.Outline
                            styleColor: BasicConfig.finishedLyricsBorderColor
                        }
                        
                        // 再绘制渐变文字（叠加在描边上）
                        Label {
                            anchors.left: parent.left
                            text: "网易云音乐"
                            font.pixelSize: 36
                            font.bold: true
                            color: BasicConfig.finishedLyricsUpColor
                            y: 1
                        }
                        Label {
                            anchors.left: parent.left
                            text: "网易云音乐"
                            font.pixelSize: 36
                            font.bold: true
                            color: BasicConfig.finishedLyricsDownColor
                        }
                    }
                    
                    // 右边Item：未播放渐变颜色（右对齐，截取右半）
                    Item {
                        width: 90
                        height: parent.height
                        anchors.right: parent.right
                        clip: true
                        
                        // 先绘制描边
                        Label {
                            anchors.right: parent.right
                            text: "网易云音乐"
                            font.pixelSize: 36
                            font.bold: true
                            color: BasicConfig.unFinishedLyricsBorderColor
                            style: Text.Outline
                            styleColor: BasicConfig.unFinishedLyricsBorderColor
                        }
                        
                        // 再绘制渐变文字（叠加在描边上）
                        Label {
                            anchors.right: parent.right
                            text: "网易云音乐"
                            font.pixelSize: 36
                            font.bold: true
                            color: BasicConfig.unFinishedLyricsUpColor
                            y: 1
                        }
                        Label {
                            anchors.right: parent.right
                            text: "网易云音乐"
                            font.pixelSize: 36
                            font.bold: true
                            color: BasicConfig.unFinishedLyricsDownColor
                        }
                    }
                }
            }
        }
    }

    // 颜色选择弹窗
    ColorSelectPopup {
        id: colorSelectPopup
    }
    ZYYCutLine{}
}