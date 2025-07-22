import Quickshell
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
            screen: modelData
            anchors {
                top: true
                right: true
            }

            implicitHeight: timerDisplay.implicitHeight
            implicitWidth: timerDisplay.implicitWidth

            color: "black"

            Text {
                id: timerDisplay
                anchors {
                    top: parent
                    horizontalCenter: parent.horizontalCenter
                }

                color: "white"
                font.pixelSize: 20
                text: {
                    let minutes = Math.floor(root.timeRemaining / 60);
                    let seconds = root.timeRemaining % 60;
                    return `${root.isTask ? "Task" : "Break"}: ${String(minutes).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`;
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onClicked: mouse => {
                        if (mouse.button === Qt.LeftButton) {
                            timer.running = !timer.running;
                        } else if (mouse.button === Qt.RightButton) {
                            timer.running = false;
                            root.isTask = true;
                            root.timeRemaining = root.taskDuration;
                        }
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
                root.timeRemaining = root.isTask ? root.breakDuration : root.taskDuration;
                root.isTask = !root.isTask;
                alarmSound.play();
            }
        }
    }

    SoundEffect {
        id: alarmSound
        source: "assets/sounds/alarm.wav"
    }
}
