import QtQuick 2.15
import QtQuick.Controls

Item {
    id: root
    width:  parent.width
    height: implicitHeight
    // implicitWidth: 600
    implicitHeight: 280

    ListModel {
        id: officialSingModel

        ListElement {
            src: "qrc:/img/cherryPick/pic1.jpg"
            gColor: "#ff937b5f"
            titleText: "【高质量纯音乐】每天都要心情明媚！"
            sing1: "沐浴阳光的旋律"
            sing2: "轻快节奏治愈心情"
            sing3: "活力清晨BGM"
        }
        ListElement {
            src: "qrc:/img/cherryPick/pic2.jpg"
            gColor: "#ff6c362b"
            titleText: "低沉鼓点，极致低音享受「车载」"
            sing1: "沉浸式低频振动"
            sing2: "黑夜专属驾驶律动"
            sing3: "重低音电子节拍"
        }
        ListElement {
            src: "qrc:/img/cherryPick/pic3.jpg"
            gColor: "#ff468c9c"
            titleText: "国风R&B的碰撞 | 春风几度绕心头"
            sing1: "诗意旋律萦绕耳畔"
            sing2: "古韵与现代节奏融合"
            sing3: "春意盎然的音乐画卷"
        }
        ListElement {
            src: "qrc:/img/cherryPick/pic4.jpg"
            gColor: "#ff3f588d"
            titleText: "日语治愈 | 走心抒情，让人沉迷"
            sing1: "温柔治愈系日系旋律"
            sing2: "感人至深的抒情歌曲"
            sing3: "清亮通透的嗓音"
        }
        ListElement {
            src: "qrc:/img/cherryPick/pic5.jpg"
            gColor: "#ff4763a0"
            titleText: "【纯音乐】夏之遗憾 为秋惊喜之铺垫"
            sing1: "校园青春回忆杀"
            sing2: "清澈宁静的钢琴曲"
            sing3: "带着淡淡忧伤的旋律"
        }
        ListElement {
            src: "qrc:/img/cherryPick/pic6.jpg"
            gColor: "#ff912d44"
            titleText: "夜店蹦迪 | 7妹8妹带你酒吧嗨起来"
            sing1: "高能量派对热曲"
            sing2: "节奏感强烈的电音舞曲"
            sing3: "酒吧必放神曲"
        }
    }

    property int visibleCount: 4
    property int cardSpacing: 12
    property int sidePadding: 30
    property int cardHeight: 210
    property int currentOffset: 0
    property int maxOffset: Math.max(0, officialSingModel.count - visibleCount)
    property real viewportWidth: width - sidePadding * 2
    property real cardWidth: (viewportWidth - cardSpacing * (visibleCount - 1)) / visibleCount

    Label {
        id: sectionTitle
        anchors.left: parent.left
        anchors.leftMargin: root.sidePadding
        anchors.top: parent.top
        text: "官方歌单>"
        color: "white"
        font.pixelSize: 15
        font.bold: true
    }

    function showPrevious() {
        if (currentOffset > 0) {
            currentOffset--
        }
    }

    function showNext() {
        if (currentOffset < maxOffset) {
            currentOffset++
        }
    }

    Image {
        id: officialLeftArrow
        source: "qrc:/img/cherryPick/zuo.png"
        width: 28
        height: 28
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: cardsViewport.verticalCenter
        opacity: root.currentOffset > 0 ? 1.0 : 0.35

        Behavior on opacity {
            NumberAnimation { duration: 180 }
        }

        MouseArea {
            anchors.fill: parent
            enabled: root.currentOffset > 0
            cursorShape: enabled ? Qt.PointingHandCursor : Qt.ArrowCursor
            onClicked: root.showPrevious()
        }
    }

    Image {
        id: officialRightArrow
        source: "qrc:/img/cherryPick/you.png"
        width: 30
        height: 30
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.verticalCenter: cardsViewport.verticalCenter
        opacity: root.currentOffset < root.maxOffset ? 1.0 : 0.35

        Behavior on opacity {
            NumberAnimation { duration: 180 }
        }

        MouseArea {
            anchors.fill: parent
            enabled: root.currentOffset < root.maxOffset
            cursorShape: enabled ? Qt.PointingHandCursor : Qt.ArrowCursor
            onClicked: root.showNext()
        }
    }

    Item {
        id: cardsViewport
        anchors.left: parent.left
        anchors.leftMargin: root.sidePadding
        anchors.right: parent.right
        anchors.rightMargin: root.sidePadding
        anchors.top: sectionTitle.bottom
        anchors.topMargin: 8
        height: root.cardHeight
        clip: true

        Row {
            id: cardsRow
            x: -root.currentOffset * (root.cardWidth + root.cardSpacing)
            spacing: root.cardSpacing

            Behavior on x {
                NumberAnimation {
                    duration: 260
                    easing.type: Easing.OutCubic
                }
            }

            Repeater {
                model: officialSingModel

                Rectangle {
                    width: root.cardWidth
                    height: root.cardHeight
                    radius: 20
                    clip: true
                    color: "#1f1f1f"

                    Image {
                        anchors.fill: parent
                        source: src
                        fillMode: Image.PreserveAspectCrop
                    }

                    MouseArea {
                        id: cardMouse
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                    }
                    // 渐变的矩形
                    Rectangle {
                        id: textBackground
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        height: cardMouse.containsMouse ? parent.height * 0.7 : parent.height * 0.25
                        color: gColor
                        opacity: cardMouse.containsMouse ? 0.4 : 0.8

                        Behavior on height {
                            NumberAnimation {
                                duration: 180
                                easing.type: Easing.OutCubic
                            }
                        }

                        Behavior on opacity {
                            NumberAnimation { duration: 180 }
                        }
                    }

                    Image {
                        source: "qrc:/img/cherryPick/bofang.png"
                        width: 22
                        height: 22
                        anchors.right: parent.right
                        anchors.rightMargin: 14
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 14
                    }

                    Item {
                        anchors.left: textBackground.left
                        anchors.right: textBackground.right
                        anchors.bottom: textBackground.bottom
                        anchors.top: textBackground.top
                        anchors.leftMargin: 14
                        anchors.rightMargin: 44
                        anchors.bottomMargin: 8
                        anchors.topMargin: 14

                        Column {
                            id: textColumn
                            width: parent.width
                            anchors.bottom: parent.bottom
                            spacing: cardMouse.containsMouse ? 8 : 0

                            Behavior on spacing {
                                NumberAnimation { duration: 180 }
                            }

                            Text {
                                width: parent.width
                                text: titleText
                                color: "#ffffff"
                                font.pixelSize: 16
                                font.bold: true
                                wrapMode: Text.Wrap
                                maximumLineCount: cardMouse.containsMouse ? 99 : 2
                                elide: cardMouse.containsMouse ? Text.ElideNone : Text.ElideRight
                            }

                            Item {
                                width: parent.width
                                height: cardMouse.containsMouse ? detailsColumn.implicitHeight : 0
                                clip: true

                                Behavior on height {
                                    NumberAnimation {
                                        duration: 180
                                        easing.type: Easing.OutCubic
                                    }
                                }

                                Column {
                                    id: detailsColumn
                                    width: parent.width
                                    spacing: 4
                                    opacity: cardMouse.containsMouse ? 1 : 0

                                    Behavior on opacity {
                                        NumberAnimation { duration: 140 }
                                    }

                                    Text {
                                        width: parent.width
                                        text: sing1
                                        color: "#f3f3f3"
                                        font.pixelSize: 12
                                        wrapMode: Text.Wrap
                                        elide: cardMouse.containsMouse ? Text.ElideNone : Text.ElideRight
                                    }

                                    Text {
                                        width: parent.width
                                        text: sing2
                                        color: "#f3f3f3"
                                        font.pixelSize: 12
                                        wrapMode: Text.Wrap
                                        elide: cardMouse.containsMouse ? Text.ElideNone : Text.ElideRight
                                    }

                                    Text {
                                        width: parent.width
                                        text: sing3
                                        color: "#f3f3f3"
                                        font.pixelSize: 12
                                        wrapMode: Text.Wrap
                                        elide: cardMouse.containsMouse ? Text.ElideNone : Text.ElideRight
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
