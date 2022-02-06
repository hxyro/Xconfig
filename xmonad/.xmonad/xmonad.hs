--           -----------------------------------------------------------------           --
---                                       import                                        ---
--           -----------------------------------------------------------------           --

---------------------------------------------base----------------------------------------------------
import XMonad hiding ( (|||) ) -- jump to layout
import XMonad.Layout.LayoutCombinators (JumpToLayout(..), (|||)) -- jump to layout
import XMonad.Config.Desktop
import System.Exit
import qualified XMonad.StackSet as W

---------------------------------------------data----------------------------------------------------
import Data.Char (isSpace)
import Data.List
import Data.Monoid
import Data.Maybe (isJust)
import Data.Ratio ((%)) -- for video
import qualified Data.Map as M

---------------------------------------------system--------------------------------------------------
import System.IO (hPutStrLn) -- for xmobar
-- util
import XMonad.Util.Run (safeSpawn, unsafeSpawn, runInTerm, spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)  
import XMonad.Util.NamedScratchpad
import XMonad.Util.NamedWindows
import XMonad.Util.WorkspaceCompare

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks (avoidStruts, docksStartupHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.EwmhDesktops -- to show workspaces in application switchers
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat, doRectFloat) 
import XMonad.Hooks.Place (placeHook, withGaps, smart)
import XMonad.Hooks.UrgencyHook

-- actions
import XMonad.Actions.CopyWindow -- for dwm window style tagging
import XMonad.Actions.UpdatePointer -- update mouse postion

-- layout 
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.GridVariants
import XMonad.Layout.ResizableTile
import XMonad.Layout.BinarySpacePartition

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Spiral
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Simplest
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Layout.WindowNavigation
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import qualified XMonad.Actions.FlexibleResize as Flex
--           -----------------------------------------------------------------           --
---                                      variables                                      ---
--           -----------------------------------------------------------------           --

-- Variables  =    Value                                     :: Type
--
--
myModMask     =  mod4Mask                                    :: KeyMask ---------- ModKey

myTerminal1    =  "alacritty"                                 :: String  ---------- Terminal
myTerminal   =  "kitty"                                     :: String  ---------- Terminal
myBrowser     =  "brave"                                     :: String  ---------- Browser
myBrowser1    =  "firefox"                                   :: String  ---------- Browser
myFilebrowser =  "spacefm"                                   :: String  ---------- Filebrowser
myEditor      =  "emacsclient -c -a 'emacs' "                :: String  ---------- MainEditor
myLibreoffice =  "libreoffice"                               :: String  ---------- Libreoffice
myImageviewer =  "sxiv"                                      :: String  ---------- Sxiv
myVideoplayer =  "mpv"                                       :: String  ---------- Mpv
myBluetooth   =  "blueberry"                                 :: String  ---------- Blueberry
myAudio       =  "pavucontrol"                               :: String  ---------- Pavucontrol

myVolumeMute  =  "pactl set-sink-mute @DEFAULT_SINK@ toggle" :: String  ---------- VloumeM
myVolumeDown  =  "pactl set-sink-volume @DEFAULT_SINK@ -4%"  :: String  ---------- VloumeD
myVolumeUp    =  "pactl set-sink-volume @DEFAULT_SINK@ +4%"  :: String  ---------- VloumeU
myRofiSearch  =  "rofi -show combi -modi combi"              :: String  ---------- rofi search
lightU        =  "light -A 2"                                :: String  ---------- Increase Brightness
lightD        =  "light -U 2"                                :: String  ---------- Decrease Brightness
shutdown      =  "shutdown now -h"                           :: String  ---------- Shutdown System
reboot        =  "reboot"                                    :: String  ---------- Reboot System
myCursor      =  "xsetroot -cursor_name left_ptr &"          :: String  ---------- Set cursor
myPicom       =  "picom -f &"                              :: String  ----------
myWallpaper   =  "~/.fehbg &"                                :: String  ----------
myEmacsd      =  "/usr/bin/emacs --daemon &"                 :: String  ----------
myDunst       =  "dunst &"                                   :: String  ----------

