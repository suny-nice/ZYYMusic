import QtQuick 2.15
import QtQuick.Controls
import "../../commonUI"

Item {
    width: parent.width
    height: 265

    Label {
        id: commonArea
        color: "white"
        font.bold: true
        text: "常规"
        font.pixelSize: 15
        width: 50
    }

    Column {
        width: parent.width
        anchors.left: commonArea.right
        anchors.leftMargin: 20
        spacing: 10

        Text {
            text: "字体选择（如果字体显示不清晰，请在控制面板-字体设置中启动系统Clear Type设置）"
            color: "#8f939e"
            font.pixelSize: 13
        }

        ZYYComboBox {
            id: fontSelectorCbx
            height: 32
        }

        Item {
            width: parent.width
            height: 200

            Column {
                id: commonCheckBox
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 15
                spacing: 15

                // 开机自动运行
                Row {
                    spacing: 10
                    ZYYCheckbox { text: "开机自动运行"; textColor: "#ffffff"; fontSize: 13 }
                }

                // 将网易云音乐设置为默认播放器
                Row {
                    spacing: 10
                    ZYYCheckbox { text: "将网易云音乐设置为默认播放器"; textColor: "#ffffff"; fontSize: 13 }
                }

                // 开启GPU加速
                ZYYCheckbox {
                    text: "<span style='color: #ffffff;'>开启GPU加速</span><span style='color: #8f939e;'> (若软件黑屏，请关闭GPU加速尝试解决)</span>"
                    textColor: "#ffffff"
                    fontSize: 13
                }

                // 禁用动画效果
                ZYYCheckbox {
                    text: "<span style='color: #ffffff;'>禁用动画效果</span><span style='color: #8f939e;'> (减少部分资源占用)</span>"
                    textColor: "#ffffff"
                    fontSize: 13
                }

                // 禁用系统缩放比例
                Column {
                    spacing: 5

                    ZYYCheckbox {
                        text: "<span style='color: #ffffff;'>禁用系统缩放比例</span><span style='color: #8f939e;'> (减少部分资源占用)</span>"
                        textColor: "#ffffff"
                        fontSize: 13
                    }

                    Text {
                        text: "<span style=\"color: #ff4a55;font-size: 11px;\">*</span><span style=\"color: #8f939e;font-size: 11px;\">高清屏适配，禁用后建议重启软件</span>"
                        textFormat: Text.RichText
                        font.pixelSize: 11
                        anchors.left: parent.left
                        anchors.leftMargin: 26
                    }
                }
            }
        }
    }
    // 分割线
    ZYYCutLine {
        anchors.top: parent.bottom
        anchors.topMargin: 10
    }
}
