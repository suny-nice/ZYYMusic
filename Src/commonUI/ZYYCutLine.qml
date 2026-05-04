import QtQuick 2.15

//在实例化的分割线中说明在谁的下方即可
Rectangle {
    id: cutline
    anchors.top: parent.bottom
    anchors.topMargin: 10
    height: 1
    anchors.right: parent.right
    anchors.rightMargin: 24
    anchors.left: parent.left
    color: "#212127"
}
