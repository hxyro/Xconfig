Config { font              =   "xft:JetBrainsMono Nerd Font:pixelsize=12"

       , additionalFonts   = [ "xft:3270SemiNarrow Nerd Font Mono:pixelsize=33"
                             , "xft:3270SemiNarrow Nerd Font Mono:pixelsize=38"
                             , "xft:Meslo LG S DZ:pixelsize=17:style=Bold"
                             , "xft:Meslo LG S DZ:pixelsize=6"
                             , "xft:3270SemiNarrow Nerd Font Mono:pixelsize=21"
                             , "xft:3270SemiNarrow Nerd Font Mono:pixelsize=25"
                             , "xft:Meslo LG S DZ:pixelsize=22:style=Bold"
                             , "xft:3270SemiNarrow Nerd Font Mono:pixelsize=28"
                             , "xft:3270SemiNarrow Nerd Font Mono:pixelsize=19"
                             , "xft:3270SemiNarrow Nerd Font Mono:pixelsize=42"
                             , "xft:Meslo LG S DZ:pixelsize=25:style=Bold"

                             ]
       , bgColor           =   "#202630"
       , fgColor           =   "#bbc2cf"
       , alpha             =   255
       , position          =   Static { xpos = -10 , ypos = 1052, width = 1940, height = 35 }
       , lowerOnStart      =   True
       , hideOnStart       =   False
       , allDesktops       =   True
       , persistent        =   True

       , commands          = [ Run UnsafeStdinReader

                             , Run BatteryP	["BAT1"]
                                           	[ "-t"      , "<acstatus>"
										   	, "--Low"   , "10"
										   	, "--High"  , "85"
										   	, "--low"   , "#ff0000"
										   	, "--high"  , "#00ff00"
										   	, "--"
										   	, "-O"      , "<fc=#47c97b><fn=1>\xf584</fn><fn=4> </fn><fn=3><left>]</fn></fc>"
										   	, "-o"      , "<fc=#9fd6b4><fn=5>\xf57c</fn><fn=4> </fn><fn=3><left>]  <fc=#cbd2df><fn=2><fn=4> </fn></fn></fc><fn=3><fc=#C778DD>[</fc><fc=#A2CD83>[</fc><fc=#cbd2df><timeleft></fc><fc=#A2CD83>]</fc><fc=#C778DD>]</fc></fn></fn></fc>"
										   	, "-i"      , "<fn=3><fc=#ff0000>Charged</fc></fn>"
										   	, "-A"      , "5"
										   	, "-a"      , "notify-send -u critical 'Battery running out!!'" ] 30

                             , Run Cpu [ "-t"      , "<fn=1>\xf135</fn><fn=4> </fn><fn=3><total>]</fn>"
                                       , "-H"      ,"40"
                                       , "--high"  ,"#ff3333" ] 10

                             , Run ThermalZone 0 [ "-t"      , "<fc=#EFCA84><fn=6>\xf2c9</fn><fn=4> </fn><fn=3><temp>]</fn></fc>"
                                                 , "--High"  , "60"
                                                 , "--high"  , "#ff3333" ] 10

                             , Run Date "<fn=9>\xfa1e</fn><fn=4> </fn><fn=3>%I<fn=7>:</fn>%M%p</fn>" "date" 600

                             , Run Brightness [ "-t", "<percent>]"
                                              , "--"
                                              , "-D", "intel_backlight" ] 3

                             , Run Volume  "default" "Capture"
                                         [ "-t", "<status>"
                                         , "--"
                                         , "-O", "<fc=#77dd77><fn=8>\xf130</fn><fn=4> </fn><fn=3><volume>]</fn></fc>"
                                         , "-o", "<fc=#dd6666><fn=1>\xf131</fn><fn=4> </fn><fn=3><volume>]</fn></fc>"
                                         ] 3
                             , Run Volume "default" "Master"
                                         [ "-t", "<status>"
                                         , "--"
                                         , "-O", "<fc=#dcffa8><fn=2>\xfa7d</fn><fn=4> </fn><fn=3><volume>]</fn></fc>"
                                         , "-o", "<fn=2>\xfa80</fn><fn=4> </fn><fn=3><volume>]</fn>"
                                         ] 3

                             , Run Com "echo" ["<fn=2>\xfb8a</fn>"] "REC" 60

                             , Run Com "echo" ["<fn=2>\xfa0d</fn>"] "INVERT" 60
                             ]
     
       , sepChar           = "$"
       , alignSep          = "}{"
       , template          = "   <fn=10>$UnsafeStdinReader$</fn> } <fc=#FFC6CD>$date$</fc> { <fc=#cccccc><action=`~/.bin/invert.sh`>$INVERT$</action></fc>    <fc=#FFB6BD><action=`~/.bin/ffmpeg.sh`>$REC$</action></fc>    <action=`pactl set-source-volume @DEFAULT_SOURCE@ +1%` button=4><action=`pactl set-source-volume @DEFAULT_SOURCE@ -1%` button=5><action=`pactl set-source-mute @DEFAULT_SOURCE@ toggle`>$default:Capture$</action></action></action>    <action=`pactl set-sink-volume @DEFAULT_SINK@ +10%` button=4><action=`pactl set-sink-volume @DEFAULT_SINK@ -10%` button=5><action=`pactl set-sink-mute @DEFAULT_SINK@ toggle`>$default:Master$</action></action></action>   <fc=#D788ED><action=`light -S 30`><action=`light -U 2` button=5><action=`light -A 2` button=4><fn=2></fn><fn=4> </fn><fn=3>$bright$</fn></action></action></action></fc>    $thermal0$    <fc=#39dbc5>$cpu$</fc>    $battery$   "
    }
