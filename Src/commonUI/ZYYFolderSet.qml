import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs

Item {
    id: root
    width: parent.width
    height: 40
    
    property string title: "目录"
    property string currentPath: "C:\\CloudMusic"
    property string dialogTitle: "选择目录"
    
    signal pathChanged(string newPath)
    
    // 目录选择对话框
    FolderDialog {
        id: folderDialog
        title: root.dialogTitle
        onAccepted: {
            let s = String(folderDialog.currentFolder)
            let str = s.slice(8)
            root.currentPath = str
            root.pathChanged(str)
        }
    }
    
    Column {
        spacing: 8
        anchors.fill: parent
        
        Text {
            text: root.title
            color: "white"
            font.pixelSize: 13
        }
        
        Row {
            spacing: 10
            
            Label {
                id: pathLabel
                text: root.currentPath
                color: "#f2f4f8"
                font.pixelSize: 13
                elide: Text.ElideMiddle
                maximumLineCount: 1
                width: 200
            }
            
            // 更改目录按钮
            Rectangle {
                width: 70
                height: 22
                radius: 3
                color: "#3a3e4c"
                border.width: 1
                border.color: "#4a4e5c"
                
                Text {
                    anchors.centerIn: parent
                    text: "更改目录"
                    color: "#f2f4f8"
                    font.pixelSize: 12
                }
                
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        folderDialog.open()
                    }
                }
            }
        }
    }
}