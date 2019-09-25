# Remap CapsLock to Escape
xmodmap -e 'clear Lock' -e 'keycode 0x42=Escape' &

# Start Polybar
polybar main &

# Start Compton
compton &
