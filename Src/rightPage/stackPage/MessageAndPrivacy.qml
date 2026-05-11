import QtQuick 2.15
import QtQuick.Controls
import "../../commonUI"

Item {
    width: parent.width
    height: 100

    // 标题
    Label {
        id: titleLabel
        color: "white"
        font.bold: true
        text: "消息与隐私"
        font.pixelSize: 15
        width: 80
    }

    // 内容区域
    Column {
        anchors.left: titleLabel.right
        anchors.leftMargin: 20
        spacing: 20

        // 私信设置
        Row {
            spacing: 15

            Text {
                text: "私信"
                color: "white"
                font.pixelSize: 13
                width: 80
            }

            Row {
                spacing: 30

                Repeater {
                    model: [{text: "所有人", group: "privateMsg"}, {text: "我关注的人", group: "privateMsg"}]
                    delegate: ZYYRadioButton {
                        text: modelData.text
                        group: modelData.group
                        checked: index === 0
                        onClicked: {
                            // 使用group属性实现互斥
                        }
                    }
                }
            }
        }

        // 我的听歌排行榜
        Row {
            spacing: 15

            Text {
                text: "我的听歌排行榜"
                color: "white"
                font.pixelSize: 13
                width: 120
            }

            Row {
                spacing: 25

                Repeater {
                    model: [
                        {text: "所有人可见", group: "ranking"}, 
                        {text: "我关注的人可见", group: "ranking"}, 
                        {text: "仅自己可见", group: "ranking"}
                    ]
                    delegate: ZYYRadioButton {
                        text: modelData.text
                        group: modelData.group
                        checked: index === 0
                    }
                }
            }
        }

        // 个性化服务
        Row {
            spacing: 15

            Text {
                text: "个性化服务"
                color: "white"
                font.pixelSize: 13
                width: 80
            }

            Row {
                spacing: 30

                ZYYRadioButton {
                    text: "开启"
                    group: "personalized"
                    checked: true
                }

                ZYYRadioButton {
                    text: "<span style='color: #ffffff;'>关闭</span><span style='color: #8f939e;'>（关闭后，即不会使用你的个性化信息提供个性化服务）</span>"
                    group: "personalized"
                    checked: false
                }
            }
        }
    }

    // 分割线
    ZYYCutLine{}
}