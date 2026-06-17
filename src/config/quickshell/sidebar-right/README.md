# sidebar-right — Quickshell sidebar para Hyprland

Sidebar direita standalone com: Calendário, CPU/RAM/GPU, Teclado e Perfil de Energia.

## Instalação

```bash
# 1. Copia para ~/.config/quickshell/
cp -r sidebar-right ~/.config/quickshell/sidebar-right

# 2. Testa manualmente
qs -c sidebar-right
```

## Integração com Waybar

Adicione um botão no seu `~/.config/waybar/config`:

```json
"custom/sidebar": {
    "format": "󰕰",
    "tooltip": false,
    "on-click": "qs -c sidebar-right ipc call sidebar toggle"
}
```

E no `style.css`:
```css
#custom-sidebar {
    padding: 0 10px;
    font-size: 16px;
    color: #3aa9f0;
    border-radius: 8px;
}
#custom-sidebar:hover {
    background: rgba(58,169,240,0.15);
}
```

## Integração com hyprland.lua

Adicione no seu `~/.config/hypr/hyprland.lua`:

```lua
-- Sidebar direita (Quickshell)
hl.bind("SUPER", "S", "exec",
    "qs -c sidebar-right ipc call sidebar toggle")

-- Blur para o painel (opcional, mas bonito)
hl.rule.layer("noanim,blur,blurpopups", "sidebar-right")
```

> **Nota sobre o nome da layer:** O Quickshell registra a layer com o nome do config.
> Se precisar ajustar, rode `hyprctl layers` para ver o nome exato e use-o na rule acima.

## Autostart

Para iniciar junto com o Hyprland (adicione no seu `hyprland.lua`):

```lua
hl.exec("qs -c sidebar-right")
```

## Dependências

| Pacote           | Usado para               |
|------------------|--------------------------|
| `quickshell`     | shell framework          |
| `nvidia-smi`     | GPU stats (vem com drivers NVIDIA) |
| `powerprofilesctl` | perfis de energia      |
| `hyprctl`        | trocar layout de teclado |

## Ajustes

### Trocar o nome do dispositivo de teclado

Em `KeyboardCard.qml`, linha `property string kbDevice`:
```qml
property string kbDevice: "usb-usb-keyboard"
```
Rode `hyprctl devices` para ver o nome exato do seu teclado.

### Cores

Todas as cores principais estão no `SidebarWindow.qml` e nos cards.
A cor de destaque padrão é `#3aa9f0` (azul), compatível com seu tema atual (border `3aa99f`).
