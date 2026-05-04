import QtQuick 2.15
import QtQuick.Controls
import "../basic"
import "../topTitle"

Item {
    id:topTitle
    MaxMin{
        id:maxmin
        anchors.right: parent.right
        height: 60
    }
    UserLogin{
        id:userLogin
        anchors.right: parent.right
        anchors.rightMargin: 280
        height: 60
        width: 200
    }

    Search{
        id:search
        anchors.left: parent.left
        anchors.leftMargin: 10
        height: 60
        width: 200
    }
}
