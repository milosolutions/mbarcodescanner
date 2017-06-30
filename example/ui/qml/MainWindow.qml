import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtMultimedia 5.5

import BarcodeCaptureFilter 1.0

ColumnLayout {
    anchors.fill: parent

    VideoOutput {
        id: cameraOutput
        source: camera
        focus: visible // to receive focus and capture key events when visible
        Layout.fillWidth: true
        Layout.fillHeight: true
        fillMode: VideoOutput.Stretch
        autoOrientation: true
        filters: [ barcodeCaptureFilter ] // add barcode capture filter

        Camera {
            id: camera

            focus {
                focusMode: Camera.FocusContinuous
                focusPointMode: Camera.FocusPointCenter
            }
        }

        MBarcodeCaptureFilter {
            id: barcodeCaptureFilter

            sourceWidth: cameraOutput.width
            sourceHeight: cameraOutput.height
            orientation: cameraOutput.orientation

            onTagFound: {
                console.log("Barcode found and decoded: %1".arg(tag))
                barcodeResultText.visible = true
                barcodeResultText.text = tag
                timer.restart()
            }

            Component.onCompleted: {
                if (typeof requestDrawRect !== "undefined")
                    barcodeCaptureFilter.requestDrawRect.connect(drawRect)
                if (typeof requestDrawRect !== "undefined")
                    barcodeCaptureFilter.requestCleanView.connect(cleanView)
            }

            function drawRect(rect) {
                console.log("Draw rect", rect)
                openCvOverlay.rect = rect
                openCvOverlay.requestPaint()
            }

            function cleanView() {
                console.log("Clean view")
                openCvOverlay.rect = null
                openCvOverlay.requestPaint()
            }
        }

        Canvas {
            id: openCvOverlay
            anchors.fill: parent

            property var rect: null

            onPaint: {
                var ctx = getContext("2d")
                ctx.clearRect(0, 0, width, height)
                if (rect == null)
                    return

                ctx.strokeStyle = "green"
                ctx.lineWidth = 10
                ctx.strokeRect(rect.x, rect.y, rect.width, rect.height)
            }
        }
    }

    Text {
        id: barcodeResultText
        color: "blue"
        visible: false
        Layout.fillWidth: true
        Layout.preferredHeight: 200
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Timer {
        id: timer
        interval: 5000

        onTriggered: {
            barcodeResultText.visible = false
        }
    }
}