myRestart     =  "xmonad --recompile && xmonad --restart && notify-send Restarting"                   :: String  ---------- Restart WM
mySStool      =  "maim --select | tee ~/ss/$(date +%s).png | xclip -selection clipboard -t image/png" :: String  ---------- Screenshot with maim

-- Borders
--
--
myBorderWidth        =  0         :: Dimension  ----------
myNormalBorderColor  =  "#D282E7" :: String     ----------
myFocusedBorderColor =  "#cbd2df" :: String     ----------
myppCurrent          =  "#FDB5C0" :: String     ----------
myppVisible          =  "#e7ff85" :: String     ----------
myppHidden           =  "#8692D6" :: String     ----------
myppHiddenNoWindows  =  "#cbd2df" :: String     ----------
myppTitle            =  "#FDF6E3" :: String     ----------
myppUrgent           =  "#DC322F" :: String     ----------

--workspaces
--
--
-- myWorkspaces         =  ["\x","\x","\x","\x","\x","\x","\x","\x", "\x"]                                                       ----------
-- myWorkspaces         =  ["\xf2dc","\xf269","\xe62b","\xf07b","\xf144","\xf0c2","\xe799","\xe769", "\xe795"]                                                       ----------
-- myWorkspaces         =  ["\xf8a5","\xf8a8","\xf8ab","\xf8ae","\xf8b1","\xf8b4","\xf8b7","\xf8ba", "\xf8bd"]                                                       ----------
myWorkspaces         =  ["\xf8a3","\xf8a6","\xf8a9","\xf8ac","\xf8af","\xf8b2","\xf8b5","\xf8b8", "\xf8bb"]                                                       ----------
windowCount          =  gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset  ----------
-----------------------------------------------------------------------------------------------------


--           -----------------------------------------------------------------           --
---                              desktop notifications                                   ---
--           -----------------------------------------------------------------           --

data LibNotifyUrgencyHook = LibNotifyUrgencyHook deriving (Read, Show)

instance UrgencyHook LibNotifyUrgencyHook where
    urgencyHook LibNotifyUrgencyHook w = do
        name     <- getName w
        Just idx <- fmap (W.findTag w) $ gets windowset

        safeSpawn "notify-send" [show name, "workspace " ++ idx]
--------------------------------------------------------------------------------------------


--           -----------------------------------------------------------------           --
---                                   Startup hook                                      ---
--           -----------------------------------------------------------------           --

myStartupHook = do
    spawnOnce (myCursor)    
    spawnOnce (myDunst)     
    spawnOnce "imwheel"     
 --   spawnOnce (myEmacsd)    
    spawnOnce (myPicom)    
    spawnOnce (myWallpaper) 
--------------------------------------------------------------------------------------------


--           -----------------------------------------------------------------           --
---                                      Layout                                         ---
--           -----------------------------------------------------------------           --

myLayout = avoidStruts ( tiled ||| Mirror tiled ||| grid ||| magnify ||| spirals ||| threeCol ||| Mirror threeCol ) ||| Full
    where
        tiled    =   spacingRaw False (Border 6 6 6 6) True (Border 6 6 6 6) True 
                      $ limitWindows 3
                       $ windowNavigation
                        $ ResizableTall nmaster delta ratio []
        grid     =   spacingRaw False (Border 8 8 8 8) True (Border 8 8 8 8) True
                      $ limitWindows 6 
                       $ mkToggle (single MIRROR) 
                        $ windowNavigation 
                         $ Grid gridx
        magnify  =   magnifier
                      $ spacingRaw False (Border 8 8 8 8) True (Border 8 8 8 8) True 
                       $ limitWindows 6 
                        $ windowNavigation 
                         $ Grid gridy
        spirals  =   spacingRaw False (Border 20 8 8 8) True (Border 8 8 8 8) True
                      $ limitWindows 6 
                       $ windowNavigation 
                        $ spiral (6/7)
        threeCol =   spacingRaw False (Border 20 8 8 8) True (Border 8 8 8 8) True
                      $ windowNavigation 
                       $ limitWindows 7 
                        $ ThreeColMid nmaster delta ratio
    
        nmaster = 1   
        ratio   = 1/2   
        delta   = 3/100
        gridx   = 16/20
        gridy   = 16/10
