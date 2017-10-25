import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.StackTile
import XMonad.Layout.TwoPane
import XMonad.Prompt.Pass
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig(additionalKeys)

main = do
    xmonad $ defaultConfig
        { terminal           = myTerminal
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , manageHook         = myManageHook
        , layoutHook         = myLayout
        , modMask            = mod4Mask
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_p), spawn "passmenu")
        , ((mod4Mask .|. shiftMask, xK_l), spawn "slock & systemctl suspend")
        , ((0, 0x1008FF02), spawn "light -A 20")
        , ((0, 0x1008FF03), spawn "light -U 20")
        , ((0, 0x1008FF11), spawn "amixer set Master 2-")
        , ((0, 0x1008FF13), spawn "amixer set Master 2+")
        , ((0, 0x1008FF12), spawn "pactl set-sink-mute 0 toggle")
        , ((0, 0x1008FF14), spawn "playerctl play-pause")
        , ((0, 0x1008FF16), spawn "playerctl prev")
        , ((0, 0x1008FF17), spawn "playerctl next")
        ]

myTerminal = "st"
myNormalBorderColor = "#666666"
myFocusedBorderColor = "#FFFFFF"

myManageHook = composeAll [ resource =? "firefox"          --> doF (W.shift "2")
                          , resource =? "slack"            --> doF (W.shift "3")
                          , resource =? "telegram-desktop" --> doF (W.shift "3")
                          ] <+> manageHook defaultConfig

myLayout = noBorders (Full) ||| StackTile 1 (3/100) (4/6) ||| TwoPane (3/100) (1/2)
