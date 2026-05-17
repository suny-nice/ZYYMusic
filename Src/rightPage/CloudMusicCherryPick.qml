import QtQuick 2.15
import QtQuick.Controls
import "../basic"

Item {
    id: root
    width: parent.width
    height: parent.height

    // 当前选中的标签索引
    property int currentIndex: 0

    Component.onCompleted: {
        BasicConfig.cloudMusicCherryPick = root
        BasicConfig.pushNav(0)
    }

    // 导航栏
    Row {
        id: navRow
        height: 15
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 30
        spacing: 30
        Repeater {
            id: navRepeater
            model: ["精选", "歌单广场", "排行榜", "歌手"]

            delegate: Column {
                spacing: 5

                Text {
                    id: navText
                    text: modelData
                    font.pixelSize: 16
                    color: currentIndex === index ? "#ff4a55" : "#8f939e"
                    font.bold: currentIndex === index

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            if (currentIndex !== index) {
                                currentIndex = index
                                BasicConfig.pushNav(index)
                            }
                        }
                    }
                }

                // 选中时显示红色下划线（宽度自适应文字）
                Rectangle {
                    width: navText.width - 10
                    height: 2
                    color: "#ff4a55"
                    anchors.horizontalCenter: parent.horizontalCenter
                    opacity: currentIndex === index ? 1 : 0
                    Behavior on opacity { NumberAnimation { duration: 150 } }
                }
            }
        }
    }

    // 内容区域 - 使用 Loader 来切换页面
    Loader {
        anchors.fill: parent
        anchors.topMargin: navRow.height
        source: {
            switch(currentIndex) {
                case 0: return "qrc:/Src/rightPage/cloudMusicCherryPick/CherryPick.qml"
                case 1: return "qrc:/Src/rightPage/cloudMusicCherryPick/SongListSquare.qml"
                case 2: return "qrc:/Src/rightPage/cloudMusicCherryPick/Ranking.qml"
                case 3: return "qrc:/Src/rightPage/cloudMusicCherryPick/Sings.qml"
                default: return "qrc:/Src/rightPage/cloudMusicCherryPick/CherryPick.qml"
            }
        }
    }
}