import QtQuick 2.15
import QtQuick.Controls

ComboBox {
    id: comboBox
    width: 150
    height: 32
    model: ["默认", "仿宋", "华文中宋", "华文仿宋", "华文宋体", "华文新魏", "华文楷体", "华文细黑", "华文行书", "华文隶书", "宋体", "幼圆", "微软雅黑", "微软雅黑 Light", "新宋体", "方正姚体", "方正舒体"]
    currentIndex: 0

    background: Rectangle {
        color: "#25262c"
        radius: 6
        border.width: 1
        border.color: "#3f4350"
    }

    contentItem: Text {
        text: comboBox.displayText
        color: "#f2f4f8"
        font.pixelSize: 13
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.verticalCenter: parent.verticalCenter
    }

    delegate: Item {
        width: parent.width
        height: 32

        Text {
            text: modelData
            color: "#f2f4f8"
            font.pixelSize: 13
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "#212127"
            anchors.bottom: parent.bottom
        }
    }

    popup: Popup {
        y: comboBox.height
        width: comboBox.width
        height: 300
        padding: 0
        background: Rectangle {
            color: "#25262c"
            radius: 6
            border.width: 1
            border.color: "#3f4350"
        }
        contentItem: ListView {
            clip: true
            model: comboBox.popup.visible ? comboBox.delegateModel : null
            currentIndex: comboBox.highlightedIndex
        }
    }

    indicator: Text {
        text: comboBox.popup.visible ? "<" : ">"
        color: "#8f939e"
        font.pixelSize: 16
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter
    }
}