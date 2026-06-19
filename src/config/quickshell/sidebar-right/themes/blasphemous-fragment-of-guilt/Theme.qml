import QtQuick

QtObject {
    // Accent ------------------------------------------------------------------
    readonly property color accent:          "#5aa59d"
    readonly property color accentDim:       "#335aa59d"   // accent 13% opaco (usado em bgActive, borders leves)
    readonly property color accentMid:       "#665aa59d"   // accent 33% opaco
    readonly property color accentFaint:     "#185aa59d"   // accent 6% opaco (fundos de item)
    readonly property color accentLight:     "#87b0a9"     // versão mais clara do accent

    // Foreground --------------------------------------------------------------
    readonly property color fgTitle:         "#2f746e"     // títulos de seção, labels de card
    readonly property color fgText:          "#24302e"     // texto principal
    readonly property color fgDim:           "#465653"     // texto secundário / valores
    readonly property color fgSubtle:        "#67827b"     // texto levemente apagado
    readonly property color fgFaint:         "#9aada7"     // desabilitado / inativo
    readonly property color fgOnAccent:      "#f7fbf9"     // texto sobre fundo accent ativo

    // Background --------------------------------------------------------------
    readonly property color bg:              "#eef7f4"
    readonly property color bgPanel:         "#d8eef7f4"   // painel principal com blur
    readonly property color bgCard:          "#eaf7fbf9"   // card com tint verde escuro
    readonly property color bgCardAlt:       "#e8e5f1ed"   // card alternativo (ex: danger tint)
    readonly property color bgHeader:        "#d8cadbd6"   // header do card
    readonly property color bgItem:          "#33739791"   // item/linha dentro do card
    readonly property color bgItemHover:     "#4d97c7bf"   // item hover
    readonly property color bgActive:        "#335aa59d"   // estado ativo (mesmo que accentDim)

    // Borders -----------------------------------------------------------------
    readonly property color border:          "#335aa59d"   // borda padrão de card
    readonly property color borderStrong:    "#665aa59d"   // borda hover / destaque
    readonly property color borderItem:      "#185aa59d"   // borda interna de item
    readonly property color borderSubtle:    "#cadbd6"     // borda neutra escura

    // Scrollbar
    readonly property color scrollbarFg:    "#5aa59d"     // scrollbar cor
    readonly property color scrollbarBg:    "#cadbd6"   // scrollbar fundo/track

    // Status ------------------------------------------------------------------
    readonly property color danger:          "#b45a52"
    readonly property color dangerDim:       "#b45a5266"
    readonly property color warn:            "#9b7d35"
    readonly property color ok:              "#5aa59d"

    // Tipography --------------------------------------------------------------
    readonly property string fontMono:       "monospace"
    readonly property string fontIcon:       "Font Awesome 6 Free"

    // Form --------------------------------------------------------------------
    readonly property int radius:            8
    readonly property int radiusPill:        18
    readonly property int radiusSmall:       4

    // Animations --------------------------------------------------------------
    readonly property int animFast:          150
    readonly property int animNormal:        220
}
