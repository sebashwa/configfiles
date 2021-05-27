set $mod Mod4

# Keyboard Layout
exec_always --no-startup-id "setxkbmap -layout us,de -option 'grp:shifts_toggle,grp:rswitch' "

# Font
font pango:DejaVu Sans Mono 10

# No borders
default_border none

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# Start a terminal
bindsym $mod+Return exec --no-startup-id st

# Kill focused window
bindsym $mod+Shift+q kill

# Start dmenu program launcher
bindsym $mod+p exec --no-startup-id dmenu_run
# Start passmenu and get password
bindsym $mod+Shift+p exec --no-startup-id passmenu
# Start passmenu and get otp
bindsym $mod+Shift+o exec --no-startup-id passmenu --get-otp
# Decrease brightness
bindcode 232 exec --no-startup-id light -U 20
# Increase brightness
bindcode 233 exec --no-startup-id light -A 20
# Player prev
bindcode 173 exec --no-startup-id playerctl prev
# Player play/ pause
bindcode 172 exec --no-startup-id playerctl play-pause
# Player next
bindcode 171 exec --no-startup-id playerctl next

# Change focus
bindsym $mod+k focus up
bindsym $mod+l focus right
bindsym $mod+j focus down
bindsym $mod+h focus left

# Move focused window
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right
bindsym $mod+Shift+j move down
bindsym $mod+Shift+h move left

# Enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
  # These bindings trigger as soon as you enter the resize mode
  bindsym h resize shrink width 10 px or 10 ppt
  bindsym k resize shrink height 10 px or 10 ppt
  bindsym j resize grow height 10 px or 10 ppt
  bindsym l resize grow width 10 px or 10 ppt

  # back to normal: Enter or Escape or $mod+r
  bindsym Return mode "default"
  bindsym Escape mode "default"
  bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

# bindsym $mod+b bar hidden_state toggle

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
  status_command i3status
  mode hide
  hidden_state hide
  modifier Mod4+Shift
  position top
  separator_symbol "  |  "
  colors {
    background #ebdbb2
    focused_workspace #1d2021 #1d2021 #ebdbb2
    inactive_workspace #928374 #ebdbb2 #1d2021
    statusline #1d2021
  }
}

# Colors
# class                 border  backgr. text    indicator child_border
client.focused          #4c7899 #ffffff #000000 #2e9ef4   #285577
