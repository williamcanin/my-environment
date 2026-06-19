pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    // Active theme is read from ~/.config/my-environment/.active-theme
    // The theme file is re-read when the file changes.
    property string _themeName: "hyprland-dark-teal"

    FileView {
        id: themeNameFile
        path: StandardPaths.writableLocation(StandardPaths.HomeLocation) +
              "/.config/my-environment/.active-theme"
        onTextChanged: {
            var n = text.trim()
            if (n !== "") root._themeName = n
        }
    }

    // Delegate to the active theme singleton.
    // Each theme file must export the same property names.
    property var _t: Qt.createQmlObject(
        'import "themes/' + _themeName + '" as T; T.Theme {}',
        root, "themeLoader"
    )

    // Re-export all properties so consumers do not need to change their code.
    readonly property color accent:          _t ? _t.accent         : "#cba6f7"
    readonly property color accentDim:       _t ? _t.accentDim      : "#22cba6f7"
    readonly property color accentMid:       _t ? _t.accentMid      : "#55cba6f7"
    readonly property color accentFaint:     _t ? _t.accentFaint    : "#0fcba6f7"
    readonly property color accentLight:     _t ? _t.accentLight    : "#f5c2e7"
    readonly property color fgTitle:         _t ? _t.fgTitle        : "#cba6f7"
    readonly property color fgText:          _t ? _t.fgText         : "#cdd6f4"
    readonly property color fgDim:           _t ? _t.fgDim          : "#bac2de"
    readonly property color fgSubtle:        _t ? _t.fgSubtle       : "#a6adc8"
    readonly property color fgFaint:         _t ? _t.fgFaint        : "#6c7086"
    readonly property color fgOnAccent:      _t ? _t.fgOnAccent     : "#1e1e2e"
    readonly property color bg:              _t ? _t.bg             : "#1e1e2e"
    readonly property color bgPanel:         _t ? _t.bgPanel        : "#b01e1e2e"
    readonly property color bgCard:          _t ? _t.bgCard         : "#b0313244"
    readonly property color bgCardAlt:       _t ? _t.bgCardAlt      : "#b045475a"
    readonly property color bgHeader:        _t ? _t.bgHeader       : "#b011111b"
    readonly property color bgItem:          _t ? _t.bgItem         : "#0acdd6f4"
    readonly property color bgItemHover:     _t ? _t.bgItemHover    : "#14cdd6f4"
    readonly property color bgActive:        _t ? _t.bgActive       : "#22cba6f7"
    readonly property color border:          _t ? _t.border         : "#22cba6f7"
    readonly property color borderStrong:    _t ? _t.borderStrong   : "#55cba6f7"
    readonly property color borderItem:      _t ? _t.borderItem     : "#0fcba6f7"
    readonly property color borderSubtle:    _t ? _t.borderSubtle   : "#45475a"
    readonly property color scrollbarFg:     _t ? _t.scrollbarFg    : "#cdd6f4"
    readonly property color scrollbarBg:     _t ? _t.scrollbarBg    : "#45475a"
    readonly property color danger:          _t ? _t.danger         : "#f38ba8"
    readonly property color dangerDim:       _t ? _t.dangerDim      : "#f38ba866"
    readonly property color warn:            _t ? _t.warn           : "#f9e2af"
    readonly property color ok:              _t ? _t.ok             : "#a6e3a1"
    readonly property string fontMono:       _t ? _t.fontMono       : "monospace"
    readonly property string fontIcon:       _t ? _t.fontIcon       : "Font Awesome 6 Free"
    readonly property int radius:            _t ? _t.radius         : 8
    readonly property int radiusPill:        _t ? _t.radiusPill     : 18
    readonly property int radiusSmall:       _t ? _t.radiusSmall    : 4
    readonly property int animFast:          _t ? _t.animFast       : 150
    readonly property int animNormal:        _t ? _t.animNormal     : 220
}