--------------------------------------------------------------------------------------------


--           -----------------------------------------------------------------           --
---                                   Window Rule                                       ---
--           -----------------------------------------------------------------           --

myManageHook = composeAll

    [ className =?  "mpv"                                --> doRectFloat (W.RationalRect (1 % 3) (1 % 3) (1 % 3) (1 % 3))
    , className =?  "Blueberry.py"                       --> doRectFloat (W.RationalRect (1 % 3) (1 % 3) (1 % 3) (1 % 3))
    , className =?  "Pavucontrol"                        --> doRectFloat (W.RationalRect (1 % 3) (1 % 3) (1 % 3) (1 % 3))
    , className =?  "Sxiv"                               --> doRectFloat (W.RationalRect (1 % 4) (1 % 4) (1 % 2) (1 % 2))

    , className =?  "Spacefm"                            --> doCenterFloat
    , className =?  "Pcmanfm"                            --> doCenterFloat
    , className =?  "Thunar"                             --> doCenterFloat
    , className =?  "dolphin"                            --> doCenterFloat
    , className =?  "fuck"                               --> doCenterFloat
    , className =?  "Dragon-drag-and-drop"               --> doCenterFloat

    , className =?  "feh"                                --> doRectFloat (W.RationalRect (1 % 3) (1 % 3) (1 % 3) (1 % 3))
    , className =?  "confirm"                            --> doFloat
    , className =?  "file_progress"                      --> doFloat
    , className =?  "dialog"                             --> doFloat
    , className =?  "download"                           --> doFloat
    , className =?  "error"                              --> doFloat
    , className =?  "notification"                       --> doFloat

    , className =?  "Emacs"                              --> doShift     (myWorkspaces !! 0)
    , className =?  "Brave-browser"                      --> doShift     (myWorkspaces !! 1)
    , className =?  "Firefox"                            --> doShift     (myWorkspaces !! 2)
    , className =?  "Google-chrome"                      --> doShift     (myWorkspaces !! 2)
    , className =?  "qutebrowser"                        --> doShift     (myWorkspaces !! 2)
    , className =?  "Zathura"                            --> doShift     (myWorkspaces !! 4)
    
    , className =?  "Firefox" <&&> resource =? "Toolkit" --> doFloat
    , resource  =?  "desktop_window"                     --> doIgnore ] 
--  , isFullscreen                                      --> doFullFloat
--------------------------------------------------------------------------------------------


--           -----------------------------------------------------------------           --
---                                   Key Bindings                                      ---
--           -----------------------------------------------------------------           --

