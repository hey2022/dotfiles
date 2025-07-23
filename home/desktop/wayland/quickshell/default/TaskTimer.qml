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
            property real margin: 5
            screen: modelData
            anchors {
                bottom: true
                right: true
            }

            margins {
                top: margin
                bottom: margin
                left: margin
                right: margin
            }
            implicitHeight: timerDisplay.implicitHeight + margin * 2
            implicitWidth: timerDisplay.implicitWidth + margin * 2
            color: "transparent"

            Rectangle {
                // match the size of the window
                anchors.fill: parent

                radius: 10
                color: "#80000000"
                Text {
                    id: timerDisplay
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
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
                        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                        onClicked: mouse => {
                            switch (mouse.button) {
                            case Qt.LeftButton:
                                timer.running ^= true;
                                break;
                            case Qt.RightButton:
                                timer.running = false;
                                root.isTask = true;
                                root.timeRemaining = root.taskDuration;
                                break;
                            case Qt.MiddleButton:
                                timer.running = false;
                                root.isTask ^= true;
                                root.timeRemaining = root.isTask ? root.taskDuration : root.breakDuration;
                                break;
                            }
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
                root.isTask ^= true;
                alarmSound.play();
            }
        }
    }

    SoundEffect {
        id: alarmSound
        source: "assets/sounds/alarm.wav"
    }
}
