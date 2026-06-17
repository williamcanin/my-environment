import QtQuick
import QtQuick.Layouts
import Quickshell.Io

BaseCard {
    cardTitle: "ENERGIA"
    cardIcon:  "»"

    property string activeProfile: "balanced"

    readonly property var profiles: [
        { id: "power-saver",  label: "Economia",   icon: "\uf06c", desc: "Economia de energia" },
        { id: "balanced",     label: "Balanceado", icon: "\uf24e", desc: "Padrao" },
        { id: "performance",  label: "Performance",icon: "\uf0e7", desc: "Max. desempenho" },
    ]

    Timer {
        interval: 500; running: true; repeat: false
        onTriggered: readProc.running = true
    }

    Process {
        id: readProc
        command: ["powerprofilesctl", "get"]
        stdout: SplitParser {
            onRead: data => {
                var l = data.trim()
                if (l.length > 0) activeProfile = l
            }
        }
    }

    Process {
        id: setProc
        property string nextProfile: ""
        command: ["powerprofilesctl", "set", nextProfile]
        onExited: function(code) {
            if (code === 0) activeProfile = nextProfile
        }
    }

    function setProfile(id) {
        setProc.nextProfile = id
        setProc.running = true
    }

    RowLayout {
        Layout.fillWidth: true
        spacing: 6

        Repeater {
            model: profiles
            delegate: GlassButton {
                Layout.fillWidth: true
                implicitHeight: 52
                iconText: modelData.icon
                label: modelData.label
                active: activeProfile === modelData.id
                onClicked: setProfile(modelData.id)
            }
        }
    }

    Text {
        Layout.fillWidth: true
        text: {
            switch(activeProfile) {
            case "power-saver":  return "\uf0e7  Economia de bateria ativa"
            case "performance":  return "\uf0e7  Maximo desempenho ativo"
            default:             return "\uf0e7  Perfil balanceado ativo"
            }
        }
        color: Theme.accent
        font.pixelSize: 10
        font.family: "monospace"
        opacity: 1
        horizontalAlignment: Text.AlignHCenter
    }
}