myKeys = [("M-" ++ m ++ k, windows $ f i) | (i, k) <- zip (myWorkspaces) (map show [1 :: Int ..]) , (f, m) <- [(W.view, ""), (W.shift, "S-"), (copy, "S-C-")]] ++
--Main
     [ ( "M-<Return>"                , spawn             (myTerminal)                      )
     , ( "M-S-<Return>"              , spawn             (myTerminal1)                     )
     , ( "M-q"                       , kill                                                )
--Misk
     , ( "M-<F1>"                    , spawn             (myEditor)                        )
     , ( "M-<F2>"                    , spawn             (myBrowser)                       )
     , ( "M-<F3>"                    , spawn             (myFilebrowser)                   )
     , ( "M-<F4>"                    , spawn             (myLibreoffice)                   )
     , ( "M-<F5>"                    , spawn             "google-chrome-stable"            )
     , ( "M-<F6>"                    , spawn              "bash ~/.bin/fdd"                            )
--   , ( "M-<F7>"                    , spawn             ()				     	           )
--   , ( "M-<F8>"                    , spawn             ()				     	           )
--   , ( "M-<F9>"                    , spawn             ()				     	           )
--   , ( "M-<F10>"                   , spawn             ()				     	           )
     , ( "M-<F11>"                   , spawn             (myBluetooth)                     )
     , ( "M-<F12>"                   , spawn             (myAudio)                         )
--Base
     , ( "M-M1-r"                    , spawn             (myRestart)                       )
     , ( "M-M1-x"                    , spawn             (shutdown)                        )
     , ( "M-C-x"                     , spawn             (reboot)                          )
--Util
     , ( "C-0"                       , spawn             (lightU)                          )
     , ( "C-9"                       , spawn             (lightD)                          )
     , ( "<XF86MonBrightnessUp>"     , spawn             (lightU)                          )
     , ( "<XF86MonBrightnessDown>"   , spawn             (lightD)                          )
     , ( "<XF86AudioMute>"           , spawn             (myVolumeMute)                    )
     , ( "<XF86AudioLowerVolume>"    , spawn             (myVolumeDown)                    )
     , ( "<XF86AudioRaiseVolume>"    , spawn             (myVolumeUp)                      )
     , ( "<XF86Search>"              , spawn             (myRofiSearch)                    )
     , ( "M-S-s"                     , spawn             (mySStool)                        )
--Layout
     , ( "M-t"                       , withFocused       $ windows . W.sink                )

     , ( "C-M1-j"                    , decWindowSpacing  4                                 )
     , ( "C-M1-k"                    , incWindowSpacing  4                                 )        
     , ( "C-M1-="                    , decScreenSpacing  4                                 )       
     , ( "C-M1--"                    , incScreenSpacing  4                                 )

     , ( "M-<L>"                     , sendMessage       Shrink                            )
     , ( "M-<R>"                     , sendMessage       Expand                            )-- Expand horiz window width
     , ( "M-M1-j"                    , sendMessage       MirrorShrink                      )-- Shrink vert window width
     , ( "M-M1-k"                    , sendMessage       MirrorExpand                      )

     , ( "M-m"                       , windows           W.focusMaster                     )-- Move focus to the master window
     , ( "M-j"                       , windows           W.focusDown                       )-- Move focus to the next window
     , ( "M-k"                       , windows           W.focusUp                         )-- Move focus to the prev window
     , ( "M-S-m"                     , windows           W.swapMaster                      )-- Swap the focused window and the master window
     , ( "M-S-j"                     , windows           W.swapDown                        )-- Swap focused window with next window
     , ( "M-S-k"                     , windows           W.swapUp                          )-- Swap focused window with prev window

     , ( "M-a"                       , sendMessage       MirrorExpand                      )
     , ( "M-z"                       , sendMessage       MirrorShrink                      )]
--   [ ( "S-C-a"                     , windows copyToAll)   -- copy window to all workspaces
--------------------------------------------------------------------------------------------


--           -----------------------------------------------------------------           --
---                                        Main                                         ---
--           -----------------------------------------------------------------           --

main = do
    xmproc0 <- spawnPipe "/usr/bin/xmobar -x 0 $HOME/.xmonad/xmobarrc.hs"
    xmonad $ withUrgencyHook LibNotifyUrgencyHook $ ewmh $ desktopConfig
        { manageHook = ( isFullscreen --> doFullFloat ) <+> manageDocks <+> myManageHook <+> manageHook desktopConfig
        , startupHook        = myStartupHook
        , layoutHook         = myLayout
        , handleEventHook    = handleEventHook desktopConfig
        , workspaces         = myWorkspaces
        , borderWidth        = myBorderWidth
        , terminal           = myTerminal
        , modMask            = myModMask
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , logHook = dynamicLogWithPP xmobarPP  
                        { ppOutput = \x -> hPutStrLn xmproc0 x
                        , ppCurrent = xmobarColor myppCurrent ""
                        , ppVisible = xmobarColor myppVisible ""
                        , ppHidden = xmobarColor myppHidden ""
                        , ppHiddenNoWindows = xmobarColor  myppHiddenNoWindows ""
                        , ppSep =  "<fc=#586E75></fc>"                     -- Separators in xmobar
                        , ppUrgent = xmobarColor  myppUrgent ""
                        , ppExtras  = [windowCount]                           -- # of windows current workspace
                        , ppOrder  = \(ws:l:t:ex) -> [ws]  -- \(ws:l:t:ex) -> [ws] --,l] -- ++ex -- ++[t]
                        } -- >> updatePointer (0.25, 0.25) (0.25, 0.25)
          }
          `additionalKeysP` myKeys
