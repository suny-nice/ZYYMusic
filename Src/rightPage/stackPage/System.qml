import QtQuick 2.15
import QtQuick.Controls
import "../../commonUI"

Item {
    width: parent.width
    height: 300

    // 标题
    Label {
        id: systemTitle
        color: "white"
        font.bold: true
        text: "系统"
        font.pixelSize: 15
        width: 50
        anchors.left: parent.left
        anchors.top: parent.top
    }

    Column {
        id:systemColumn
        width: parent.width
        anchors.left: systemTitle.right
        anchors.leftMargin: 20
        anchors.top: parent.top
        spacing: 20
        height: 150
        // 开启定时关闭软件
        ZYYCheckbox {
            id:guanbiBox
            text: "开启定时关闭软件"
            textColor: "#ffffff"
            fontSize: 13
        }
        Item{
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: guanbiBox.bottom
            anchors.topMargin: 10
            Column{
                anchors.fill: parent
                spacing: 10
                // 剩余关闭时间
                Row {
                    spacing: 10

                    Text {
                        text: "剩余关闭时间"
                        color: "#8f939e"
                        font.pixelSize: 13
                        anchors.verticalCenter: minuteComboBox.verticalCenter
                    }

                    ZYYComboBox {
                        id: hourComboBox
                        width: 80
                        height: 24

                        // 生成0-12小时选项
                        model: ListModel {
                            Component.onCompleted: {
                                for (var i = 0; i <= 12; i++) {
                                    append({text: i.toString()})
                                }
                            }
                        }
                        currentIndex: 0
                    }

                    Text {
                        text: "小时"
                        color: "#8f939e"
                        font.pixelSize: 13
                        anchors.verticalCenter: hourComboBox.verticalCenter
                    }

                    ZYYComboBox {
                        id: minuteComboBox
                        width: 80
                        height: 24

                        // 生成0-60分钟选项
                        model: ListModel {
                            Component.onCompleted: {
                                for (var i = 0; i < 60; i++) {
                                    append({text: i.toString()})
                                }
                            }
                        }
                        currentIndex: 0
                    }

                    Text {
                        text: "分钟"
                        color: "#8f939e"
                        font.pixelSize: 13
                        anchors.verticalCenter: minuteComboBox.verticalCenter
                    }
                }

                // 关闭软件同时关机（灰色不可选）
                ZYYCheckbox {
                    text: "关闭软件同时关机"
                    textColor: "#5a5e6a"  // 浅灰色
                    fontSize: 13
                    enabled: false
                }

                // 关闭主面板
                Column {
                    spacing: 10

                    Text {
                        text: "关闭主面板"
                        color: "#8f939e"
                        font.pixelSize: 13
                    }

                    Row {
                        spacing: 30

                        // 最小化到系统托盘（单选按钮）
                        ZYYRadioButton {
                            id: minimizeRadio
                            text: "最小化到系统托盘"
                            checked: true
                            textColor: "#ffffff"
                            fontSize: 13

                            onClicked: {
                                if (minimizeRadio.checked) {
                                    exitRadio.checked = false
                                }
                            }
                        }

                        // 退出云音乐（单选按钮）
                        ZYYRadioButton {
                            id: exitRadio
                            text: "退出云音乐"
                            textColor: "#ffffff"
                            fontSize: 13

                            onClicked: {
                                if (exitRadio.checked) {
                                    minimizeRadio.checked = false
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // 分割线
    Rectangle {
        width: parent.width
        anchors.top:systemColumn.bottom
        height: 1
        color: "#212127"
    }
}
