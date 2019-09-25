# remap capslock to escape
xmodmap -e 'clear Lock' -e 'keycode 0x42=Escape' &

# custom scripts
bar_start.sh &
wallpaper.sh &

# start compositor
compton &

# start window manager
exec dwm
