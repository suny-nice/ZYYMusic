import QtQuick 2.15
import QtQuick.Controls
import "../basic"

Item {
    id:search
    anchors.left: parent.left
    anchors.leftMargin: 10
    height: 60
    width: 200

    ListModel { id: userSearchHistory }
    property bool isExpanded: false  // 控制展开/收起状态

    Popup {
        id: searchPopup
        x: 0
        y: parent.height - 5
        width: maikefeng.implicitWidth + qianjinRow.implicitWidth + searchItem.implicitWidth
        height: 380
        modal: false
        dim: true

        onOpened: searchField.forceActiveFocus()

        contentItem: Rectangle {
            anchors.fill: parent
            color: "#2d2d37"
            border.color: "#45454e"
            border.width: 0.8
            radius: 3

            // 整个弹窗可滚动
            Flickable {
                anchors.fill: parent
                contentHeight: contentColumn.implicitHeight + 20
                boundsBehavior: Flickable.DragAndOvershootBounds
                clip: true

                Column {
                    id: contentColumn
                    width: parent.width
                    spacing: 10
                    anchors.topMargin: 10

                    Item {
                        id:historyItem
                        width: parent.width
                        height: 35

                        Text {
                            text: "搜索历史"
                            color: BasicConfig.colorSecondaryText
                            font.pixelSize: 17
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        //清空
                        Image {
                            width: 16
                            height: 16
                            anchors.right: parent.right
                            anchors.rightMargin: 20
                            anchors.verticalCenter: parent.verticalCenter
                            source: "qrc:/img/qingkong.png"

                            MouseArea { anchors.fill: parent; onClicked: userSearchHistory.clear() }
                        }
                    }
                    //搜索记录
                    Flow {
                        id:historyFlow
                        width: parent.width
                        anchors.left: parent.left
                        anchors.leftMargin: 8
                        anchors.right: parent.right
                        anchors.rightMargin: 8
                        spacing: 8

                        Repeater {
                            model: userSearchHistory
                            delegate: Rectangle {
                                radius: 4
                                color: "#3a3a45"
                                visible: isExpanded || index < 6

                                Text {
                                    id: historyText
                                    text:singName
                                    color: "white"
                                    font.pixelSize: 13
                                    anchors.centerIn: parent
                                    anchors.leftMargin: 10
                                    anchors.rightMargin: 10
                                }

                                width: historyText.implicitWidth + 20
                                height: historyText.implicitHeight
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: { searchField.text =singName; searchPopup.close() }
                                }
                            }
                        }

                        // 展开/收起 按钮
                        Rectangle {
                            height: 17
                            width: 20
                            radius: 4
                            color: "#3a3a45"
                            visible: userSearchHistory.count > 6

                            Text {
                                text: isExpanded ? "v" : ">"
                                color: "white"
                                font.pixelSize: 13
                                anchors.centerIn: parent
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: { isExpanded = !isExpanded }
                            }
                        }
                    }

                    // 热搜榜数据（放在外面作为全局数据）
                    ListModel {
                        id: hotSearchSingModeL
                        ListElement { singName: "想象之中" }
                        ListElement { singName: "雨道" }
                        ListElement { singName: "哪里都是你" }
                        ListElement { singName: "入戏太深" }
                        ListElement { singName: "That girl" }
                        ListElement { singName: "素颜" }
                        ListElement { singName: "她说" }
                        ListElement { singName: "ABC" }
                        ListElement { singName: "daylight" }
                        ListElement { singName: "其他" }
                        ListElement { singName: "想象之中" }
                        ListElement { singName: "雨道" }
                        ListElement { singName: "哪里都是你" }
                        ListElement { singName: "入戏太深" }
                        ListElement { singName: "That girl" }
                        ListElement { singName: "素颜" }
                        ListElement { singName: "她说" }
                        ListElement { singName: "ABC" }
                        ListElement { singName: "daylight" }
                        ListElement { singName: "其他" }
                    }

                    // 热搜榜标题
                    Text {
                        id:hotSearchText
                        text: "热搜榜"
                        color: BasicConfig.colorSecondaryText
                        font.pixelSize: 17
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                    }

                    // 热搜列表
                    Column {
                        spacing: 10
                        anchors.left: hotSearchText.left
                        anchors.leftMargin: 10

                        Repeater {
                            model: hotSearchSingModeL
                            delegate: Row {
                                spacing: 10

                                Text {
                                    text: (index + 1)
                                    font.pixelSize: 13
                                    color: index < 3 ? "#ff4d4f" : "#8c8c8c"
                                }

                                Text {
                                    text: singName
                                    color: "white"
                                    font.pixelSize: 13

                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            searchField.text = singName
                                            searchPopup.close()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Row {
        id: qianjinRow
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter

        Rectangle {
            width: 18
            height: 28
            radius: 3
            color: BasicConfig.colorWindowRightBg
            border.color: "#36262f"
            border.width: 1

            Image { height: 23; width: 20; source: "qrc:/img/zuojiantou.png"; anchors.centerIn: parent }
        }
        //输入框
        Item {
            id: searchItem
            height: 25
            width: 120

            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0; color: "#21283d" }
                    GradientStop { position: 1; color: "#382635" }
                }
            }

            Image { id: searchIcon; height: 20; width: 20; source: "qrc:/img/sousuo.png"; anchors.left: parent.left; anchors.verticalCenter: parent.verticalCenter }

            TextInput {
                id: searchField
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.left: searchIcon.right
                anchors.leftMargin: 2
                color: "white"
                verticalAlignment: Text.AlignVCenter

                onAccepted: {
                    if (text.trim()) {
                        // 检查是否已存在
                        var exists = false
                        for (var i = 0; i < userSearchHistory.count; i++) {
                            if (userSearchHistory.get(i).singName === text) {
                                exists = true
                                break
                            }
                        }
                        if (!exists) {
                            //插入数据
                            userSearchHistory.insert(0, { singName: text })
                            // 最多保留9条，超过则删除最早的
                            if (userSearchHistory.count > 9) {
                                userSearchHistory.remove(userSearchHistory.count - 1)
                            }
                        }
                        text = ""
                        searchPopup.close()
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (!searchPopup.visible) {
                        searchPopup.open()
                    }
                }
            }
        }

        Rectangle {
            id: maikefeng
            width: 27
            height: 27
            radius: 3
            color: BasicConfig.colorWindowRightBg
            border.color: "#36262f"
            border.width: 1

            Image { height: 21; width: 21; source: "qrc:/img/luyin.png"; anchors.centerIn: parent }
        }
    }
}
