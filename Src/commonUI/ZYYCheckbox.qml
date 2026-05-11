import QtQuick 2.15

Item {
    id: root
    property alias text: label.text
    property color textColor: "white"
    property int fontSize: 13
    property bool checked: false
    signal toggled(bool checked)

    width: checkbox.width + 10 + label.implicitWidth
    height: Math.max(checkbox.height, 20)  // 固定最小高度为20

    Rectangle {
        id: checkbox
        width: 16
        height: 16
        radius: 3
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: (parent.height - height) / 2
        color: root.checked ? "#ff666a" : "transparent"
        border.width: 1
        border.color: root.checked ? "#ff666a" : "#3f4350"

        Text {
            anchors.centerIn: parent
            visible: root.checked
            text: "✓"
            color: "#ffffff"
            font.pixelSize: 11
            font.weight: Font.Bold
        }
    }

    Text {
        id: label
        anchors.left: checkbox.right
        anchors.leftMargin: 9
        anchors.top: parent.top
        anchors.topMargin: (parent.height - implicitHeight) / 2
        font.pixelSize: 13
        textFormat: Text.RichText
        
        // 设置默认颜色，富文本中的样式会覆盖这个颜色
        color: root.textColor
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            root.checked = !root.checked
            root.toggled(root.checked)
        }
    }
}