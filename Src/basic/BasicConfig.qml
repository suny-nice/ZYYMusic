pragma Singleton
import QtQuick 2.15

QtObject{
    //三个区域的颜色
    readonly property color colorWindowLeftBg: "#1a1a21"
    readonly property color colorWindowRightBg: "#13131a"
    readonly property color colorPlayerBarBg: "#2d2d37"
    
    readonly property int leftPaneWidth: 225
    readonly property int playerBarHeight: 80

    //顶部栏的颜色
    readonly property color colorTop: "#75777f"

    //搜索记录字体颜色
    readonly property color colorSecondaryText: "#7f7f85"
    
    //已播放歌词颜色
    property color finishedLyricsUpColor: "#ee83b4"          //已播放歌词的上渐变颜色
    property color finishedLyricsDownColor: "#f3b3b1"        //已播放歌词的下渐变颜色
    property color finishedLyricsBorderColor: "#fffff9"      //已播放歌词的边框颜色
    
    //未播放歌词颜色
    property color unFinishedLyricsUpColor: "white"          //未播放歌词的上渐变颜色
    property color unFinishedLyricsDownColor: "#dddddd"      //未播放歌词的下渐变颜色
    property color unFinishedLyricsBorderColor: "white"      //未播放歌词的边框颜色
}