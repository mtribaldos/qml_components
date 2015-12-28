
import QtQuick 1.1


Item {
    property string source
    property date begin_at
    property date end_at

    Loader {
        id: loader
        anchors.fill: parent
    }
    Timer {
        interval: parent.begin_at - Date.now()
        onTriggered: loader.source = parent.source
        running: true
    }
    Timer {
        interval: parent.end_at - Date.now()
        onTriggered: loader.source = "undefined"
        running: true
    }
}
