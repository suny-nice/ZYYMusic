import QtQuick 2.15

Item {
    id: root
    width: parent ? parent.width : implicitWidth
    height: implicitHeight
    implicitWidth: 600
    implicitHeight: 180

    property var bannerSources: [
        "qrc:/img/cherryPick/lunbotu01.jpg",
        "qrc:/img/cherryPick/lunbotu02.jpg",
        "qrc:/img/cherryPick/lunbotu03.jpg",
        "qrc:/img/cherryPick/lunbotu04.jpg",
        "qrc:/img/cherryPick/lunbotu05.jpg",
        "qrc:/img/cherryPick/lunbotu06.jpg"
    ]
    property bool isAnimating: false
    property int currentIndex: 0
    property int animationDuration: 500
    property int autoPlayInterval: 2000

    ListModel {
        id: bannerModel
    }

    function rebuildModel() {
        bannerModel.clear()

        for (var i = 0; i < bannerSources.length; ++i) {
            bannerModel.append({ "src": bannerSources[i] })
        }
    }

    function slideLeft() {
        if (isAnimating || bannerModel.count <= 1) return

        isAnimating = true
        currentIndex = (currentIndex + 1) % bannerModel.count
        bannerModel.append(bannerModel.get(0))
        bannerModel.remove(0)

        dotsContainer.moveDirection = -1
        dotsMoveAnimation.restart()
        finishTimer.restart()
    }

    function slideRight() {
        if (isAnimating || bannerModel.count <= 1) return

        isAnimating = true
        currentIndex = (currentIndex - 1 + bannerModel.count) % bannerModel.count
        bannerModel.insert(0, bannerModel.get(bannerModel.count - 1))
        bannerModel.remove(bannerModel.count - 1)

        dotsContainer.moveDirection = 1
        dotsMoveAnimation.restart()
        finishTimer.restart()
    }

    Component.onCompleted: rebuildModel()

    onBannerSourcesChanged: {
        currentIndex = 0
        rebuildModel()
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            leftArrow.opacity = 1
            rightArrow.opacity = 1
        }

        onExited: {
            leftArrow.opacity = 0
            rightArrow.opacity = 0
        }
    }

    Image {
        id: leftArrow
        source: "qrc:/img/cherryPick/zuo.png"
        width: 40
        height: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 40
        opacity: 0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: root.slideRight()
        }
    }

    Image {
        id: rightArrow
        source: "qrc:/img/cherryPick/you.png"
        width: 42
        height: 42
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 40
        opacity: 0

        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: root.slideLeft()
        }
    }

    Item {
        id: bannerItem
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.top: parent.top
        height: 160

        ListView {
            id: bannerListView
            anchors.fill: parent
            orientation: ListView.Horizontal
            model: bannerModel
            spacing: 10
            clip: true
            interactive: false
            snapMode: ListView.NoSnap
            cacheBuffer: 1000
            highlightFollowsCurrentItem: false
            highlightRangeMode: ListView.NoHighlightRange

            remove: Transition {
                NumberAnimation {
                    properties: "x"
                    to: -360
                    duration: root.animationDuration
                    easing.type: Easing.OutCubic
                }
            }

            removeDisplaced: Transition {
                NumberAnimation {
                    properties: "x"
                    duration: root.animationDuration
                    easing.type: Easing.OutCubic
                }
            }

            delegate: Rectangle {
                width: (bannerListView.width - bannerListView.spacing) / 2
                height: 140
                color: "transparent"

                Image {
                    anchors.fill: parent
                    source: model.src
                    fillMode: Image.PreserveAspectCrop
                }
            }
        }
    }

    Item {
        id: dotsContainer
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        width: dotSpacing * dotSizes.length
        height: dotSpacing

        property int dotSpacing: 18
        property var dotSizes: [0, 6, 8, 10, 8, 6, 0]
        property real moveProgress: 0
        property int moveDirection: 0

        Repeater {
            model: dotsContainer.dotSizes.length

            Item {
                width: dotsContainer.dotSpacing
                height: dotsContainer.dotSpacing
                x: index * dotsContainer.dotSpacing
                clip: true

                property real dotSize: dotsContainer.dotSizes[index]
                property real restX: (width - dotSize) / 2
                property real restY: (height - dotSize) / 2
                property real travelX: dotsContainer.moveDirection * dotsContainer.dotSpacing

                Rectangle {
                    anchors.centerIn: parent
                    width: parent.dotSize
                    height: width
                    radius: width / 2
                    color: "#ffffff"
                    opacity: width > 0 ? 0.6 : 0
                    visible: !dotsMoveAnimation.running
                }

                Rectangle {
                    width: parent.dotSize
                    height: width
                    radius: width / 2
                    color: "#ffffff"
                    opacity: width > 0 ? 0.6 : 0
                    x: parent.restX + parent.travelX * dotsContainer.moveProgress
                    y: parent.restY
                    visible: dotsMoveAnimation.running
                }

                Rectangle {
                    width: parent.dotSize
                    height: width
                    radius: width / 2
                    color: "#ffffff"
                    opacity: width > 0 ? 0.6 : 0
                    x: parent.restX - parent.travelX + parent.travelX * dotsContainer.moveProgress
                    y: parent.restY
                    visible: dotsMoveAnimation.running
                }
            }
        }

        NumberAnimation {
            id: dotsMoveAnimation
            target: dotsContainer
            property: "moveProgress"
            from: 0
            to: 1
            duration: root.animationDuration
            easing.type: Easing.OutCubic
            onStopped: dotsContainer.moveProgress = 0
        }
    }

    Timer {
        id: finishTimer
        interval: root.animationDuration
        running: false
        repeat: false
        onTriggered: root.isAnimating = false
    }

    Timer {
        id: carouselTimer
        interval: root.autoPlayInterval
        running: root.visible && bannerModel.count > 1
        repeat: true
        onTriggered: root.slideLeft()
    }
}
