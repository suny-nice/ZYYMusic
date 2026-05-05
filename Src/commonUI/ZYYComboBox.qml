import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Basic as Basic

Basic.ComboBox {
    id: comboBox
    width: 100
    height: 28
    model: ["默认", "仿宋", "华文中宋", "华文仿宋", "华文宋体", "华文新魏", "华文楷体", "华文细黑", "华文行书", "华文隶书", "宋体", "幼圆", "微软雅黑", "微软雅黑", "新宋体", "方正姚体", "方正舒体"]
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
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 30  // 为箭头留出空间
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }

    delegate: Item {
        width: comboBox.width
        height: 32

        Rectangle {
            id: hoverBg
            anchors.fill: parent
            color: "#3f4350"
            visible: false
        }

        Text {
            text: modelData
            color: "#f2f4f8"
            font.pixelSize: 13
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: (parent.height - implicitHeight) / 2
        }



        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: hoverBg.visible = true
            onExited: hoverBg.visible = false
            onClicked: {
                comboBox.currentIndex = index
                comboBox.popup.close()
            }
        }
    }

    popup: Popup {
        y: comboBox.height
        width: comboBox.width
        height:300
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
        text: ">"
        color: "#8f939e"
        font.pixelSize: 16
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        rotation: comboBox.popup.visible ? -90 : 90
    }
}