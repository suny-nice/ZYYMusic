import QtQuick 2.15

Item {
    id: root
    width: parent.width
    height: 280

    property int currentPage: 0
    property int pageSize: 6

    ListModel {
        id: musicModel
        ListElement { singName: "我们"; singer: "五五分fifty-fifty"; description: "我们"; svipLabel: "Hi-Res"; playTime: "04:04"; imgIndex: 1 }
        ListElement { singName: "遗憾总是贯穿人生始终 (女声版)"; singer: "梁11不摇滚 / 粘了咕叽"; description: "遗憾总是贯穿人生始终"; svipLabel: "Hi-Res"; playTime: "03:30"; imgIndex: 2 }
        ListElement { singName: "她是INFP"; singer: "晓白"; description: "她是INFP (他是个可爱善良的..."; svipLabel: "SQ"; playTime: "01:46"; imgIndex: 3 }
        ListElement { singName: "脏腑改五官"; singer: "爻爻YOYO"; description: "脏腑改五官"; svipLabel: "Hi-Res"; playTime: "05:21"; imgIndex: 4 }
        ListElement { singName: "你爱的太疯"; singer: "纳earsh"; description: "一点"; svipLabel: "SQ"; playTime: "01:46"; imgIndex: 5 }
        ListElement { singName: "风中的漂泊 (DTS5.1)"; singer: "任才"; description: "风说"; svipLabel: "SQ"; playTime: "03:56"; imgIndex: 6 }
        ListElement { singName: "旧火重燃"; singer: "Aaranson."; description: "旧火重燃-Kirsty刘瑾睿"; svipLabel: "Hi-Res"; playTime: "02:34"; imgIndex: 7 }
        ListElement { singName: "来自云的风"; singer: "龚琳娜"; description: "来自云的风"; svipLabel: "Hi-Res"; playTime: "05:34"; imgIndex: 8 }
        ListElement { singName: "同旧人说再见"; singer: "小表哥"; description: "同旧人说再见"; svipLabel: "SQ"; playTime: "02:32"; imgIndex: 9 }
        ListElement { singName: "回眸的晚霞"; singer: "刘皮皮"; description: "回眸的瞬间"; svipLabel: "Hi-Res"; playTime: "03:42"; imgIndex: 10 }
        ListElement { singName: "你是玫瑰"; singer: "Bethybai"; description: "9月10号于你家"; svipLabel: "SQ"; playTime: "02:41"; imgIndex: 11 }
        ListElement { singName: "chao(夏潮)"; singer: "Bethybai"; description: "午后梦核"; svipLabel: "SQ"; playTime: "03:20"; imgIndex: 12 }
    }

    ListModel {
        id: displayModel
    }

    Component.onCompleted: {
        updateDisplayModel()
    }

    function updateDisplayModel() {
        displayModel.clear()
        var startIndex = currentPage * pageSize
        var endIndex = Math.min(startIndex + pageSize, musicModel.count)
        for (var i = startIndex; i < endIndex; i++) {
            displayModel.append(musicModel.get(i))
        }
    }

    onCurrentPageChanged: {
        updateDisplayModel()
    }

    Column {
        anchors.fill: parent

        Text {
            text: "最新音乐"
            color: "white"
            anchors.left: parent.left
            anchors.leftMargin: 30
            font.pixelSize: 18
            font.bold: true
        }

        Row {
            width: parent.width -10
            height: parent.height - 30
            anchors.left: parent.left
             anchors.leftMargin: 10
            // spacing: 10

            Image {
                id: leftArrow
                source: "qrc:/img/cherryPick/zuo"
                anchors.verticalCenter: parent.verticalCenter
                width: 30
                height: 30
                opacity: currentPage === 0 ? 0.5 : 1
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (currentPage > 0) {
                            currentPage--;
                        }
                    }
                }
            }

            GridView {
                id: musicGridView
                width: parent.width - leftArrow.width - rightArrow.width - 20
                height: parent.height
                model: displayModel
                clip: true
                cellWidth: width / 2
                cellHeight: 80
                flow: GridView.LeftToRight
                interactive: false

                delegate: Item {
                    width: musicGridView.cellWidth - 5
                    height: musicGridView.cellHeight

                    Row {
                        anchors.fill: parent
                        anchors.margins: 5
                        spacing: 8

                        Image {
                            width: 50
                            height: 50
                            anchors.verticalCenter: parent.verticalCenter
                            source: "qrc:/img/cherryPick/img" + model.imgIndex + ".jpg"
                        }

                        Column {
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 3

                            Text {
                                text: model.singName
                                color: "white"
                                font.pixelSize: 12
                                elide: Text.ElideRight
                                width: musicGridView.cellWidth - 70
                            }

                            Text {
                                text: model.singer
                                color: "#888888"
                                font.pixelSize: 10
                                elide: Text.ElideRight
                                width: musicGridView.cellWidth - 70
                            }

                            Row {
                                spacing: 4

                                Rectangle {
                                    color: "#13131a"
                                    radius: 2
                                    width: svipText.width + 6
                                    height: svipText.height + 3
                                    border.width: 1
                                    border.color: "#ce4a4c"
                                    Text {
                                        id: svipText
                                        text: model.svipLabel
                                        color: "#FF6B6B"
                                        font.pixelSize: 9
                                        anchors.centerIn: parent
                                    }
                                }

                                Text {
                                    text: model.playTime
                                    color: "#666666"
                                    font.pixelSize: 9
                                }
                            }
                        }
                    }
                }
            }

            Image {
                id: rightArrow
                source: "qrc:/img/cherryPick/you"
                anchors.verticalCenter: parent.verticalCenter
                width: 30
                height: 30
                opacity: currentPage === 1 ? 0.5 : 1
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (currentPage < 1) {
                            currentPage++;
                        }
                    }
                }
            }
        }
    }
}
