import QtQuick
import QtQuick.Controls
import "../basic"


Popup {
    id: userLoginPopup
    modal: false
    dim: false
    focus: false
    width: 300
    height: 400
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
            font.pixelSize: 20
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
        }

        // 图片容器
        Item {
            id: imageContainer
            width: 300
            height: 200
            anchors.top: titleText.bottom
            anchors.topMargin: 30
            anchors.verticalCenter: parent.verticalCenter

            // 爱心图片（左，长方形）
            Image {
                id: aiXinImage
                height: 230
                width: 140

                source: "qrc:/img/aixin.png"
                x: 15  // 默认在左侧，留出间距
                y: 0    // 垂直居中
            }

            // 二维码容器（包含二维码和提示文字）
            Item {
                id: qrCodeContainer
                height: 180
                width: 140
                scale: 0.8  // 默认缩小显示
                x: 160      // 默认在右侧
                y: 30       // 垂直居中

                // 二维码图片
                Image {
                    id: qrCodeImage
                    height: 140
                    width: 140
                    source: "qrc:/img/QRcode.png"
                    anchors.top: parent.top
                }

                // 提示文字（始终在二维码下方）
                Text {
                    id: hintText
                    textFormat: Text.RichText
                    text: qsTr("使用<a href=\"https://music.163.com/\">网易云App</a>扫码登录")
                    color: BasicConfig.colorSecondaryText
                    font.pixelSize: 13
                    anchors.top: qrCodeImage.bottom
                    anchors.topMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: qrCodeContainer.scale === 0.8 ? 130 : 170
                    wrapMode: Text.WrapAnywhere
                    horizontalAlignment: Text.AlignHCenter

                    onLinkActivated: function(link) {
                        Qt.openUrlExternally(link)
                    }
                }

                // 在二维码上添加 MouseArea
                MouseArea {
                    id: qrCodeMouseArea
                    anchors.fill: qrCodeImage
                    hoverEnabled: true

                    onEntered: {
                        showAnimation.showFlag = true
                        showAnimation.start()
                    }

                    onExited: {
                        showAnimation.showFlag = false
                        showAnimation.start()
                    }
                }
            }

            // 并行动画
            ParallelAnimation {
                id: showAnimation
                property bool showFlag: false

                // 爱心图片动画
                PropertyAnimation {
                    target: aiXinImage
                    property: "opacity"
                    from: showAnimation.showFlag ? 1 : 0
                    to: showAnimation.showFlag ? 0 : 1
                    duration: 300
                    easing.type: Easing.OutCubic
                }

                PropertyAnimation {
                    target: aiXinImage
                    property: "x"
                    from: showAnimation.showFlag ? 10 : 80
                    to: showAnimation.showFlag ? 80 : 10
                    duration: 300
                    easing.type: Easing.OutCubic
                }

                PropertyAnimation {
                    target: aiXinImage
                    property: "y"
                    from: showAnimation.showFlag ? 0 : 30
                    to: showAnimation.showFlag ? 30 : 0
                    duration: 300
                    easing.type: Easing.OutCubic
                }

                // 二维码容器动画（包含二维码和提示文字）
                PropertyAnimation {
                    target: qrCodeContainer
                    property: "x"
                    from: showAnimation.showFlag ? 160 : 80
                    to: showAnimation.showFlag ? 80 : 160
                    duration: 300
                    easing.type: Easing.OutCubic
                }

                PropertyAnimation {
                    target: qrCodeContainer
                    property: "y"
                    from: showAnimation.showFlag ? 30 : 30
                    to: showAnimation.showFlag ? 30 : 30
                    duration: 300
                    easing.type: Easing.OutCubic
                }

                PropertyAnimation {
                    target: qrCodeContainer
                    property: "scale"
                    from: showAnimation.showFlag ? 0.8 : 1.2
                    to: showAnimation.showFlag ? 1.2 : 0.8
                    duration: 300
                    easing.type: Easing.OutCubic
                }
            }
        }

        // 选择其他方式登录
        Text {
            id: otherLoginText
            text: qsTr("选择其他方式登录>")
            color: "#75777f"
            font.pixelSize: 13

            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onEntered: {
                    cursorShape = Qt.PointingHandCursor
                }

                onExited: {
                    cursorShape = Qt.ArrowCursor
                }

                onClicked: {
                    // 弹出新弹窗
                    otherLoginPopup.open()
                }
            }
        }

        // 其他登录方式弹窗
        OtherLoginPopup{
            id: otherLoginPopup
        }

    }
}