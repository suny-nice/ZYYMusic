import QtQuick 2.15

Item {
    id: root
    
    // 属性
    property string text: ""
    property color textColor: "#ffffff"
    property int fontSize: 13
    property bool checked: false
    property string group: ""
    
    // 信号
    signal clicked()
    
    width: radioButton.width + 5 + label.implicitWidth
    height: Math.max(radioButton.height, label.implicitHeight)
    
    // 单选框按钮
    Rectangle {
        id: radioButton
        width: 16
        height: 16
        radius: 8
        border.color: root.checked ? "#ff666a" : "#3f4350"
        border.width: 1
        color: "transparent"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: (parent.height - height) / 2
        
        // 内圆
        Rectangle {
            width: 8
            height: 8
            radius: 4
            color: root.checked ? "#ff666a" : "transparent"
            anchors.centerIn: parent
        }
        
        // 点击区域
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (!root.checked) {
                    root.checked = true
                    root.clicked()
                }
            }
        }
    }
    
    // 文字标签
    Text {
        id: label
        text: root.text
        color: root.textColor
        font.pixelSize: root.fontSize
        textFormat: Text.RichText
        anchors.left: radioButton.right
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: (parent.height - implicitHeight) / 2
        
        // 点击区域
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (!root.checked) {
                    root.checked = true
                    root.clicked()
                }
            }
        }
    }
    
    // 递归查找同一组的所有单选框
    function findRadioButtonsInGroup(item, groupName) {
        var result = []
        if (item && item.children) {
            for (var i = 0; i < item.children.length; i++) {
                var child = item.children[i]
                // 检查是否是ZYYRadioButton且属于同一组
                if (child !== root && child.group === groupName) {
                    result.push(child)
                }
                // 递归查找子节点
                result = result.concat(findRadioButtonsInGroup(child, groupName))
            }
        }
        return result
    }
    
    // 当checked状态改变时，通知同一组的其他单选框
    onCheckedChanged: {
        if (checked && group !== "") {
            // 从根节点开始查找同一组的所有单选框
            var rootItem = root
            while (rootItem.parent) {
                rootItem = rootItem.parent
            }
            // 查找同一组的所有单选框
            var radioButtons = findRadioButtonsInGroup(rootItem, group)
            for (var i = 0; i < radioButtons.length; i++) {
                var rb = radioButtons[i]
                if (rb !== root && rb.checked) {
                    rb.checked = false
                }
            }
        }
    }
}