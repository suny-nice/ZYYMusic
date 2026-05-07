import QtQuick 2.15
import QtQuick.Controls
import "../../commonUI"
Item {
    width: parent.width
    height: 50
        // 标题和内容区域
        Row {
            spacing: 20

            // 标题
            Label {
                id: accounttitle
                color: "white"
                font.bold: true
                text: "账号"
                font.pixelSize: 15
                width: 50
            }

            // 内容区域
            Column {
                spacing: 10

                Text {
                    text: "登录网易云音乐，手机电脑多端同步，320k高音质无线下载"
                    color: "#8f939e"
                    font.pixelSize: 13
                }

                // 立即登录按钮（居中）
                Rectangle {
                    id: loginButton
                    width: 80
                    height: 24
                    radius: 18
                    color: "#ff4a55"

                    Text {
                        text: "立即登录"
                        color: "white"
                        font.pixelSize: 13
                        font.bold: true
                        opacity: loginTextArea.containsMouse ? 0.8 : 1.0
                        anchors.centerIn: parent
                    }

                    MouseArea {
                        id: loginTextArea
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                }
            }
        }
        // 分割线
        ZYYCutLine {
            anchors.top: parent.bottom
            anchors.topMargin: 15
        }
    }