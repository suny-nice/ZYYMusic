import QtQuick
import QtQuick.Controls
import "../basic"
import QtQuick.Window

Popup {
    id: userLoginPopup
    modal: false
    dim: false
    focus: false
    width: 320
    height: 380
    closePolicy: Popup.NoAutoClose
    y: 70

    contentItem: Rectangle {
        anchors.fill: parent
        color: "#2d2d37"
        border.color: "#45454e"
        border.width: 0.8
        radius: 3

        // 关闭按钮
        Image {
            id: closeBtn
            height: 20
            width: 20
            source: "qrc:/img/quxiao.png"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            opacity: closeBtnMouseArea.containsMouse ? 0.7 : 1.0

            MouseArea {
                id: closeBtnMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: userLoginPopup.close()
            }
        }

        // 扫码登录标题
        Text {
            id: titleText
            text: qsTr("扫码登录")
            color: "white"
            font.pixelSize: 16
            anchors.top: parent.top
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // 二维码图片
        Image {
            id: qrCodeImage
            height: 200
            width: 200
            source: "qrc:/img/QRcode.png"
            anchors.top: titleText.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // 提示文字（使用HTML格式）
        Text {
            id: hintText
            textFormat: Text.RichText
            text: qsTr("使用手机<a href=\"https://music.163.com/\">网易云App</a>扫码登录")
            color: BasicConfig.colorSecondaryText
            font.pixelSize: 12
            anchors.top: qrCodeImage.bottom
            anchors.topMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
            
            onLinkActivated: function(link) {
                Qt.openUrlExternally(link)
            }
        }
    }
}
