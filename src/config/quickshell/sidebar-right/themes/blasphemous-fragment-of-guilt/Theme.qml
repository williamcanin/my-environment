import QtQuick

QtObject {
    // Accent ------------------------------------------------------------------
    // Verde-escuro médio — visível sobre fundo claro, harmonioso com a paleta mint
    readonly property color accent:          "#3a6b63"
    readonly property color accentDim:       "#333a6b63"   // accent 20% opaco (bgActive, borders leves)
    readonly property color accentMid:       "#663a6b63"   // accent 40% opaco
    readonly property color accentFaint:     "#183a6b63"   // accent 9% opaco (fundos de item)
    readonly property color accentLight:     "#5a8c83"     // versão mais clara do accent

    // Foreground --------------------------------------------------------------
    readonly property color fgTitle:         "#2d4a45"     // títulos de seção, labels de card
    readonly property color fgText:          "#24302e"     // texto principal
    readonly property color fgDim:           "#3d5550"     // texto secundário / valores
    readonly property color fgSubtle:        "#5a7a74"     // texto levemente apagado
    readonly property color fgFaint:         "#8aada8"     // desabilitado / inativo
    readonly property color fgOnAccent:      "#eef7f4"     // texto sobre fundo accent ativo

    // Background --------------------------------------------------------------
    readonly property color bg:              "#eef7f4"
    readonly property color bgPanel:         "#eaeef7f4"   // painel principal com blur
    readonly property color bgCard:          "#eaf7fbf9"   // card com tint verde claro
    readonly property color bgCardAlt:       "#eaf1edea"   // card alternativo (ex: danger tint)
    readonly property color bgHeader:        "#d8e8e4"     // header do card
    readonly property color bgItem:          "#1824302e"   // item/linha dentro do card (fg 9%)
    readonly property color bgItemHover:     "#2824302e"   // item hover (fg 16%)
    readonly property color bgActive:        "#333a6b63"   // estado ativo (mesmo que accentDim)

    // Borders -----------------------------------------------------------------
    readonly property color border:          "#333a6b63"   // borda padrão de card
    readonly property color borderStrong:    "#663a6b63"   // borda hover / destaque
    readonly property color borderItem:      "#183a6b63"   // borda interna de item
    readonly property color borderSubtle:    "#c8ddd9"     // borda neutra clara

    // Scrollbar
    readonly property color scrollbarFg:    "#5a7a74"     // scrollbar cor
    readonly property color scrollbarBg:    "#d8e8e4"     // scrollbar fundo/track

    // Status ------------------------------------------------------------------
    readonly property color danger:          "#b45a52"
    readonly property color dangerDim:       "#b45a5266"
    readonly property color warn:            "#9b7d35"
    readonly property color ok:              "#3a6b63"

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
