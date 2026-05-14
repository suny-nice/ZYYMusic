import QtQuick 2.15
import QtQuick.Controls
import "../../commonUI"
import "."

Item {
    Item {
        anchors.fill: parent
        anchors.leftMargin: 24
        anchors.topMargin: 10

        Label {
            id: setingTitle
            color: "white"
            font.bold: true
            text: "设置"
            font.pixelSize: 20
        }

        Item {
            id: tabContainer
            anchors.top: setingTitle.bottom
            anchors.topMargin: 10
            height: 26

            Row {
                id: tabRow
                spacing: 20

                property int currentIndex: 0
                property var tabs: ["账号", "常规", "系统", "播放", "消息与隐私", "快捷键", "音质与下载", "桌面歌词", "工具", "关于网易云音乐"]

                Repeater {
                    model: tabRow.tabs
                    delegate: Item {
                        id: tabItem
                        width: tabText.implicitWidth
                        height: 24

                        Text {
                            id: tabText
                            text: modelData
                            color: tabRow.currentIndex === index ? "#f2f4f8" : "#8f939e"
                            font.pixelSize: 15
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                tabRow.currentIndex = index
                                underline.x = tabItem.x
                                underline.width = tabItem.width
                                
                                // 滚动到对应位置
                                var targetY = 0
                                switch(index) {
                                    case 0: targetY = accountItem.y; break
                                    case 1: targetY = commonItem.y; break
                                    case 2: targetY = systemItem.y; break
                                    case 3: targetY = playItem.y; break
                                    case 4: targetY = messageItem.y; break
                                    case 5: targetY = shortcutItem.y; break
                                    case 6: targetY = soundItem.y; break
                                    case 7: targetY = lyricsItem.y; break
                                    case 8: targetY = toolItem.y; break
                                    case 9: targetY = aboutItem.y; break
                                }
                                flick.contentY = targetY
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: underline
                height: 2
                width: 24
                color: "#ff4a55"
                anchors.bottom: parent.bottom
                x: 0
            }
        }
        ZYYCutLine{
            id:cutline
        anchors.top: tabContainer.bottom
        }

        // 滚动区域容器
        Item {
            id: scrollContainer
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: cutline.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 10
            anchors.bottomMargin: 5
            // 自定义滚动条（放在 Flickable 外面）
            Item {
                id: scrollBar
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom

                width: 6

                // 滑块
                Rectangle {
                    id: slider
                    width: parent.width
                    height: 60
                    color: "#6a6e7c"
                    radius: 3
                    anchors.horizontalCenter: parent.horizontalCenter

                    // 根据滚动位置更新滑块位置
                    y: flick.visibleArea.yPosition * (scrollBar.height - 60)

                    // 拖拽滑动
                    MouseArea {
                        anchors.fill: parent
                        drag.target: slider
                        drag.axis: Drag.YAxis
                        drag.minimumY: 0
                        drag.maximumY: scrollBar.height - 60

                        onPositionChanged: {
                            flick.contentY = slider.y / (scrollBar.height - 60) * (flick.contentHeight - flick.height)
                        }
                    }
                }
            }

            // Flickable 内容区域
            Flickable {
                id: flick
                anchors.fill: parent
                anchors.rightMargin: 20
                contentHeight: 3200
                clip: true

                Column {
                    width: parent.width
                    spacing: 30
                    //账户
                    Account { id: accountItem }
                    //常规
                    Common { id: commonItem }
                    //系统
                    System{ id: systemItem }
                    //播放
                    Play{ id: playItem }
                    //消息与隐私
                    MessageAndPrivacy{ id: messageItem }
                    //快捷键
                    CustomShortcut{ id: shortcutItem }
                    //音质与下载
                    SoundQualityAndDownload{ id: soundItem }
                    //桌面歌词
                    DesktopLyrics{ id: lyricsItem }
                    //工具
                    Tool{ id: toolItem }
                    //关于网易云音乐
                    About{ id: aboutItem }
                }
            }
        }
    }
}
