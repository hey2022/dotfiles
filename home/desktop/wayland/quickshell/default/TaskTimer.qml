import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls
import QtMultimedia

Scope {
    id: root
    property int taskDuration: 90 * 60
    property int breakDuration: 20 * 60
    property bool isTask: true
    property int timeRemaining: taskDuration

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
                            let minutes = Math.floor(root.timeRemaining / 60);
                            let seconds = root.timeRemaining % 60;
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
                        timer.running = false;
                        root.timeRemaining = root.resetTime();
                        break;
                    case Qt.MiddleButton:
                        timer.running = false;
                        root.isTask ^= true;
                        root.timeRemaining = root.resetTime();
                        break;
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
            if (root.timeRemaining > 0) {
                root.timeRemaining -= 1;
            } else {
                root.isTask ^= true;
                root.timeRemaining = root.resetTime();
                alarmSound.play();
            }
        }
    }

    function resetTime() {
        return root.isTask ? root.taskDuration : root.breakDuration;
    }

    SoundEffect {
        id: alarmSound
        source: "assets/sounds/alarm.wav"
    }
}
