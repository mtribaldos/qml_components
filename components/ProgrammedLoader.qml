
import QtQuick 2.0


Loader {
    property date begin_at
    property date end_at
    property url delayed_source

    Component.onCompleted: { 
        delayed_source = source; 
        source = (Date.now() >= begin_at && Date.now() < end_at) ? delayed_source : ""
    }
    Timer {
        interval: parent.begin_at - Date.now()
        onTriggered: parent.source = parent.delayed_source
        running: parent.begin_at > Date.now()
    }
    Timer {
        interval: parent.end_at - Date.now()
        onTriggered: parent.source = ""
        running: parent.end_at > Date.now()
    }
}
