import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window

    color: "#ffffffff"

    width: Screen.width
    height: Screen.height
    visible: true
    title: qsTr("Barcode Scanning Sample")

    Component {
        id: mainWindow
        MainWindow {}
    }

    Loader {
        id: loaderMain
        anchors.fill: parent
        asynchronous: false
        sourceComponent: mainWindow
        visible: status == Loader.Ready
    }
}
