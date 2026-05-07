import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Controls.Basic as Basic
import "../commonUI"

// 其他登录方式弹窗
Popup {
    id: otherLoginPopup
    modal: false
    dim: false
    focus: false
    width: 300
    height: 400
    closePolicy: Popup.NoAutoClose

    onClosed: {
        userLoginPopup.close()
    }

    property bool passwordVisible: false
    property string selectedCountryCode: "+86"
    property string selectedCountryName: "中国大陆"
    property string selectedCountryFlag: "qrc:/img/country/zhongguoguoqi.png"

    property var countryCodes: [
        { code: "+86", name: "中国大陆", flag: "qrc:/img/country/zhongguoguoqi.png" },
        { code: "+852", name: "中国香港", flag: "qrc:/img/country/xianggang.png" },
        { code: "+1", name: "美国", flag: "qrc:/img/country/meiguoguoqi.png" },
        { code: "+1", name: "加拿大", flag: "qrc:/img/country/jianada.png" },
        { code: "+81", name: "日本", flag: "qrc:/img/country/riben.png" },
        { code: "+82", name: "韩国", flag: "qrc:/img/country/hanguo.png" },
        { code: "+44", name: "英国", flag: "qrc:/img/country/yingguoguoqi.png" },
        { code: "+49", name: "德国", flag: "qrc:/img/country/deguoguoqi.png" },
        { code: "+31", name: "荷兰", flag: "qrc:/img/country/helanguoqi.png" },
        { code: "+39", name: "意大利", flag: "qrc:/img/country/yidali.png" },
        { code: "+41", name: "瑞士", flag: "qrc:/img/country/ruishi.png" },
        { code: "+84", name: "越南", flag: "qrc:/img/country/yuenan.png" },
        { code: "+92", name: "巴基斯坦", flag: "qrc:/img/country/bajisitan.png" }
    ]

    contentItem: Rectangle {
        anchors.fill: parent
        color: "#2d2d37"
        border.color: "#45454e"
        border.width: 0.8
        radius: 3

        // 关闭按钮
        Image {
            id: otherCloseBtn
            height: 20
            width: 20
            source: "qrc:/img/quxiao.png"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            opacity: otherCloseBtnMouseArea.containsMouse ? 0.7 : 1.0

            MouseArea {
                id: otherCloseBtnMouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: otherLoginPopup.close()
            }
        }

        Image {
            id: qrcode
            scale: 0.2
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -130
            anchors.topMargin: -130
            source: "qrc:/img/QRcode.png"
            smooth: true

            MouseArea {
                anchors.left: parent.left
                anchors.top: parent.top
                width: 200
                height: 200
                hoverEnabled: true
                onEntered: cursorShape = Qt.PointingHandCursor
                onExited: cursorShape = Qt.ArrowCursor
                onClicked: {
                    otherLoginPopup.close()
                    userLoginPopup.open()
                }
            }
        }

        Canvas {
            id: canvas
            antialiasing: false
            width: 200
            height: 200

            onPaint: {
                var ctx = getContext("2d")
                ctx.beginPath()
                ctx.moveTo(80, 5)
                ctx.lineTo(80, 80)
                ctx.lineTo(5, 80)
                ctx.lineTo(80, 5)
                ctx.closePath()
                ctx.fillStyle = "#2d2d37"
                ctx.fill()
            }
        }

        Column {
            id: loginForm
            width: parent.width -50
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 14

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10

                Image {
                    width: 34
                    height: 34
                    source: "qrc:/img/wangyiyun.png"
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: "网易云APP"
                    color: "#f2f4f8"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                }
            }

            // 手机号输入框
            Rectangle {
                id: phoneFieldWrap
                width: parent.width
                height: 40
                radius: 20
                color: "#25262c"
                border.width: 1
                // border.color:"red"

                Row {
                    anchors.fill: parent
                    anchors.leftMargin: 14
                    anchors.rightMargin: 14
                    spacing: 0

                    Item {
                        id:countryItem
                        width: 65//输入框前+86的宽度
                        height: parent.height
                        Row {
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 5
                            Image {
                                width: 16
                                height: 16
                                source: otherLoginPopup.selectedCountryFlag
                                fillMode: Image.PreserveAspectFit
                                smooth: true
                            }

                            Text {
                                text: otherLoginPopup.selectedCountryCode + " v"
                                color: countryArea.containsMouse ? "#f2f4f8" : "#d7dae1"
                                font.pixelSize: 13
                                font.weight: Font.Medium
                            }
                        }

                        MouseArea {
                            id: countryArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                if (countryCodePopup.opened) {
                                    countryCodePopup.close()
                                } else {
                                    countryCodePopup.open()
                                }
                            }
                        }
                    }

                    Rectangle {
                        width: 1
                        height: 20
                        radius: 1
                        anchors.verticalCenter: parent.verticalCenter
                        color: "#3a3e4c"
                    }

                    Basic.TextField {
                        id: numberTextField
                        width: parent.width - 80
                        height: parent.height
                        placeholderText: "请输入手机号"
                        placeholderTextColor: "#6f737d"
                        color: "#f2f4f8"
                        font.pixelSize: 14
                        selectByMouse: true
                        leftPadding: 0
                        verticalAlignment: TextInput.AlignVCenter
                        background: Item {}
                    }
                }
            }

            // 密码输入框
            Rectangle {
                id: passwordFieldWrap
                width: parent.width
                height: 40
                radius: 20
                color: "#25262c"
                border.width: 1

                Row {
                    anchors.fill: parent
                    anchors.leftMargin: 14
                    anchors.rightMargin: 14
                    spacing: 0

                    Basic.TextField {
                        id: passwordInput
                        width: parent.width - 34
                        height: parent.height
                        placeholderText: "请输入密码"
                        placeholderTextColor: "#6f737d"
                        color: "#f2f4f8"
                        font.pixelSize: 14
                        selectByMouse: true
                        leftPadding: 0
                        echoMode: otherLoginPopup.passwordVisible ? Basic.TextField.Normal : Basic.TextField.Password
                        verticalAlignment: TextInput.AlignVCenter
                        background: Item {}
                    }

                    Image {
                        id: passwordEye
                        width: 20
                        height: 20
                        anchors.verticalCenter: parent.verticalCenter
                        source: otherLoginPopup.passwordVisible  ? "qrc:/img/Logo/yanjing.png" : "qrc:/img/Logo/yanjingguanbi.png"

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: otherLoginPopup.passwordVisible  = !otherLoginPopup.passwordVisible
                        }
                    }
                }
            }

            // 自动登录和链接
            Row {
                width: parent.width
                height: 20

                ZYYCheckbox {
                    id: autoLogin
                    checked: false
                    text: "自动登录"
                    fontSize: 12
                    textColor: "#6f737d"
                }
                Item{
                    anchors.right: parent.right
                    anchors.rightMargin: 14
                    width:120
                    Row {
                        spacing: 5
                        Text {

                            text: "忘记密码"
                            color: "#6f737d"
                            font.pixelSize: 12
                            opacity: wjArea.containsMouse ? 0.8 : 1.0
                            MouseArea {
                                id:wjArea
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: { /* 忘记密码逻辑 */ }
                            }
                        }
                        Text { text: "|" ; color: "#45454e" ; font.pixelSize: 12 }
                        Text {
                            text: "验证码登录"
                            color: "#6f737d"
                            font.pixelSize: 12
                             opacity: yzmArea.containsMouse ? 0.8 : 1.0
                            MouseArea {
                                id:yzmArea
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: { /* 验证码登录逻辑 */ }
                            }
                        }
                    }
                }
            }

            // 登录按钮
            Rectangle {
                width: parent.width
                height: 40
                radius: 20
                color: "#ff4a55"

                Text {
                    anchors.centerIn: parent
                    text: "登录"
                    color: "#ffffff"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                     opacity: loginArea.containsMouse ? 0.8 : 1.0

                }

                MouseArea {
                    id:loginArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: { /* 登录逻辑 */ }
                }
            }
            Text {
                id: registerText
                anchors.horizontalCenter: parent.horizontalCenter
                text: "注册"
                color: "#a7acb6"
                font.pixelSize: 14
                font.weight: Font.Medium
                opacity: registerArea.containsMouse ? 0.8 : 1.0

                MouseArea {
                    id: registerArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                }
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 18

                Repeater {
                    model: [
                        { source: "qrc:/img/Logo/weixin.png" },
                        { source: "qrc:/img/Logo/QQ.png" },
                        { source: "qrc:/img/Logo/weibo.png" },
                        { source: "qrc:/img/Logo/wangyi.png" }
                    ]

                    delegate: Rectangle {
                        id: socialButton
                        width: 36
                        height: 36
                        radius: 18
                        // color: "transparent"
                        // border.width: 1
                        color: socialArea.containsMouse ? "#ff666a" : "#2f323b"

                        Image {
                            anchors.centerIn: parent
                            width: 20
                            height: 20
                            source: modelData.source
                            fillMode: Image.PreserveAspectFit
                            smooth: true
                            opacity: socialArea.containsMouse ? 0.8 : 1.0
                        }

                        MouseArea {
                            id: socialArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                }
            }

            Item {
                width: parent.width
                height: 20
                // anchors.left: parent.left
                // anchors.leftMargin: 14
                Row {

                    spacing: -2
                    ZYYCheckbox {
                        checked: false
                        text: "同意"
                        textColor: "#767b87"
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Text {
                        text: "《服务条款》"
                        color: "#748fd7"
                        font.pixelSize: 11
                         anchors.verticalCenter: parent.verticalCenter
                    }

                    Text {
                        text: "《隐私政策》"
                        color: "#748fd7"
                        font.pixelSize: 11
                         anchors.verticalCenter: parent.verticalCenter
                    }

                    Text {
                        text: "《儿童隐私政策》"
                        color: "#748fd7"
                        font.pixelSize: 11
                         anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }

        }



        // 国家代码选择弹窗
        Popup {
            id: countryCodePopup
            x: 18
            y: phoneFieldWrap.y + phoneFieldWrap.height + 70
            width: phoneFieldWrap.width
            height: 224
            padding: 0
            modal: false
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

            background: Rectangle {
                radius: 12
                color: "#2d2d37"
                border.width: 1
                border.color: "#45454e"
            }

            contentItem: Flickable {
                id: countryFlick
                anchors.fill: parent
                anchors.margins: 8
                contentWidth: width
                contentHeight: countryColumn.height
                clip: true
                boundsBehavior: Flickable.StopAtBounds

                Column {
                    id: countryColumn
                    width: countryFlick.width
                    spacing: 6

                    Repeater {
                        model: otherLoginPopup.countryCodes

                        delegate: Rectangle {
                            width: countryColumn.width
                            height: 38
                            radius: 8
                            color: itemArea.containsMouse ? "#333744" : "transparent"

                            Row {
                                anchors.fill: parent
                                anchors.leftMargin: 12
                                anchors.rightMargin: 12
                                spacing: 10

                                Image {
                                    width: 18
                                    height: 18
                                    anchors.verticalCenter: parent.verticalCenter
                                    source: modelData.flag
                                    fillMode: Image.PreserveAspectFit
                                    smooth: true
                                }

                                Text {
                                    width: 48
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: modelData.code
                                    color: "#f2f4f8"
                                    font.pixelSize: 14
                                    font.weight: Font.Medium
                                }

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: modelData.name
                                    color: "#a0a4ad"
                                    font.pixelSize: 14
                                }
                            }

                            MouseArea {
                                id: itemArea
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    otherLoginPopup.selectedCountryCode = modelData.code
                                    otherLoginPopup.selectedCountryName = modelData.name
                                    otherLoginPopup.selectedCountryFlag = modelData.flag
                                    countryCodePopup.close()
                                }
                            }
                        }
                    }
                }
            }
        }

    }
}
