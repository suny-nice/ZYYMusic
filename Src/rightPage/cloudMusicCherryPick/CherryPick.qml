import QtQuick 2.15

Item {
    width: parent.width
    height: parent.height



    // 自定义滚动条
    Item {
        id: scrollBar
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -75
        width: 6

        Rectangle {
            id: slider
            width: parent.width
            height: 60
            color: "#6a6e7c"
            radius: 3
            anchors.horizontalCenter: parent.horizontalCenter
            y: flick.visibleArea.yPosition * (scrollBar.height - 30)

            MouseArea {
                anchors.fill: parent
                drag.target: slider
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: scrollBar.height - 135

                onPositionChanged: {
                    flick.contentY = slider.y / (scrollBar.height - 60) * (flick.contentHeight - flick.height)
                }
            }
        }
    }

    // 可滚动内容区域
    Flickable {
        id: flick
        anchors.fill: parent
        anchors.topMargin: 20
        contentHeight: 2000
        clip: true

        Column {
            id: contentColumn
            width: parent.width
            spacing: 30
            //轮播图
            Carousellmage {
                width: parent.width
            }
            //歌单
            OfficialPlayList{}
        }
    }
}
