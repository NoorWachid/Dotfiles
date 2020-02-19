# load keyboard layout
setxkbmap dvorak

# remap capslock to escape
xmodmap -e 'clear Lock' -e 'keycode 0x42=Escape' &

# start compositor
compton &

# set wallpaper
feh --bg-fill ~/pictures/wallpapers/cyberpunk-city.jpg

# start window manager
exec openbox-session
