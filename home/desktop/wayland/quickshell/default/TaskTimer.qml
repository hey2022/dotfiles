import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Controls
import QtMultimedia

Scope {
    id: root
    property bool isTask: true
    property int time: 0
    property int breakTime: 0

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
                    border {
                        width: 2
                        color: timer.running ? "#ffffff" : "#000000"
                    }
                    Text {
                        id: timerDisplay
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        color: "white"
                        font.pixelSize: 20
                        text: {
                            let time = root.isTask ? root.time : root.breakTime;
                            let minutes = Math.floor(time / 60);
                            let seconds = time % 60;
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
                        switchMode();
                        break;
                    case Qt.MiddleButton:
                        root.isTask = true;
                        timer.running = false;
                        if (root.isTask) {
                            root.time = 0;
                        } else {
                            root.breakTime = 0;
                        }
                        break;
                    }
                }
                onWheel: wheel => {
                    let dt = wheel.angleDelta.y / 2;
                    if (root.isTask) {
                        root.time = Math.max(0, root.time + dt);
                    } else {
                        root.breakTime = Math.max(0, root.breakTime + dt);
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
            if (root.isTask) {
                root.time++;
                return;
            }

            if (root.breakTime <= 0) {
                switchMode();
                timer.running = false;
                alarmSound.play();
            } else {
                root.breakTime--;
            }
        }
    }

    function switchMode() {
        root.isTask ^= true;
        root.breakTime += root.time / 5;
        root.time = 0;
    }

    SoundEffect {
        id: alarmSound
        source: "assets/sounds/alarm.wav"
    }
}
