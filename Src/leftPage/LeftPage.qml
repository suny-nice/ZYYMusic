import QtQuick 2.15
import "../basic"
import "../commonUI"

Rectangle {
    id: leftRect
    color: BasicConfig.colorWindowLeftBg

    // ==================== Logo + 名称 ====================
    Item {
        id: logoWrapper
        anchors.top: parent.top
        anchors.topMargin: 28
        anchors.left: parent.left
        anchors.leftMargin: 45
        anchors.right: parent.right
        height: 70
        Row {
            id: logoSection
            spacing: 8

            Image {
                width: 40
                height: 40
                source: "qrc:/img/leftImg/wangyiyun.png"

            }

            Text {
                text: "周易云音乐"
                color: "#cccccc"
                font.pixelSize: 17
                font.bold: true
                 anchors.verticalCenter: parent.verticalCenter
            }
        }
        ZYYCutLine {}
    }

    // ==================== 云音乐精选 ====================
    Rectangle {
        id: cloudMusicPick
        anchors.top: logoWrapper.bottom
        anchors.topMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        height: 30
        color: "#ec4141"
        radius: 15

        Text {
            anchors.centerIn: parent
            text: "云音乐精选"
            color: "#ffffff"
            font.pixelSize: 14
            font.bold: true
        }
    }

    // ==================== 最近播放 ====================
    Row {
        id: recentItem
        anchors.top: cloudMusicPick.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 15

        Image {
            width: 20
            height: 20
            source: "qrc:/img/leftImg/zuijinbofang.png"
        }

        Text {
            text: "最近播放"
            color: "#cccccc"
            font.pixelSize: 14
        }
    }

    // ==================== 本地音乐 ====================
    Row {
        id: localItem
        anchors.top: recentItem.bottom
        anchors.topMargin:20
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 15

        Image {
            width: 15
            height: 15
            source: "qrc:/img/leftImg/bendiyinle.png"
        }

        Text {
            text: "本地音乐"
            color: "#cccccc"
            font.pixelSize: 14
        }
    }

    // ==================== 我喜欢 ====================
    Item {
        id: likeItem
        anchors.top: localItem.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.right: parent.right
        height: 24

        Row {
            anchors.left: parent.left
            anchors.leftMargin: 20
            spacing: 15

            Image {
                width: 20
                height: 20
                source: "qrc:/img/leftImg/aixin.png"
            }

            Text {
                text: "我喜欢的音乐"
                color: "#cccccc"
                font.pixelSize: 14
            }
        }


    }

    // ==================== 播客 ====================
    Row {
        id: bokeItem
        anchors.top: likeItem.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 15

        Image {
            width: 20
            height: 20
            source: "qrc:/img/leftImg/boke.png"
        }

        Text {
            text: "播客"
            color: "#cccccc"
            font.pixelSize: 14
        }
    }

    // ==================== 社区 ====================
    Row {
        id: shequItem
        anchors.top: bokeItem.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 15

        Image {
            width: 20
            height: 20
            source: "qrc:/img/leftImg/shequ.png"
        }

        Text {
            text: "社区"
            color: "#cccccc"
            font.pixelSize: 14
        }
    }

    // ==================== 新建歌单 ====================
    Item {
        id: newPlaylistWrapper
        anchors.top: shequItem.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 100
        Row {
            id: newPlaylist
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            spacing: 15
            Image {
                width: 20
                height:20
                source: "qrc:/img/leftImg/icon-.png"
            }
            Text {
                text: "新建歌单"
                color: "#cccccc"
                font.pixelSize: 14
                 anchors.verticalCenter: parent.verticalCenter
            }
        }

    }

}
