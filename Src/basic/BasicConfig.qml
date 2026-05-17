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
    
    // 导航历史列表（用于标签导航）
    property var navHistory: []
    
    // StackView 历史列表（用于设置页面导航）
    property var stackHistory: []
    
    // CloudMusicCherryPick 组件引用
    property var cloudMusicCherryPick: null
    
    // StackView 引用
    property var mainStackView: null
    
    // 添加页面到导航历史（标签导航）
    function pushNav(pageInfo) {
        navHistory.push(pageInfo)
    }
    
    // 从导航历史弹出上一个页面（标签导航）
    function popNav() {
        if (navHistory.length > 1) {
            navHistory.pop()
            return navHistory[navHistory.length - 1]
        }
        return null
    }
    
    // 检查是否可以返回（标签导航）
    function canGoBack() {
        return navHistory.length > 1
    }
    
    // 添加页面到 StackView 历史
    function pushStack(pageInfo) {
        stackHistory.push(pageInfo)
        if (mainStackView) {
            mainStackView.push(pageInfo)
        }
    }
    
    // 从 StackView 弹出上一个页面
    function popStack() {
        if (stackHistory.length > 0) {
            stackHistory.pop()
            if (mainStackView) {
                mainStackView.pop()
            }
        }
    }
    
    // 检查是否可以返回（StackView 导航）
    function canGoBackStack() {
        return stackHistory.length > 0
    }
}