import QtQuick 2.15
import "../basic"

//最大化，最小化，退出
Item{
    id:maxmin
    Row{
        id:minRow
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
        layoutDirection: Qt.RightToLeft

        Image {
            height: 26
            width: 26
            source: "qrc:/img/quxiao.png"
            anchors.verticalCenter: parent.verticalCenter
            opacity: closeMouseArea.containsMouse ? 0.7 : 1.0
            MouseArea{
                id: closeMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    Qt.quit()
                }
            }
        }
        Rectangle{
            id:zuidahua
            height: 18
            width: 18
            color: "transparent"
            border.color: BasicConfig.colorTop
            border.width: 1.5
            radius: 3
            anchors.verticalCenter: parent.verticalCenter
            opacity: maxMouseArea.containsMouse ? 0.7 : 1.0

            MouseArea{
                id: maxMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    mainWindow.showMaximized()
                }
            }
        }
        Image {
            height: 26
            width: 26
            source: "qrc:/img/zuixiaohua.png"
            anchors.verticalCenter: parent.verticalCenter
            opacity: zuixiaohua.containsMouse ? 0.7 : 1.0
            MouseArea{
                id:zuixiaohua
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    mainWindow.showMinimized()
                }
            }
        }

        Image {
            id: minimizImg
            height: 30
            width: 30
            source: "qrc:/img/MINIMIZE.png"
            anchors.verticalCenter: parent.verticalCenter
            opacity: minimizeMouseArea.containsMouse ? 0.7 : 1.0
            MouseArea{
                id:  minimizeMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                   mainWindow.showNormal()
                }
            }
        }
    }
}
