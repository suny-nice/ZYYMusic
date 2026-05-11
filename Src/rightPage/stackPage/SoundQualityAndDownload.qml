import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs
import "../../commonUI"

Item {
    id: root
    width: parent.width
    height: 610
    
    property string playQuality: "标准"
    property string downloadQuality: "标准"
    property string musicNamingFormat: "不分类文件夹"
    property string fileSmartSort: "歌曲名"
    property string downloadDir: "C:\\CloudMusic"
    property string cacheDir: "C:\\CloudMusic"
    property int maxCacheSize: 1024 // MB
    property int maxCacheSizeMax: 10240 // MB (10GB)
    
    // Toast 提示组件
    Item {
        id: toastContainer
        anchors.fill: parent
        z: 100
        
        Rectangle {
            id: toast
            width: 150
            height: 40
            radius: 4
            color: Qt.rgba(0, 0, 0, 0.7)
            visible: false
            anchors.centerIn:  toastContainer
            
            Text {
                anchors.centerIn: parent
                text: toastText
                color: "white"
                font.pixelSize: 13
            }
            
            NumberAnimation on opacity {
                id: toastAnimation
                from: 1
                to: 0
                duration: 1000
                running: false
                onRunningChanged: {
                    if (!running) {
                        toast.visible = false
                    }
                }
            }
        }
    }
    
    property string toastText: ""
    
    function showToast(text) {
        toastText = text
        toast.opacity = 1
        toast.visible = true
        toastAnimation.stop()
        toastAnimation.start()
    }
    
    // 标题和内容区域
    Row {
        spacing: 20
        anchors.top: parent.top
        
        // 标题
        Text {
            text: "音质与下载"
            color: "white"
            font.bold: true
            font.pixelSize: 15
            width: 80
        }
        
        // 内容区域
        Column {
            spacing: 30
            
            // 音质播放设置
            Column {
                spacing: 10
                
                // 标题
                Text {
                    text: "音质播放设置"
                    color: "white"
                    font.pixelSize: 13
                }
                
                // 所有播放设置的单选框放在同一个Column中（用于分组）
                Column {
                    spacing: 5
                    
                    // 选项行1
                    Row {
                        spacing: 60
                        
                        ZYYRadioButton {
                            text: "沉静环绕声"
                            textColor: "#f2f4f8"
                            group: "playQualityGroup"
                            checked: root.playQuality === "沉静环绕声"
                            onClicked: {
                                root.playQuality = "沉静环绕声"
                            }
                        }
                        
                        ZYYRadioButton {
                            text: "超声母带"
                            textColor: "#f2f4f8"
                            group: "playQualityGroup"
                            checked: root.playQuality === "超声母带"
                            onClicked: {
                                root.playQuality = "超声母带"
                            }
                        }
                        
                        ZYYRadioButton {
                            text: "高清臻音"
                            textColor: "#f2f4f8"
                            group: "playQualityGroup"
                            checked: root.playQuality === "高清臻音"
                            onClicked: {
                                root.playQuality = "高清臻音"
                            }
                        }
                    }
                    
                    // 选项行2
                    Row {
                        spacing: 60
                        
                        ZYYRadioButton {
                            text: "高解析度无损"
                            textColor: "#f2f4f8"
                            group: "playQualityGroup"
                            checked: root.playQuality === "高解析度无损"
                            onClicked: {
                                root.playQuality = "高解析度无损"
                            }
                        }
                        
                        ZYYRadioButton {
                            text: "无损"
                            textColor: "#f2f4f8"
                            group: "playQualityGroup"
                            checked: root.playQuality === "无损"
                            onClicked: {
                                root.playQuality = "无损"
                            }
                        }
                        
                        ZYYRadioButton {
                            text: "极高"
                            textColor: "#f2f4f8"
                            group: "playQualityGroup"
                            checked: root.playQuality === "极高"
                            onClicked: {
                                root.playQuality = "极高"
                            }
                        }
                    }
                    
                    // 选项行3
                    Row {
                        spacing: 60
                        
                        ZYYRadioButton {
                            text: "标准"
                            textColor: "#f2f4f8"
                            group: "playQualityGroup"
                            checked: root.playQuality === "标准"
                            onClicked: {
                                root.playQuality = "标准"
                            }
                        }
                    }
                }
            }
            
            // 音质下载设置
            Column {
                spacing: 10
                
                // 标题
                Text {
                    text: "音质下载设置"
                    color: "white"
                    font.pixelSize: 13
                }
                
                // 所有下载设置的单选框放在同一个Column中（用于分组）
                Column {
                    spacing: 5
                    
                    // 选项行1
                    Row {
                        spacing: 60
                        
                        ZYYRadioButton {
                            text: "沉静环绕声"
                            textColor: "#f2f4f8"
                            group: "downloadQualityGroup"
                            checked: root.downloadQuality === "沉静环绕声"
                            onClicked: {
                                root.downloadQuality = "沉静环绕声"
                            }
                        }
                        
                        ZYYRadioButton {
                            text: "超声母带"
                            textColor: "#f2f4f8"
                            group: "downloadQualityGroup"
                            checked: root.downloadQuality === "超声母带"
                            onClicked: {
                                root.downloadQuality = "超声母带"
                            }
                        }
                        
                        ZYYRadioButton {
                            text: "高清臻音"
                            textColor: "#f2f4f8"
                            group: "downloadQualityGroup"
                            checked: root.downloadQuality === "高清臻音"
                            onClicked: {
                                root.downloadQuality = "高清臻音"
                            }
                        }
                    }
                    
                    // 选项行2
                    Row {
                        spacing: 60
                        
                        ZYYRadioButton {
                            text: "高解析度无损"
                            textColor: "#f2f4f8"
                            group: "downloadQualityGroup"
                            checked: root.downloadQuality === "高解析度无损"
                            onClicked: {
                                root.downloadQuality = "高解析度无损"
                            }
                        }
                        
                        ZYYRadioButton {
                            text: "无损"
                            textColor: "#f2f4f8"
                            group: "downloadQualityGroup"
                            checked: root.downloadQuality === "无损"
                            onClicked: {
                                root.downloadQuality = "无损"
                            }
                        }
                        
                        ZYYRadioButton {
                            text: "极高"
                            textColor: "#f2f4f8"
                            group: "downloadQualityGroup"
                            checked: root.downloadQuality === "极高"
                            onClicked: {
                                root.downloadQuality = "极高"
                            }
                        }
                    }
                    
                    // 选项行3
                    Row {
                        spacing: 60
                        
                        ZYYRadioButton {
                            text: "标准"
                            textColor: "#f2f4f8"
                            group: "downloadQualityGroup"
                            checked: root.downloadQuality === "标准"
                            onClicked: {
                                root.downloadQuality = "标准"
                            }
                        }
                    }
                }
            }

            // 了解音质（放在音质下载设置下面）


            Text {
                text: "了解音质>"
                color: "#8f939e"
                font.pixelSize: 13
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        Qt.openUrlExternally("https://music.163.com/#/discover")
                    }
                }
            }





            
            // 下载目录
            ZYYFolderSet {
                title: "下载目录"
                dialogTitle: "选择下载目录"
                currentPath: root.downloadDir
                
                onPathChanged: function(newPath) {
                    root.downloadDir = newPath
                }
            }
            
            // 缓存目录
            ZYYFolderSet {
                title: "缓存目录"
                dialogTitle: "选择缓存目录"
                currentPath: root.cacheDir
                
                onPathChanged: function(newPath) {
                    root.cacheDir = newPath
                }
            }
            
            // 缓存最大占用
            Column {
                spacing: 8
                
                Text {
                    text: "缓存最大占用"
                    color: "white"
                    font.pixelSize: 13
                }
                
                Row {
                    spacing: 10
                    
                    // 滑块滚动条
                    Item {
                        width: 200
                        height: 16
                        
                        // 滑块背景
                        Rectangle {
                            width: parent.width
                            height: 4
                            color: "#3a3e4c"
                            radius: 2
                            anchors.verticalCenter: parent.verticalCenter
                            
                            // 已填充部分
                            Rectangle {
                                width: (root.maxCacheSize / root.maxCacheSizeMax) * parent.width
                                height: parent.height
                                color: "#ff4a55"
                                radius: 2
                            }
                        }
                        
                        // 滑块手柄
                        Rectangle {
                            width: 16
                            height: 16
                            radius: 8
                            color: "#ff4a55"
                            anchors.verticalCenter: parent.verticalCenter
                            x: (root.maxCacheSize / root.maxCacheSizeMax) * parent.width - width / 2
                            
                            MouseArea {
                                anchors.fill: parent
                                drag.target: parent
                                drag.axis: Drag.XAxis
                                drag.minimumX: 0
                                drag.maximumX: parent.parent.width - parent.width
                                
                                onPositionChanged: {
                                    if (drag.active) {
                                        var newValue = (parent.x + parent.width / 2) / parent.parent.width * root.maxCacheSizeMax
                                        root.maxCacheSize = Math.max(0, Math.min(root.maxCacheSizeMax, Math.round(newValue)))
                                    }
                                }
                            }
                        }
                    }
                    
                    // 显示大小
                    Text {
                        text: (root.maxCacheSize / 1024).toFixed(1) + "G"
                        color: "#f2f4f8"
                        font.pixelSize: 13
                    }
                    
                    // 清除缓存按钮
                    Rectangle {
                        width: 70
                        height: 22
                        radius: 3
                        color: "#3a3e4c"
                        border.width: 1
                        border.color: "#4a4e5c"
                        
                        Text {
                            anchors.centerIn: parent
                            text: "清除缓存"
                            color: "#f2f4f8"
                            font.pixelSize: 12
                        }
                        
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                showToast("缓存已清除")
                            }
                        }
                    }
                }
            }
            
            // 音乐命名格式
            Column {
                spacing: 10
                
                Text {
                    text: "音乐命名格式"
                    color: "white"
                    font.pixelSize: 13
                }
                
                Row {
                    spacing: 40
                    
                    ZYYRadioButton {
                        text: "不分类文件夹"
                        textColor: "#f2f4f8"
                        group: "namingFormatGroup"
                        checked: root.musicNamingFormat === "不分类文件夹"
                        onClicked: {
                            root.musicNamingFormat = "不分类文件夹"
                        }
                    }
                    
                    ZYYRadioButton {
                        text: "按歌手分文件夹"
                        textColor: "#f2f4f8"
                        group: "namingFormatGroup"
                        checked: root.musicNamingFormat === "按歌手分文件夹"
                        onClicked: {
                            root.musicNamingFormat = "按歌手分文件夹"
                        }
                    }
                    
                    ZYYRadioButton {
                        text: "按歌手/专辑分文件夹"
                        textColor: "#f2f4f8"
                        group: "namingFormatGroup"
                        checked: root.musicNamingFormat === "按歌手/专辑分文件夹"
                        onClicked: {
                            root.musicNamingFormat = "按歌手/专辑分文件夹"
                        }
                    }
                }
            }
            
            // 文件智能分类
            Column {
                spacing: 10
                
                Text {
                    text: "文件智能分类"
                    color: "white"
                    font.pixelSize: 13
                }
                
                Row {
                    spacing: 40
                    
                    ZYYRadioButton {
                        text: "歌曲名"
                        textColor: "#f2f4f8"
                        group: "smartSortGroup"
                        checked: root.fileSmartSort === "歌曲名"
                        onClicked: {
                            root.fileSmartSort = "歌曲名"
                        }
                    }
                    
                    ZYYRadioButton {
                        text: "歌曲-歌手名"
                        textColor: "#f2f4f8"
                        group: "smartSortGroup"
                        checked: root.fileSmartSort === "歌曲-歌手名"
                        onClicked: {
                            root.fileSmartSort = "歌曲-歌手名"
                        }
                    }
                    
                    ZYYRadioButton {
                        text: "歌曲名-歌手"
                        textColor: "#f2f4f8"
                        group: "smartSortGroup"
                        checked: root.fileSmartSort === "歌曲名-歌手"
                        onClicked: {
                            root.fileSmartSort = "歌曲名-歌手"
                        }
                    }
                }
            }
            

        }
    }
    // 分割线
    ZYYCutLine {}
}