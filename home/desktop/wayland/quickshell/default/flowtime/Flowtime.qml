import Quickshell
import Quickshell.Widgets
import QtQuick
import QtMultimedia
import Quickshell.Io

Scope {
    id: root

    readonly property string ticktickAccessToken: tokenFile.text().trim()
    property bool isTask: true
    property bool showTimer: true
    property double focusStartTime: -1
    property double lastContinueTime: -1
    property double accumulatedFocusTime: 0
    property int displayTime: 0
    property int breakTime: 0

    Variants {
        model: Quickshell.screens

        PanelWindow {
            visible: root.showTimer

            property var modelData
            property int margin: 5

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
                    color: "#c0000000"

                    border {
                        width: 1
                        color: {
                            if (root.isTask) {
                                return timer.running ? "#ff7287fd" : "#807287fd";
                            } else {
                                return timer.running ? "#ff8839ef" : "#808839ef";
                            }
                        }
                    }

                    Text {
                        id: timerDisplay

                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        color: "white"
                        font.pixelSize: 12

                        text: {
                            let time = root.isTask ? root.displayTime : root.breakTime;
                            let minutes = Math.trunc(time / 60);
                            let seconds = Math.abs(time) % 60;
                            return `${time < 0 ? "-" : ""}${String(Math.abs(minutes)).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`;
                        }
                    }
                }

                acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

                onClicked: mouse => {
                    switch (mouse.button) {
                    case Qt.LeftButton:
                        timer.running = !timer.running;
                        break;
                    case Qt.RightButton:
                        root.switchMode();
                        break;
                    case Qt.MiddleButton:
                        alarmSound.stop();
                        timer.running = false;

                        if (!root.isTask) {
                            root.breakTime = 0;
                        }

                        root.isTask = true;
                        root.resetFocusTime();
                        break;
                    }
                }

                onWheel: wheel => {
                    if (!root.isTask) {
                        root.breakTime += wheel.angleDelta.y / 2;
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

        onRunningChanged: {
            root.trackFocusTiming(running);

            if (root.isTask) {
                root.refreshDisplayTime();
            }
        }

        onTriggered: {
            if (root.isTask) {
                root.refreshDisplayTime();
                return;
            }

            root.breakTime--;

            if (root.breakTime === 0) {
                alarmSound.play();
            }
        }
    }

    function switchMode() {
        alarmSound.stop();

        if (root.isTask) {
            const end = Date.now();
            root.refreshDisplayTime(end);
            root.submitFocus(end);

            root.breakTime += Math.floor(root.displayTime / 5);
            root.resetFocusTime();
            root.isTask = false;
        } else {
            if (root.breakTime >= -10 && root.breakTime < 0) {
                root.breakTime = 0;
            }

            root.isTask = true;

            // Running can remain true across the mode switch.
            if (timer.running) {
                root.trackFocusTiming(true);
            }

            root.refreshDisplayTime();
        }
    }

    SoundEffect {
        id: alarmSound
        source: "assets/alarm.wav"
    }

    IpcHandler {
        target: "flowtime"

        function toggle(): void {
            root.showTimer = !root.showTimer;
        }
    }

    FileView {
        id: tokenFile

        path: {
            const dir = Quickshell.env("CREDENTIALS_DIRECTORY");
            return dir ? `${dir}/ticktick-token` : "";
        }
    }

    function trackFocusTiming(running) {
        if (!root.isTask)
            return;

        const now = Date.now();

        if (running) {
            if (root.focusStartTime === -1) {
                root.focusStartTime = now;
            }

            if (root.lastContinueTime === -1) {
                root.lastContinueTime = now;
            }
        } else if (root.lastContinueTime !== -1) {
            root.accumulatedFocusTime += now - root.lastContinueTime;
            root.lastContinueTime = -1;
        }
    }

    function activeFocusTime(now = Date.now()) {
        return root.accumulatedFocusTime + (root.lastContinueTime !== -1 ? now - root.lastContinueTime : 0);
    }

    function refreshDisplayTime(now = Date.now()) {
        root.displayTime = Math.floor(root.activeFocusTime(now) / 1000);
    }

    function resetFocusTime() {
        root.focusStartTime = -1;
        root.lastContinueTime = -1;
        root.accumulatedFocusTime = 0;
        root.displayTime = 0;
    }

    function ticktickTimestamp(milliseconds) {
        return new Date(milliseconds).toISOString().replace(/\.\d{3}Z$/, "+0000");
    }

    function submitFocus(end = Date.now()) {
        if (root.focusStartTime === -1)
            return;

        const activeFocusTime = root.activeFocusTime(end);
        const duration = Math.floor(activeFocusTime / 1000);

        if (duration <= 0)
            return;

        if (!root.ticktickAccessToken) {
            console.warn("TickTick access token is missing; focus was not uploaded");
            return;
        }

        const payload = {
            type: 1,
            startTime: root.ticktickTimestamp(root.focusStartTime),
            endTime: root.ticktickTimestamp(end),
            duration: duration,
            pauseDuration: Math.max(0, Math.floor((end - root.focusStartTime - activeFocusTime) / 1000))
        };

        const xhr = new XMLHttpRequest();

        xhr.open("POST", "https://api.ticktick.com/open/v1/focus");
        xhr.setRequestHeader("Authorization", "Bearer " + root.ticktickAccessToken);
        xhr.setRequestHeader("Content-Type", "application/json");

        xhr.onreadystatechange = function () {
            if (xhr.readyState !== XMLHttpRequest.DONE)
                return;

            if (xhr.status >= 200 && xhr.status < 300) {
                console.log("TickTick focus recorded");
            } else {
                console.warn("TickTick focus upload failed:", xhr.status);
            }
        };

        xhr.send(JSON.stringify(payload));
    }
}
