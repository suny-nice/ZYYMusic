import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Controls.Basic as Basic

// 自定义快捷键组件
Item {
    id: root
    
    // 属性
    property string shortcut: ""
    property string placeholderText: "⌘ + G"
    property int fontSize: 13
    property color textColor: "#ffffff"
    property color placeholderColor: "#6f939e"
    property color backgroundColor: "#25262c"
    property color borderColor: "#3a3e4c"
    
    width: 100
    height:30
    
    // 当 shortcut 属性改变时，同步到输入框
    onShortcutChanged: {
        if (shortcutInput) {
            shortcutInput.text = shortcut
        }
    }
    
    // 快捷键输入框
    Rectangle {
        id: shortcutField
        width: parent.width
        height: parent.height
        radius: height / 2
        color: root.backgroundColor
        border.width: 1
        border.color: root.borderColor
        
        Basic.TextField {
            id: shortcutInput
            anchors.fill: parent
            anchors.leftMargin: 14
            anchors.rightMargin: 14
            placeholderText: root.placeholderText
            placeholderTextColor: root.placeholderColor
            color: root.textColor
            font.pixelSize: root.fontSize
            readOnly: false
            cursorVisible: shortcutInput.activeFocus
            verticalAlignment: TextInput.AlignVCenter
            background: Item {}
            selectByMouse: false
            
            Keys.onPressed: function(event) {
                handleKeyPressed(event)
            }
            
            onActiveFocusChanged: {
                if (activeFocus && shortcutInput.text === "") {
                    root.shortcut = ""
                }
            }
        }
        
        MouseArea {
            anchors.fill: parent
            onClicked: {
                shortcutInput.forceActiveFocus()
            }
        }
    }
    
    function handleKeyPressed(event) {
        if (!shortcutInput.focus) return
        
        event.accepted = true
        
        // 只接收组合键
        if (event.modifiers === 0) {
            return
        }
        
        var key = event.key
        
        // 简单处理：只接受标准字母键码
        if (key < 65 || key > 90) {
            return
        }
        
        var str = ""
        
        if (event.modifiers & Qt.MetaModifier) {
            str += "⌃ + "
        }
        if (event.modifiers & Qt.ControlModifier) {
            str += "⌘ + "
        }
        if (event.modifiers & Qt.AltModifier) {
            str += "⌥ + "
        }
        
        str += String.fromCharCode(key)
        
        root.shortcut = str
        shortcutInput.text = str
    }
    
    function setShortcut(newShortcut) {
        root.shortcut = newShortcut
        shortcutInput.text = newShortcut
    }
    
    function clearShortcut() {
        root.shortcut = ""
        shortcutInput.text = ""
    }
    
    function loseFocus() {
        shortcutInput.focus = false
    }
}