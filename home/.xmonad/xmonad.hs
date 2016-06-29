-------------------------------------------------------------------------------
-- Based on xmonad.hs for xmonad-darcs by <mrelendig AT har-ikkje DOT net>
-------------------------------------------------------------------------------
-- Compiler flags --
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts #-}

-- Imports --
-- stuff
import XMonad
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.Exit
import XMonad.Util.Run (safeSpawn)
import Graphics.X11.ExtraTypes.XF86

-- actions
import XMonad.Actions.GridSelect

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
-- import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.InsertPosition

-- layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed
import XMonad.Layout.Tabbed

-------------------------------------------------------------------------------
-- Main --
main :: IO ()
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
-- myBar = "xmobar"
myBar = "bash -c \"tee >(xmobar -x0) | xmobar -x1\""

-- main = xmonad =<< statusBar cmd pp kb conf
--  where
--    uhook = withUrgencyHookC NoUrgencyHook urgentConfig
--    cmd = "bash -c \"tee >(xmobar -x0) | xmobar -x1\""
--    pp = customPP
--    kb = toggleStrutsKey
--    conf = uhook myConfig

-------------------------------------------------------------------------------
-- Configs --
myConfig = def { workspaces = workspaces'
               , modMask = modMask'
               , borderWidth = borderWidth'
               , normalBorderColor = normalBorderColor'
               , focusedBorderColor = focusedBorderColor'
               , terminal = terminal'
               , keys = keys'
               , layoutHook = layoutHook'
               , manageHook = manageHook'
               }

-------------------------------------------------------------------------------
-- Window Management --
manageHook' = composeAll [ isFullscreen             --> doFullFloat
                         , className =? "MPlayer"   --> doFloat
                         , className =? "mplayer2"  --> doFloat
                         , className =? "Gimp"      --> doFloat
                         , className =? "Vlc"       --> doFloat
                         , insertPosition Below Newer
                         , transience'
                         ]


-------------------------------------------------------------------------------
-- Looks --
-- bar
myPP = def { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">"
           , ppHidden = xmobarColor "#C98F0A" ""
           , ppHiddenNoWindows = xmobarColor "#C9A34E" ""
           , ppUrgent = xmobarColor "#FFFFAF" "" . wrap "[" "]"
           , ppLayout = xmobarColor "#C9A34E" ""
           , ppTitle =  xmobarColor "#C9A34E" "" . shorten 80
           , ppSep = xmobarColor "#429942" "" " | "
           }

-- GridSelect
myGSConfig = def { gs_cellwidth = 460
--               , fontName = "xft:Inconsolata:pixelsize=32"
}

-- urgent notification
-- urgentConfig = UrgencyConfig { suppressWhen = Focused, remindWhen = Dont }

-- borders
borderWidth' = 3
-- normalBorderColor'  = "#002b36"
normalBorderColor'  = "#073642"
-- focusedBorderColor' = "#AF5F57"
focusedBorderColor' = "#dc322f"

-- tabs
tabTheme1 = def { decoHeight = 28
                , fontName = "xft:Inconsolata:pixelsize=28"
                , activeColor = "#a6c292"
                , activeBorderColor = "#a6c292"
                , activeTextColor = "#000000"
                , inactiveBorderColor = "#000000"
                }

-- workspaces
workspaces' = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

-- layouts
layoutHook' = tile ||| mtile ||| tab ||| full
  where
    rt = ResizableTall 1 (2/100) (1/2) []
    tile = renamed [Replace "[]="] $ smartBorders rt
    mtile = renamed [Replace "M[]="] $ smartBorders $ Mirror rt
    tab = renamed [Replace "T"] $ noBorders $ tabbed shrinkText tabTheme1
    full = renamed [Replace "[]"] $ noBorders Full

