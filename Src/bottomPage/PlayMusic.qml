import QtQuick 2.15

Rectangle {
    id: bottomRect
    color: parent.color
    height: 60
    clip: false

    property int currentMode: 0
    property real volume: 0.7
    property bool isMuted: false
    property real progress: 0.35
    property bool isPlaying: false
    property bool isFavorite: false

    Rectangle {
        width: parent.width
        height: 4
        color: "#333333"
        anchors.top: parent.top
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: dot.visible = true
            onExited: dot.visible = false
            onPressed: progress = Math.max(0, Math.min(1, mouseX / width))
            onPositionChanged: if (pressed) progress = Math.max(0, Math.min(1, mouseX / width))
            Rectangle {
                width: progress * parent.width
                height: parent.height
                color: "#FF6B6B"
            }
        }
    }

    Rectangle {
        id: dot
        width: 10
        height: 10
        color: "#FF6B6B"
        radius: 5
        visible: false
        z: 100
        parent: bottomRect.parent
        x: bottomRect.x + progress * bottomRect.width - 5
        y: bottomRect.y - 3
    }

    Row {
        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        spacing: 15

        Image {
            width: 40
            height: 40
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/cherryPick/img1.jpg"
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 2
            Text {
                text: "我们 - 五五分fifty-fifty"
                color: "white"
                font.pixelSize: 12
            }
            Text {
                text: "01:45 / 04:04"
                color: "#666666"
                font.pixelSize: 10
            }
        }
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 15

        Image {
            width: 16
            height: 16
            anchors.verticalCenter: parent.verticalCenter
            source: isFavorite ? "qrc:/img/playMusic/aixin.png" : "qrc:/img/playMusic/aixin-2.png"
            MouseArea {
                anchors.fill: parent
                onClicked: isFavorite = !isFavorite
            }
        }

        Image {
            width: 18
            height: 18
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/playMusic/diyiyeshouyeshangyishou.png"
        }

        Item {
            id: playBtn
            width: 30
            height: 30
            anchors.verticalCenter: parent.verticalCenter
            Image {
                // anchors.fill: parent
                // fillMode: Image.Stretch
                source: isPlaying ? "qrc:/img/playMusic/zanting.png" : "qrc:/img/playMusic/kaishi.png"
                scale:  isPlaying ? 0.8 : 1
            }
            MouseArea {
                anchors.fill: parent
                onClicked: isPlaying = !isPlaying
            }
        }

        Image {
            width: 18
            height: 18
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/playMusic/zuihouyiyemoyexiayishou.png"
        }

        Image {
            width: 16
            height: 16
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/playMusic/fenxiang.png"
        }
    }

    Row {
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        spacing: 15

        Image {
            width: 18
            height: 18
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/playMusic/jingyunyinxiaopt-wangyiicon.png"
        }

        Image {
            id: modeBtn
            width: 18
            height: 18
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "qrc:/img/playMusic/shunxubofang.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    currentMode = (currentMode + 1) % 4
                    switch(currentMode) {
                        case 0: modeBtn.source = "qrc:/img/playMusic/shunxubofang.png"; break
                        case 1: modeBtn.source = "qrc:/img/playMusic/danquxunhuan.png"; break
                        case 2: modeBtn.source = "qrc:/img/playMusic/suijibofang.png"; break
                        case 3: modeBtn.source = "qrc:/img/playMusic/xindong.png"; break
                    }
                }
            }
        }

        Image {
            width: 18
            height: 18
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/playMusic/a-menumanegement.png"
        }

        Image {
            width: 18
            height: 18
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/playMusic/geci32.png"
        }

        Item {
            width: 18
            height: 18
            anchors.verticalCenter: parent.verticalCenter
            Image {
                id: volumeBtn
                width: 18
                height: 18
                source: isMuted ? "qrc:/img/playMusic/24gl-volumeCross.png" : "qrc:/img/playMusic/24gl-volumeZero.png"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: slider.visible = true
                    onClicked: {
                        isMuted = !isMuted
                        volume = isMuted ? 0 : 0.7
                    }
                }
            }
        }
    }

    Rectangle {
        id: slider
        width: 4
        height: 110
        color: "white"
        visible: false
        z: 100
        parent: bottomRect.parent
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: slider.visible = true
            onExited: slider.visible = false
            onPressed: volume = Math.max(0, Math.min(1, 1 - mouseY / height))
            onPositionChanged: if (pressed) volume = Math.max(0, Math.min(1, 1 - mouseY / height))
        }
        Rectangle {
            width: parent.width
            height: volume * parent.height
            color: "#FF6B6B"
            anchors.bottom: parent.bottom
        }
        Rectangle {
            width: 10
            height: 10
            color: "#FF6B6B"
            radius: 5
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height - volume * parent.height - 5
        }
    }

    Component.onCompleted: {
        updateSliderPosition()
    }

    function updateSliderPosition() {
        var volumeBtnPos = volumeBtn.mapToItem(bottomRect.parent, volumeBtn.x, volumeBtn.y)
        slider.x = volumeBtnPos.x + 7
        slider.y = volumeBtnPos.y - 125
    }

    Connections {
        target: volumeBtn
        function onXChanged() { updateSliderPosition() }
        function onYChanged() { updateSliderPosition() }
    }
}
