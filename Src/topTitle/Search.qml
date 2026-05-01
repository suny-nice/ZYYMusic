import QtQuick 2.15
import QtQuick.Controls
import "../basic"

Item {
    anchors.left:parent.left
    anchors.leftMargin: 10
    height: 60
    width: 200
    Row{
        spacing: 10
        anchors.verticalCenter: parent.verticalCenter
        //前进
        Rectangle{
            width: 18
            height: 28
            radius: 3
            color: BasicConfig.colorWindowRightBg
            border.color: "#36262f"
            border.width: 1

            anchors.verticalCenter: parent.verticalCenter
            Image {
                height: 23
                width: 20
                source: "qrc:/img/zuojiantou.png"
                anchors.centerIn: parent
                opacity: qianjinMouseArea.containsMouse ? 0.8 : 1.0
                MouseArea{
                    id:qianjinMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    // onClicked: {}
                }
            }
        }
        //搜索输入框
        Item {
            height: 25
            width: 120
            anchors.verticalCenter: parent.verticalCenter
            
            //背景层
            Rectangle{//外矩形
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0; color: "#21283d" }
                    GradientStop { position: 1; color: "#382635" }
                }
                Rectangle{//内矩形
                    anchors.fill: parent
                    anchors.margins: 1
                    gradient: Gradient {
                        GradientStop { position: 0; color: "#1a1d29" }
                        GradientStop { position: 1; color: "#241c26" }
                    }
                }
            }
            
            //搜索图标
            Image {
                id: searchIcon
                height: 20
                width: 20
                source: "qrc:/img/sousuo.png"
                anchors.left: parent.left
                // anchors.leftMargin: 2
                anchors.verticalCenter: parent.verticalCenter
            }
            
      //输入框
            TextInput{
                id:searchField
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.left: searchIcon.right  // 从图标右侧开始
                anchors.leftMargin: 2
                clip: true  // 裁剪超出部分
                verticalAlignment: Text.AlignVCenter  // 垂直居中
                color: "white"  // 文字颜色
            }
        }
        //麦克风
        Rectangle{
            width: 27
            height: width
            radius: 3
            color: BasicConfig.colorWindowRightBg
            border.color: "#36262f"
            border.width: 1
            anchors.verticalCenter: parent.verticalCenter
            Image {
                id: luyinImg
                height: width
                width: 21
                source: "qrc:/img/luyin.png"
                anchors.centerIn: parent
                opacity: luyinMouseArea.containsMouse ? 0.8 : 1.0
                MouseArea{
                    id:luyinMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    // onClicked: {}
                }
            }
        }

    }

    // Rectangle{
    //     anchors.fill: parent
    //     color: "red"
    // }
}