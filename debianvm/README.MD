# debianvm — Xfce Rice

My Debian 13 (Trixie) smoke-test box, riced on Xfce / Xfwm4. Nord chrome with a
phosphor-green terminal identity, over a *My Neighbor Totoro* wallpaper.

![screenshot](screenshot.png)
![screenshot](screenshot3.png)

## The Stack

| Component      | Choice                          |
|----------------|---------------------------------|
| Distro         | Debian 13 (Trixie)              |
| DE / WM        | Xfce 4.20 / Xfwm4 (X11)         |
| Compositor     | picom (xrender backend)         |
| GTK + WM theme | [Nordic](https://github.com/EliverLara/Nordic) |
| Icons          | Papirus-Dark                    |
| Cursor         | Bibata-Modern-Classic           |
| Terminal       | Alacritty                       |
| Font           | JetBrainsMono Nerd Font Mono    |
| System monitor | conky (custom, phosphor palette)|

## What's in here

- \`picom.conf\` — compositor config → \`~/.config/picom/\`
- \`conky.conf\` — system-monitor widget → \`~/.config/conky/\`
- \`alacritty.toml\` — "Phosphor" green CRT scheme, TUI-safe ANSI → \`~/.config/alacritty/\`

## Install

Themes and fonts:

\`\`\`bash
# Nordic (GTK + Xfwm4)
git clone --depth=1 https://github.com/EliverLara/Nordic ~/.themes/Nordic

# Icons + cursor (Debian repos)
sudo apt install -y papirus-icon-theme bibata-cursor-theme conky-all

# JetBrainsMono Nerd Font
mkdir -p ~/.local/share/fonts
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xf JetBrainsMono.tar.xz -C ~/.local/share/fonts/
fc-cache -f
\`\`\`

Then drop the configs into place:

bash
- cp picom.conf     ~/.config/picom/
- cp conky.conf     ~/.config/conky/
- cp alacritty.toml ~/.config/alacritty/

Apply the themes via **Settings**:
- Appearance → Style → **Nordic**
- Window Manager → Style → **Nordic**
- Appearance → Icons → **Papirus-Dark**
- Mouse and Touchpad → Theme → **Bibata-Modern-Classic**

Autostart picom and conky (Session and Startup → Application Autostart).

## Notes

- **picom is on the \`xrender\` backend, not \`glx\`.** This is a VMware guest with
  soft-rendered 3D — glx fails to enable vsync and can freeze the display.
  xrender gives fades, transparency, and rounded corners with no GPU dependency.
  On real hardware, switch to \`backend = "glx"\` for smoother compositing + blur.
- The Alacritty colors keep a green phosphor primary (bg/fg/cursor) but use
  conventional, high-contrast ANSI 8–15 so TUIs render their highlights correctly.
- conky uses Nerd Font glyphs — needs JetBrainsMono Nerd Font installed to render
  the icons instead of tofu boxes.

## Credits

- [Nordic](https://github.com/EliverLara/Nordic) by EliverLara
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) by ryanoasis
- Wallpaper: *My Neighbor Totoro* (Studio Ghibli)