-------------------------------------------------------------------------------
-- Terminal --
-- terminal' = "~/bin/urxvt.sh"
-- terminal' = "/usr/bin/urxvt"
-- terminal' = "/usr/bin/lxterminal"
terminal' = "/usr/bin/xfce4-terminal"

-------------------------------------------------------------------------------
-- Keys/Button bindings --
-- modmask
modMask' = mod4Mask

-- keys
toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

keys' :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
keys' conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- launching and killing programs
    [ ((modMask,               xK_Return), safeSpawn (XMonad.terminal conf) [])
    , ((modMask .|. shiftMask, xK_t     ), safeSpawn "emacs" [])
    , ((modMask .|. shiftMask, xK_f     ), safeSpawn "firefox" [])
    , ((modMask .|. shiftMask, xK_g     ), safeSpawn "google-chrome-stable" [])
    , ((modMask,               xK_p     ), safeSpawn "dmenu_run" [])
    , ((modMask .|. shiftMask, xK_p     ), safeSpawn "gmrun" [])
    , ((modMask .|. shiftMask, xK_c     ), kill)

    -- multimedia
    , ((0, xF86XK_AudioRaiseVolume      ), safeSpawn "ponymix" ["increase", "3"])
    , ((0, xF86XK_AudioLowerVolume      ), safeSpawn "ponymix" ["decrease", "3"])
    , ((0, xF86XK_AudioMute             ), safeSpawn "ponymix" ["toggle"])
    , ((0, xF86XK_AudioPlay             ), safeSpawn "mocp" ["-G"])
    , ((0, xF86XK_AudioNext             ), safeSpawn "mocp" ["-f"])
    , ((0, xF86XK_AudioPrev             ), safeSpawn "mocp" ["-r"])

    -- alsa main
    , ((modMask,               xK_Up    ), spawn "amixer -c 1 set Master 1dB+")
    , ((modMask,               xK_Down  ), spawn "amixer -c 1 set Master 1dB-")

    -- audacious
    , ((modMask,               xK_x     ), spawn "audtool playlist-advance")
    , ((modMask,               xK_z     ), spawn "audtool playback-pause")

    -- xbacklight
    , ((0, xF86XK_MonBrightnessUp       ), spawn "xbacklight +5")
    , ((0, xF86XK_MonBrightnessDown     ), spawn "xbacklight -5")

    -- Screenshot (FIXME: set file name to unique, date-based name)
    , ((0,                     xK_Print ), spawn "gm import $HOME/Downloads/tmp.png")

    -- grid
    , ((modMask,               xK_g     ), goToSelected myGSConfig)

    -- Rotate through the available layout algorithms
    , ((modMask,               xK_space ), sendMessage NextLayout)

    -- Reset the layouts on the current workspace to default
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Refresh, resize viewed windows to the correct size
    , ((modMask,               xK_n     ), refresh)

    -- focus
    , ((modMask,               xK_Tab   ), windows W.focusDown)
    , ((modMask,               xK_j     ), windows W.focusDown)
    , ((modMask,               xK_k     ), windows W.focusUp)
    , ((modMask,               xK_m     ), windows W.focusMaster)

    -- swapping
    , ((modMask .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- resizing
    , ((modMask,               xK_h     ), sendMessage Shrink)
    , ((modMask,               xK_l     ), sendMessage Expand)
    , ((modMask .|. shiftMask, xK_h     ), sendMessage MirrorShrink)
    , ((modMask .|. shiftMask, xK_l     ), sendMessage MirrorExpand)

    -- Push window back into tiling
    , ((modMask,               xK_t     ), withFocused $ windows . W.sink)

    -- Increase or decrease number of windows in the master area
    , ((modMask              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modMask              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit, restart, help
    , ((modMask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modMask              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    , ((modMask .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
    [((m .|. modMask, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]] -- was greedyView
    ++
    -- mod-[w,e] %! switch to twinview screen 1/2
    -- mod-shift-[w,e] %! move window to screen 1/2
    [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
