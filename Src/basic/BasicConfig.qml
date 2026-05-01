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
}
