import QtQuick 2.15
import QtQuick.Controls
import "../../commonUI"

Item {
    width: parent.width
    height: 350

    Label {
        id: playTitle
        color: "white"
        font.bold: true
        text: "播放"
        font.pixelSize: 15
        width: 50
    }

    Column {
        anchors.left: playTitle.right
        anchors.leftMargin: 20
        spacing: 15

        Column {
            spacing: 10

            ZYYCheckbox { text: "程序启动时自动播放"; checked: false }
            ZYYCheckbox { text: "<span style='color: white;'>首次进入播客时自动播放</span><span style='color: #8f939e;'>（不播歌时）</span>"; checked: false }
            ZYYCheckbox { text: "程序启动时记住上一次播放进度"; checked: true }
            ZYYCheckbox { text: "开启音乐淡入淡出"; checked: false }
            ZYYCheckbox { text: "平衡不同音频之间的音量大小"; checked: false }
        }

        Column {
            spacing: 10

            Text {
                text: "输出设备"
                color: "white"
                font.pixelSize: 13
                font.bold: true
            }

            ZYYComboBox {
                width: 280
                height: 28
                model: ["DirectSound:主声音驱动程序", "WaveOut:扬声器", "ASIO:音频接口"]
                currentIndex: 0
            }
        }

        Column {
            spacing: 10

            Text {
                text: "播放列表"
                color: "white"
                font.pixelSize: 13
                font.bold: true
            }

            ZYYRadioButton {
                id: replacePlaylist
                text: "双击播放单曲时，用当前单曲所在的歌曲列表替换播放列表"
                checked: true
                group: "playlistGroup"
            }

            ZYYRadioButton {
                id: addToPlaylist
                text: "双击播放单曲时，仅把当前单曲添加到播放列表中"
                checked: false
                group: "playlistGroup"
            }
            Text {
                text: "最近播放记录"
                color: "white"
                font.pixelSize: 13
                font.bold: true
            }
            ZYYCheckbox{
                text: "开启后，同步当前账户所在设置名称的最近播放记录"
                checked: false
            }
        }
    }
    ZYYCutLine{}
}
