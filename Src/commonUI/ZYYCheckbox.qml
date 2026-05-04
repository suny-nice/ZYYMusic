import QtQuick 2.15

Item {
    id: root
    property alias text: label.text
    property color textColor: "#c8ccd5"
    property int fontSize: 13
    property bool checked: false
    signal toggled(bool checked)

    width: checkbox.width + 10 + label.implicitWidth
    height: Math.max(checkbox.height, label.implicitHeight)

    Rectangle {
        id: checkbox
        width: 16
        height: 16
        radius: 3
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
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
        anchors.verticalCenter: parent.verticalCenter
        color: root.textColor
        font.pixelSize: 13
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