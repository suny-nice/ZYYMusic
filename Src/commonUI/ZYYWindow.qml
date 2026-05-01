import QtQuick 2.15

Window {
    id: mainWindow
    width: 1000
    height: 640
    visible: true
    title: qsTr("Hello World")

    // 窗口居中显示
    x: (Screen.width - width) / 2
    y: (Screen.height - height) / 2

    // 使用 Item 作为容器来支持拖拽
    Item {
        id: rootItem
        anchors.fill: parent

        // 用于拖拽窗口的 MouseArea
        MouseArea {
            anchors.fill: parent
            onPressed:function(mouse) {
                // 记录鼠标按下时的位置
                dragOffset = Qt.point(mouse.x, mouse.y)
            }
            onPositionChanged:function(mouse) {
                // 根据鼠标移动更新窗口位置
                mainWindow.x += mouse.x - dragOffset.x
                mainWindow.y += mouse.y - dragOffset.y
            }

            property var dragOffset
        }

    }
}
