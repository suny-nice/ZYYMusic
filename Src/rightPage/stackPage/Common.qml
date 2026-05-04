import QtQuick 2.15
import QtQuick.Controls

Item {
    width: parent.width
    height: 300
    // 标题
    Label {
        id:commonArea
        color: "white"
        font.bold: true
        text: "常规"
        font.pixelSize: 15
        width: 50
    }
    // 内容区域
    Column {
        width: parent.width
        anchors.left: commonArea.right
        anchors.leftMargin: 20
        // 描述文字
        Text {
            text: "字体选择（如果字体显示不清晰，请在控制面板-字体设置中启动系统Clear Type设置）"
            color: "#8f939e"
            font.pixelSize: 13
        }


    }
}
