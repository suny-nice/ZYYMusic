import QtQuick 2.15
import "../../commonUI"

Item {
    id: root
    width: parent.width
    height: 590

    // 定义列宽度常量
    property int labelWidth: 60
    property int descriptionWidth: 100
    property int shortcutWidth: 120
    property int globalShortcutWidth: 150
    property int columnSpacing: 40  // 列之间的间距

    // 全局快捷键设置
    property bool enableGlobalShortcut: false
    property bool useSystemMediaShortcut: false

    // 覆盖整个区域的 MouseArea，用于点击空白区域失焦
    MouseArea {
        anchors.fill: parent
        z: -1  // 放在最底层

        onClicked: {
            // 点击空白区域时，让所有快捷键组件失去焦点
            for (var i = 0; i < shortcutRepeater.count; i++) {
                var item = shortcutRepeater.itemAt(i)
                if (item) {
                    var shortcut1 = item.children[2]  // 快捷键输入框
                    var shortcut2 = item.children[3]  // 全局快捷键输入框
                    if (shortcut1 && shortcut1.loseFocus) {
                        shortcut1.loseFocus()
                    }
                    if (shortcut2 && shortcut2.loseFocus) {
                        shortcut2.loseFocus()
                    }
                }
            }
        }
    }

    // 恢复默认快捷键函数
    function restoreDefaults() {
        // 恢复复选框状态
        globalShortcutCheckbox.checked = false
        systemMediaCheckbox.checked = false
        root.enableGlobalShortcut = false
        root.useSystemMediaShortcut = false

        // 恢复所有快捷键为默认值
        var defaults = [
                    {description: "播放/暂停", shortcut: "⌃ + P", globalShortcut: "⌃ + ⌥ + P"},
                    {description: "上一首", shortcut: "⌃ + Left", globalShortcut: "⌃ + ⌥ + Left"},
                    {description: "下一首", shortcut: "⌃ + Right", globalShortcut: "⌃ + ⌥ + Right"},
                    {description: "音量加", shortcut: "⌃ + Up", globalShortcut: "⌃ + ⌥ + Up"},
                    {description: "音量减", shortcut: "⌃ + Down", globalShortcut: "⌃ + ⌥ + Down"},
                    {description: "mini/完整模式", shortcut: "⌃ + M", globalShortcut: "⌃ + ⌥ + M"},
                    {description: "喜欢歌曲", shortcut: "⌃ + L", globalShortcut: "⌃ + ⌥ + L"},
                    {description: "标签", shortcut: "⌃ + B", globalShortcut: "⌃ + ⌥ + B"},
                    {description: "打开/关闭歌词", shortcut: "⌃ + D", globalShortcut: "⌃ + ⌥ + D"}
                ]

        for (var i = 0; i < shortcutModel.count; i++) {
            shortcutModel.setProperty(i, "shortcut", defaults[i].shortcut)
            shortcutModel.setProperty(i, "globalShortcut", defaults[i].globalShortcut)
        }

        // 更新所有ZYYShortcut组件的显示
        for (var j = 0; j < shortcutRepeater.count; j++) {
            var item = shortcutRepeater.itemAt(j)
            if (item) {
                var shortcut1 = item.children[2]
                var shortcut2 = item.children[3]
                if (shortcut1 && shortcut1.setShortcut) {
                    shortcut1.setShortcut(defaults[j].shortcut)
                }
                if (shortcut2 && shortcut2.setShortcut) {
                    shortcut2.setShortcut(defaults[j].globalShortcut)
                }
            }
        }
    }

    // 标题行
    Row {
        id: titleRow
        width: parent.width
        height: 30
        spacing: columnSpacing
        anchors.top: parent.top

        // Label 列
        Text {
            width: labelWidth
            text: "快捷键"
            color: "white"
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
        }

        // 功能说明列
        Text {
            width: descriptionWidth
            text: "功能说明"
            color: "white"
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
        }

        // 快捷键列
        Text {
            width: shortcutWidth
            text: "快捷键"
            color: "white"
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
        }

        // 全局快捷键列
        Text {
            width: globalShortcutWidth
            text: "全局快捷键"
            color: "white"
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
        }
    }

    // 快捷键列表
    Column {
        id: shortcutsColumn
        width: parent.width
        anchors.top: titleRow.bottom
        anchors.topMargin: 20
        spacing: 20

        // ListModel 存储默认快捷键数据
        ListModel {
            id: shortcutModel

            ListElement {
                description: "播放/暂停"
                shortcut: "⌃ + P"
                globalShortcut: "⌃ + ⌥ + P"
            }

            ListElement {
                description: "上一首"
                shortcut: "⌃ + Left"
                globalShortcut: "⌃ + ⌥ + Left"
            }

            ListElement {
                description: "下一首"
                shortcut: "⌃ + Right"
                globalShortcut: "⌃ + ⌥ + Right"
            }

            ListElement {
                description: "音量加"
                shortcut: "⌃ + Up"
                globalShortcut: "⌃ + ⌥ + Up"
            }

            ListElement {
                description: "音量减"
                shortcut: "⌃ + Down"
                globalShortcut: "⌃ + ⌥ + Down"
            }

            ListElement {
                description: "mini/完整模式"
                shortcut: "⌃ + M"
                globalShortcut: "⌃ + ⌥ + M"
            }

            ListElement {
                description: "喜欢歌曲"
                shortcut: "⌃ + L"
                globalShortcut: "⌃ + ⌥ + L"
            }

            ListElement {
                description: "标签"
                shortcut: "⌃ + B"
                globalShortcut: "⌃ + ⌥ + B"
            }

            ListElement {
                description: "打开/关闭歌词"
                shortcut: "⌃ + D"
                globalShortcut: "⌃ + ⌥ + D"
            }
        }

        // 使用 Repeater 渲染每一行
        Repeater {
            id: shortcutRepeater
            model: shortcutModel

            Row {
                width: parent.width
                height: 30
                spacing: columnSpacing

                // Label 列（空列，保持对齐）
                Item {
                    width: labelWidth
                    height: 30
                }

                // 功能说明
                Text {
                    width: descriptionWidth
                    text: model.description
                    color: "#f2f4f8"
                    font.pixelSize: 13
                    verticalAlignment: Text.AlignVCenter
                }

                // 快捷键输入框
                ZYYShortcut {
                    id: shortcut1
                    width: shortcutWidth
                    height: 30
                    shortcut: model.shortcut
                    anchors.verticalCenter: parent.verticalCenter
                }

                // 全局快捷键输入框
                ZYYShortcut {
                    id: shortcut2
                    width: globalShortcutWidth
                    height: 30
                    shortcut: model.globalShortcut
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }
    }

    // 全局快捷键设置区域（放在快捷键列表下面，与功能说明列对齐）
    Column {
        id: settingsColumn
        width: parent.width - labelWidth
        anchors.top: shortcutsColumn.bottom
        anchors.left: parent.left
        anchors.leftMargin: labelWidth +40
        anchors.topMargin: 40
        spacing: 15

        // 启用全局快捷键
        Row {
            spacing: 10

            ZYYCheckbox {
                id: globalShortcutCheckbox
                checked: root.enableGlobalShortcut
                onToggled: function(checked) {
                    root.enableGlobalShortcut = checked
                }
            }

            Text {
                text: "启用全局快捷键（云音乐在后台时也能响应）"
                color: "#f2f4f8"
                font.pixelSize: 13
                verticalAlignment: Text.AlignVCenter
            }
        }

        // 使用系统媒体快捷键
        Row {
            spacing: 10

            ZYYCheckbox {
                id: systemMediaCheckbox
                checked: root.useSystemMediaShortcut
                onToggled: function(checked) {
                    root.useSystemMediaShortcut = checked
                }
            }

            Text {
                text: "使用系统媒体快捷键（播放/暂停、上一首、下一首、停止）"
                color: "#f2f4f8"
                font.pixelSize: 13
                verticalAlignment: Text.AlignVCenter
            }

            // 默认恢复按钮
            Rectangle {
                id: defaultButton
                width: 80
                height: 28
                radius: 4
                color: "#3a3e4c"
                border.width: 1
                border.color: "#4a4e5c"
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    anchors.centerIn: parent
                    text: "默认恢复"
                    color: "#f2f4f8"
                    font.pixelSize: 13
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        restoreDefaults()
                    }
                }

            }

        }

    }
    ZYYCutLine{}
}