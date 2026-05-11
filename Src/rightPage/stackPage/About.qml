import QtQuick 2.15
import QtQuick.Controls
import "../../commonUI"

Item {
    width: parent.width
    height: 400

    // 标题
    Label {
        id: aboutTitle
        color: "white"
        font.bold: true
        text: "关于网易云音乐"
        font.pixelSize: 15
        width: 50
    }

    // 右侧内容区域
    Column {
        id: contentColumn
        spacing: 20
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.left: aboutTitle.right
        anchors.leftMargin: 20

        // 第一行：版本信息 + 按钮
        Row {
            spacing: 15

            Text {
                text: "(当前版本3.0.1)(64位)(Build:123456)Patch:123456"
                color: "#8f939e"
                font.pixelSize: 11
            }

            Rectangle {
                width: 75
                height: 30
                radius: 15
                color: "#25262c"
                border.width: 1
                border.color: "#3f4350"
                Text {
                    text: "检查更新"
                    color: "#f2f4f8"
                    font.pixelSize: 12
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                width: 75
                height: 30
                radius:14
                color: "#25262c"
                border.width: 1
                border.color: "#3f4350"

                Text {
                    text: "意见反馈"
                    color: "#f2f4f8"
                    font.pixelSize: 12
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                width: 75
                height: 30
                radius: 15
                color: "#25262c"
                border.width: 1
                border.color: "#3f4350"

                Text {
                    text: "版本记录"
                    color: "#f2f4f8"
                    font.pixelSize: 12
                    anchors.centerIn: parent
                }
            }
        }

        // 第二行：自动更新选项
        Row {
            spacing: 35

            ZYYRadioButton {
                text: "自动更新"
                checked: true
                group: "update"
            }

            ZYYRadioButton {
                text: "有版本时提醒我"
                group: "update"
                checked: false
            }
        }

        // 第三行：下载移动客户端标签
        Label {
            text: "下载移动客户端"
            color: "white"
            font.pixelSize: 14
        }

        // 第四行：客户端下载按钮
        Row {
            spacing: 25

            Rectangle {
                width: 100
                height: 30
                radius: 15
                color: "#ff4a55"

                Text {
                    text: "iPhone版"
                    color: "white"
                    font.pixelSize: 13
                    font.bold: true
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                width: 100
                height: 30
                radius: 15
                color: "#ff4a55"
                Text {
                    text: "iPad版"
                    color: "white"
                    font.pixelSize: 13
                    font.bold: true
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                width: 100
                height: 30
                radius: 15
                color: "#ff4a55"

                Text {
                    text: "Andriod版"
                    color: "white"
                    font.pixelSize: 13
                    font.bold: true
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                width: 100
                height: 30
                radius: 15
                color: "#ff4a55"

                Text {
                    text: "WP版"
                    color: "white"
                    font.pixelSize: 13
                    font.bold: true
                    anchors.centerIn: parent
                }
            }
        }

        // 第五行：底部链接
        Row {
            spacing: 10

            Text {
                text: "《网易云音乐官网》"
                color: "#5a7fc2"
                font.pixelSize: 12
            }

            Text {
                text: "《网易云音乐社区管理细则》"
                color: "#5a7fc2"
                font.pixelSize: 12
            }

            Text {
                text: "《服务条款》"
                color: "#5a7fc2"
                font.pixelSize: 12
            }

            Text {
                text: "《隐私政策》"
                color: "#5a7fc2"
                font.pixelSize: 12
            }

            Text {
                text: "《儿童隐私政策》"
                color: "#5a7fc2"
                font.pixelSize: 12
            }
        }
    }
}
