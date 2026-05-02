import QtQuick 2.15
import QtQuick.Controls
import "../basic"
import "../topTitle"
Item {
    id:userLogin
    anchors.right: parent.right
    anchors.rightMargin: 280
    height: 60
    width: 200

    UserLoginPopup{
    id:userLoginPopup
    }

    Row{
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10
        //头像
        Image {
            id: weidengluImg
            height: width
            width: 26
            source: "qrc:/img/weidenglu.png"
            anchors.verticalCenter: parent.verticalCenter
            opacity: weidengluImgMouseArea.containsMouse ? 0.7 : 1.0
            MouseArea{
                id: weidengluImgMouseArea
                anchors.fill: parent
                hoverEnabled: true
                // onClicked: {}
            }
        }
        // 未登录 文本
        Text {
            id: weidengluText
            text: qsTr("未登录")
            opacity: weidengluTextMouseArea.containsMouse ? 0.7 : 1.0
            color:"white"
            font.pixelSize: 13
            anchors.verticalCenter: parent.verticalCenter
            MouseArea{
                id: weidengluTextMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    userLoginPopup.open()
                }
            }
        }
        //vip
        Rectangle{
            id:vipRect
            height: 23
            width: 80
            radius: 13
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            Label{
                id:vipText
                text: "VIP开通"
               leftPadding:29
                font.pixelSize: 12
                anchors.verticalCenter: parent.verticalCenter
                opacity: vipTextMouseArea.containsMouse ? 0.7 : 1.0
                MouseArea{
                    id: vipTextMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    // onClicked: {}
                }
            }
            Rectangle{
                height: 26
                width: 26
                 radius: width/2
                color: "white"
                border.width: 0.7
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        //下拉
        Image {
            height: 26
            width: 26
            source: "qrc:/img/xiala.png"
            anchors.verticalCenter: parent.verticalCenter
            opacity: xiala.containsMouse ? 0.7 : 1.0
            MouseArea{
                id:xiala
                anchors.fill: parent
                hoverEnabled: true
                // onClicked: {}
            }
        }
        //邮件
        Image {
            height: 26
            width: 26
            source: "qrc:/img/youjian.png"
            anchors.verticalCenter: parent.verticalCenter
            opacity: youjian.containsMouse ? 0.7 : 1.0
            MouseArea{
                id:youjian
                anchors.fill: parent
                hoverEnabled: true
                // onClicked: {}
            }
        }
        //设置
        Image {
            height: 26
            width: 26
            source: "qrc:/img/shezhi.png"
            anchors.verticalCenter: parent.verticalCenter
            opacity: shezhi.containsMouse ? 0.7 : 1.0
            MouseArea{
                id:shezhi
                anchors.fill: parent
                hoverEnabled: true
                // onClicked: {}
            }
        }
        //换肤
        Image {
            height: 26
            width: 26
            source: "qrc:/img/huanfu.png"
            anchors.verticalCenter: parent.verticalCenter
            opacity: huanfu.containsMouse ? 0.7 : 1.0
            MouseArea{
                id:huanfu
                anchors.fill: parent
                hoverEnabled: true
                // onClicked: {}
            }
        }
        //竖线
        Rectangle{
            width: 1
            height: 20
            color: BasicConfig.colorTop
            anchors.verticalCenter: parent.verticalCenter
        }

    }
    // Rectangle{
    //     anchors.fill: parent
    //     color: "red"
    // }
}
