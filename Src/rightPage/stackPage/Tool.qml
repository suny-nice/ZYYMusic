import QtQuick 2.15
import QtQuick.Controls
import "../../commonUI"
Item {
    width: parent.width
    height:100
    // 工具部分
    // 标题
    Label {
        id: toolsTitle
        color: "white"
        font.bold: true
        text: "工具"
        font.pixelSize: 15
        width: 50
    }
    Column {
        id: toolsColumn
        anchors.left: toolsTitle.right
        anchors.leftMargin: 20
        spacing: 10
        // HTTP代理设置
        Row {
            spacing: 25
            Label {
                text: "http代理"
                color: "white"
                font.pixelSize: 14
                width: 80
            }

            // 不适用代理
            ZYYRadioButton {
                text: "不适用代理"
                checked: true
                group: "proxy"
            }

            // 使用IE代理设置
            ZYYRadioButton {
                checked: false
                text: "使用IE代理设置"
                group: "proxy"
            }

            // 自定义代理
            ZYYRadioButton {
                checked: false
                text: "自定义代理"
                group: "proxy"
            }

            // 测试按钮
            Rectangle {
                width: 60
                height: 30
                radius: 15
                color: "#25262c"
                border.width: 1
                border.color: "#3f4350"
                anchors.top: parent.top
                anchors.topMargin: -5
                Text {
                    text: "测试"
                    color: "#f2f4f8"
                    font.pixelSize: 12
                    anchors.centerIn: parent
                }
            }

            // 确定按钮
            Rectangle {
                width: 60
                height: 30
                radius: 15
                color: "#25262c"
                border.width: 1
                border.color: "#3f4350"
                anchors.top: parent.top
                anchors.topMargin: -5
                Text {
                    text: "确定"
                    color: "#f2f4f8"
                    font.pixelSize: 12
                    anchors.centerIn: parent
                }
            }
        }

        // 音乐云盘设置
        Label {
            text: "音乐云盘设置"
            color: "white"
            font.pixelSize: 13
        }

        ZYYCheckbox {
            id: cloudMusicCheckbox
            checked: true
            text: "本地音乐添加到歌单后，将文件上传至云盘，可多端同步歌单，播放下载"
        }
    }
    // 分割线
    ZYYCutLine {}

}
