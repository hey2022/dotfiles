import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls
import QtMultimedia

Scope {
    id: root
    property bool isTask: true
    property int time: 0

    Variants {
        model: Quickshell.screens
        PanelWindow {
            property var modelData
            property real margin: 5
            screen: modelData
            anchors {
                bottom: true
                right: true
            }

            margins {
                bottom: margin
                right: margin
            }

            color: "transparent"
            implicitHeight: rect.implicitHeight
            implicitWidth: rect.implicitWidth

            WrapperMouseArea {
                WrapperRectangle {
                    id: rect
                    anchors.centerIn: parent
                    radius: 10
                    margin: 5
                    color: "#80000000"
                    Text {
                        id: timerDisplay
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        color: "white"
                        font.pixelSize: 20
                        text: {
                            let minutes = Math.floor(root.time / 60);
                            let seconds = root.time % 60;
                            return `${root.isTask ? "Task" : "Break"}: ${String(minutes).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`;
                        }
                    }
                }
                acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                onClicked: mouse => {
                    switch (mouse.button) {
                    case Qt.LeftButton:
                        timer.running ^= true;
                        break;
                    case Qt.RightButton:
                        root.time = root.isTask ? root.time / 5 : 0;
                        root.isTask ^= true;
                        break;
                    case Qt.MiddleButton:
                        root.isTask = true;
                        timer.running = false;
                        root.time = 0;
                        break;
                    }
                }
                onWheel: wheel => {
                    if (root.isTask) {
                        root.time += wheel.angleDelta.y / 2;
                        root.time = Math.max(root.time, 0);
                    }
                }
            }
        }
    }

    Timer {
        id: timer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            root.time += root.isTask ? 1 : -1;
            if (!root.isTask && time <= 0) {
                root.isTask = true;
                root.time = 0;
                alarmSound.play();
            }
        }
    }

    SoundEffect {
        id: alarmSound
        source: "assets/sounds/alarm.wav"
    }
}
