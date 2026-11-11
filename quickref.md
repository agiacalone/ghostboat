# Ghost Boat quick reference

One page to keep beside the console. The full [captain's manual](manual.md) is on the console too: press `?`.

## First minutes

1. Power up the trainer, choose **Training** on the main menu, and run **Civilian 1: The Console**. The ten civilian tutorials take about two hours and teach one idea each; then **Naval 1: Taking Command** teaches the navy's orders. The Ghost lessons teach the attack boat's weapons: the solution, straight runners, homing torpedoes, the line-up, jamming and the beam, each with when to use it.
2. `Space` pauses at any time. `?` opens the manual and pauses the trainer.
3. `q` leaves an exercise and saves it; **Continue** on the main menu picks it up again. `Esc` never quits.
4. On the title screen, `↑`/`↓` choose, `Enter` opens, and `Esc` goes back to the main menu. Scenarios holds the challenges, War Campaign the war, and Options the theme, colours and sign-in.

## Signing in

Any key skips the sign-in. `C` on the title screen (or Options, then Captain and sign-in) opens the captains page: `Enter` signs in, `a` always logs in as this captain, `n` adds a captain, `c` changes career, `f` files Form FP-1138, `s` turns the sequence on or off. `--no-signin` skips sign-in for one run.

## Flying: autopilot or orders

**A civilian hull flies on autopilot.** The arrows act at once.

| Key | Does |
|---|---|
| `←` `→` | Steer, 5° a press (`Shift` for 1°) |
| `Shift+↑` `Shift+↓` | Pitch, 5° a press |
| `↑` `↓` | The speed the autopilot holds (or the throttle, flying by hand) |
| `c` | Autopilot on, or manual control |
| `x` | Cut the drive; on autopilot, come to rest |

**A warship flies by orders.** The arrows **dial** an order; nothing happens until you press `Enter`, and the crew takes a few seconds to answer.

| Key | Order |
|---|---|
| `←` `→` | Dial a heading, 5° a step (`Shift` for 1°) |
| `Shift+↑` `Shift+↓` | Dial a pitch, 5° a step |
| `↑` `↓` | Dial the engine telegraph: all stop, ahead one third, two thirds, standard, full, flank |
| `Enter` | Give the dialled order (`Esc` drops it) |
| `x` | All stop, without `Enter` |

**Newton, not the sea.** Turning the nose does not change where you are going; only burning does. To slow down, turn round and burn (`full stop` on the conn).

## Senses

| Key | Does |
|---|---|
| `P` | Ping. Gives range at once, and tells everyone where you are |
| `b` | Rig for silent running, or back to normal |
| `h` | Raise or lower the navigational shield |
| `u` | Jury rig what has failed (an old boat) |
| `n` | Rose, nav plot (plan), nav plot (profile), 3-D |
| `<` `>` `{` `}` | Turn and tilt the 3-D view |
| `[` `]` | Zoom the nav plot |
| `o` | True or relative bearings |

## Weapons and defence

| Key | Does |
|---|---|
| `f` | Fire at the contact with the best solution |
| `g` | Gauss gun burst (destroyers and cruisers) |
| `j` | Drop a static buoy: a loud lure for homing torpedoes |
| `d` | Launch a decoy that sounds like you |
| `J` | Begin jamming: jam the loudest incoming torpedo |
| `a` | Acknowledge the master alarm |
| `,` `.` | On the fire control window: choose a contact |
| `Enter` | On the fire control window: put the shot on the conn line |

## Time and the console

| Key | Does |
|---|---|
| `Space` | Pause; resume at x1 (iron mode: back to x1 first) |
| `+` `-` | Time compression, x1 to x100k. Drops to x1 when something happens |
| `=` | Back to x1 |
| `Tab` `v` `z` `L` | Focus a window, change what it shows, swap it into the main window, next layout |
| `F2` to `F10` | Console setups: bridge, sensors, nav, engineering, comms, science, damage, stealth, travel. `setup weapons` has no key. |
| `s` or `☰` | Menus of every station and every action (the mouse works too) |
| `l` | The whole ship's log: `1`-`8` kinds, `f` or `c` one contact, `/` search, `Enter` detail, `p` show on the plot. Also in the replay |
| `N` | Night orders: what wakes you |
| `S` | Standing orders: what the crew does before you answer, and what each board setting buys |
| `W` | The plotting menu: filters, layers, shadows, zones |
| `r` | When the engagement is over: the replay, true tracks and a debrief on a map you can turn and tilt |
| `i` | After a failure with an instructor's note: the replay at the moment it blames. Also jumps there inside the replay |
| `t` `T` `e` `m` | Theme (next, back), color effects, sound |

## The conn

Press `Enter` with nothing dialled (or `:`) and type an order. `↑` brings back earlier ones.

| Order | Does |
|---|---|
| `helm 045`, `helm 045 +10` | Come to a heading (and elevation) |
| `helm cse` | Point along your own course |
| `helm s090`, `helm p045` | Turn by a bearing off the bow |
| `reverse` | Helm only: end for end, the drive left as it is |
| `clear baffles`, `clear baffles right` | End for end, or 90° to that side |
| `helm quiet`, `helm full` | Turns held under the MAG rate (slow, silent), or full rate again |
| `match s1` | In testing: the helm points for the burn that matches s1's velocity and says how much; you give the throttle |
| `reverse half`, `reverse 50` | End for end with the drive cut, then the drive at half (or full, standard, slow, or a percentage) |
| `point 100,-50,20` | Point at a chart position, km |
| `all ahead one third`, `two thirds`, `standard`, `full`, `flank`; `thr 40`; `all stop` | Drive orders. Flank pushes the drive |
| `burn to 2.5`, `burn 30` | A controlled burn, then coast |
| `full stop`, `slow to 0.5` | Turn end for end and burn down to rest, or to a speed |
| `beam s1`, `steer s1`, `away s1` | Turn to put a contact abeam, ahead, astern |
| `fire s1`, `salvo 3 s1`, `fire s1 homing`, `fire s1 mk2h` | Torpedoes |
| `fire s1 contact`, `exploder contact`, `exploder prox` | Exploder for one salvo, or standing |
| `seeker 800 narrow`, `seeker off` | Homing seeker on 800 km out, looking ahead only; back to the standard. Stands until changed |
| `check s1` | Fire control's answer for each weapon, without firing |
| `drop s1` | Take a silent contact off the table until it is heard again |
| `mark 045`, `mark s1`, `mark b off`, `mark off` | Up to three bearing marks on the rose |
| `load 2 mk2h`, `load 2 empty`, `load 2 rack` | Change a tube now: a reload's time, and it is heard |
| `reload 2 mk1`, `reload 2 same`, `reload 2 empty` | Choose what a tube takes next: silent |
| `jam s1`, `jam s1 60%`, `jam +`, `jam off` | Jamming, at a share of full power |
| `eccm on`, `eccm 60%`, `eccm +`, `eccm off` | Counter-jamming, likewise |
| `carrier s1 40m` | A cold carrier: it coasts, then releases two torpedoes |
| `launch picket`, `launch picket 2`, `launch screen` | A carrier's flight deck: craft that listen far out, or guard you close in |
| `launch strike s3`, `launch strike 4 s3` | Strike craft at a contact with a solution: two unless you say |
| `recall`, `recall picket`, `recall all` | Call craft home; launches still waiting are struck off |
| `deck`, `sorties` | The hangar and the launch queue; each craft's mission, Δv, time left and where it is |
| `show deck` | The flight deck window: every craft with its Δv and endurance bars |
| `push`, `push off` | Drive past its rating, at a risk |
| `overload on`, `overload off` | Guns over their rating, at a risk |
| `dc quiet`, `dc work` | Stand the damage parties down, or send them back |
| `shadow s1`, `shadow own`, `shadow off` | Shade what a contact cannot see, by your estimate of it |
| `filter held`, `filter off` | What a rose shows (also `weapons`, `solved`, `hostile`, `torpedoes`, `courses`) |
| `layer reach`, `layer loud`, `layer reset` | What a plot draws (also `lob`, `ellipses`, `vectors`, `trail`, `rings`, `labels`, `bands`, and `craft`, our craft's rings home) |
| `vectors 30`, `vectors auto` | The plot's vector time |
| `zone`, `zone alpha 500`, `zone off alpha`, `zones` | A tripwire box: the crew calls when a contact's estimate enters |
| `guard port 270 330` | A guard arc off the bow: the crew calls a bearing on it |
| `silent`, `ultra`, `normal` | Rig the boat |
| `shield status`, `reactor status` | Any system reports its setting: also the transponder, assist, radiators, sensors, generator, scrubbers, electrolysis and jammer |
| `battery`, `heat`, `fuel`, `prop`, `hull`, `air`, `cabin`, `crew`, `helm`, `pos`, `alt`, `accel`, `turn`, `tubes`, `guns`, `pinger`, `cm`, `sig` | The crew reads that gauge from its own instruments: the cross-check for a broken gauge |
| `gauges` | The gauges damage control knows are broken |
| `reports all`, `reports normal`, `reports quiet` | How much the crew reports on its own. Kept for the next exercise |
| `mag status` | The boat's magnetic field, what makes it, and how close a magnetometer must come to feel it |
| `board`, `board patrol` | List or set the board's named settings: `standard`, `patrol`, `quiet`, `battle` |
| `board preview patrol` | What a setting would buy and cost on your boat |
| `standing`, `standing lure decoy`, `standing off` | The crew's reactions. Rows: `lure`, `evade`, `array`, `jam`, `pinged`, `battery` |
| `shed tubes`, `restore tubes`, `restore all` | Open or close a breaker |
| `priority tubes 3`, `priority auto` | Reorder the board |
| `aux on`, `aux off`, `aux auto` | Run the generator |
| `bank a off`, `bank a on` | Isolate a battery bank |
| `refuel`, `refuel stop` | Take fuel from a tanker or base alongside |
| `save`, `save before the attack` | Save the exercise (not in iron mode) |
| `log <text>` | Write your own line in the log, handy for play-test notes |
| `filter s1`, `filter eng`, `filter off` | Narrow the log window |
| `night`, `night transit`, `night patrol`, `night ambush`, `night standing` | Night orders |
| `call me on ping`, `call me pause on contact`, `call me never on lost` | What reaches you. Torpedoes, hits and the end always do |
| `call me at 02:00`, `call me battery 30`, `call me waypoint`, `call me off` | Your own calls |
| `call s3 hostile`, `name s3 fat one`, `ignore s3`, `pin s3` | Your own call on a contact, beside the crew's |
| `red`, `blue`, `yellow`, `white` | Set the condition by its colour |
| `tune 045`, `tune s1`, `tune t2`, `tune off` | Listen down one bearing, a contact's or your own torpedo's |
| `all stop; silent` | Several orders on one line |
| `help` | List every order |
| `help fire` | Just that order, and what it does |

## Reading the contacts table

| Column | Means |
|---|---|
| `S1`, `S2` | Contacts, by the order you heard them |
| `TYPE` | The crew's best guess: `unknown`, `civilian?`, `military?`, then a class. Only an opinion. `info s1` shows the odds |
| `RANGE km` | A range and its error. `?200-900` is a limit from the signal and the crew's calls, never a solution |
| `TMA` | How good the solution is: `POOR`, `FAIR`, `GOOD`. You need `FAIR` or better to shoot |
| `SIG` | dB above your threshold. Rising: closing or getting louder. Falling: opening or going quiet |
| Rose `HEARD AT ~` | How far off you could be heard now, by your own estimate. A red-shaded contact is inside it |
| Course | Click the focused plan to arm one; `Enter` gives it, `Esc` drops it, and it lapses after 8 s |
| Overlay | `p` takes up the pencil: click a note, drag a line, click a mark to rub out. Pencil down: drag a note to move it |
| Plot marks | `⊗ launch 12m` is where you were loud: a ring grows at your speed. It never says whether anyone heard |
| Plot | Drag to pan; `centre s1` follows a contact, `C` comes home at the standard range |
| `HEAR` | Which sensors have it: `P` passive array, `I` infrared, `X` beacon (it is announcing itself), `x` beacon gone silent, `E` EM (it is transmitting), `M` magnetic (it is close) |
| `DZ km` | Height above (`+`) or below (`-`) you, once range is known. Ranges are 3-D |

Symbols: `○` friendly, `◇` hostile, `□` neutral, `✣` unknown. A fighter wears the top half: `◠ ⋀ ⊓ ⌒`. `⊕ WPT` is a waypoint from your orders, not a contact.

## Rules of thumb

- **Listen before you act.** A ship that burns or pings is heard far beyond where it can hear or see you.
- **Range comes from a leg change.** Fly straight and the solution stays `POOR`. Turn about 90° (`beam s1`), burn briefly, and drift.
- **Burning makes you deaf** as well as loud. Cut the drive to listen.
- **A homing torpedo chases the loudest thing it hears.** Drop a static buoy, slide off its line, and go quiet.
- **A carrier sees with her craft.** Her own hull is too loud to hear a quiet boat. Put pickets far out, keep a screen for torpedoes, and land craft before their pilots tire: each faint ring on the plot is how far out one can be and still make the deck. The challenge **The Flight Deck** walks you through it.
- **Under air cover, go dark.** Craft are loud and half deaf. When one comes near, rig for silent running (`b`), keep radio silence and drift: what it hears, the destroyers hear. `Launch transients` mean a flight deck, and craft on the way.
- **A jammer blinds a seeker.** Against jamming escorts, fire straight runners on a `GOOD` solution: on `GOOD` the fan closes.
- **Jamming is a confession.** It hides you inside its cone and tells everyone else exactly where you are.
- **Civilians and the navy are not equals.** A civilian hull is heard far off and hears little. A warship is the reverse.
