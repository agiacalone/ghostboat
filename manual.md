# Ghost Boat: captain's manual

*Issued with every registered vessel. Read it before the hull is breached, not after.*

**Reading this at the console:** press `F1` at any time, or `?` for the quick reference card and then `h` for this manual. The trainer pauses while you read. `↑`/`↓` scroll a line; `PgUp`/`PgDn`, `Shift+↑`/`Shift+↓`, or `b`/space scroll a page; `g`/`G` jump to the start and end; `←`/`→` jump between sections (on the quick reference, also between the groups of conn orders), and `?` or `Esc` closes the manual and puts the exercise back as it was.

**Searching it:** `/` opens a search line at the foot, as in vim and `less`. Type a word and press `Enter`: the reader jumps to the first match from the top of the screen and highlights it, and the foot counts the matches, such as `3 of 12`. `n` goes to the next match and `N` to the one before; both go round from the last to the first, and back. Case does not matter. A search that finds nothing says so at the foot. `Esc` closes the search line; `Esc` again closes the manual. The quick reference and the War diaries reader search the same way.

You command a ship by its instruments. A ghost is called a boat, by tradition, as a submarine is, whatever her size. A ghost boat has no portholes: at a kilometre a second, the dust of space would sandblast the glass in minutes, and a ship worth seeing is hundreds of kilometres off and dark. You will never see a map of where the enemy is. You will see bearings, signal strengths and estimates, and you will decide what they mean. This manual explains every instrument, every control and every rule the trainer uses. The spec sheets near the end come straight from the fleet's own data, so they are always current.

> [!IMPORTANT]
> **The one rule.** Everything you know about other ships comes from your sensors. Everything they know about you comes from theirs. That goes for the enemy too, at every difficulty. If they found you, you gave yourself away.

## Your orders

*The flotilla commander, on the dock, to a skipper with the ink still wet.*

Okay, green skipper. Here is your boat. Seventy crew who know their jobs better than you know yours, four tubes, and a long way from home.

The job is tonnage. Every ton you sink is a ton the other side doesn't have, and that is how this war gets settled. So stay quiet. Hear them before they hear you. A ghost picks its own fights, and if a fight looks bad, you were never there. When it looks good, sink them, get clear, and come back for more torpedoes. Dead skippers sink nothing.

Nobody out there is a villain. They have orders too, and somebody like me on their dock, telling them to find you. Who was right is for the politicians.

Nobody is coming for you, either. No backup, no rescue, no second boat. Once the hatch shuts it's you, your crew and the dark.

Sink 'em all, skipper. Then bring my boat back.

## Contents

1. [How the trainer works](#1-how-the-trainer-works)
2. [The console](#2-the-console)
3. [Controls](#3-controls)
4. [Setting up the console](#4-setting-up-the-console)
5. [Reading the instruments](#5-reading-the-instruments)
6. [Drills](#6-drills)
7. [Flying a Newtonian ship](#7-flying-a-newtonian-ship)
8. [Passive array](#8-passive-array)
9. [Range from bearings: TMA](#9-range-from-bearings-tma)
10. [Active array](#10-active-array)
11. [Gravity wells](#11-gravity-wells)
12. [Nebulas](#12-nebulas)
13. [Torpedoes](#13-torpedoes)
14. [Electronic warfare: jamming and ECCM](#14-electronic-warfare-jamming-and-eccm)
15. [Power, heat and signatures](#15-power-heat-and-signatures)
16. [Life support](#16-life-support)
17. [Damage](#17-damage)
18. [How the enemy thinks](#18-how-the-enemy-thinks)
19. [Your boat and theirs](#19-your-boat-and-theirs)
20. [Goals and scoring](#20-goals-and-scoring)
21. [The war campaign](#21-the-war-campaign)
22. [The career](#22-the-career)
23. [Scenarios](#23-scenarios)
24. [Ship registry and specifications](#24-ship-registry-and-specifications)
25. [Glossary](#25-glossary)
26. [Enclosures](#26-enclosures)

## 1. How the trainer works

You command a ghost: a submarine in space. Nobody out here can see anyone. Every ship knows only what reaches its sensors: the energy other ships give off, and the echoes of its own pings. **Everything you know about the enemy, it gave away. Everything it knows about you, you gave away.**

![Hunting a convoy. The rose (left) shows which way each contact lies, and once its range is known, how far, how high and whether it is closing: the escort is 278 km off and closing. The waterfall (right) is the raw output of the passive array: the convoy is the bright column. The plot (bottom) shows the solutions.](screenshots/convoy-hunt.png)

### The hunt

Every engagement is the same loop, on both sides. The side that gets round it first, quietly, usually wins.

```mermaid
%% The hunt, from first contact to getting home
flowchart LR
  L["Listen<br/>drift, quiet"] --> H["Hear<br/>a bearing"]
  H --> T["Track<br/>heard again and again"]
  T --> S["Solve<br/>leg change: range, course, speed"]
  S --> F["Fire<br/>a torpedo or a gun"]
  F --> C["Get clear<br/>break contact"]
  C --> L
  F -. "the launch is heard" .-> E["The enemy hunts<br/>down your bearing"]
  E -. "you are tracked" .-> X["Found"]
  style X fill:#ffdce0,stroke:#cf222e,color:#1a1a1a
```

1. **Listen.** Drift with the drive off. A drifting ship is quiet and its own array is at its best.
2. **Hear.** A contact appears as a bearing: a line on the rose and a streak on the waterfall. A bearing gives direction, never distance.
3. **Track.** Keep hearing it. Each new bearing goes into the contacts table.
4. **Solve.** Range comes from geometry. Change course (a *leg change*), and the bearings from your two legs cross. The solution grows from `POOR` to `FAIR` to `GOOD`. See [Range from bearings](#9-range-from-bearings-tma).
5. **Fire.** A torpedo on a `FAIR` solution may miss; on a `GOOD` one it should hit. A spread covers the error.
6. **Get clear.** Inside about 600 km the enemy hears the launch: expect it to come down your bearing. Go quiet and slip away.

The enemy runs the same loop against you, with the same sensors and the same mathematics. It never knows where you really are; it knows only what you gave away.

### What gives you away

| What you do | What it costs | Who notices, and from how far |
|---|---|---|
| Drift, reactor running | almost nothing | a destroyer hears a drifting ghost at about 230 km |
| Fly on autopilot (civilian hulls) | navigation radar and electronics radiating all the time it is on, plus its thrusters | every warship's array: switch it off (`C`) before you need to hide |
| Burn the drive | the loudest thing you do: the drive's plume | a destroyer hears a ghost at full burn at about 23,000 km, a hundred times farther; even a gentle burn carries thousands of km |
| Ping | everyone hears the ping far beyond the range at which its echo finds anything | every ship for a very long way: it knows exactly where you are |
| Fire a torpedo | a launch transient, then the torpedo's own drive | a destroyer hears a ghost's launch at about 600 km, louder than the boat even with its reactor up, and the torpedo's small motor at about 250 km; a warship's tubes are far louder; a coasting torpedo is heard at about 20 to 40 km |
| Transmit (datalink, beam weapon) | an EM signal on your true bearing | every EM receiver in range |
| Jam | the loudest emission there is, on your true bearing | everyone, from any side; see [Electronic warfare](#14-electronic-warfare-jamming-and-eccm) |
| Run warm (radiators out, reactor hot) | heat glows in infrared | warships' telescopes; silent running cools you |
| Come close | your hull's magnetic field: the reactor's coils while it runs, and every hard turn | magnetometers feel a running attack boat at about 14 km and a cold one at about 6 to 7 km, from its steel hull alone; turning hard reaches farther |

The two numbers to remember: **drifting, you are heard at a few hundred km; burning, at tens of thousands.** Most of the job lives between them.

### What new captains get wrong

> [!IMPORTANT]
> **"Speed is loud."** It isn't. There is no water in space. A ship coasting at any speed makes only its reactor's hum. The *drive* is loud, and only while it burns. Burn hard, then coast in silence.

> [!IMPORTANT]
> **"Turning changes where I'm going."** It doesn't. Turning points the nose; only burning changes your course. Watch `HDG` and `CSE` part in the own-ship panel. See [Flying a Newtonian ship](#7-flying-a-newtonian-ship).

> [!IMPORTANT]
> **"A ping only gives me away if it finds them."** It gives you away to everyone who hears it, which is everyone, far beyond its echo's reach.

> [!IMPORTANT]
> **"Jamming hides me."** It hides what is behind your jammer from the ships inside its cone, and tells every ship in the sky exactly where you are. It is a defence against guided weapons, not a cloak.

> [!IMPORTANT]
> **"A contact on the rose is a target."** It is a direction. Until you have a solution you don't know how far it is, which way it's going or how fast.

> [!IMPORTANT]
> **"Once I've fired, it's over."** Firing is the loudest thing a ghost does. Escorts hunt the firing point, and many goals ask you to get clear afterwards.

### Two ways to fly

How you fly depends on your hull.

- **A civilian hull flies on autopilot.** A small generalist crew leans on automation. The arrow keys act at once: `←`/`→` steer, and `↑`/`↓` set the speed the autopilot holds along your nose (`AUTOPILOT` in the header). Press `C` (Shift-c) to take manual control (`MANUAL`): then `↑`/`↓` step the throttle, still at once. Easy and forgiving, but a ship that holds a steady speed is easy to predict, and easy to hit, and the autopilot radiates EF the whole time it is on. To hide, switch it off.
- **A warship flies by orders.** The navy has no autopilot. The arrow keys **dial** a heading, a pitch or an engine order (`ORDER` in the header), and `Enter` gives it. A specialist crew carries it out: the helm in about 3 seconds and the engine room in about 4, slower when tired or short of air (`ANSWERING` while they work). Plan a moment ahead: a stop ordered late is a stop overshot. It is harder, and it is worth it. A navy drive pushes two or three times as hard as a hauler's, spools and turns faster, and can be pushed to flank. The crew flies a controlled burn (`burn to 1`, `full stop`) to the figure and cuts it. Between orders the boat coasts: nothing holds her speed, nothing fires, nothing radiates, and a captain who changes course in bursts is hard to predict. The navy also has the better weapons and sensors.

The civilian tutorials teach the autopilot; the naval ones teach orders. See [Controls](#3-controls).

## 2. The console

```text
┌ header: ship · XPDR · zone · drive state · PING · ASSIST · clock · scenario ┐
│ bearing rose            │ passive waterfall (bearing across, time down)    │
├ status                  │ contacts: bearing, elevation, signal, TMA        │
├ log ─────────────────────────────────────────────────────────────────────── ┤
└ key bar ─────────────────────────────────────────────────────────────────── ┘
```

Instruments follow one rule: **labels are dim, values carry the colour, and colour means something is wrong.** A quiet, green board is a good board. Look for the one reading that has changed colour.

### You are the captain

You give orders; the crew carries them out and answers. Every order on the conn is acknowledged by the station that does it (`HELM`, `SENSORS`, `WEAPONS`, `COUNTERMEASURES`, `ENGINEERING`, `COB`, `DAMAGE CONTROL`), and the crew reports on its own: damage control on what it is fixing and how long it will take, the chief of the boat on the air, engineering when the plant acts by itself.

The windows that run a department, **engineering** and **damage control**, open on a **captain's summary**: what you can do and for how long, in words with gauges for the battery, fuel and heat ("Battery 100%, about 35 min left at this draw"). Press `i` on the focused window for the **detail**: every gauge and number. Leave everything on AUTO and the crew runs it sensibly; reach into the detail when you want to run it yourself.

### Windows

The console is a frame that never moves (the header, the goals and the key bar) around six windows: one large **main window** and five smaller ones. Any window can show any instrument, so you can set the console up the way you like to fight.

| Key | Does |
|---|---|
| `Tab` / `Shift-Tab` | Move the focus to the next or previous window. The focused window's frame is bright, with a `◆` in its corner. |
| `v` | Change what the focused window shows: waterfall, rose, nav plan, nav profile, 3-D, chart, engineering, damage, contacts, status, log, comms, survey, vessel, fire control, on a carrier the flight deck, and in a career fight the patrol chart and the crew. Only the focused window changes, and it skips instruments already on screen. `V` steps back the other way. `show NAME` on the conn puts one in a second window on purpose. |
| `z` | Swap the focused window into the main window. Press `z` again (the focus follows it) to put it back. |
| `L` | Next layout: **Bridge** (main window top left, two beside it, two below), **Tactical** (main window across the top, four below), **Focus** (main window takes most of the screen, four in a column beside it). |
| `n` | Step the focused window through rose, plan, profile and 3-D, if it is one of those. |
| `o` | True or relative bearings on every bearing display at once (rose, waterfalls, contacts). A window you switch to, and each built-in setup, takes up the same frame. For a mixed setup, set windows one by one on the conn: `rose relative`, `waterfall true`, `contacts relative`; a setup you save keeps the mix. |
| `i` | The focused window between the captain's summary and the detail (engineering, damage control), or fire control between its grid and the torpedo room. |

The bottom strip holds the log by default. Your windows and layout carry from one engagement to the next.

Three **dynamic windows** open over the main window by themselves, then close:

- **TORPEDO**, top right, while you can hear an enemy torpedo: its bearing, its signal, and `CLOSING` when it is getting louder.
- **DAMAGE**, bottom right, while the master alarm is unacknowledged and the damage report isn't on screen: what is hurt.
- **NOTICE**, bottom left, for a few seconds after an alert, but only when the log is not on screen to show it.

### Header

| Item | Meaning |
|---|---|
| Ship name and class | Yours. |
| `GST 3127.214 06:41:09` | Galactic Standard Time: year, day of the year, time of day. The galaxy's one clock. Each engagement starts on its own date, drawn inside its era in the campaign and anywhere in the war in free play; it never stops in iron mode. |
| `T+00:02:09` | Mission time, with days (`T+2d 04:10:00`) past the first. |
| `T2 ⏱00:42` / `T2 +00:03` / `T2 past 00:20` | A torpedo clock for each of yours running, as WWII boats timed every run with a stopwatch: time to impact while fire control has a solution, else time since launch. Amber `past` means the meeting time has gone by with the torpedo still running: it has probably missed. |
| `COND` | The boat's condition, shown by its lighting (as in *Das Boot*): **RED** combat (a torpedo in the black, yours or theirs, or a master warning; you can set another condition over it with `condition`, and it holds until something new goes wrong; once the alarm is over your setting stays), **BLUE** silent running (`silent` and `ultra` set it over a WHITE or YELLOW you set by hand, though not over RED, and `normal` hands it back to the boat), **YELLOW** caution, raised by the first ping heard or a new vessel that is unidentified or hostile, and held until you stand it down, **WHITE** all clear. Your own group is friendly, and so is a ship broadcasting its transponder unless intelligence says otherwise; neither raises YELLOW. Set the condition yourself with `condition red`, `blue`, `yellow` or `white` (which also stands down a raised YELLOW), and hand it back with `condition auto`. A torpedo turns the boat RED whatever you set. Damage, heat and bad air have their own warnings. With effects on, the console's text and lines take on the light. The condition is also your crew's stance, and it has real effects: **WHITE** answers slower than normal (a quarter again), **YELLOW** is normal, **BLUE** and **RED** answer faster (15% and 25%). Anything but WHITE tires the crew (YELLOW over a day, BLUE in half that, RED in eight hours), and only WHITE rests them (six hours from spent to fresh), so stand down between fights. You may order RED at any time, ahead of an alarm, and pay for it in fatigue. Computer-flown ships follow the same rules by what they have heard: a captain on patrol is at WHITE and slow to answer, one hunting is at YELLOW, one attacking is at RED, and a silent-running one searching with its reactor cold is at BLUE. |
| `SHIELD` | The navigational shield is up (`H`). It shows on EF and magnetics. |
| `DRIFT` | Nothing is firing. You are as quiet as your ship can be. |
| `BURN` | The main drive is running. You are loud, and partly deaf. |
| `THRUSTERS` | Flight assist is firing its thrusters to hold your course. Also loud. |
| `PING` | Someone has pinged you with active array. Flashes for ten seconds. |
| `TORPEDO` | An enemy torpedo is in the black and you can hear it. Flashes until it goes quiet. |
| `SILENT` | The reactor is shut down: you are running on the battery, quieter than drifting. |
| `RAD` | Radiators out: shedding heat, and glowing in infrared. |
| `HEAT` | The heat sink is over 90%, or full and the reactor has scrammed itself. |
| `HULL` | **Vitals, in the right-hand column.** In a narrow window `HULL`, `FUEL`, `PROP` and `CREW` stay among the gauges as figures, and the rest fall below them. The bars come first, always in the same order, so a short or red bar stands out: `HULL`, `BATT`, `SINK`, `FUEL`, `PROP`. They run from what ends a patrol soonest to what ends it slowly. `HULL` is hull integrity: amber under 70%, red under 30%, and at 0% the ship is lost. |
| `BATT` | Battery below 15%. |
| `BEAM` | Your beam weapon is firing: you are lit up on EM. |
| `REACTOR START` | The reactor is coming back from cold, with the time left. It makes no power yet, and the start can be heard. |
| `ULTRA` | Rigged for ultra-quiet: the scrubbers are off and CO₂ is climbing. No reloads and no repairs until it ends, and the crew tires fast. |
| `AIR 2.1%` | The crew is short of air and working worse. |
| `HULL 70%` | You have been hit: hull integrity left. |
| `MASTER CAUTION` / `MASTER WARNING` | The annunciator. Caution: a system has been damaged. Warning: one has failed, or the hull is below 30%. Flashes until you acknowledge it with `a`; a worse alarm relights it. |
| `ASSIST` | Lit when flight assist is engaged. Shown only if you have a compensator. |
| `DUST` `ION` `STORM` | You are inside a nebula of that kind, shown in its colour. See [Nebulas](#12-nebulas). |
| `LOST` | Your ship has been sunk. |
| `T+HH:MM:SS  xN` | Mission clock and time compression. `PAUSED` when paused. A challenge starts running at x1. A resumed save opens paused, as may a lesson that asks you to read something first. |

### Goals

When a mission has goals, a **GOALS** line sits under the header: `○` still to do, `●` done, `✕` failed, with `(optional)` on goals that don't decide the result. A goal that means going somewhere shows its bearing and range, `⊕ 045° 1,200 km`, and the same `⊕` appears on the rose's ring and on the nav plot, with a circle showing how close you need to get. When the mission has advice for the current goal, it appears underneath, on as many lines as it needs.

**The briefing, read again.** `t`, or the order `brief`, shows the exercise's name and briefing again, as the launch page gave it, with the goals under it. Each goal says in words whether it is open, done or failed, and the current goal's hint is written out in full under it. The clock stops while it shows, as it does for the manual (not in iron mode), and runs again as before when you close it with `t` or `Esc`. Every line is plain text, so a screen reader reads it as it stands. In a career fight there is no exercise briefing: the page gives command's orders for the patrol, the place and the boat's state as she dropped in, and the fight's goals; in a career lesson, the lesson's own briefing comes first. The `t` key is in testing and may change; the order `brief` will stay.

*Stay undetected* means no hostile ship may **track** you: hear you several times within a minute. One lucky faint detection doesn't count, but the hunter may come looking. Civilian ships hearing you don't count.

What each kind of goal asks, and how a patrol is scored: [Goals and scoring](#20-goals-and-scoring).

When the mission ends, a box says **MISSION COMPLETE** or **MISSION FAILED**, with the reason and the time taken. A third ending, **EXERCISE ENDED**, comes when a ship you had to sink gets clean away: unheard for an hour, over 10,000 km off and still opening, with too few left to make the count. It is neither won nor lost, and the records show it as `ended`. `l` reviews the log, and `r` opens the replay. `s` keeps this play: the save from just before the end, as a named save to retry from; the end itself, as a named save to come back to; and the replay, safe from pruning. Loading the end shows this box again, and `k` plays on from there. The result is recorded once, however often you load it. `k` keeps playing: the result stands as recorded, the box goes, and the boat sails on for as long as you like, saved as any game is (not after your boat is lost). `q` leaves at once. If you don't keep it, the autosave from before the end goes when you leave, so finished games don't pile up and **Continue** never takes you back into a fight already decided. In iron mode the save goes at the end, and `s` keeps the replay only.

### Bearing rose

A compass card centred on you, with its own scale, shown in its title (`±2,000 km`): the wheel over it, or `[` and `]` when it's focused, step the ring in or out, and the inner ring is half that, labelled. Anything you have a position for gets a `•` at its range, and its line stops there; a contact with only a bearing stays a line to the ring, and one off the scale keeps its range in its tag. Bodies and waypoints sit at their range too, and a dotted red ring shows how far off you can be heard (`HEARD AT`). **Mark a bearing:** click inside the focused rose to set your own mark, and hold the button to drag it round the card; the tag reads it as it moves (`MARK 045`). `mark 045` on the conn does the same, and `mark off` clears it. It stays on that true bearing as you turn, and it's yours alone: leave it on a contact, and if the contact stays on your mark while it gets louder, it is on a collision course. Click the title bar to swap the rose into the main window. It has two settings. `o` switches every bearing display together; to set the roses alone, type `rose relative` or `rose true` (which sets every rose on screen):

- **True** (the default): 000 is up. The fleet's 000, its "north", points toward the galactic centre, so `N` on the card is coreward. Bearings match the waterfall and the contacts table, which are always true.
- **Relative:** your bow is up, and the card turns as you turn. Ticks read relative bearings (`0` dead ahead, `90` starboard beam, `180` astern), and the contact and waypoint tags read from the bow the way the contacts table does (`S045`, `P135`); a `✦` on the ring marks the galactic centre. Use it to see at a glance what is ahead, abeam or in your baffles. The helm dial, ordered heading and course tags show both figures in either mode, relative first here as `P050 027°`, and true first on the true card as `027° P050`.

The galactic centre is a fixed direction, but where an engagement lies against it is not: each time you start one (the training lessons aside), its layout is turned a different way. Bearings in the briefing and the goals are the bearings for this patrol.

The waterfall has the same two settings (`o` with the others, or `waterfall relative` / `waterfall true` on their own); see [Passive waterfall](#passive-waterfall). The contacts table can show relative bearings too (`o` with the others, or `contacts relative` / `contacts true`). Each window keeps its own setting, so one waterfall can be true and another relative. Console setups save them.

- **Solid line from the centre:** your heading, where the nose points, with its number at the tip (`045°`).
- **Your own torpedoes** have their own lines, in the threat colour, tagged with tube, time to impact and range (`T1 02:32 ~180 km`). They come from fire control, not your sensors: `~` marks dead reckoning from the launch, and a torpedo on a guidance link shows where it really is. Everything else on the rose is what your sensors hold.
- **Dotted line, in its own colour (lime in the default theme):** your velocity, where you are actually going. Its length shows your speed, and its tag gives your course and speed (`012° 0.60 km/s`). Under the centre, `z +0 km` is your own height in the fleet's frame. When it parts from the heading line, you are sliding.
- **Short amber tick outside the ring:** the heading you have ordered, with its number, while the helm is still turning.
- **Lines toward the ring, labelled `S1`, `S2`…:** contacts, drawn at their last bearing. They all stop at the ring, because the passive array gives no range. Each line carries a tag: the ID, bearing and elevation (`S1 321° +04°`). Once you know the range, from a `FAIR` or `GOOD` solution or a ping echo in the last minute, the tag adds it with its error, how far above (`↑`) or below (`↓`) you it is, and whether it is closing or opening and how fast in km/s: `S1 321° +04° 550 km ±53 ↑38 km closing 0.40`. Ranges are straight lines in 3-D. Without a solution, a held contact's tag says `louder` or `fainter` when its signal has changed over the last half minute. A small rose shows only the ID and range. When many contacts lie in one direction, their tags spread out along their lines and step up or down a row, so none covers another; the most urgent (torpedoes, then anything closing, then `GOOD` solutions, then the nearest) keep their full tags, and the rest shorten to ID and range, or the bare ID. The contacts table always has every number. Held contacts pulse; lost ones are faint.
- **Hatched wedge astern:** your baffles, the arc your array cannot hear.
- **Hatched sector with a short name:** a charted body, such as a moon, covering that part of the sky.
- **Shimmering band inside the ring:** a nebula, across the bearings it covers, in its kind's colour. Inside one, the band runs all the way round.
- **Bright ray that fades:** a ping you just heard, pointing at the ship that sent it.
- **Ring spreading from the centre:** your own ping going out.
- **`HEARD AT ~` in the top corner:** your own estimate of how far off you could be detected now, by channel (`P 1,240 km · I 310 km · M 12 km`). It takes what you are giving off against a typical hunter's sensors (a destroyer's if you are a warship, a pirate raider's if you are a civilian), drifting quietly, as a boat's own-emissions monitor would. It allows for the cloud you are in, as if the hunter shared your weather; a backdrop, or dust between you and a hunter in clear space, it cannot know. The real listener may be better or worse, so treat it as a guide. Burn, ping, transmit or run the autopilot and the numbers jump.
- **Red-shaded sector:** a contact whose known range is inside your heard-at range. It can probably hear you.

### Bearing marks

A bearing mark is a ruler laid across the rose, and across the plan and the 3-D plot at your level (`MARK A 024°`, true). It stays on its true bearing while everything else moves, so it is how you see a change that is too slow to notice by eye. You can lay three, `A`, `B` and `C`, and each shows both figures, first in the card's own frame: `MARK A 024° P053`.

| Order | Does |
|---|---|
| `mark 045` | Lays the next free mark. A fourth takes the place of the oldest |
| `mark s1` | Lays a mark on a contact's present bearing. It is also on the contact's right-click menu |
| `mark b off` | Clears one mark |
| `mark off` | Clears them all |

With the pointer, click a focused rose to lay a mark. Press within about 8° of one to take hold of it and sweep it round.

**What it is for:**

- **A collision course.** `mark s1`, then watch. If S1 stays on the line and its signal grows, it is coming straight at you. A bearing that holds steady is the oldest warning at sea, and it needs no solution.
- **Which way a contact is drifting.** If it walks off the mark, you see which way and how fast. Bearing rate is the first clue to range: a close contact walks quickly, a distant one hardly moves.
- **Bracketing a convoy.** Lay `A` and `B` on the two ends of the column. If the gap between them opens, you are closing, and if it narrows, you are falling behind.
- **A danger sector.** Lay marks either side of an escort and keep your bow out of the wedge, or either side of a tube's arc to see what it can reach.
- **Remembering a bearing.** The last place you heard a contact, or the line your torpedo took, which a drilled hunter that heard the launch comes down.
- **Reading a figure.** Sweep a mark onto anything on the card and read the bearing off its tag, then use it in an order.

### Track symbols

Every display marks a contact the way a military plot does, after the MIL-STD-2525 and APP-6 standards. One shape and colour per affiliation, the same on the plot, the chart and the contacts table:

| Symbol | Affiliation | Colour |
|---|---|---|
| `○` circle | **Friendly**: our own group, or a ship broadcasting its transponder that intelligence hasn't marked otherwise | own-ship colour |
| `◇` diamond | **Hostile**: noted hostile by intelligence, or an enemy merchant whose beacon names her side | red |
| `□` square | **Neutral** | value colour |
| `✣` quatrefoil | **Unknown**: everything else, until proven otherwise | amber |

A contact the crew calls a fighter wears the top half of its frame, as air tracks do: `◠` friendly, `⋀` hostile, `⊓` neutral, `⌒` unknown. See [Flight decks](#flight-decks-carriers-and-their-craft).

A mark's label carries what is known: the solution's grade, its range and error once a solution or an echo gives one, its course and speed from the solution (`S1 GOOD 780 km ±60 329°/0.10`), and how long since it was lost. Zoomed out past 5,000 km, labels keep the range only. A lost contact stays on the plot at its dead-reckoned position, faded, with its uncertainty ellipse growing.

### Nav plot

![The nav plot in plan view during an attack. Two torpedoes run with their times to impact; the escort carries a GOOD solution, labelled with range and uncertainty, course and speed.](screenshots/firing-solutions.png)

The **nav plot** can go in any window (see [Windows](#windows)); `n` steps a nav display from the rose to the plot, then its side view, then the 3-D view, then back. `[` and `]` zoom in and out; the title shows the scale (half the plot's height).

**The plotting overlay:** think of a sheet of glass over the map, and a grease pencil. **Click** the focused plan to arm a course toward that point: a pulsing arm runs out from your boat with its bearing, as the helm dial's does on the rose (the 3-D plot shows it too, and both show the ordered heading while the helm swings to it), and `ORDER` shows in the header. Click again to move it, `Enter` gives the order and `Esc` drops it. A clicked course lapses after 8 seconds, with the countdown in the `ORDER` pill, so a stray click can't lie in wait for your next `Enter`; touch the arrows and it becomes a dialled order, which stays. Any movement of the mouse makes it a pan, not a click. If `Enter` gave a clicked course when you meant to open the conn, a letter in the next 2 seconds goes to the conn rather than to a hotkey. Only the bearing is used, and the order is a heading: as with any helm order, on a warship it turns the nose and your course changes when you burn. Press **`p`** to take up the pencil, and the plot's title says `PENCIL`: then **click** to write a note, **drag** to draw a line (a track, a boundary, an intended course), and **click a mark** to rub it out. Press `p` again to put it down. With the pencil down, **left-drag** moves a note. The **right button** works as the pencil at any time, if your terminal passes it to the trainer (see [Mouse, touch and menus](#mouse-touch-and-menus) for iTerm). On the keyboard, `note TEXT` on the conn writes at the plot's centre, `pencil` draws a line (`pencil 045/500` from your boat to a point 500 km out on 045°, `pencil s1 to s2` between two contacts' estimates, `pencil io to europa` between bodies or notes by name, and more points make more legs), `overlay undo` takes back the last mark, and `overlay clear` wipes the glass, every sheet of it. Marks stay where you put them on the map, show on the plots and the chart, and the ship keeps them with the save, the bearing mark too. They are yours alone: they add nothing the boat doesn't know, and nothing in the simulation reads them. The pencil writes on the sheet of glass in hand; there is one for each job (see [Sheets of glass](#sheets-of-glass)), and a ruler to measure with (see [The navigator's ruler](#the-navigators-ruler)).

**Move the plot:** drag it with the mouse to look elsewhere. It stays where you put it, on the map, and its title says `off centre`. `centre s1` on the conn follows a contact you have a position for, at the position your solution or fix gives, and holds its last place if you lose it; its title says `on S1`. `centre` alone comes back to your boat, and `c` goes home: the plots on your boat, and the plots and rose at the standard range, ±2,000 km. All the nav plots share one centre. Clicking a focused plot's title bar swaps it into the main window.

- **PLAN** looks down from above: east right, north up. **PROFILE** looks from the side: ahead (along your heading) right, up up. Use PROFILE to see who is above or below you.
- **3-D** is the same plot turned and tilted, so you can see the third dimension. `<` and `>` turn it 15° at a time; `{` and `}` tilt it 10° at a time, from edge-on (0°) to straight down (90°, the plan view again). The range rings lie flat at your level, with `N` marking north. Every contact you have a position for (a TMA estimate or a ping echo) stands on a dotted **drop line** to that level. A drop line going up means the contact is above you, and one going down means it is below; its length is the height difference. Lines of bearing are drawn in 3-D too, so after a turn of the view a bearing that climbs is easy to see. A contact you only have a bearing on has no position yet, so it has no drop line.
- **You** are the `◆` at the centre, with a solid heading line, a dotted vector showing where your velocity carries you, tagged with your course and speed, and a fading trail behind.
- **Vectors** run for a standard time, shown in the plot's title (`vectors 30 min`): 1, 2, 5, 10, 20, 30, 60 minutes and up, as on a ship's radar plot. The plot chooses the step from its zoom and your speed, so your own line stays inside the window as you zoom; at a close zoom and a hauler's best, even a minute's line runs long. Every vector on the plot runs for the same time, so a longer line is a faster ship.
- **Charted bodies** are drawn to scale, with their names.
- **Waypoints** (`⊕ WPT 1h25`) are drawn with their arrival ring and the time to reach the ring at your present speed, as a navigator pencils the time against a mark. The time changes as your speed does, and with no way on it is not shown. With more than one still to reach they are numbered in your orders' order, `WPT1`, `WPT2`, as `helm wpt2` names them. The bearing rose gives each waypoint's bearing, pitch and range (`⊕ WPT 045° +12° 3,475 km`), since the card itself is flat.
- **Nebulas** are shimmering clouds, to scale, with a name and kind (`the Veil · DUST`).
- **Lines of bearing** run from where you were when you heard each bearing. If you fly straight they stay parallel and never meet. After a leg change they cross, and **the crossing is the target**. This is TMA, drawn.
- **TMA estimates** appear as an ellipse (2σ, so the target is very likely inside) with the contact's ID, and a dotted vector showing where its estimated course takes it. Its label gives the grade in a word after the ID (`S1 FAIR`, `S1 GOOD`), as the contacts window does. The colour says it too: a `FAIR` ellipse is the mark's colour mixed with amber, and a `GOOD` one is the mark's own colour. The ellipse shrinks as the solution improves.
- **Ping echoes** appear as small amber circles.
- **The red dotted ring** is your heard-at range, the farthest of the `HEARD AT` estimates on the rose. Anything inside it can probably hear you.
- **Labels** step aside when they would cover one another; the most urgent (torpedoes, then held contacts, then the nearest) keep their full text.
- **Your torpedoes** are `•` in the threat colour (orange in the default theme) with their tube and time to impact (`T1 02:32`), and a dotted line to the `×` where fire control expects them to meet the target. A practice shot drifting by her beacon after her run reads `T1 adrift`, with no line (see [Practice shots](#practice-shots)). Your gauss gun slugs are grey dots. Enemy torpedoes are red contacts, with red lines of bearing.

![The 3-D view in Hunter-Killer, turned to put north on the right and tilted 35°. One attack boat sits above your level and one below, each on its drop line; your group's destroyers sit on the rings at your level.](screenshots/three-d-view.png)

- **A thick amber band on a bearing** is a range band: the near and far limits on a contact you hold on a bearing alone, tagged `?200-900`. See [The range band](#the-range-band).
- **`⊗ launch 12m`** is a loud mark, with its ring. See [Loud marks](#loud-marks).

The plot only shows what you know. Nothing is drawn where you haven't heard anything.

### What the plot draws

Each plot chooses its own layers, and a setup saves them. `layer lob`, `layer ellipses`, `layer vectors`, `layer trail`, `layer rings`, `layer labels`, `layer bands`, `layer loud` and `layer craft` (your own craft's rings home, on a carrier) turn each off or back on; `layer reach` turns on the reach rings, which start off. `layer reset` puts them back. `vectors 30` runs every vector for 30 minutes, and `vectors auto` lets the zoom choose. `W`, or `w` on a focused plot, opens the **plotting menu**: everything in this section, with a tick beside what is on, for pointing at.

### Shadows

`shadow s1` shades the part of the plot that S1 cannot see, behind charted bodies and, more softly, through thick dust. The title reads `SHADOW S1 ±53 km`. Use it to find the way out of a hunter's sight, or to keep a moon between you and an escort.

A shadow is drawn from **where your solution puts the contact**, not from where it is. Its uncertainty blurs the edge: dense hatching is hidden from everywhere the contact may be, and thin hatching only from part of that. A poor solution gives a vague shadow, and a bad solution gives a shadow in the wrong place. It needs a `FAIR` solution or a recent echo; `POOR` gives none. As a solution ages its edge spreads, and if the estimate goes, the title says `no estimate` and the shading stops.

`shadow own` shows what you yourself cannot see. Up to three shadows show at once, each with its own hatching (one in a narrow window). `shadow s1` again takes it off, and `shadow off` clears them. The shading lies on the plane through the plot's centre.

### The range band

A contact on a bearing alone has no range, but it does have a signal. If it is that faint, it can be no nearer than its quietest likely class would be, and no farther than its loudest. The plotter draws those two limits as a thick band on the bearing, and the contacts table reads `?200-900`, in km. A far limit past 10,000 km says only that she may be far off, so it reads `?1.0k+`. `info s1` gives the same limits in full.

**The `?` matters. The band is a limit, never a firing solution.** Fire control takes nothing from it, though the crew use it to check fire control's solutions and say when one lies past it (see [The computer, the crew and you](#the-computer-the-crew-and-you)), so it does not replace a leg change and TMA. It is wide because a ship may be drifting silent or burning hard, and the band has to allow for both. It rests on the classes the crew still allows, so it narrows as they make up their minds, and a wrong call gives a wrong band. It allows for jamming and masking in that beam, because your array measures those, but it knows of no dust on the path, which makes a near ship sound far. Use it to ask whether a contact can be a threat yet, and whether it deserves a leg change or a ping.

### Reach rings

`layer reach` draws what your torpedoes can do: a ring at the longest run of what you carry (`reach MK1 1,200 km`, in still space) and the arming circle (`arms 40 km`). Inside the arming circle a hit is a dud.

A contact with a position and a class call gets a dashed ring for each weapon that class carries, tagged `S2 torp ~1,200 km, crew's call`. **These are the crew's estimate.** The ring comes from the class they called, so a bad call gives a bad ring, and a contact they will not name gets none.

`info s1` gives your reach on a solved contact, per torpedo: `MK1 holds ~1,180 km / runs ~640 km`. The first is the farthest you can catch it from if it holds its course. The second is the same if it turns and runs at once, by the class called; with no class call the crew can't say. Shooting between the two means a warned target can outrun the shot.

### Loud marks

The plotter marks each place you were loud: a launch, a ping, a gun burst, a beam shot, a burn (`⊗ launch 12m`). A salvo is one mark, and a long burn is renewed every ten minutes. Around each mark a dotted ring grows at your own speed, so it always reaches the boat. It shows where you might be, to anyone who might have heard you at that spot. The last twelve are kept, fading over an hour; a narrow window shows only the latest.

**A mark says only what you did. It never says whether anyone heard.** Someone might have, and a hunter races to a datum. Use the marks to choose which way to run after a shot, and to see how long a loud moment stays dangerous. `layer loud` hides them and `loud clear` wipes them.

### Zones and tripwires

A zone is a line the crew watches for you. `zone alpha 500` sets a box 1,000 km across at the plot's centre. `zone` on its own takes up the pencil, and the next drag on the plan draws the box; the title says `BOX ALPHA`. A box is fixed to the map (`[f]`) and runs through every height. When a held contact's **estimate** comes inside, the crew calls `ZONE ALPHA: S2 inside, by the estimate.` and time drops to x1, as for any alert. So set an ambush, compress time and wait.

`guard port 270 330` sets a guard arc from 270 to 330 degrees clockwise off the bow. It turns with the boat (`[r]`), and needs only a bearing: the crew calls `GUARD PORT: S2 on the arc.`

A tripwire reads only the sensor picture. It will not call a ship you have not heard, or a box contact you hold on a bearing alone, and an estimate in the wrong place trips in the wrong place. A contact that leaves and comes back within five minutes is not called twice. Mines are not called.

`zones` lists them, `zone off alpha` takes one down, `zones clear` wipes them, and with the pencil up a click on a box's edge rubs it out. Zones go with the save. `overlay clear` wipes them with your other marks.

### The navigator's ruler

A submarine's navigator worked the chart with parallel rules, dividers and a protractor. The ruler does the same on the plots: the plan, the side view and the 3-D view. Lay it from one point to another and it reads the **true bearing**, the **distance**, and the **time to run it** at your present speed (`093° 2566 km 1h25`). With no way on, it reads no time.

- **With the pointer:** press **`R`** to take up the ruler, and the plot's title says `RULER`. Click a point, then the next, and each click lays a leg. A click on the last point again ends the chain. `R` again puts the ruler down. The ruler and the pencil take turns: `p` puts the ruler down.
- **On the conn:** `ruler s1` lays one from your boat to S1. `ruler us 045/500` runs from your boat to a point 500 km out on 045°. `ruler io europa` runs between two bodies; for a name of more than one word, put `to` between the points (`ruler us to Old Wreck`). `leg s2` walks the latest ruler on by another leg. `ruler` alone takes up the ruler for the pointer, as `R` does.

**A chain of legs** sums its distance and time (`total 3566 km 1h58`), as dividers walk off a route. At each joint the ruler reads the turn from one leg to the next (`87° stbd`), for planning a dogleg round a moon, a belt or a field.

**Its ends hold fast.** An end laid on your boat follows the boat. An end on a contact follows the boat's estimate of it, its solution or its last fix, and never the ship itself: with no estimate, that leg is not drawn until you have one again. An end on a body or a pencil note stays on it. Any other end is a point on the map, and stays there while the plot moves.

**Lines of position.** `lop 045` lays a line on 045° from where you are. `lop 045 10m` lays it from where you were 10 minutes ago, from your own track (it goes back two hours). `lop s1` lays one along S1's latest bearing, from where you were when you heard it; `lop s1 10m` takes its bearing from 10 minutes ago. Two lines cross at a **fix**, marked `✕ FIX` with its bearing and distance from you. Two bearings on a body from two of your positions fix it. Two bearings on a contact from two positions fix it only if it has not moved between them, as in TMA.

`rulers` reads out every ruler on the glass in the log, with any fix. `ruler off` takes off the latest, and `rulers clear` takes them all off the sheet in hand. The ruler measures only what is on the plot. It adds nothing the boat doesn't know, and nothing in the simulation reads it.

### Sheets of glass

The plot has a sheet of glass for each job: **nav** (the route, its rulers and legs, notes on hazards), **attack** (bearing lines, the firing ruler, the torpedo's track) and **search**. You may name more. The pencil and the ruler draw on the sheet in hand.

- `sheet attack` takes up the attack sheet, and puts the one in hand aside with its marks. `sheet mine` takes up a sheet you name, clean the first time. **`G`** takes up the next sheet.
- `sheet show nav` lays the nav sheet under the one in hand, so both show; the one under is fainter. `sheet hide nav` takes it away.
- `sheet clear` wipes the sheet in hand, and `sheet clear attack` wipes that one. The others keep their marks. `overlay clear` wipes every sheet.
- `sheet` alone names the sheet in hand, any laid under, and every sheet.

The plot's title names the sheet in hand, and any laid under it: `SHEET ATTACK+NAV`. A console setup brings up the sheet for its job: `nav` (`F4`) and `travel` the nav sheet, `sensors` and `science` the search sheet, and `weapons` the attack sheet. The others leave the sheet in hand alone. A setup you save keeps the sheet in hand. Every sheet goes with the save. Only the pencil's marks and rulers are on a sheet: bearing marks, zones and loud marks show on every sheet.

### Chart

The chart is the plotting table's paper copy: north up, **fixed to space**, and it remembers. It is not on screen at first; put it in a window with `v` (it pairs well with the main window, `z`).

- **Your whole track**, and `◆` where you are now.
- **The charted world:** bodies, nebulas (outlined in their kind's colour) and waypoints `⊕ WPT`. A waypoint is a place in your orders, with an exact bearing and range. Nothing is there to hear.
- **A mark `✕` for every contact you have had a position for**, from its latest FAIR or better solution or its latest ping echo, with a ring showing the 2σ uncertainty. The label gives its age in minutes (`S1 12m`), and marks fade as they age. A mark stays where you last knew the contact was, even after you lose it, until something newer moves it. That is how far old knowledge can be trusted.
- The frame grows to take in new marks but never scrolls or shrinks, so the marks stay put on screen while you move.
- **Every label sits beside its mark**, clear of the other labels, the symbols and your track. In a crowd a contact's label shortens to its number (`S4`).

### Passive waterfall

The output of your passive array, the newest second at the top, older seconds scrolling down. It has two settings (`o` with the other bearing displays, or `waterfall true` / `waterfall relative` on their own):

- **True** (the default): `000`, toward the galactic centre, in the middle, with `270` left, `090` right and `180` at both edges, the same layout as relative with north in place of the bow. Turning doesn't move a trace.
- **Relative:** the bow in the middle (`000`), port beam left (`P90`), starboard beam right (`S90`), and the baffles at both edges. A `✦` marks the galactic centre. This is what the hull array actually hears. Each row stays where it was when recorded, so when you turn, every trace shows a kink: old rows at the old heading, new rows at the new one. Real boats offer both; the true display is the array's output corrected for your own heading.

- **Background speckle** is hiss. It is always there.
- **A brighter vertical streak** is a ship. Faint ones come and go; a steady trace is a contact you can follow. You may spot a trace before the tracker calls it a contact.
- **A trace that slants** is a bearing that is changing.
- **A neutral grey band** is your baffles, the arc astern where your own engine deafens the array. It is grey on every theme, so it never reads as a contact. It moves when you turn.
- **Tinted hiss** is a nebula's bearing, in its kind's colour. Inside an ion cloud the speckle turns coarse: that is the static. A sharp **white-hot crack** that is gone in a second is a storm's discharge.
- **A white-hot mark** is a ping. **A whole row lighting up** is your own ping: you are deaf for that second.
- **Markers above the data** (`▼S1`) show held contacts. **Below the data**, `▲` is your heading and `△` your ordered heading.

### Sensor waterfalls

![The sensors station (F3) on an attack boat. The passive array fills the main window: a target's trace stands far above the dotted threshold line. The infrared waterfall beside it shows the same target by its heat.](screenshots/sensors-station.png)

**Real heat.** On engagements built on real physics (so far the *Thermal Range*), infrared is in real units. Your hull radiates whatever heat flows out of the heat sink, so an emptier sink means a colder, dimmer hull; engineering shows it as `hull 191 K (-82 °C) radiating 91 kW`. Radiators shed far more, but they are panels along your sides: from ahead, astern, above or below they are edge-on and hidden, so point your bow at the hunter. A burning drive's plume is seen across a system. A telescope's bearings are extraordinarily precise, thousandths of a degree.

**Real EF.** On the same engagements, the passive array is an **EF array**: it hears radio, in watts. A burning drive's plasma is about 500 W on a warship, the reactor about a watt, a boat on its battery milliwatts, a datalink a kilowatt. Your own vessel is the loudest thing your array hears: light the drive and you go deaf, and the arc astern is deaf. Ion clouds add static; dust doesn't block radio. In the contacts table the array's letter is `F`, and engineering shows your EF in watts (`EF 30 mW`). Each sensor's waterfall has its own colour: infrared warm, EM cyan, magnetic violet.

**Why nobody looks.** There is no lookout and no camera. Hulls are painted a non-reflective black, so a hull reflects almost no starlight, and what it does reflect is lost among every rock and grain of dust doing the same. A glint could be anything at any range, and light is the easiest thing to fake. So a ship is found by what it cannot help giving off: its heat, its EF and its magnetism. The telescopes see heat, not light.

**Magnetism.** Every engagement uses real magnetism. Warships carry magnetometers that feel a ship's magnetic field (shown in magenta), and civilian hulls carry crude ones. A ship's field comes from its reactor's coils and its steel hull: with the reactor running, a destroyer feels an attack boat at about 14 km; with it shut down, the coils' field all but goes, the hull's own field stays, and the destroyer must come within about 6 to 7 km. A navigational shield adds its own coils, and every hard turn or pitch adds up to as much again. It is the point-blank channel, and silence does not hide you from it.

**Searching the sky.** A telescope sees far only where it is pointed. It points at what you already hold: the few contacts most recently heard on any channel (yours, or shared by the group), and any sector it has been set to watch. The rest of the sky is covered by a wide survey a tenth as far. So being heard, on any channel, brings the telescope onto you; and a ship nobody is looking for can pass where it would be seen easily. The survey window shows what your telescope is on.

**Hiding in front of something bigger.** A moon or planet between you and a hunter blocks everything. A planet *behind* you, as the hunter sees it, hides you too: its warm disk drowns the few watts of a hull. A magnetised planet's field drowns magnetometers near it. Burning gives you away regardless.

**Pings and mines, for real.** On the same engagements a ping is a radar pulse. Its echo fades with the fourth power of range, so a destroyer's radar finds an attack boat only out to about 7,500 km, at an even chance a ping; the pulse itself is heard across the whole system. Echoes and pulses travel at light speed. Mines trip on real signatures: EF mines on a loud ship (an idling boat slips past). Magnetic mines trip on a hull's field on every engagement (see [Mines](#mines)).

**Transponders.** Civilian ships carry a beacon. A trader broadcasts it, and it is a dead giveaway: a warship hears it from millions of km, and it gives your name, class, position, course and speed every 30 seconds. Yours starts off; `transponder on` or `transponder off` on the conn (`xpdr` for short). The header shows `XPDR ON` while it broadcasts. Going dark where a beacon was is suspicious in itself.

**The rules of war.** A transponder says two things: "I'm here", and "I'm on this side". In friendly space every merchant broadcasts, as the law of the lanes requires. In a war zone a merchant sailing under escort may lawfully run dark, and many do. An unescorted merchant is bound to broadcast, but many run dark anyway, against the rules, and a dark merchant alone in a war zone is a lawful target. A merchant's beacon follows her situation: one that loses her escort may light up, and one that gains an escort may go dark. Your crew reports a change on any contact you hold (`COMMS  Beacon on S3.`, `COMMS  S3's beacon has gone dark.`). An enemy merchant's beacon names her side, so she reads as hostile (`◇`), and the crew remembers it after she goes dark. The debrief records whether each merchant you sank was broadcasting at the time. An enemy merchant is a lawful target whether she broadcasts or not. Sinking a friendly or neutral merchant who broadcasts honestly is a breach of the rules of war: the fleet reprimands you, your reputation suffers, and the breach costs you rank. A ship flying a false beacon has given up that protection, so sinking her is no breach. A pirate keeps no rules of war, so a captain sailing as one is never charged.

Career fights follow the same rules. A patrol fights in a war zone throughout, with no friendly space. Each merchant rolls once, as the fight begins, whether she runs dark, at the share for the era of the war's date. Escorted merchants run dark more often than unescorted ones, and more of them run dark as the war goes on. Every merchant you meet on patrol is the enemy's, so a broadcasting one reads as hostile, and sinking her is no breach.

**The radio.** Ships talk, and every call is a transmission. Your set guards channel 16, the calling and distress channel every ship listens to, and the working channels traders chat on. What it hears comes up in the log with the channel and a signal report, `RADIO 16  ... [weak but readable]`: the navy's prowords, strength then readability, from *loud and clear* through *good and readable*, *weak but readable* and *very weak but readable* to *very weak and intermittent*. The report says roughly how close the caller is. Calls follow radio procedure: the station called, then the caller, and OVER or OUT, never both. Channel 16 is for calling and distress only: a station that answers on 16 moves the traffic to a working channel ("Six eight. OVER.") and carries on there.

- **`hail s1`** calls a contact on 16 and asks who it is. A trader answers with her name and her kind of ship; a warship of a side not at war with you answers and asks your intentions; a raider may bluff under a borrowed name, or say nothing; an enemy warship says nothing at all. A trader running dark in a war zone keeps quiet.
- **Challenges.** A warship of a side not at war with you that holds your boat, with no beacon to name you, challenges you on 16. **`reply`** answers the last station that called you. Ignore two challenges and you are logged as suspect.
- **MAYDAY.** A trader hit and still afloat calls MAYDAY on 16, in full: her name three times, her position by the nearest charted mark, the nature of her distress and the persons on board. Warships don't.
- **Chatter.** Traders broadcasting their beacons pass the time on 68 and 72: weather in the fields, spare parts, the convoy's station keeping. Most of it is idle, and some of it is intelligence.

**A call gives you away, by its bearing.** While you transmit, the `EF` gauge reads `TX`, and any ESM set in range hears you on your true bearing, as it hears a datalink. It learns where you are only as it would from any other bearing, by working it up. A call's words carry far (about 10,000 km in clear space), but an enemy's ESM takes a bearing on it only much closer (about 3,000 km for a destroyer). Under radio silence you cannot transmit at all. The set is half duplex, like a ship's radio: while a call comes in the gauge reads `RX`, and a call that arrives while you are transmitting is lost (`Doubled ... Say again?`).

**Collisions.** Hitting a moon destroys you. Hitting another hull costs each ship by its mass: the lighter one takes the worse of it, in the ratio of their masses, so a ghost that touches a freighter comes off far the worse. Damage rises with the square of the closing speed. A ghost is wrecked by a closing speed around 100 m/s against a heavy hull, and at a km/s or more both ships are gone. The hits knock systems as a weapon's do. A hull that survives a crash may still tear: a breach in a pressure hull can run along the frames until the ship snaps in two. Any real crash carries at least a one-in-four chance of that, rising to certain at about a 38% loss of hull, so ramming is a last resort. It also earns nothing: a hull lost in a crash counts as neither sunk nor tonnage, and computer captains burn clear of any hull their solutions show coming close. The helm looks ahead. It calls a charted body on your present course 30 minutes and 5 minutes out (`HELM  Collision course: Mere in about 28 min, at 1.0 km/s.`), and a contact whose solution passes within 5 km of you. Each call drops time compression to x1. A call on a contact is only as good as your solution, and a ship you haven't worked out gets no call. A burn in progress isn't counted: the helm calls the course as it stands.

**Weapon arcs.** Every torpedo tube fires in a cone. An attack boat's tubes are fixed, three in the bow and one in the stern, each 30° either side of its axis, and heading and pitch both count. A destroyer or cruiser has trainable mounts on each side, 120° either way, and a raider or hunter faces forward. The `TUBES` line marks each tube `B`, `S`, `P` or `R`. Fire control picks the ready tube that bears best. You may fire outside the arc, as a WWII gyro angle allowed: the torpedo turns at 1° a second before its motor lights, so each degree costs a second of time and of burn, and the launch is 6 dB louder. At long range that can put the target out of reach, so aim the boat when you have time. Close in, a snap shot off the arc often beats a two-minute turn. `bear s1` turns the boat to bring the nearest tube on, which may be the lone stern tube, so use `steer s1` when a salvo wants the bow. Computer captains keep to the same arcs: they swing up to two minutes, then fire off the arc anyway.

**Warmth.** The cabin must stay warm. While there is power the heaters hold it at 20 °C; without it the cabin cools, and below about 10 °C the crew starts to slip. A flat battery is not a quiet win.

**Every window says what it shows.** The title names the sensor and what it senses (`PASSIVE ARRAY · EMISSIONS BY BEARING`, `INFRARED · HEAT BY BEARING`), and a legend on the bottom border says how to read it: which way the bearings run, that the newest second is at the top and how much history the window holds, and that brighter means stronger. The rose, plot, chart and contacts table carry legends too. A small window shows a short form, so bigger windows (or a bigger terminal) show more: a waterfall holds two seconds per row, so a short window holds only seconds of history.

**Layers** (`w` on a focused waterfall, again for the next) lay more over the picture, as a ham radio's panadapter sits over its waterfall:

1. **Spectrum and guides.** A strip on top shows the last few seconds as bars across bearing, with two reference lines: the **floor** (the background) and the **threshold** (the level at which the tracker can call a contact). A peak poking above the threshold is something you can hold. Guide lines run down the waterfall every 30°, your own heading is traced over time (a turn shows as a step), and time ticks run down the right edge.
2. **The other sensors** (warships): infrared, EM and magnetic returns tinted over the picture in their own colours, so one window shows which sensor sees what.
3. **The tracker's picks:** a dot at every bearing the tracker measured, over the raw trace.

**Estimated courses.** With a `FAIR` or `GOOD` solution on a moving contact, a small arrow at the end of its line points along the estimated course: dim on `FAIR`, bright on `GOOD`, fading once the contact is lost. It shows direction only, and it is the boat's estimate, so a wrong solution draws a wrong arrow.

**On the rose,** `w` hides or shows your own torpedoes in that window, for a crowded picture. `filter held`, `filter weapons`, `filter solved` (`FAIR` or better, or an echo) and `filter hostile` narrow what else that rose shows; give the order again to lift one, or `filter off` for them all. The title says `only held`. A filter hides a line and nothing more: the sensors keep working, the alarms still sound, and a contact called a torpedo stays on every rose. `W` opens the same choices as a menu. The title says when they are hidden, a setup remembers it, and enemy torpedoes always show.

**Tuning:** like tuning a receiver to one frequency and listening, put a cursor on one bearing and hear everything from that direction. Click inside a focused waterfall, nudge with `,` and `.` (2° a press), or type `tune 045`, `tune s1`, `tune t2` (along your own torpedo's track) or `tune off`. Every waterfall draws the cursor, and the bottom border reads out each sensor's level on that bearing and any contact within 4° of it, with its track symbol and its range once known: `TUNED 034° · array +33 dB · IR — · EM — · ✣S1 at 034° 1082 km ±3`. Bearings follow the window's mode (`S034` when relative). A narrow window trims the readout from the right.

What you get depends on the ship.

- **A civilian ship** has one display, **SENSORS · FUSED**: everything its sensors pick up, emissions and transmissions alike, in one waterfall. Its sensors are less sensitive, and it can't tell you which sensor heard what.
- **A warship** has a separate, more sensitive waterfall for each sensor it carries, each in its own window:
  - **PASSIVE:** the passive array, as above.
  - **INFRARED:** heat. Sharp bearings (about 1°). A boat glows when its radiators are out or its drive burns.
  - **EM INTERCEPT:** transmissions: a group's datalink, and the flash of guns and beams. Silent ships show nothing.
  - **MAGNETIC:** the magnetometer: hulls, powered or not, mines included. Broad, blurry bearings, and only at very short range.

  Each marks only the contacts its own sensor has heard in the last minute, so comparing them tells you how a contact gives itself away. The **sensors** station (`F3`) puts them side by side.

A station built for a warship, opened on a ship without those sensors, fills the spare windows with other instruments.

### Comms

The comms station's window: who can hear us, and who we are talking to. Its top is the **radio stack**, a row of sets with their channels and lamps, as on an aircraft's panel. Each figure is one the boat already knows.

```
┌ RADIO ───────────────────────────────────────────────────────────────┐
│COM 1  CH 16  156.800  DW ▸ CH 72  156.625                   RX ● TX ○│
│COM 2  CH 23  157.150  fleet net                                      │
│LINK   Pack · up · SILENT                                         TX ○│
│XPDR   [ 1251 ] ▸STBY  ON  ALT                                        │
│SIG    ▁▂▃▄▁▁▁ +19 dB · CH 72 · 00:54 ago         AIR 00:10 this watch│
└──────────────────────────────────────────────────────────────────────┘
```

- **COM 1:** your voice set. It guards channel 16, and dual-watches (`DW`) the working channel your last call was on, as a marine set does. Each channel shows its frequency from the band plan. The **RX** lamp lights green while a call comes in, and the **TX** lamp amber while you send one. The set is half duplex, so they never light together.
- **COM 2:** in a group, your second set guards the fleet net. Nothing passes on it yet.
- **LINK:** the datalink: your group's net, the link's health, and whether you keep radio silence (`SILENT`) or share. Its **TX** lamp lights in each second the link sends to the group.
- **XPDR:** your beacon, as a transponder. The four-digit code is your hull's own and never changes. The switch reads **STBY** while the beacon is off, and **ALT** while it broadcasts your name and position, as an aircraft's transponder adds its altitude (**ON** where beacons give a name and no position). A warship carries none.
- **SIG:** the last call your set took, as a signal meter: one bar for each 5 dB it came in over your receiver's floor, with its channel and how long ago.
- **AIR:** how long you have transmitted this watch, by any means: calls, the datalink, a linked torpedo's guidance. It is what an enemy's ESM could have heard of you. Watches turn every four hours on the galactic clock (00, 04, 08, 12, 16 and 20).
- **The group:** each ship with its class, bearing and range, from the datalink.
- **TRAFFIC:** the calls your set took or sent, each tagged with its channel; your orders; and every report about the group or the link. The newest is at the bottom.

A small window keeps the rows that matter most: COM 1 first, then the beacon (if you carry one), the link, the signal and the air time.

### Fire control

The weapons station's window answers one question: can I shoot, and if not, what must change? `setup weapons` opens it, `v` reaches it in any window, and `show fire` puts it in the focused one.

The top line gives the exploder setting, the seeker setting when it is not the standard (`SEEK 800 km NARROW`), the tubes and the magazine. Below that is a grid. Each row is a contact you hold, with the crew's call and the solution's quality. Each column is a weapon kind aboard. A cell reads `OK`, with the time to the meeting or the range, or it names what blocks the shot.

| Cell | Means |
|---|---|
| `OK 04:12` | Clear to fire. The torpedo meets the target in 4 min 12 s. |
| `OK 04:12 spr 3` | Clear, and a spread of three covers the solution's range error. It says nothing about how many hits the target takes. |
| `OK 48km` | Clear to fire a gun, at fire control's range. |
| `arming 38km` | The order will go, but the run is inside arming distance. It will not arm. |
| `hits Mere` | The order will go, but the run crosses a body on the way and the torpedo will strike it. `Enter` never offers this shot. |
| `rock North Sill` | The order will go, but the run crosses a charted rock field, which may stop the torpedo. See [Torpedoes and rock](#torpedoes-and-rock). |
| `seeker 800km` | A homing torpedo's seeker is set to switch on past the target, so it would run by deaf. `Enter` never offers this shot. See [The seeker setting](#the-seeker-setting). |
| `solution` | No `FAIR` solution, or for a gun no fresh echo either. |
| `reach` | The torpedo can't catch it on this run. |
| `arc 41°` | Tube is 41° off, and it can't turn in time. |
| `reload 42s`, `charging 42s` | Ready soon. |
| `not loaded` | This kind is aboard, but no tube holds it. |
| `none left`, `damaged` | As it says. |
| `range 900` | Beyond the gun's reach, at fire control's range. |

The chosen contact's row opens below the grid: one line per weapon, saying what would clear the block, such as `load 2 mk2h` or `Close 840 km`. On a contact whose class the crew has called, a clear line also gives their count of good hits to sink it, as an estimate. `,` and `.` change the row while this window has the focus, and `info s1` and `check s1` choose it too. `Enter` puts the first clear shot on the conn line, and you still give the order. If nothing is clear, it offers the first order that would clear a block. Clicking a row in the focused window chooses it, and clicking a cell puts its order on the conn line: the shot, or the order that clears the block, such as `load 2 mk2h` or `bear s1`.

**The torpedo room.** `i` turns the window to its detail: each tube and what it holds, then each torpedo in the magazine and on the racks, every one with her log of practice runs (`MK1  23 runs`, `MK1  1 run`). The crew load the freshest of each kind first. In a career the depot issues torpedoes already run; outside a career every torpedo reads 0 runs. See [Torpedo wear](#torpedo-wear). `i` again brings back the grid. While the torpedo room shows, `Enter` and `,` `.` leave the grid alone: `Enter` opens an empty conn line.

The grid uses the same checks as your orders, and only fire control's own figures, so a cell can be wrong exactly when your solution is. **A moon in the way.** When you fire, fire control checks the run to the aim point against the chart. If it passes through a charted body, the launch line says so: `The run crosses Mere: it will strike it.` A charted rock field gets its own warning: `The run crosses the North Sill: rock may stop it.` The grid shows both. A window too narrow for the grid shows the chosen contact alone, one line per weapon.

### Survey

The science station's window: how each thing gives itself away.

- **Each contact,** with what each sensor (passive array, infrared, EM, magnetic) last heard of it: the signal in dB and how long ago. Grey means more than a minute old; `·` means never.
- **SURROUNDINGS:** each cloud (inside it, or its bearing and the distance to its edge) and each body (bearing and distance to its surface). These are charted, so their true positions are fair to show.
- **WE SHOW:** your own signature on each channel: EF, infrared (amber when the radiators are out), your magnetic field (`MAG 6.0 kA·m²`, with `×1.8 manoeuvring` in amber while a turn adds to it), and whether you are transmitting.

### Status (your vessel)

**Naming your vessel.** The title screen draws a name for your vessel from its class's naming tradition: the attack boat after night birds, haulers after small birds, freighters after virtues and trades, tankers after rivers, destroyers after hawks and resolve. Press `r` for another, or `n` to type your own (Enter keeps it, Esc cancels). Choosing a different engagement draws a fresh name. An engagement that names its own vessel offers neither. A career lesson names the boat and sets the war itself, so its entry shows no name and none of the launch settings (difficulty, load, iron, conn, boat, war).

The window titled with your vessel's own name (`NIGHTJAR`, `MUDLARK`).

| Gauge | Meaning |
|---|---|
| `HDG` / `PTCH` | Heading and pitch of the nose, with the ordered values in amber while turning. |
| `CSE` / `VEL` | Course (direction of travel: true bearing, bearing off the bow, and climb) and speed. `CSE 043° P019 +02°` means she is sliding 19° to port of where she points. |
| `THR` | Main drive output, with the ordered value while it spools. With flight assist on, `SPD` shows the speed assist is holding instead. |
| `EF` | How much you are radiating right now: watts on the real-physics engagements, a level in dB on the others. An amber `TX` beside it means you are transmitting this second: a radio call, a datalink report, or a linked torpedo's guidance. A green `RX` means your radio is taking a call. On the engagements that read in dB the link is a radio signal of its own, which the level leaves out, and the enemy's ESM hears it on your true bearing. |
| `ACT` | Active array: `ready`, seconds to recharge, or `none`. |
| `ALT` | Altitude above the nearest body and how fast it is changing. Amber if you would hit within ten minutes, red within two. |
| `TUBES` | Each tube and what is in it (`1:MK1`), and any kind ordered next (`1:MK1>MK2H`). Green when ready (the plain value colour in a single-hue theme). The tube its room's crew is loading is amber, with the turning wheel and the time left (`2B:-- ⠋8:40`); a tube waiting its turn reads `wait`. Dim when empty. What is left in the magazine (`MK1×6`) shows beside `THR`, or on its own `STOCK` row in a narrow panel. Shown only if you have tubes. |
| `DECK` | **On a carrier, in place of the tubes,** and above `SIG`, so a short window keeps it. Each kind of craft and how many are ready (`F×6` fighters, `S×4` strike fighters, green), with those being refuelled and rearmed after a `+` in amber; `Q2` launches waiting; and `AIR 3`, craft aloft. Below it, as the window has room, a row for each craft: its short name (`Picket 1`, red when it can no longer make the deck in time), its mission, its Δv and endurance bars, and its range from you. `show deck` opens the full window. |
| `MINES` | Mines left to lay, by kind. |
| `GUNS` | Gauss gun slugs left (`GAUSS×200`) and seconds to recharge; the beam, `ready` or `charging 42s` (with several, `1/2 42s`: charged, and the wait for the next). |
| `CM` | Countermeasures left: static buoys (`BUOY`), decoys (`DCY`) and jammer drones (`JAM`), with the launcher's reload in seconds. |
| `EW` | Electronic warfare: your jammer (`ON 045` or `off`) if fitted, and the strongest jamming you hear (`JAMMED 012 +48 dB`). Amber while jammed; red once the displays break up. |
| `POS` | Your position in the fleet frame, in km. |
| `SIG` | **Stealth:** what you're giving away on each channel, as a bar from the quietest your boat can be to the loudest, green, amber, red. `EF` (electric field: what the passive array hears), `IR` heat, `MAG` magnetism. Every real manoeuvre costs magnetism: turning, pitching or flight-assist corrections beyond 10% of the boat's ability drive the attitude motors, up to double the field at full rate. Small movements are free. |
| `BATT` | **Vitals, in the right-hand column** (below the other gauges in a narrow window). The battery's charge, and which way it is going. Draining, an amber `▼` and how long until it is flat (`62% ▼ 41m`). Charging, a green `▲ charging`. Topped up, it reads `FULL`. Holding steady, a dim time: how long the charge would carry the present load alone. The bar is amber under 30% and red under 15%. |
| `SINK` | How full the heat sink is, as a gauge running blue to red and a percent. Amber over 70%, red over 90% or overheating. |
| `FUEL` | Reactor fuel left, to a tenth of a percent, and, while the reactor burns it, an amber `▼` and how long it lasts at this burn, in days, hours or minutes (`99.8% ▼ 41d`). Amber under 10%, red under 2%, `DRY` at zero. With Nerd Font icons on, the label carries a fuel cell. Propellant moves the boat; fuel runs the reactor and generator. Engineering shows how long it lasts at this burn. |
| `PROP` | Propellant left. Amber under 25%, red under 10%. At zero the engineer calls it, and the helm answers any burn order with `Tanks dry`. |
| `AIR` | Carbon dioxide and oxygen, and while the air is getting worse, how long the crew has before it kills them (`· 57m`). Each gas has its own colour. `CO₂` turns amber over 1% and red over 4%; `O₂` turns amber under 19% and red under 16%. |
| `CABIN` | Cabin temperature. Amber under 16 °C, red under 10 °C. |
| `CREW` | How tired the crew is: `fresh`, a percentage worn, then `tired` (amber, from half) and `spent` (red). A tired crew hears, reloads, repairs and answers worse, down to half as well when spent, on top of bad air (the worse of the two counts). The log says once when they are tired and once when they are spent. |
| `ACCEL` | What the crew feels, in g, and the peak this voyage (`pk`). Thrust and flight assist count; gravity doesn't, because a ship in free fall floats in it. Turning under assist adds g as the thrusters bend your course. Amber over 80% of the crew's limit (1.5 g where the class sets none), red over it. |
| `TURN` | How fast the nose turns, in degrees a second, heading or pitch, whichever is faster. Amber once the turn is fast enough to show on MAG (a tenth of the boat's top rate); white below that, where turning is quiet. `CSE` after it is how fast your course itself swings, in degrees a minute: what thrust and gravity are doing to your track. `turn status` reads both, and the quiet limit. |
| `SENS` | Whether the sensors have power. `OFF: deaf` means you hear nothing. |

**A gauge can break.** Damage, or a quirk of the hull, can break the instrument behind a gauge. A dead gauge says so: its label is struck through and the reading says `× NO DATA`. A stuck gauge keeps showing its last reading, and a wrong one drifts further from the truth. Neither gives any sign. Cross-check them against the crew and against the engineering window, which has its own meters. See [Broken gauges](#broken-gauges).

### Contacts

| Column | Meaning |
|---|---|
| `ID` | Contact designation, `S1`, `S2`…, after its track symbol (`○` friendly, `◇` hostile, `□` neutral, `✣` unknown; a fighter's is the top half: `◠ ⋀ ⊓ ⌒`). |
| `TYPE` | The crew's best guess: `unknown`, then `civilian?` or `military?`, then a class (see [Identifying a contact](#identifying-a-contact)). |
| `HEAR` | Which sensors heard it in the last minute. `P`: the passive array, hearing what a ship's drive and machinery radiate (there is no sound in space; on most engagements this is a stand-in for the EF a ship gives off, measured in dB). `F`: on the real-physics engagements, the same array as an EF array, hearing radio, in place of `P`. `I`: infrared, its heat. `E`: EM, its transmissions. `M`: magnetic. `X`: its transponder beacon is broadcasting, so it is announcing itself; a contact without `X` is one you found. The window's bottom border is the key. |
| `BRG` / `EL` | Last bearing and elevation. With relative bearings on (`o`), the column reads `REL`: `S045` is 45° to starboard of the bow, `P135` is 135° to port, `000` dead ahead, `180` dead astern. The letters keep a relative bearing from being mistaken for a true one: helm orders and `CSE` are always true. |
| `SIG` | How far above your detection threshold the last signal was, in dB. Near zero is faint. |
| `RANGE km` | Estimated range and uncertainty, from TMA or a ping echo, worked forward to now. `?200-900` is a [range band](#the-range-band): limits from a faint signal and the crew's class calls, never a solution. Blank when unknown. `~` means carried forward by dead reckoning from an older solution, its uncertainty growing. |
| `CSE` / `SPD` | Estimated course and speed, from TMA. |
| `TMA` | Solution quality: `----` none, `POOR`, `FAIR`, `GOOD`, or `FIX` for a recent ping echo. `FAIR?` or `GOOD?` is fire control's grade where the crew rate the solution lower: see [The computer, the crew and you](#the-computer-the-crew-and-you). |
| `STAT` | `HELD` while heard recently; `LOST` after a minute of silence; `SUNK?` when the crew calls it sunk; `TORP` for a torpedo, in red; `MINE` for a mine. |
| `AGE` | Time since last heard. |
| `DZ km` | Height above (`+`) or below (`-`) you, once range is known. Every range on the console is a straight line in 3-D, so a contact far above you is farther than its plan-view distance. |

The fire-control computer keeps working after a contact goes quiet: range, and a lost contact's bearing, come from its last solution carried forward to now. Their colour says how old that solution is: the track's own colour within a minute, amber up to ten minutes, faint after that.

**Your own torpedoes** are listed below the contacts as `T1`, `T2`… (by tube), in your own colour. Torpedoes are fire-and-forget: a guidance link is a transmitter, and a quiet boat will not run one. So these numbers are fire control's **dead reckoning** from the launch (`est` in the `HEAR` column), not truth: a homing torpedo that turns on its own is not where they say. A **linked** torpedo (`link`, the cruiser's Mk 3) reports its true position and takes course corrections, at the price of the launcher transmitting for the whole run, on a beam that points at the target. The columns: bearing, range in km, course, speed relative to you, `BURN` or `COAST`, `SAFE` or `ARMD` (armed), and in the last column the time to the meeting point fire control aimed it at. A practice shot whose run is over is listed faint, as `shot adrift`: `bcn` in the `HEAR` column, for her beacon, and `DRIFT` where a running torpedo shows `BURN` or `COAST`.

### Log

Timestamped reports in plain language: new contacts, transients, solutions, pings, and anything else the boat wants you to know. Time compression drops to x1 whenever something important happens.

**Crew reports.** The crew says what the gauges show, each station in its own voice, so you can run the boat from the console. Engineering calls the battery as it passes 50%, 30%, 15% and 5%, the heat sink at 50%, 70% and 90%, fuel at 50% and 25%, and a channel turning loud on the `SIG` bars. The helm calls propellant at 50%, 25% and 10%; when what is left could barely stop the boat (less than twice her speed in Δv), and when it no longer can, since a boat must be at rest to warp out (the helm reckons with a little kept back, as a crew that wants to get home does, so that call comes with a margin still in the tanks); `Steady on 045°` when a turn is done, the drive answering an order, and acceleration near or past the crew's limit. Navigation calls your height as you sink into a well. Damage control calls the hull after a hit. The chief of the boat calls the cabin cooling. Weapons calls a tube loaded, the gauss and the beam ready, and a torpedo's last minute and last ten seconds to run. Sensors call a contact's bearing once it has moved 10°, a torpedo's bearing every 30 seconds while it runs, the pinger ready, and jamming. A reading is called once as it crosses a line, and again only once it has come well back, and no report repeats within 30 seconds. Choose how much you hear with `reports`: `reports normal` (the default) gives what needs a decision and what is urgent; `reports quiet` keeps only the urgent; `reports all` adds the routine. The choice is kept for the next exercise.

Every gauge also has an answer at the console. Type its name: `battery`, `heat`, `fuel`, `prop`, `hull`, `air`, `cabin`, `crew`, `helm` (heading, course, speed and drive), `pos`, `alt`, `accel`, `tubes`, `guns`, `pinger`, `cm` or `sig`. The station answers from its own instruments, not from the gauge.

The panel shows the newest entries, and the wheel scrolls it back. In a window at least 44 columns wide and 7 rows high, a row of toggles runs along its top: `ORD` orders, `CON` contacts, `FC` fire control, `ENG` engineering, `DC` damage, `NAV` navigation, `COM` comms and `SYS` the trainer's own notes. Click one to hide or show that kind, or give the order `filter eng`. With `filter s1`, a wide log window gives S1 a column of its own beside all traffic. `filter off` takes the contact away.

**Press `l` to review the whole log**: it opens full screen and pauses the exercise.

| Key | Does |
|---|---|
| `↑` `↓` | Move the cursor one line |
| `PgUp` `PgDn`, `Shift+↑` `↓`, `b` `space` | Move a page |
| `Home` `End`, `g` `G` | The oldest and newest entries |
| `1` to `8` | Hide or show a kind |
| `f` | Show only one contact: type `s3`, or nothing for all |
| `c` | Show only the contact on this line, or all again |
| `/` | Search as you type. `Enter` keeps it and `Esc` drops it |
| `0` | Clear every filter |
| `Enter` | Open the line: where you were, which sensor held the contact, its signal, its range and solution, and the crew's call at that moment |
| `p` | Close the log and centre the plot on where you were, with a brief `✕` mark. `c` brings the plot home |
| `l` `Esc` | Close |

The mouse works here too: click a toggle or a word along the foot, click a line to put the cursor on it, and click it again to open it. A line that names a contact counts as being about it, so `Ping. Echoes: S1...; S2...` shows under both.

Entries are coloured by what they say: your orders, your own `log` lines (bold), contacts, pings, transients and system notes. Lines that night orders keep off the running log show here, faint.

**After the fight.** Press `l` in the replay for the same log over the whole encounter, and every filter works. It opens at the replay's moment. `p` closes it and moves the replay to the moment of that line, so you can read what the boat knew and then see what was true. The filter stays for the next time you open it.

### Night orders

Night orders say what wakes you. Press `N`, choose it from the menu, or give the order `night`. The page lists each kind of event with four levels:

| Level | What happens |
|---|---|
| `record` | The line goes in the record for later review, and stays off the running log |
| `log` | A line in the log. Time runs on |
| `x1` | Time compression drops to x1, and a notice shows if the log is not on screen |
| `pause` | Time compression drops to x1 and the clock stops. In iron mode a pause reads as x1 and spends none of your pauses |

The trainer starts on the **Standing** orders. If you never open this page, nothing changes. `↑` `↓` choose a row, `←` `→` change it, and `Enter` steps round. A click on a level sets it. Keys `1` to `4` choose a preset, and the header shows it beside the time rate unless it is Standing:

| Preset | For |
|---|---|
| **Standing** | The trainer's defaults |
| **Transit** | Long legs through traffic. New contacts log without slowing time. What you already hold stays off the running log. A ping still drops to x1 |
| **Patrol** | The first report of anything drops to x1. Regained contacts, transients and clouds only log |
| **Ambush** | A long wait. A new contact, a transient or a ping stops the clock |

Lower alarms save real time, and they delay your answer to a new contact. That is the trade.

**Three kinds always reach you.** A torpedo or detonation, a hit on your boat and the end of the engagement always drop to x1. You can raise them to `pause`, but you can't lower them. Night orders change only what reaches you. Your crew's work and your alarm bell stay the same.

**Your own calls** sit at the foot of the page. The crew calls you once when each comes due:

| Order | Calls you |
|---|---|
| `call me battery 30` | When the battery falls under 30% (again once it has recovered 5%) |
| `call me at 02:00` | At that time on the `T+` clock |
| `call me waypoint`, `call me waypoint 20000` | Within 5,000 km, or the distance you give, of a charted waypoint |
| `call me off` | Drops all three (`x` on the page) |

### Standing orders

Standing orders say what the crew does before you can answer. Press `S`, choose it from the menu, or give the order `standing`. Every row starts on `hold`, and a boat on `hold` does nothing by itself. If you never open this page, nothing changes.

| Row | Choices | What you trade |
|---|---|---|
| Torpedo called: lure | `hold`, `noisemaker`, `decoy` | One from the rack at the first call. A far torpedo can outlast it |
| Torpedo called: helm | `hold`, `burn` | The helm puts the torpedo on the beam and burns for 45 seconds. Everyone sees the drive, and your own plan is gone |
| Torpedo called: array | `hold`, `ping` | One ping ranges the torpedo. It tells everyone where you are |
| Torpedo called: jammer | `hold`, `jam` | Jamming starts on the torpedo, and everyone can hear exactly where you are until you order `jam off` |
| Ping heard | `hold`, `coast`, `silent` | A ping may not have found you. `coast` cuts the burn. `silent` shuts the reactor down too, and a restart takes time and is heard |
| Battery low, plant held | `hold`, `normal` | Under 20% with the reactor held or capped, the plant goes back on automatic. The start is heard. On `hold` you stay hidden and may go flat |

`↑` `↓` choose a row, `←` `→` change it, and `Enter` steps round. A click on a choice sets it. `x` puts every row back on `hold`. The order `standing lure decoy` sets a row, and `standing off` clears the sheet. The header shows `STANDING 2` while two rows are off `hold`. A row reads `not fitted` if your boat lacks the gear.

**The crew is a drill, not a tactician.** It answers about 20 seconds after the call on an average crew, sooner at Red and later on a slow one. It answers one torpedo call or one ping in two minutes, so the second torpedo of a salvo is yours. It does not know how far off the torpedo is, or whether that ping found you. It can't weigh any of that, and you can.

### The captain's own call

The `TYPE` column is the crew's opinion, and the crew can be wrong. These orders record yours beside it. They change nothing the crew or fire control does.

| Order | Does |
|---|---|
| `call s3 hostile`, `neutral`, `friendly`, `off` | Your own reading of the contact |
| `name s3 fat one`, `name s3` | Your own name for it, or none |
| `ignore s3`, `ignore s3 off` | Set it aside: it dims in the table and on the plot, and `f` and `g` pass over it |
| `pin s3` | A note on the overlay where the contact is now, with its name and the time |

Your view shows in a `CAPT` column when the contacts table is wide, and after the `TYPE` when it is not. The vessel window shows it too. **An ignored contact's alarms still sound.** Setting something aside is a real risk, so a torpedo from it reaches you as any other does. A torpedo itself never dims.

### A crew of friends

Ghost Boat has one captain at one keyboard, but no boat was ever run by one person. Gather round one screen with friends, the way people once crowded round a single computer to play together, and share the boat out:

- **The captain** has the keys and gives the orders. Only the captain's word moves the boat.
- **Sensors** watch the waterfalls and call what they hear: a new trace, a bearing drifting, a ping.
- **The navigator** keeps the plot and the chart, measures with the ruler, and calls the turns.
- **Weapons** watch fire control and the tubes, and say when a solution is good enough to shoot.

Call your reports out loud, as a real crew does, and let the captain decide: the computer reports, the crew makes its call, and the captain decides, around the screen as in the game. On a long career, take the captain's seat in turns, a patrol each. The war diary keeps one record of the whole war, and each captain can add a note to mark their patrol. In iron mode nobody can pause, so the crew earns its keep.

It works at any age, and in a classroom too: two to a screen, one at the keys as captain and one as navigator, swapping seats each patrol. Working out an intercept or a range from bearings goes better argued aloud with a partner than done alone.

### Signing in

The trainer signs you in each time you power up the console. It opens a secure line, checks your clearance and greets you, with your hours on the trainer as an officer's record. This takes under two seconds, and any key or click skips it. The sequence does not run for a replay. Over a metered link it is one still frame, held for a second.

**Your first time.** Type your last name, `Enter`, then your first name, `Enter`. The first name may be left blank. The record keeps both, as `Hale, Anthony`. The trainer and the crew address you by your last name alone: the first name appears only on the captains page and your signature. From then on the trainer greets you by the time on your own clock (good morning, good afternoon, good evening, and less formally in the small hours) and asks nothing. `Esc` on an empty name goes straight to the title screen, with nobody signed in, and the trainer asks again next time.

**Form FP-1138.** After the name, the Fleet Personnel Office offers its application. `↑`/`↓` move between fields, `←`/`→` change an answer, and `Enter` moves on. Any field may stay "Not stated". `Esc` skips the rest of the form, and your name stands alone. Choose a career stream, then answer four questions. Page 2 is the declaration: `Enter` signs it with your name, and the form comes back stamped ACCEPTED, with a score slip.

**The score slip.** The Navy Aptitude Assessment Test (NAAT) gives a line score out of 99 for sensors, navigation, engineering and tactics, a percentile, and a recommended career path. The recommendation is advice: the career you stated stands, and `c` on the captains page changes it. Your answers lean the scores and chance moves them. The office then reports what you tested as, from those scores and more chance, so the result may surprise you. It is rolled once and stays on your record. A form you skipped can be filed later with `f` on the captains page. The form also leans the four attributes of a captain's sheet: nerve, cunning, aggression and seamanship. All of this is a service record. None of it changes how a boat handles or how an exercise is scored.

**Captains.** Several captains can share one trainer. Each has a name, a career, a level of difficulty, hours, records and saved exercises of their own. With one captain on the roster, the trainer signs that captain in. With several, you choose. `C` on the title screen opens the captains page at any time:

| Key | Does |
|---|---|
| `↑` `↓` | Choose a captain. The service record is shown below the list |
| `Enter` | Sign in as that captain |
| `a` | Always log in as this captain. Sign-in then skips the choice and goes straight to the greeting. Press it again to turn it off, or on another captain to move it |
| `n` | A new captain |
| `r` | Rename this captain: the last name, `Enter`, the first name, `Enter`. The roster, the records and the saves take the new name, so rank, hours and record carry over; replays keep the name they were made under. A name another captain holds is refused |
| `c` | Change this captain's career |
| `f` | File Form FP-1138, if this captain has not |
| `s` | Turn the sign-in sequence on or off |
| `Esc` | Back, with no change of captain |

The list and these keys can be clicked as well. To skip sign-in for one run, start the trainer with `--no-signin`: it keeps the last captain and asks nothing.

**Rank.** Every captain starts at the foot of their career's ladder. A promotion takes two things: credit for challenges won, and hours played. Each challenge counts once, at the best level you have won it at. It is worth its rating times its level: Routine 1, Testing 2, Demanding 3, Hard 4 and Severe 5, times 1 at Standard, 1.5 at Hard and 2 at Nightmare. So a Severe challenge won at Nightmare is worth 10, and winning it again adds nothing. A war campaign engagement is one of the challenges, and counts as that challenge. A win with no rating counts as Routine. Lessons don't count.

Hours played count only while an exercise runs: not while it is paused, as it is while you read the manual outside iron mode, and not once it is over, unless you play on. Time on the title screen and its pages never counts. Of any stretch with no key pressed, at most 10 minutes count; a mouse click counts as a key. A career's time counts toward the career's own rank, not this one.

| Navy | Merchant service | Privateer | Credit | Hours played |
|---|---|---|---|---|
| Ensign | Third Mate | Prize Crew | 0 | 0 |
| Sub-Lieutenant | Second Mate | Gunner | 5 | 1 |
| Lieutenant | First Mate | Quartermaster | 15 | 3 |
| Lieutenant Commander | Skipper | Sailing Master | 30 | 6 |
| Commander | Master | Captain | 55 | 12 |
| Captain | | | 90 | 20 |
| Commodore | Commodore Master | Commodore of the Free Company | 140 | 35 |

Each breach of the rules of war takes 10 off your credit, which never falls below 0. A breach can reduce you in rank, and the service record shows a reputation, from clean through noted and questioned to notorious. A rank you already hold is yours until the ladder passes it: only a breach takes it away. Rank is a record of experience and conduct: it changes nothing in an exercise. The trainer shows it beside your name and announces a promotion when you next reach the console. The enemy wears the same ranks, and theirs say roughly how experienced they are.

**Awards.** The fleet also notices outstanding work, once for each award, and lists them on your service record. Like rank, an award changes nothing in an exercise. Some are plain about what earns them and some are not; you will find out.

**Careers.** Captains are listed by career: Military, Civilian or Pirate. A career is a label on your record for now, and every career sails the war campaign. Your progress through it is your own.

**Time on the trainer.** Hours count the time spent in exercises, by the clock on the wall, including time paused. Replays and the title screen do not count. **Your first captain inherits** everything the trainer held before it had captains: past records and saved exercises. Replays are shared by all captains. Your roster is kept in `roster.ron`, beside your records.

### Title screen

The **Fleet Tactical Trainer** opens on its main menu when you power up the console, after the sign-in. `↑`/`↓` (or `k`/`j`) choose an item, `Enter` opens it, `Esc` or `q` comes back from any page to the menu, `?` opens this manual, and `q` on the menu quits. The menu holds, in order:

- **New Game:** a career: one captain, one boat and one war, in patrols from base. `Enter` opens the commission, which shows the captain, the first boat, the war's code and its first year, and the iron mode. `i` steps the iron mode, `Enter` commissions and `Esc` goes back. Each captain has one career at a time: while one is in progress, New Game does not start another and says so. Retiring at base ends it. Continue opens it when it is your newest save still in play; otherwise **Saved Exercises** does. A saved career always opens under the captain it belongs to. With nobody signed in, only a career kept under no captain's name is listed, so another captain's career neither stops New Game nor opens with Continue. Outside iron mode the career is saved on sailing, at each drop into a fight and each return from one, every 5 minutes in a fight, on coming home and on leaving; in iron mode it has one save, written on leaving and used up by continuing. A career that ends goes to the records once its ending is saved; if the game stops between the two, the title puts it there the next time it opens. Continue opens a career where it was left: at base, on the patrol chart or mid-fight. At sea the career runs on the patrol chart: see [The career](#22-the-career).
  - **The base** shows command's orders, or the two it offers, with the date it issued them, and anyone who comes aboard for them; the boat as fitted out with its fuel, food and crew; the record: patrols sailed and passed, tonnage, rank, standing and time in service; the crew's news since the boat came in; and as much of command's briefing as fits. Its orders are **Sail**, which fits out the boat and puts to sea on those orders; **Briefing**, the briefing in full; **War diary**, the war so far (see [The war diary](#the-war-diary)); **Crew**, the crew screen; **Shore leave**; and **Retire**, which asks first (`y` retires) and then ends the career with its record banked. While command offers two orders, **Order 1** and **Order 2** keep one, and the boat cannot sail until one is kept. While command has taken the exec, or offers a newer boat, the base also lists the choices that answer it (see [The crew](#the-crew)), and the boat cannot sail until a new exec is chosen; a refusal to sail says why. `↑`/`↓` choose an order, `Enter` gives it, `:` opens a conn line for the typed orders at base (see [Orders and the briefing](#orders-and-the-briefing)), where `↑` brings back earlier orders, those typed on the chart too, and `q` saves and goes back to the title. `Esc` never leaves the base. With the mouse on, a click on an order gives it, a click on a key at the foot presses it, and the wheel moves. The orders are drawn once a visit, so leaving and coming back does not change them.
  - **The briefing** is command's word at base, dated: the orders, the news with each item's age when it reached base, the mess's talk, the crew's mail, and the chart overlays handed over, each with its source and date. `↑`/`↓` scroll it, and `q` goes back to base.
  - **The patrol report** follows each patrol home, dated the day the boat came in: the order and command's verdict on it, command's verdict on the patrol with its reason, whether the boat reached its place and how long it kept station, what it sank and what command learned each ship carried, what any search found, who came home aboard, any reason it left station early, news that settled an earlier mission, the tonnage banked, the change in standing and rank, and what became of the crew. `↑`/`↓` scroll it, and `Enter` goes back to base.
  - **The record** comes up when a career ends: how it ended, the figures, each patrol's order and command's verdict on it, every boat the captain commanded with her history, and everyone who served. `↑`/`↓` scroll it, and `q` goes back to the title.
  - A career that ends (lost, relieved, retired or at the war's end) is written once to `careers.tsv` beside the records, and its war diary to the `diaries` folder. Then its save is removed, in iron mode or not: a finished war keeps its record and its diary, not a save to continue.
- **Continue:** your newest saved exercise that is still in play, paused where you left off. A finished game, such as the snapshot `s` keeps at the end, is skipped; it stays on the saves and replays page. Continue is listed only when there is a game to continue. Its details show beside it; `x` opens the saves and replays page at its delete question (below).
- **Training:** the lessons, under CIVILIAN, NAVAL and GHOST, in teaching order. See [Tutorials](#tutorials).
- **Scenarios:** the challenges, under the kind of boat you sail: CIVILIAN, NAVAL or PRIVATEER.
- **War Campaign:** the war in order: nine engagements in three eras, each opened by winning the one before. See [The war campaign](#21-the-war-campaign).
- **Saved Exercises:** every save and kept replay (below).
- **War diaries:** the diary of each war, as last written, newest first, each shown by its heading: the captain, the boat, the war's dates, In service or how it ended, and the tonnage. A war ends by writing its diary, and `w` in the diary writes it at any time. `Enter` reads one, and `Esc` goes back. See [The war diary](#the-war-diary).
- **Options:** the theme, colours (24-bit or 256), effects, sound, CRT scanlines, Nerd Font icons, how much the crew reports, whether `q` asks before leaving, **Wild Spaceland**, and the captain and sign-in. `↑`/`↓` choose a row; `→` or `Enter` steps it on and `←` steps it back. The keys `t` theme, `c` colours, `e` effects, `m` sound, `s` scanlines and `f` icons work on every page, and `C` opens the captains page. Settings carry into the exercise and back, and are kept for the next launch. Each captain keeps their own, so two people sharing a machine each find their own console. A captain signing in for the first time since settings became each captain's own takes the machine's settings as they stood. With nobody signed in (`--no-signin`), the machine's settings apply: the last ones any captain kept. Over SSH or mosh the effects start off whatever was kept, and turning them on there does not change what is kept. A privateer signs in to Letter of Marque until choosing another theme, which is then kept.
- **Manual** and **Quit.**

![The main menu, with Training chosen: its lessons by track, and how many are won.](screenshots/title.png)

![The Scenarios page: the challenges by kind of boat, easiest first, each with its rating.](screenshots/scenarios.png)

**Training, Scenarios and War Campaign** each list their exercises with the chosen one's briefing and best result. `↑`/`↓` choose one, and `Enter` begins it (or, for an exercise that offers a choice of ships, opens its setup page). A locked campaign step says which win opens it. Under the list are the choices for the next launch: `d` difficulty, `l` [the load to sail with](#choosing-the-load-before-sailing), `i` iron mode, `o` [the bare conn](#the-bare-conn), `b` the boat and `w` the war.

**Launch codes.** Each launch is drawn fresh: the crews and captains you meet, the fuel and food aboard, who is out there and where, the moons and clouds of a scenario that places them fresh, how the layout is turned, and the date. One draw decides all of them, and its code is the serial on the patrol orders: twelve characters in three groups of four, such as `7F3A-91C2-K4M0`. A career's war has a code of the same kind, shown on the New Game page as its war code. It shows dim at the right of the briefing's heading, on the first line of the log (`ORDERS  Patrol orders, serial 7F3A-91C2-K4M0.`) and on the saves and replays page. A new serial each launch means the run was set for you, not played from a script. To play a launch again, or to quote one in a report, start the trainer with the code and the scenario file:

```
ghostboat --launch 7F3A-91C2-K4M0 data/scenarios/run_home.ron
```

The code fixes what is drawn, not what you choose. From the command line the scenario starts as a free engagement with its default choices: Standard, the first ships offered, and no war set. A code uses the digits and the letters other than I, L, O and U, so no character looks like another; case and the hyphen don't matter. The trainer reads a code by its own version's rules, and the log says so: a code from another version may set a different exercise.

#### The bare conn

`o` on a launch page sets the conn **bare**. An exercise at the bare conn has no gauges, rose, plot or waterfall: the screen is the header, the goals and the log, with the conn line under it. You run the boat by orders, by `status` reports from each system (`reactor status`, `battery status`, `hull status`, `helm status` and the rest), by **`contacts`**, which has the watch read out every contact held (bearing, the solution if there is one, and the crew's call), and by what the watch reports. Window orders such as `info` and `show` are refused. Set **Crew reports** to `all` on the Options page for a talkative watch. The header says `BARE CONN`. Your record marks a bare-conn result, a bare win ranks above a dressed one, and the fleet notices. A resumed exercise keeps the conn it was started with.

The misconception to drop: the bare conn is not a harder sim. The ships, sensors and odds are the same. Only what you are shown changes, so it is a test of how well you know the boat.

**Saves and replays.** Saved Exercises, or `a` on any page of the title screen, opens a page listing every saved exercise and kept replay together, newest first: its name, scenario, date (UTC), level, outcome, for a replay the verdict band, and the launch's serial ([launch codes](#title-screen)). A save or replay from before launch codes shows no serial. (`m` is the sound setting, so the page is on `a`.) `↑`/`↓` choose, `Enter` continues a save or watches a replay, and `Esc` goes back.

- `r` renames a save you named, or a replay. A replay keeps its date and outcome in its file name, so it still lists and plays; an autosave or the iron save can't be renamed.
- `k` keeps a replay, so it is never pruned (the trainer keeps the newest 50 otherwise, and a kept one isn't counted among them); `k` again lets it go.
- `d` deletes, and always asks first: only `y` does it. It removes only the trainer's own save and replay files. An iron-mode save can't be deleted while its engagement is still running: continue it and finish the fight. One that won't read can't be finished, so it can be deleted.
- `/` filters the list by scenario (`Enter` keeps the filter, `Esc` clears it).
- A save or replay file that won't read (a corrupt file, half of a save, or a save from an older version) is listed as unreadable, and can still be deleted. Continuing one from the title says "Can't read that save."

- **Without iron mode** an exercise keeps several saves: an autosave for each engagement, written as it starts, every 5 minutes and when you leave, and any number you name yourself with `save` or `save before the attack` on the conn. Each captain keeps the five newest autosaves; an older one goes when a sixth is written. Saves you name are never removed.
- **In iron mode** there is one save, written only when you leave. There is no autosave and no `save` order, and continuing from the save uses it up. An exercise keeps the iron mode it was started in.

**Choosing ships.** Some engagements, such as *Duel*, let you pick your ship, the opponent's ship and its captain. On the setup page, `↑`/`↓` move between the choices, `←`/`→` change one, `Enter` begins and `Esc` goes back. Under each ship is a one-line summary: acceleration, EF drifting and burning, how quiet its array is ("ears", lower is better), whether it pings, and its tubes.

**Themes** live in `data/themes.ron`. Thirty-five come with the trainer, in four groups, and the Options page shows each theme's group beside its name. First comes the house colour, Deep Signal, the default. Then the fleet's own looks: Polaris, the cool Nord palette on a darker ground; Graveyard Watch, the Dracula palette on a darker ground; Cold Steel, gunmetal and frost for a flight deck; Imperial Bridge, grey deck plate with red and green panel lights; Boldly Go, orange and lilac panels on black; So Say We All, a combat information centre in gunmetal and warm low light; Letter of Marque, a sea chart in tar and gold, which comes up by itself when a privateer with no theme of their own signs in; Full Dress, the Pride flag's colours, after the rainbow of signal flags a ship strings bow to stern on a day of celebration; Yamamoto, deep indigo with soft blue text and pastel signals; Solarpunk, the Solarized palette; Red Light, the red lighting of a control room at night; Luna, deep purple from a plum ground to pale lilac; and two light ones, Via Lactea, bronze on pale verdigris, and Sol, black on a soft butter yellow. Then the terminals: PF3, a mainframe terminal's green screen; No Scroll, the white phosphor of a famous minicomputer terminal; Gold Key, the amber of its successor; and Common Ghost Environment, the tan and slate of a Unix workstation's desktop. Then the home computers, oldest first: HGR and HGR2, the two colour sets of one machine's high-resolution screen; YG-80 (Garbage Scow), the bluish white of another, which its owners nicknamed after rubbish; Player Missile, the single blue of a home computer named for its sprites; Palette One, the four colours of an early PC's graphics card; Field Service, in the blue of an old PC; Solid State, the fifteen colours of a machine whose title screen opened with a band of colour bars; Mode 7, the teletext colours of a school computer; Rubber Keys, the bright colours on black of a small computer with a rubber keyboard; Breadbin, the light blue on blue of an old home computer; Screen 1, the white on blue of a home computer standard; Locomotive, the yellow on deep blue of one that came with its own monitor; Jackintosh, the green desktop and white windows of an early 16-bit machine; Workbench, the royal blue, white and orange of its rival; Workbench 2, the grey of its later version; and Boss Key, an office desktop's colours on white. Copy one, change its colours and restart to make your own. If the file has a mistake, the trainer says so and uses its built-in themes.

**Scanlines** (`s`) darken every other row a little, like an old CRT.

**Difficulty** (`d`) steps the level of your next launch through Standard, Hard and Nightmare, for free play and the campaign alike. It belongs to the signed-in captain, so it is kept between sessions and each captain has their own. With nobody signed in, it starts at Standard. The first time you choose Nightmare it shows a warning: `y` sails anyway, and any other key backs out. Once you've accepted, it doesn't ask again on this machine; the yellow label under the list says what you've chosen. See [Difficulty](#difficulty).

**Iron mode** (`i` on a list of exercises) takes the pause away, as a real watch would:

- **off:** pause whenever you like;
- **limited:** three pauses per engagement, each lasting at most 30 seconds, then the trainer resumes by itself. The header shows `IRON 2` for the pauses left;
- **iron:** no pausing at all (`IRON` in the header). The manual and the log viewer open over an exercise that keeps running.

**Records.** Each finished engagement is saved: won or lost, the time, the mode, ships sunk, hull left, the level, the [verdict band](#verdict-bands) and the tons sunk. A Nightmare run is marked as one. The title screen shows each engagement's best (a win in a stricter mode beats a faster one in a gentler mode, and at the same mode a harder level beats a faster easier one), and at its head your heaviest bag and your running total of tons. Records live in `~/.local/share/ghostboat/records.tsv` (or under `$XDG_DATA_HOME`).

If the colours look garish or wrong, press `c` for 256-colour mode. Terminals reached over SSH often can't say whether they support 24-bit colour, so the trainer may start in 256-colour mode; press `c` to try 24-bit. The trainer remembers your choice for the next launch, for the captain signed in.

## 3. Controls

| Key | Action |
|---|---|
| `Enter` or `:` | Open the `CONN>` line to type an order (see below) |
| `s` | Stations: pick a console setup from a menu |
| `Space` | Pause, and resume at x1. In iron mode it first brings time back to x1, and pauses (where iron allows it) only at x1 |
| `=` | Back to x1 at once |
| `+` / `-` | Time compression, x1 to x100k: x1, x2, x5, x10, x30, x100, x300, x1k, x3k, x10k, x30k, x100k. It drops back to x1 by itself whenever something happens. Engagements at real distances take hours or days; compression is how you cross the empty ones. If the machine can't keep up, the header shows the rate actually reached: `x100k (x17.4k max)`. |
| Click the plan | Arm a course toward that point, on any hull; `Enter` gives it and `Esc` drops it |
| `←` / `→` | Warship: dial in a heading 5° left or right; nothing turns until you press `Enter` (or `Shift+Enter`) to give the order, and `Esc` drops it. Civilian hull: steer 5° at once. Hold `Shift` for 1° steps |
| `Shift+↑` / `Shift+↓` (or `PgUp` / `PgDn`) | Dial in pitch 5° up or down; `Enter` gives the order. On a civilian hull's autopilot it acts at once |
| `↑` / `↓` | Dial the engine telegraph: all stop, ahead one third (25%), two thirds (50%), standard (75%), full (100%), flank (full, pushed). With flight assist on, dial a speed 0.1 km/s up or down. `Enter` gives the order On a civilian hull's autopilot it acts at once. |
| `x` | All stop, without `Enter`: cut the drive and release flight assist, and the engine room answers in its own time. On a civilian hull's autopilot, it stays on and brings the ship to rest; `C` is what hands you manual control |
| `C` | Autopilot (flight assist) on or off; off is manual control. It takes a Shift, because the autopilot radiates. Only a hull with a compensator has one: the civilian hulls and the pirate raider. The navy flies by orders and has none. The log records the order and the helm's answer, as for `assist on` |
| `P` | Ping with active array. It takes a Shift, because a ping tells everyone where you are |
| `f` | Fire the next ready tube at the contact with the best solution, among the shots the fire control window reads `OK`; if none does, the log says so |
| `d` | Launch a decoy along your course. Loud, but an emergency key, so no Shift |
| `j` | Drop a static buoy astern |
| `J` | Begin jamming: jam the loudest incoming torpedo, steady, at your jammer's highest setting |
| `b` | Rig for silent running (reactor shut down, radiators in), or back to normal |
| `H` | Raise or lower the navigational shield. It takes a Shift, because a raised shield is heard |
| `u` | Jury rig what has failed (an old boat) |
| `g` | Gauss gun burst at the contact with the best fix or solution |
| `K` | A gauss burst into the area of the contact chosen on the fire control window, or the one `g` would take, with no solution. It hits only by chance and tells everyone where you are. It takes a Shift, because it is loud |
| `a` | Acknowledge the master alarm |
| `i` | The focused window: captain's summary or detail |
| `n` | Step the focused nav display: rose, plan, profile, 3-D |
| `<` / `>` | Turn the 3-D view |
| `{` / `}` | Tilt the 3-D view: toward edge-on, toward overhead |
| `o` | True or relative bearings: every bearing display at once |
| `c` | Home: centre the nav plots on your boat, and put the plots and rose back at the standard range (±2,000 km) |
| `p` | Take up the grease pencil, or put it down |
| `R` | Take up the navigator's ruler, or put it down: click point to point to lay legs |
| `G` | The next sheet of glass: nav, attack, search, and any you named |
| `W` | The plotting menu: filters, layers, shadows, zones. `w` on a focused plot opens it too |
| `Tab` / `Shift-Tab` | Focus the next or previous window |
| `v` | Change what the focused window shows |
| `V` | Change it back, the other way round |
| `z` | Swap the focused window into the main window |
| `L` | Next window layout |
| `F2`–`F10` | Console setups: bridge, sensors, nav, engineering, comms, science, damage, stealth, travel. See [Setting up the console](#4-setting-up-the-console). |
| `[` / `]` | Nav plot zoom in / out |
| `T` | The theme menu: each theme is shown as you move to it, `Enter` keeps it and `Esc` puts back the one you had |
| `e` | Colour effects on or off |
| `m` | Sound on or off |
| `l` | The full ship's log, for review (pauses the trainer) |
| `N` | Night orders: what wakes you (stops the clock) |
| `S` | Standing orders: what the crew does before you can answer (stops the clock) |
| `t` | The briefing again, with the goals: each goal open, done or failed, and the current hint. In a career fight, the patrol's orders and the boat as she dropped in. It stops the clock as the manual does; `t` or `Esc` closes it. In testing: the key may change |
| `?` | The quick reference card (pauses the trainer). In it, `h` opens this manual, `/` searches it (`n` and `N` step through the matches), and `q` or `Esc` goes back to the game |
| `F1` | This manual, straight away |
| `q` | Leave the exercise for the title screen (on the title screen: back to the main menu, and on the main menu, quit). It asks first: `q` again leaves, any other key stays. **Ask before leaving** on the Options page turns the question off. `Esc` never quits |

The key bar at the foot of the screen lists the keys used most in play. The rest (`e`, `m`, `r`, zoom) are in the table above.

### Mouse, touch and menus

Every action has a key, and every action can also be reached by pointing, so the trainer works without function keys, and on a tablet or phone over SSH.

- **`☰` menu** (first on the key bar): every command, with its key beside it.
- **`s` stations:** every console setup, built in or saved. The function keys are shortcuts to the same list.
- **The key bar is buttons.** Click an entry to press its key. On a pair such as `←→`, click the arrow you want.
- **Windows:** click a window to focus it; click the focused window's title bar to swap it into the main window, and again to put it back. Inside a focused waterfall, a click tunes to that bearing.
- **The rose:** click inside it when focused to lay a bearing mark. Press near a mark to take hold of it, and sweep it round. See [Bearing marks](#bearing-marks). Press on the bow's arm or the helm's order and sweep it to dial a heading, then `Enter` gives the order and `Esc` drops it.
- **The plotting menu:** the `☰` menu's `plotting` entry, or `W`, lists every filter, layer, shadow and zone order for the window, to click.
- **The overlay:** press `p` for the pencil, then click a plot to write a note or rub out a mark, and drag to draw a line. With the pencil down, drag a note to move it. See [Nav plot](#nav-plot).
- **Plots:** drag a plan, profile or 3-D plot to pan it. It stays where you put it, and `c` brings it home at the standard range. See [Nav plot](#nav-plot).
- **The wheel** works on what the pointer is over: it zooms a nav plot or the bearing rose, moves a menu's selection, and scrolls the manual and log, the log window included. Scrolled back, the log window's title says how far (`12 lines back`).
- **Menus** take `↑`/`↓` and `Enter`, the number shown, or a click; `Esc` or a click outside closes them.
- **The title screen:** click a menu item, an option or an exercise to select it, and again to choose it. The launch choices and the key bar are buttons too.

**Running remotely.** Over SSH or mosh, the trainer starts with effects off: the glow and flicker change cells on every frame, and a link pays for each one (`e` on the title screen turns them back on). Played locally, effects start on. Locally, or over **mosh**, run as normal: mosh sends only the newest screen and never falls behind. Over **plain SSH**, start with `--metered`. Plain SSH sends every frame, so a busy screen such as the waterfalls queues up behind the link and the console seems to crawl. Metered, the trainer keeps its output to 32 KB/s (or `--metered 16`, or `GHOSTBOAT_METERED=16`) by skipping frames, and starts with effects off. The simulation keeps real time either way; only the screen updates less often. Sensor waterfalls redraw at most twice a second in every mode, and at once after a key or click.

With the mouse on, most terminals need a modifier to select text (in iTerm, hold `⌥ Option`). Start with `--no-mouse` to keep the terminal's own selection.

**Right-click in iTerm.** iTerm opens its own menu on a right-click unless you tell it otherwise. Tick **Settings → Pointer → Right-click reported to apps, does not open menu**, and the right button (or a two-finger tap on a trackpad) reaches the trainer: a contact's orders in the table, and the grease pencil on a plot.

### The conn

Press `Enter` (or `:`) and the bottom line becomes `CONN>`. Type an order and press `Enter`; the boat answers in the log. `Esc` cancels, and `↑`/`↓` bring back earlier orders. The exercise keeps running while you type, but time compression drops to x1. Every important action also has a single key, so you never have to type a sentence while something is closing on you.

Orders are not case-sensitive. Contacts are named `s1`, `s2`, and so on.

| Order | Does |
|---|---|
| `helm 045`, `come to 045` | Come to a heading |
| `helm s090`, `helm p045`, `come to s090` | Turn by a bearing off the bow, starboard or port, as the rose writes it: three digits after the `s`, so `helm s005` is 5° to starboard |
| `helm s1`, `come to s1` | Turn bow on to a contact, as `steer s1` does. Only three digits after the `s` make a bearing off the bow: `helm s005` turns 5° to starboard, but `helm s05` steers for contact S5. Any other number of digits names a contact. After a `p` the digits are always a bearing, so `helm p05` turns 5° to port. A contact numbered 100 to 999 takes `steer s100`; from S1000 up, `helm s1000` works too. A contact always takes its `s`: `steer 045` is refused |
| `helm 045 +10`, `helm 045 mark 10` | Point along a bearing and elevation at once |
| `helm cse`, `come to cse` | Point the nose along your own course, the bearing and elevation CSE shows: back onto your track after a turn, or lined up with your drift before you go quiet |
| `burn to 2.5`, `burn 30`, `burn off` | A controlled burn: to a speed along the nose (km/s) or for a time (s), then coast; or stop it |
| `reverse` | Helm only: come to the reciprocal of your heading. The drive stays as it is |
| `clear baffles`, `clear the baffles` | The same turn as `reverse`, by its drill name. `clear baffles starboard` (or `port`; `stbd`, `sb`, `right` and `left` work too) turns 90° instead: the shorter drill, which keeps you closer to your track |
| `helm quiet`, `helm full` | The quiet helm holds every turn and pitch just under the rate that shows on MAG, so a turn costs time and nothing else. The TURN gauge shows `QUIET` while it is set. `helm full` turns at the boat's full rate again |
| `match s1` | **In testing.** The helm points the nose along the burn that would match s1's velocity, by your solution, and reports how much velocity there is to take up and roughly how long at full drive. You give the throttle (`burn 30`, `thr 50`). The helm never burns for you, and a match is only as good as your solution: on FAIR expect to correct, on POOR it is a guess. Every burn to match is heard |
| `reverse two thirds`, `reverse 50` | End for end, then drive. The drive is cut while she comes round, so no thrust goes sideways, and once she is round the drive runs at two thirds (or `one third`, `standard`, `full`, or a percentage; `half` and `slow` are the older names) and stays there. Steering by hand during the turn cancels it |
| `full stop`, `slow to 0.5` | Turn end for end and burn against your velocity until you stop, or slow to a speed. It is the main drive's stop, so it turns a civilian's autopilot off; on the autopilot, `all stop` stops her on its thrusters, with no turn |
| `point 100,-50,20` | Point the bow at a chart position, in km as `POS` shows it |
| `helm wpt`, `helm wpt2`, `steer wpt 3` | Point the bow at a waypoint of your orders, bearing and pitch at once: `wpt` is the next one still to reach, `wpt2` the second. With more than one, the plot and the rose number them (`⊕ WPT2`) |
| `away wpt`, `beam wpt2` | Turn your stern to a waypoint, or put it abeam, as `away s1` and `beam s1` do for a contact |
| `helm io`, `steer europa`, `away old wreck`, `beam io` | Turn relative to a charted body or a pencil note, by its name, as the ruler finds them: bow on, stern on or abeam. Case does not matter. A name with nothing charted or noted behind it is refused |
| `right 20`, `left 15` | Turn by that many degrees |
| `pitch 10`, `pitch +10`, `up 10`, `down 5` | Set or change pitch |
| `ahead one third`, `ahead two thirds`, `ahead standard`, `ahead full`, `ahead flank`, `thr 40` | Drive output: 25%, 50%, 75% and 100%. Flank is full with the drive pushed past its rating (see `push`); any other step brings it back. `all ahead ...` works too, and `slow` and `half` are the older names for one third and two thirds |
| `all stop` | Cut the drive and release assist: drift. A civilian hull's autopilot stays on and brings the ship to rest |
| `speed 1.5`, `assist on`, `assist off` | Flight assist (needs a compensator; the navy has none) |
| `ping` | Active array |
| `steer s1` | Turn bow on to a contact. The turn is made once: the bow does not follow her as she moves |
| `beam s1` | Turn to put a contact abeam: the classic leg change for TMA, and it stays out of your baffles |
| `away s1` | Turn your stern to a contact (it goes into your baffles) |
| `put s1 starboard 30`, `put s1 port 45`, `put s1 green 045`, `put s1 red 045` | Mark the heading that puts S1 that many degrees off the bow, 0 to 180: starboard or green, port or red. `put s1 on the starboard beam` and `put s1 astern` work too. It only marks, and `Enter` gives it. See [Orders relative to a target](#orders-relative-to-a-target) |
| `close s1`, `open s1` | Mark the course straight at S1, or straight away from her, by your solution |
| `station s1 astern`, `station s1 abeam`, `station s1 ahead`, `station s1 astern 300` | Mark the course to take station on S1 by her course: astern, abeam on your side, or ahead, at your present range or the km given. Once on station, it marks her own course |
| `intercept s1` | Mark the lead course that meets S1 at your speed, and say when |
| `x10`, `pause`, `resume`, `step 5m`, `step tti` | Time. `step` runs that long at the current rate, or to your next torpedo's time to impact, then pauses (`30s`, `5m` or `2h`). An alert cuts it short. Full iron mode has no steps, and each one costs a pause in limited iron mode. |
| `radio silence`, `datalink on` | Hold radio silence (no datalink sharing, nothing to hear) or lift it. A pack you lead holds cold while you keep silence; lifting it is their signal to attack. |
| `condition red`, `condition blue`, `condition yellow`, `condition white`, `condition auto` | Set the boat's condition, or let it set itself. The colour alone does the same: `red`, `blue`, `yellow`, `white` |
| `nav rose`, `nav plan`, `nav profile`, `nav 3d`, `zoom 2000`, `rose relative`, `rose true`, `waterfall relative`, `waterfall true`, `contacts relative`, `contacts true` | Displays |
| `fire s1`, `fire 2 s1`, `fire s1 homing`, `fire s1 burn 30`, `fire s1 speed 2` | Fire at a contact through fire control: any ready tube, or tube 2; a homing or `straight` torpedo; burn 30 s, then coast silently; or set a speed over yours, km/s, and fire control works out the burn |
| `fire 045`, `fire 045 +10`, `salvo 3 045 +10 2` | Fire straight down a bearing, with no solution: level, or at an elevation (up positive, signed, as the helm takes it). A salvo's spread comes after the elevation |
| `salvo 3 s1`, `salvo 3 s1 1.5` | A spread of three across the target's track. Fire control sizes the spread so the kill zones just touch. On a GOOD solution it trusts the aim and closes a straight runners' fan, so two or three can meet the target. Or give the degrees between torpedoes, and a tight one puts more hits on a big hull |
| `info s1` | The vessel window: what the crew has worked out about S1, with its range band or your reach on it |
| `shadow s1`, `shadow own`, `shadow off` | Shade what a contact cannot see, by your estimate of it, or what you cannot; or clear them |
| `filter held`, `filter weapons`, `filter solved`, `filter hostile`, `filter torpedoes`, `filter courses`, `filter off` | What a rose shows. `courses` and `torpedoes` hide those marks |
| `layer lob`, `layer ellipses`, `layer vectors`, `layer trail`, `layer rings`, `layer labels`, `layer bands`, `layer loud`, `layer reach`, `layer craft`, `layer reset` | What a plot draws |
| `vectors 30`, `vectors auto` | The plot's vector time, minutes, or by the zoom |
| `zone`, `zone alpha 500`, `zone off alpha`, `zones`, `zones clear` | Tripwire boxes: drawn with the pencil, or set at the plot's centre; take one down; list or wipe them |
| `guard port 270 330`, `guard off port` | A guard arc, degrees clockwise off the bow |
| `loud clear` | Wipe the loud marks |
| `pencil 045/500`, `pencil s1 to s2`, `pencil us to 090/300 to 180/300`, `pencil io to europa` | A grease-pencil line through the points, as the ruler takes them; one point runs from your boat. Each end stays where it lies on the map when drawn |
| `ruler`, `ruler s1`, `ruler us 045/500`, `ruler io to europa`, `leg s2`, `ruler off`, `rulers`, `rulers clear` | The navigator's ruler: take it up for the pointer, or lay one from us, from point to point, or between bodies and notes by name; walk it on a leg; take off the latest; read them all out; take them all off. See [The navigator's ruler](#the-navigators-ruler) |
| `lop 045`, `lop 045 10m`, `lop s1`, `lop s1 10m` | A line of position: a true bearing, or a contact's, from where you are or were. Two cross at a fix |
| `sheet`, `sheet attack`, `sheet show nav`, `sheet hide nav`, `sheet clear`, `sheet clear attack` | Sheets of glass: name them, take one up, lay one under, take it away, wipe one. See [Sheets of glass](#sheets-of-glass) |
| `gauss s1` | Gauss gun burst at S1 |
| `gauss s1 area` | A burst into the area of your estimate of S1: its solution, or the middle of its range band. It needs no solution, hits only by chance, and tells everyone where you are |
| `check s1` | Fire control's answer on S1 for each weapon, in the log, without firing |
| `fire s1 mk2h`, `fire s1 contact`, `exploder contact`, `exploder prox` | Fire a named kind; set one salvo's exploder, or the standing setting |
| `seeker 800`, `seeker narrow`, `seeker 800 narrow`, `seeker wide`, `seeker off` | A homing torpedo's seeker: switch on 800 km out, listen only ahead, or back to the standard (on at arming, all round). It stands until changed; see [The seeker setting](#the-seeker-setting) |
| `load 2 mk2h`, `load 2 empty`, `load 2 rack` | Change what is in tube 2 now: a reload's time, and it is heard |
| `reload 2 mk1`, `reload 2 same`, `reload 2 empty` | Choose what tube 2 takes next |
| `ultra`, `rig for ultra-quiet`, `rig for silent running`, `rig for normal` | Rig the boat: ultra-quiet, silent, or back to normal |
| `scrubbers off`, `electrolysis off`, `candle`, `air auto` | The air, by hand; `air auto` gives it back to the chief |
| `repair drive`, `repair auto`, `ack` | Damage control: put the parties on a system, or back on automatic; acknowledge the master alarm |
| `dc quiet`, `dc work` | Stand the damage parties down for quiet, or send them back. Rigging for silent stands them down, and `dc work` overrides that |
| `push`, `push off` | Push the drive past its rating, or bring it back |
| `overload on`, `overload off` | Fire the guns over their rating, or bring them back |
| `carrier s1 40m`, `carrier s1 2h` | Send a cold carrier at S1, to release its torpedoes after that long |
| `launch picket`, `launch picket 2`, `launch screen`, `launch strike s3`, `launch strike 4 s3`, `launch sweep` | Launch craft from your flight deck. `launch sweep` sends sweepers to the nearest charted enemy field. One unless you say, and two for a strike. A strike needs a contact with a solution. See [Commanding a carrier](#commanding-a-carrier) |
| `recall`, `recall picket`, `recall screen`, `recall strike`, `recall all` | Call craft home: those on one mission, or all. Launches still waiting are struck off |
| `deck`, `sorties` | The deck officer's report: the hangar, the launch queue and how many are aloft; or each craft's mission, range and bearing from you, Δv, time left, and whether it is coming home. `craft` is the same as `sorties`. Each also takes `status` |
| `lay`, `lay captor` | Lay a mine here: the first kind left, or the kind named |
| `track s1 1200 090 0.6`, `track s1 off` | Your own track on a contact: range km, course, speed km/s. Fire control uses it, graded; the vessel window shows how it fits. `off` hands it back to the crew. See [Working the track by hand](#working-the-track-by-hand) |
| `classify s1 destroyer`, `classify s1 crew` | Your own call on a contact's class, by words of its book name or its key; it holds. See [Reading the lines](#reading-the-lines) |
| `hail s1`, `reply` | Call a contact on channel 16 and ask who it is; answer the last station that called you. Either puts you on the air (`TX`), and ESM hears your bearing; see *The radio* under [Comms](#comms) |
| `transponder on`, `transponder off` | Broadcast your beacon, or go dark. `xpdr` is short for `transponder`. The beacon gives your name, class, position, course and speed every 30 seconds, and a warship hears it from millions of km. The header shows `XPDR ON` while it broadcasts. See *Transponders* under [Sensor waterfalls](#sensor-waterfalls) |
| `grav on`, `grav off` | The gravitic thrusters take the telegraph's orders, or give them back to the drive: silent small course corrections, slow, on propellant, with a magnetic field while they push. See [Flying a Newtonian ship](#7-flying-a-newtonian-ship) |
| `sweep on`, `sweep off` | Stream or recover the minesweeping gear (a sweeper craft or a destroyer). It works at its speed or under; see [Mines](#mines) |
| `lase s1` | One beam shot at S1 |
| `reactor auto`, `reactor cap 30`, `reactor 40`, `scram` | Run the reactor: automatic, automatic but never past 30% and a little quieter for it, held at 40% whatever the boat needs, or shut down |
| `radiators out`, `radiators in`, `radiators auto` | Radiators: out to shed heat fast (and glow in infrared), in to hide, or automatic |
| `sensors off`, `sensors on` | Passive sensors: off saves a little power and leaves you deaf |
| `silent`, `normal` | Rig for silent running, or back to automatic |
| `buoy`, `decoy`, `decoy 090` | Countermeasures: a static buoy astern; a decoy along your course, or on bearing 090° |
| `jam 045`, `jam s1 half`, `jam s1 60%`, `jam off` | Aim your jammer at a bearing, or at a contact it then follows, at low, half, full or a share of full power (civilian sets: a quarter at most); or switch it off |
| `jam +`, `jam -` | A quarter more or less power to the jammer |
| `jam look`, `jam steady` | Look-through (the default): the jammer falls silent 5 s in every 25 so you can listen in its cone. Steady: no pauses, and no hearing in the cone, but a seeker gets no gap to reacquire in. `J` jams steady. |
| `eccm on`, `eccm off`, `eccm 60%`, `eccm +`, `eccm -` | ECCM: reject jamming, at the cost of a little more EF and some power. A share of full power, or a quarter more or less |
| `shield status`, `reactor status`, and the same for the transponder, assist, radiators, sensors, generator, scrubbers, electrolysis and jammer | The watch reports that system's setting. All but the jammer also answer to their bare name |
| `battery`, `heat`, `fuel`, `prop`, `hull`, `air`, `cabin`, `crew`, `helm`, `pos`, `alt`, `accel`, `turn`, `tubes`, `guns`, `pinger`, `cm`, `sig` | The station reads that gauge from its own instruments, and says if damage control knows the gauge on the conn is broken. Each also takes `status` |
| `gauges` | Damage control lists the gauges it knows are broken |
| `reports all`, `reports normal`, `reports quiet`, `reports` | How much the crew reports on its own, or the present setting |
| `mag status` (or `mag`, `magnetics`) | The boat's magnetic field now, what is making it (reactor, shield, manoeuvring), and how close a hunter's magnetometer would have to come to feel it |
| `shield up`, `shield down` | The navigational shield: stops strikes up to its rated speed, and shows on EF and magnetics (`H`) |
| `jury` | Jury rig what has failed on an old boat: back now, and the next failure sooner (`u`) |
| `jammer`, `jammer 090` | Launch a jammer drone along your course, or on bearing 090° |
| `log <text>` | Write your own line in the log |
| `filter s1`, `filter eng`, `filter off` | Narrow the log window to a contact, hide or show a kind, or clear the contact |
| `brief` | The briefing again, with the goals and the current hint (`t`). See [Goals](#goals) |
| `night`, `night transit` | Open the night orders, or set a preset: `standing`, `transit`, `patrol`, `ambush` |
| `call me on ping`, `call me pause on contact`, `call me log on transient`, `call me never on lost` | How far a kind of event reaches you: x1, pause, log or record. The words are `contact`, `regained`, `lost`, `called`, `solution`, `transient`, `manoeuvre`, `ping`, `cloud`, `objective`, `mine`, `air`, `collision`, `calls`, `torpedo`, `hit`, `end` |
| `call me at 02:00`, `call me battery 30`, `call me waypoint`, `call me off` | Your own calls, or none |
| `call s3 hostile`, `name s3 fat one`, `ignore s3`, `pin s3` | The captain's own call on a contact |
| `save`, `save before the attack` | Save the exercise, under a name or the exercise clock (not in iron mode) |
| `recover` | Bring aboard what lies close aboard: within 2 km and all but stopped, for 10 minutes. In a lesson, a practice shot adrift by her beacon (see [Practice shots](#practice-shots)); in a career fight, the people of a lifeboat or pod (see [Dropping in](#dropping-in)) |
| `yard` | In a career, at base: open the yard, the refit waiting, with each job's days and the day she sails (see [The yard](#the-yard)) |
| `diary` | In a career, at base or on the patrol chart: open the war diary (see [The war diary](#the-war-diary)) |
| `note <text>` | In a career, at base or on the patrol chart: write a line of your own in the war diary, at most 120 characters. In a fight, `note` writes on the plot instead (see [Nav plot](#nav-plot)) |
| `all stop; silent; helm 090` | Several orders on one line, separated by `;`. Each goes out and is answered in turn, as if typed alone. A `log` entry keeps its semicolons |
| `help` | List the orders in the log |
| `help fire`, `help clear baffles` | Only the orders that start with those words, and what the manual says about each. `help baffles` finds the orders that mention a word |

**Nerd Font icons.** Ghost Boat needs no special font. If your terminal uses a [Nerd Font](https://www.nerdfonts.com/), press `f` on the title screen for icons in the window titles, the goals, the bars (`HULL`, `BATT`, `SINK`, `FUEL`, `PROP`), the torpedo stopwatch, and on waypoints (` WPT`), mines, notes and the plots' countermeasures. The `SIG` bars become joined capsule gauges, and a small spinner turns on the `TUBES` line while a tube reloads and beside a system under repair, if effects are on. These need Nerd Fonts 3.0 or later. A symbol means the same either way, and contact symbols (`○ ◇ □ ✣`, and a fighter's `◠ ⋀ ⊓ ⌒`) always stay as they are: they follow the military standard. If icons show as boxes, your terminal isn't using a Nerd Font: press `f` again, or choose one, preferably a `Nerd Font Mono`, in your terminal's settings. iTerm can keep your usual font and use a Nerd Font just for symbols, under **Profiles > Text > Non-ASCII Font**. The replay viewer stays plain.

**Sound.** The trainer uses your terminal's bell: once when you are pinged, hear a torpedo, or are hit by a beam or slugs, and three times, the klaxon, when the boat goes to condition RED, whether you call it or the boat sets it. Every sound has an on-screen twin (the `PING` and `TORPEDO` pills, the rose flash, `COND RED` in the header, the log line), so you lose nothing with sound off. In iTerm you can choose the bell's sound under *Settings → Profiles → Terminal*; the stock macOS sound *Submarine* suits the boat, and *Ping* gives a sharper note.

**Music.** There is none, on purpose. Anthony, who made Ghost Boat, recommends that you pick your favourite CD from the 1980s or 1990s and play it while you hunt. That is the intended soundtrack. It is how he and his friends played DOS games together in the 1990s. Unless you think a destroyer's pings are music. Then carry on, sailor.

## 4. Setting up the console

The console is yours to arrange, and different jobs want different arrangements. Set it up once for each job and switch with one key.

### Windows, layouts and detail

There are six windows: a large **main window** and five smaller ones. Any window can show any instrument: waterfall, rose, nav plan, nav profile, 3-D, chart, engineering, damage control, contacts, status, log, comms, survey, vessel or fire control, and where fitted the flight deck, the patrol chart and the crew; on a warship also the infrared, EM and magnetic waterfalls.

| Key | Does |
|---|---|
| `Tab` / `Shift-Tab` | Focus the next or previous window (bright frame, `◆` in the corner) |
| `v` | Change what the focused window shows. Nothing else changes, and it skips instruments already on screen, so ten instruments rotate through six windows |
| `V` | The same, the other way round |
| `show NAME` | (on the conn) Put an instrument in the focused window even if another window has it: two waterfalls, one true and one relative, say |
| `z` | Swap the focused window into the main window; `z` again puts it back. The quick way to blow up the waterfall for fine tuning, then return to the rose |
| `L` | Next layout |
| `i` | The focused window between the captain's summary and the detail (engineering, damage control), or fire control between its grid and the torpedo room |
| `o` | True or relative bearings on every bearing display at once (the conn sets them one by one) |
| `n` | Step the focused window through rose, plan, profile and 3-D |
| `[` / `]` | Zoom the nav plot |

| Layout | Shape | Good for |
|---|---|---|
| **Bridge** | main window top left, two beside it, two below, the log along the bottom | an all-round watch |
| **Tactical** | main window across the top, four below it, the log along the bottom | one instrument to stare at, four to glance at |
| **Focus** | main window takes most of the screen, four stacked beside it, the log along the bottom | a big waterfall or chart |

The console is built for a big terminal (160×45 and up): every window gets more room, and the waterfalls more history. It works down to 80×24. Below that, the console, the title screen and the career's screens say so and draw nothing else; the manual and the other reading pages fit any size. A lean layout for small screens is planned.

### Setups

A **setup** is a whole arrangement under a name: the layout, what every window shows, and each window's view (summary or detail; true or relative bearings). Think of a working ship: each station has its own view of the same boat. Nine setups come built in, on the function keys: seven stations and two situations.

| Key | Setup | Main window | Around it | For |
|---|---|---|---|---|
| `F2` | **bridge** | rose | contacts and waterfall, status, plot, log | the fight: what is around you (`o` for bearings off the bow); `z` on the waterfall to fine tune a trace |
| `F3` | **sensors** | passive array waterfall, with its spectrum layer | infrared waterfall, contacts, rose, status, log | the sensor watch: two waterfalls big enough to read, `w` for more layers, tune to listen |
| `F4` | **nav** | nav plot | profile, chart, rose, status, log | pilotage, traffic in friendly space, and finding your way in three dimensions |
| `F5` | **engineering** | engineering (detail) | damage control, status, contacts, rose, log | the plant: power, heat, signatures, air |
| `F6` | **comms** | comms window | chart, log, status, rose, contacts | the radio stack, the group, and the traffic |
| `F7` | **science** | survey | chart, waterfall, infrared, profile, contacts | how each contact gives itself away, the surroundings, your own signature |
| `F8` | **damage** | damage control (detail) | engineering (detail), contacts, rose, status, log | after a hit |
| `F9` | **stealth** | waterfall, true | engineering, survey (what we show the world on each channel), status, contacts, log | running quiet: the waterfall, and what your plant is giving away |
| `F10` | **travel** | chart | plot, engineering (detail), rose, status, log | long passages: where you are going, and how long the plant and air last |
| none | **weapons** | fire control | contacts, rose, status, plot, log | the attack: which weapon can reach what, and what is stopping the rest. `setup weapons`, or `s` and pick it |
| none | **patrol** | the patrol chart | plot, contacts, rose, status, log | a career fight: the chart the boat dropped in from. `setup patrol`; in an exercise the chart's window gives way to another |

The trainer starts on a console like **bridge** but with true bearings: the rose large, the sensors beside it.

**Make your own.** Arrange the console the way you like it and type `setup save NAME` on the conn (for example `setup save attack`). `setup attack` brings it back; `setups` lists every setup with its key. Your own setups are recalled by name (`setup attack`); the function keys are all taken by the built-ins. Saving under a built-in's name (`setup save combat`) replaces that built-in with yours. A setup also brings up its sheet of glass: `nav` the nav sheet, `weapons` the attack sheet (see [Sheets of glass](#sheets-of-glass)). One you save keeps the sheet in hand when you save it. Setups are kept between sessions in `~/.config/ghostboat/setups.tsv` (or under `$XDG_CONFIG_HOME`).

**Some arrangements worth trying:**

- **TMA work:** the nav plot in the main window, with contacts beside it: watch the lines of bearing cross as the `TMA` grade firms up.
- **Torpedo attack:** contacts in the main window (your torpedoes count down there) with the plot beside it.
- **Escort or hunting group:** the chart in the main window, to see your group's `▲` marks and every contact's last known position at once.
- **Minefield:** the chart for the charted field, the waterfall for captor torpedoes, engineering in the summary for the battery.

### Look and feel

These are under Options on the main menu, and their keys work on every page of the title screen. In an exercise, `T` opens the theme menu, and `theme NAME` on the conn picks one (`theme red` for Red Light; `theme` alone takes the next):

| Key | Setting |
|---|---|
| `T` | The themes, under their groups (house, fleet, terminal, home computer). Each is shown as you move to it: `↑` `↓` move, `PgUp` `PgDn` go to the group before or after, `Enter` keeps the theme shown, and `Esc` puts back the one you had. On the Theme row of Options, `Enter` opens the list and `←` `→` step through the themes one at a time |
| `c` | Colours: 24-bit, or 256 if 24-bit looks wrong. Remembered between launches |
| `e` | Effects: the living colour (shimmer, pulse, glow) on or off |
| `m` | Sound: the terminal bell for pings, torpedoes and hits, and the klaxon at condition RED |
| `s` | CRT scanlines |
| `f` | Nerd Font icons, remembered between exercises |
| `i` | Iron mode: off, limited or iron |

**Your own theme.** Themes are in `data/themes.ron`. Copy a block, give it a new name, change the colours (`#rrggbb`), and restart. Every role needs a colour; keep the roles' meanings (threats stand out, faint things recede, warnings are unmistakable), because colour means the same thing in every theme. If the file has a mistake, the trainer says which theme and which colour, and uses its built-in themes.

### Accessibility

The trainer is all text, and text can be read aloud. The aim is a trainer that every captain can play, blind captains included. It is not there yet. This section says what works today, how it was checked, what does not work yet, and how to tell us.

**What works today.**

- **The keyboard does everything.** Every action has a key or a typed order. The mouse and touch are extras, and `--no-mouse` turns them off. No function key is needed.
- **Time waits for you.** Time compression drops back to x1 whenever something happens. Outside iron mode, `Space` pauses at any time, and you can still type orders while paused. The manual, the quick reference and the full log pause the exercise. Night orders can stop the clock for the events you choose.
- **Words carry the boat.** The crew reports in the log, and each line names the station that speaks. `reports all`, `reports normal` and `reports quiet` set how much you hear. Every gauge has a typed answer: `battery`, `hull`, `air`, `contacts` and the rest.
- **The bare conn.** `o` on a launch page plays an exercise from the header, the goals and the log alone, with no gauges or plots. See [The bare conn](#the-bare-conn).
- **Colour is never meant to be the only sign.** Contacts have shapes as well as colours, and states are written as words. In every theme, text stands out from its ground by at least 4.5 to 1. Each theme's alarms are set apart for captains with red-green colour blindness. `T` chooses a theme, light or dark, and you can make your own.
- **Sound is never the only sign.** Every bell has a twin on screen. `m` turns sound off.
- **Motion can be turned off.** `e` stops the flicker and glow of the effects, and `s` the scanlines.
- **Text size is your terminal's.** Make the font as large as you like, while the window still holds 80 columns by 24 rows.

**How it was checked.** Automated tests check that every action has a key on a plain keyboard. They check the contrast of alarms, labels and faint text in every theme, and that the alarms stay apart for red-green colour blindness. The colour reference measures each theme and shows its alarms as colour-blind captains see them. Nobody has yet played the trainer with a screen reader.

**What does not work yet.**

- **Screen readers.** The trainer redraws the whole window many times a second. Screen readers expect lines of text that arrive one after another, so they handle the trainer badly today.
- **There is no screen-reader mode yet.** Nothing prints new lines only, or takes orders at a plain prompt.
- **Real time.** An exercise runs in real time, and in iron mode you can't pause. A fast moment can still ask more than a screen reader can say in time.
- **Keys can't be changed yet.** There is no key file to edit.
- **Free-hand drawing needs the mouse.** A free-hand pencil line is drawn by dragging. The order `pencil` draws a line through points by key.
- **Flashing.** With effects on, alarms flash up to twice a second and a jammer's strobe flickers faster. Turn effects off with `e` if flashing troubles you.
- **A phone held upright** gives fewer than 80 columns, which is too narrow.

**Tell us.** If something stops you playing, or plays badly with your screen reader, magnifier or other aid, write to Records, records@ghost-boat.net. Say which aid and which terminal you use, your operating system, the build (on the title screen's top border), and what happened. Nobody is named in the credits without asking.

## 5. Reading the instruments

Section 1 says what each instrument shows. This section says how to read it: the patterns an operator learns to spot, and what they mean for you.

### The computer, the crew and you

Three voices run the boat, and each works on its own.

- **The computer reports what it measures, and nothing more.** Fire control's solutions, the gauges and the waterfall are its facts. It does not say what they mean.
- **The crew make their calls.** They name contacts, judge how far off a faint one can be, and say what they think a sound means. Their calls often end "Our estimate."
- **You decide.** Neither the computer nor the crew overrules the other. When they disagree, both reports stand, and the call is yours.

Both can be wrong. Every bearing carries some error, and an array can read a few degrees off. A solution can settle on the wrong range. A damaged system reads worse. A crew can call a destroyer a sweeper. That is part of the boat: weigh what you are told, check one source against another, and use the debrief's true picture afterwards to learn which one misled you.

You will see them disagree. Fire control grades a solution by its own error alone, so a fit to a craft that dodges can come out FAIR at an impossible range. The crew check each new solution: against the [range band](#the-range-band), against the last solution, and against how hard a ship can burn (see [Reading a contact](#reading-a-contact)). When it lies past anything the contact could be, for one, they say so: `SENSORS  We don't believe fire control's range on S9. Nothing she could be is loud enough to be heard so faintly from there: we make her inside 2140 km. Your call, Captain.` The grade stays as fire control gave it, and the table shows `FAIR?`. Your own fire control fires on its own grade; whether to shoot is up to you. A computer captain, by contrast, acts on its crew's call. A wrong class call can make the crew doubt a right solution, too.

### The waterfall: reading traces

The waterfall is signal strength by bearing (across) against time (down, newest at the top). On the true display, turning your own boat doesn't move a trace; moving it does, slowly. On the relative display, a turn kinks every trace by the amount you turned, so a kink that every trace shares is you, and a bend in only one trace is the contact.

| You see | It means | What to do |
|---|---|---|
| Speckle everywhere, no pattern | Background hiss. Nothing there, or nothing you can hear yet. | Wait, drift, keep your own emissions down. |
| A faint streak that comes and goes on one bearing | A quiet ship at the edge of hearing. The tracker may not call it yet. | Stay quiet and keep listening; it firms up as range closes or as you go quieter. |
| A trace that stays on one bearing and gets **brighter** | **Constant bearing, closing.** Something is coming straight at you, or you at it. The classic warning. | Treat it as a threat. Change course to make the bearing move, or get ready. |
| A trace that stays on one bearing and fades | Constant bearing, getting fainter. She may be opening, or going quiet where she is, and the trace cannot tell you which. | Solve her before you act on it. |
| A trace that **slants** | The bearing is changing: a crossing target. Steeper slant means faster across your bow, or closer. | Good for TMA: a moving bearing gives range. |
| A trace that **suddenly brightens** | A transient: a drive lighting up, or a launch thump. The log calls it. | It may have heard you. Listen for a ping or a torpedo. |
| A white-hot mark that is gone in a second | A ping (theirs), or a storm discharge (`Static discharges` in the log). | A ping means they may have you: see the drills. |
| The **whole row** lights up for a moment | Your own ping. You are deaf for that second. | Expected. |
| A neutral grey band | Your baffles, the deaf arc astern. It turns with your nose. | Clear your baffles now and then (drills). |
| A tinted band | A nebula's bearings, in its kind's colour. Inside an ion cloud the speckle turns coarse: that is the static. | See Nebulas. |
| Static blocks and `NO SIGNAL` | Your array is damaged or failed. | Damage control; `repair array`. |

### The bearing rose

Each line points along a contact's latest bearing. All lines stop at the ring, because passive array gives no range: a long line is not a near ship. A line that **pulses** is held now; a faint one is lost. A line that **stays put while you move** is either far away or coming straight for you; one that **swings** is crossing or close. Your heading is the solid line from the centre, your actual course the dotted one, and when they part you are sliding. A shimmering band inside the ring is a nebula; a hatched sector, a moon.

### Identifying a contact

Nothing comes with a name. A contact is `unknown` until your crew has heard enough of it, and the `TYPE` column gives their best guess so far: first `civilian?` or `military?`, then a class. The array reads the character of its machinery and, when it burns, its drive and how hard it pushes; a ping reads the size of its echo. A faint contact takes far longer than a loud one, a quiet ghost may never be called, and similar classes stay confused. Ships in your own group are known. Infrared, EF and magnetic readings don't count yet.

**Crews can be wrong.** Each new call has a chance of naming the runner-up, higher with a green or tired crew, and it stands until the evidence is overwhelming. The call in the table is the crew's opinion, not a fact.

**A transponder is a claim.** It gives a name, a class and a position at once, but only what the ship says of itself. A position report gives you a range and a solution without a sound, and the tracker treats it like an echo. If the signature doesn't fit the class, or three reports running don't fit the bearings your own array measures, the crew marks it `suspect` and it stops reading friendly. A false position also leaves the track, which goes on from your bearings alone. A lie along your line of sight doesn't show on the bearing until one of you moves, so a solution from a beacon is only as good as the beacon. Some lessons use older beacons that give no position.

**The vessel window** (`info s1`, or `info` for the latest heard) shows the call, the classes it could be with their odds, the beacon's claim and reported position (and when it was last heard, once it falls silent), how long you have listened, and, once a class is called, what that class carries.

**Torpedoes are identified too.** The contact is only a `TORP`, and the alarm only sounds, once it is called, and the enemy plays by the same rule. A burning torpedo is called as soon as it is heard, because nothing else pushes that hard, but its motor is small: you hear it only inside about 300 km. Once it coasts it is a faint hum: the array alone won't hear it until about 20 km out, some five seconds away. To find one in time you must ping, which tells everyone where you are.


#### Reading the lines

A ship's machinery leaks narrow radio lines, and each class has its own set. Once a contact is loud enough, the vessel window lists the lines your array hears on it (`LINES MHz  52.3991  104.7982 ...`), and under each class the crew thinks it could be, that class's lines from the recognition book. Set one against the other. The heard lines are shifted by Doppler: a ship opening reads low and a ship closing reads high, every line by the same fraction (at 300 MHz, 5 km/s is about 5 kHz). A faint contact shows only its strongest lines. Similar classes share some lines and differ in others, and a decoy carries none at all.

When the lines say the crew is wrong, overrule them: **`classify s1 destroyer`** (any words of the class's book name, or its key) makes the call yours, and it holds while the crew keeps reading. `classify s1 crew` hands it back. Your call is only as good as your reading.

### Reading a contact

The contacts table holds one row per contact. Read it left to right:

- **`HEAR`:** which sensors have it. `P` (passive array) is the usual, and it means you found the ship, not that it announced itself. `X` means it is broadcasting a transponder beacon, and clears a minute after it goes dark. A small `x` then marks a held contact whose beacon has gone silent in the last ten minutes: switched off, or out of hearing. `I` (infrared) on a quiet boat usually means its radiators are out or it is burning. `E` (EM) means it is **transmitting**: a hunting group sharing a contact, or a gun or beam firing. `M` (magnetic) means it is **close**: a magnetometer feels a running warship at about 15 to 20 km and a cold one at about 6 to 7 km.
- **`SIG`:** how far above your threshold the signal is, in dB. Near 0: faint, it will flicker. A **rising** SIG is a contact closing or getting louder, and a **falling** one a contact opening or going quiet: the level alone cannot tell which. Only a solution gives range (see *Trust the geometry*, section 9). A sudden jump of 6 dB or more is a transient.
- **`TMA`:** how far to trust the range, course and speed:

  | Grade | Range is good to | Use it for |
  |---|---|---|
  | `----` or `POOR` | nothing shown: don't trust it | keep listening; make a leg change |
  | `FAIR` | within about 30% | a spread of torpedoes; steering toward or away |
  | `GOOD` | within about 10% | a single torpedo, a gauss gun burst, the beam |
  | `FIX` | a ping echo in the last minute: range to within a few km (about 10 from a civilian active array) | guns; a quick solution |

  A solution assumes the target flies straight. One that is turning or still burning can fool it. Fire control checks its own fit: if the fit misses the bearings by more than their usual scatter, it widens its error, and the grade falls with it. The crew check the rest, and where they rate a solution lower they say why and the grade shows `FAIR?` or `GOOD?` (see [The computer, the crew and you](#the-computer-the-crew-and-you)). They doubt a solution that would mean the target changed speed faster than any ship can burn. They doubt one that jumped from the last by more than twice its own error, until two agree. They hold a target that has made a transient at `FAIR` for five minutes, in case she is still burning, unless an echo gives her range. And they doubt a range past anything the contact could be. After a convoy scatters, expect solutions to drop back to `POOR` until the ships settle on their new courses.

- **`RANGE km`:** the estimate and its uncertainty, one standard deviation (`720±212`: likely between about 510 and 930, and almost certainly between 300 and 1,150). The plot's ellipse is drawn at two.
- **`STAT`:** `HELD` (heard in the last minute), `LOST`, `TORP` (a torpedo, in red), `MINE`. `SUNK?` is the crew's call after breaking-up noises on that bearing (see [Torpedoes](#13-torpedoes) for what they are in space). They go by the bearing and can be wrong, and a contact heard again goes back to `HELD`. `drop s1` takes a silent contact off the table and the plots until it is heard again. A right click on a contact's row in the table offers these orders and more.
- **`AGE`:** how long since last heard. An old `HELD` contact is a guess about the past.
- **`DZ km`:** how far above (`+`) or below (`-`) you it is, once you know its range.

Your own torpedoes are listed below as `T1`, `T2`…: dead-reckoned estimates (`est`) unless linked (`link`), with the time to impact counting down in the last column.

### The nav plot and the chart

On the **nav plot**, lines of bearing run from where you were when you heard each bearing. **Parallel lines mean no range**: you have been flying straight. **Lines that cross mean a leg change worked**, and the target is where they cross. The ellipse is where the target probably is (2σ); a long thin ellipse lying along the bearing means range is the doubt, not bearing. The dotted line from it is where its estimated course takes it in ten minutes. If that line points at you, it is closing; if it runs across your bow, it is crossing, and a torpedo needs to lead it.

On the **chart**, a `✕` is where a contact *was*, not where it is: read the age (`S1 12m`). A coasting ship has moved by its speed times that age. Marks fade over an hour; trust a fresh one, treat an old one as a place to start looking. `✱` marks mines, which don't move.

### The captain's summaries

**Engineering** in words:

| Line | Says | Watch for |
|---|---|---|
| `RUNNING` | Normal, silent running, or ultra-quiet | silent and ultra-quiet run down the battery and the air |
| `POWER` | Who is carrying the load, and how long the battery lasts at this draw | under 15 minutes: plan to go back to normal; "drive starved" means you are asking for more than the plant can give |
| `HEAT` | Cool, warming (with the time until the radiators come out), radiators out, overheat | radiators out = **glowing in infrared**; if you must stay hidden, stop burning or charging |
| `COB` | The Chief of the Boat's reckoning: days left in the black, what goes first of the tanks and the food, and his advice. He is cautious, and when he says you are on the reserve there is still a little left | fuel is at this burn, so a hard burn shortens it |
| `AIR` | Fresh, the time until the crew starts to slip, or the crew's performance | under 90%: sensor operators miss faint contacts, reloads and the helm slow |
| `SHOWING` | What the world sees: EF in dB, infrared, the magnetic field in A·m² (and `×1.8 manoeuvring` while a turn adds to it), transmitting | compare with the hunters' hearing ranges in the ship registry; `mag status` says how close a magnetometer must come |

**Damage control** in words: the hull, what the parties are on and how long ("working again in about 4 min"), and what you can and can't do by job: `MOVE`, `POWER`, `HEAR`, `FIGHT`, `TALK`. A job that says `OK` is fine; anything else names the system and how bad.

### The pills, and what to do

| Pill | Means | First move |
|---|---|---|
| `COND RED` / `BLUE` / `YELLOW` / `WHITE` | Combat, silent running, caution, all clear: the boat's lighting | red: fight or evade; blue: keep it quiet; yellow: find out why |
| `DRIFT` | Nothing firing: as quiet as normal running gets | — |
| `BURN` / `THRUSTERS` | You are loud | cut it (`x`) as soon as you can |
| `SILENT` / `ULTRA` | Running on the battery / and the scrubbers off | watch the battery and the air |
| `PING` | You have been pinged: they may have your range | assume they know where you are; move |
| `TORPEDO` | An enemy torpedo is in the black | the torpedo drill |
| `RAD` | Radiators out: glowing in infrared | if hiding, stop making heat |
| `HEAT` / `BATT` / `AIR` | The plant or the crew is near a limit | engineering summary |
| `MASTER CAUTION` / `WARNING` | Damage | `a` to acknowledge, then the damage summary |
| `HULL 40%` | Hull integrity | one more mine or a few slugs could finish you |
| `DUST` `ION` `STORM` | You are inside a nebula | see Nebulas |

## 6. Drills

Standard ways to do the common jobs. The keys are in brackets; any of it can also be ordered on the conn.

**Get a solution (TMA).**
1. Drift and listen until the contact is `HELD` with a steady `SIG`.
2. Turn about 90° to its bearing (`beam s1`), burn briefly (`↑` and `Enter`, a few seconds to half a minute), then cut (`x`). The engine room takes a few seconds to answer, so cut a little early.
3. Drift and wait. Within a few minutes `TMA` goes `FAIR`, then `GOOD`. On the plot the lines of bearing start to cross.
4. Faster but loud: ping (`P`) for a `FIX`.

**Attack with torpedoes.**
1. Get a solution: `GOOD` for one torpedo, `FAIR` for a spread. A big hull wants several hits, whatever the solution.
2. Close to well inside a few hundred km, but stay beyond 40 km: inside that the warhead won't arm.
3. Fire (`f`, or `salvo 2 s1`). Watch `T1` count down in the contacts table and on the plot.
4. A detonation with breaking-up noises is a kill. A detonation on a hull with no breaking-up noises means she is hurt and still there, so fire again or leave her. "Run ended, no hit" means a miss: refine the solution and fire again.

**Evade a torpedo.**
1. `TORPEDO IN THE BLACK`: note its bearing.
2. Drop a static buoy (`j`) and slide off its line: turn so the torpedo is on your beam or astern and burn briefly.
3. Cut the drive and go quiet (`b`). A homing torpedo chases the loudest thing it hears; make that the static buoy.
4. A decoy (`d`) running on along your old course draws hunters off while you turn away.

**Go quiet.**
1. `b` rigs for silent running: the reactor shuts down and the boat lives on her battery.
2. `ultra` goes further: the scrubbers stop too, and every course change goes to the gravitic thrusters. It lasts as long as the battery and the air allow.
3. `b` again, or `rig for normal`, brings the reactor back. The restart is a transient a listener may call.

**Clear your baffles.** Every few minutes, turn 60 to 90° (`right 60`, or `clear baffles starboard`), listen for a minute, and turn back. `clear baffles` alone turns you end for end. Anything that was hiding astern shows up.

**Take damage.** `a` to acknowledge, then read the damage summary. Damage control is already on the worst of it. Change its priority only for a reason ("I need the tubes before the drive": `repair tubes`). Avoid relying on a system marked `FAILED`.

## 7. Flying a Newtonian ship

Your ship obeys Newton, not the sea.

**Your crew answers your orders.** You are the captain: you give orders, and the crew carry them out after a moment. An average crew answers the helm in about 3 seconds and the engine room answers the telegraph in about 4. A tired crew, or one short of air, is slower. The header shows `ANSWERING HELM 2s ENGINES 3s` while they work, and the rose shows the ordered heading at once. A small correction to a standing order (under 5°, or 5% of throttle) is taken at once, as a helmsman follows a corrected course. Enemy crews work the same way: a green crew is slower than yours, a seasoned one a little quicker. `x` (all stop) goes through the engine room too, so cut early.

**Controlled burns.** The telegraph sets the drive's output, not a speed: "ahead full" burns until you order otherwise, and in space you keep speeding up. For a precise change, give a manoeuvre and the helm and engine room fly it together, easing off as they near the mark, then cut and coast:

- `burn to 2.5`: burn along the nose until you make 2.5 km/s that way.
- `burn 30`: burn at full for 30 seconds.
- `full stop` (or `slow to 0.5`): turn end for end, against your velocity, and burn until you stop (or slow to 0.5 km/s). Space has no brakes; this is how you slow down. It turns a civilian's autopilot off. The autopilot's own stop is `all stop` (or `x`): its movable thrusters push against your motion from any side, so there is no turn. They are weaker than the drive, so below about 2 km/s, where the turn is most of a full stop's time, the autopilot stops a hauler sooner, and above it the drive does. Either way you are heard.
- `burn off`: stop the burn and cut the drive. Any engine order, `x` included, also takes over from a burn.

The header shows the burn as it runs (`BURN TO 2.50 · 1.83 km/s`), and the log says when it is done. Civilian hulls also have **flight assist** (`C`), which holds a speed for you; warships don't, because a ship that holds one steady speed is easy to predict and easy to hit.

- **You keep your velocity until you burn.** Turning the nose does not change where you are going. Only thrust does. That is why the console shows heading and course separately.
- **The main drive pushes along the nose.** To change course, point the nose where you want the change to go and burn. To stop, turn around and burn against your motion.
- **Everything is slow.** Turns build up and ease off; the drive takes time to spool. Plan ahead.
- **Speed is silent; the drive is loud.** There is no water in space. A ship coasting at any speed makes only its reactor hum. Burning can be twenty decibels louder. **Drifting is free and quiet.**
- **Even a whisper of the drive carries.** The drive's noise follows its power: a 1% burn is still about 24 dB over a silent boat, and a destroyer hears it from thousands of km. Its plume shows on infrared too. So a ghost skipper plans the approach early, while every hunter is far off, and changes course then; later, she drifts.

**Gravitic thrusters: small course corrections.** A ghost carries gravitic thrusters, built for creeping alongside a tender or into a berth, and a skipper presses them into service to bend a course unheard. `grav on` hands the telegraph's orders to them, and `grav off` gives them back to the drive; the header shows `GRAV` while they have them. They are silent on the array and on infrared, with no plume. They are weak, about a tenth of a km/s an hour at full, and they only turn the course: they push across your motion, never along it, so they add no speed and cannot brake. Point the nose where you want the course to go, and give the order. They spend propellant for what they change, as the drive would. And while they push they throw a magnetic field: early in the war the magnetometers barely feel it, but late in the war, when magnetics is the hunters' keenest sense, it is their tell, and a magnetic mine feels it too.

**Ultra-quiet turns on the gravitic thrusters.** That is what sets it apart from silent running: rigged for ultra-quiet, every course change goes to the thrusters, silent but slow and magnetic. `grav off` keeps the drive while you stay ultra-quiet, and `normal` hands the telegraph back to the drive. One rule always holds: an order the thrusters can't carry out (`burn to`, `burn 30`, `full stop`, `slow to`, flank) takes the telegraph back to the drive at once, and the engine room says so.
- **Propellant is limited.** Every burn spends it. The registry lists each class's total.

**Flight assist.** If your ship has a compensator, `C` engages flight assist: it fires thrusters to keep your velocity along the nose at a set speed, so the ship flies the way you point it. A civilian hull's thrusters are movable: they swivel to push from any side, so the autopilot can hold a course, cancel a drift or stop her without turning end for end. They are slow, about three quarters of a hauler's main drive, and loud: quieter than the drive, but far louder than a drifting hull, and the autopilot's radar radiates the whole time it is on. It is real thrust. It costs propellant, it can be heard, and near a moon it has to fight gravity the whole time. Use it to get somewhere; switch it off to hide.

The autopilot holds a speed, not a destination. Point her at a contact, a waypoint or a chart position (`steer s1`, `helm wpt`, `point`) and she flies straight at it at the speed you set, through it and on past. She does not slow down as she comes near, and she does not stop there. To stop, order `all stop` (or press `x`), which brings her to rest on the thrusters; how far she runs on while she stops depends on her speed. The helm's reply to an order that points her at something says this while the autopilot is on.

### Orders relative to a target

The conn can work out a course on a contact for you, as a navy's plotter does:

- `put s1 starboard 30` marks the heading that puts S1 30° off the starboard bow. `port`, and the navy's `green` (starboard) and `red` (port), work the same way, from 0 to 180.
- `close s1` marks the course straight at her, and `open s1` the course straight away.
- `station s1 astern` marks the course to take station astern of her, by her own course, at your present range. `abeam` is on your side of her, and `ahead` is ahead of her. Add km to set the distance: `station s1 astern 300`. Once you are on station, it marks her own course.
- `intercept s1` marks the lead course: the one that meets her at your speed. The plotter says how long it takes.

**These orders only mark.** Each one arms the helm dial, the steering line, as a click on the plan does. The arm shows on the rose and the plots, and `ORDER` shows in the header. Nothing turns until you press `Enter`. `Esc` drops it, and it lapses after 8 seconds, as a click does. They are not `match s1`, which points for the burn that matches her velocity.

**A mark is only as good as your solution.** The plotter works from fire control's solution, carried forward to now, and says its grade. On FAIR, expect to correct. On POOR, the mark is a guess, but it is still marked, because the call is yours. If the crew grade the solution lower than fire control, they say so too. With no solution, `put`, `close` and `open` work from her last bearing heard, and the plotter says so. A station or an intercept needs a solution, so without one nothing is marked.

**Your speed** is what flight assist holds, or else what you are making now. When no course at that speed can meet her, or you have no way on, the plotter says so plainly and marks nothing. On a warship the mark turns the nose, as any helm order does. Your course changes only when you burn.

## 8. Passive array

Your passive array listens. It gives you a **bearing** and a **signal strength**, and nothing else. It never tells you how far away something is.

**What decides whether you hear a ship:**

```text
signal excess = target's emissions − loss over distance − your background − threshold
```

- **The target's emissions:** louder ships are heard farther. Burning ships are much louder.
- **Loss over distance:** about 6 dB every time the range doubles.
- **Your background:** your array's own floor, plus your own vessel's emissions leaking in. **Burning makes you deaf** as well as loud.
- **Threshold:** how good your array is.

Near zero excess a contact fades in and out. Well above zero it is held steadily, with a sharper bearing.

**Why arrays differ.** A bigger array hears better. Doubling an array's width gives it four times the area, so it gathers about 6 dB more of a passing signal, and its bearings are twice as sharp, because a beam narrows as the array widens. Big ships carry big arrays. The cruiser tows the largest in the fleet, 20 m across, well clear of its own hull, so half as much of its own noise leaks in: the finest ears in the fleet, with a wide deaf arc astern (70°). The ghost's array is half that width. She makes up for it by being the quietest ship in the fleet. Who hears whom first depends on what each ship gives off as well as on what each can hear, and a destroyer gives off 38 dB more than a drifting ghost. Real navies made the same trade: big ships with long towed arrays hear best, and small, quiet boats are heard least.

**Baffles.** Every array is deaf in a cone astern, where its own drive is. A ship behind you can be close and silent. To check, turn: this is called *clearing your baffles*.

**Transients.** When a ship you can hear suddenly gets louder, the log calls a **transient**. Usually it is a drive lighting up, and often that means you have been heard and something is coming.

**Moons block everything.** No sensor works through a planet or moon.

## 9. Range from bearings: TMA

Target motion analysis turns a series of bearings into a range, course and speed. Each bearing says "it was somewhere on this line, at this moment". If the target holds a steady velocity, only one track fits all the lines. In space a coasting ship really does hold a steady velocity, so TMA here is very good, if you give it what it needs.

> [!IMPORTANT]
> **You must manoeuvre.** If you fly a straight line, range cannot be worked out, however long you listen. Change course (a *leg change*), burn briefly, drift again, and the solution firms up. Watch it happen on the nav plot: the lines of bearing start to cross.

**Quality** is the uncertainty compared with the range: `GOOD` under 10%, `FAIR` under 30%, otherwise `POOR`. `POOR` solutions show no numbers, because they mean nothing yet. If the target manoeuvres (a transient), its solution starts over. Before it calls a solution `GOOD`, fire control also works the bearings again from a nearer and a farther start. If another track at a different range fits them about as well, the range is not known, and the grade drops to match. The grade is fire control's own and nobody else changes it. The crew judge it separately: they will not call a target that manoeuvred better than `FAIR` until she has run steady for five minutes (a ping echo skips the wait), and they say when they doubt a solution for that or another reason. Fire control will fire on its own grade; whether to wait for the crew is your call (see [The computer, the crew and you](#the-computer-the-crew-and-you)).

**A solution is an estimate, never the truth.** Fire control works from bearings, and every bearing carries a little error, so even a GOOD solution can be off, and now and then badly off. That is how tracking by ear works, and the trainer keeps it so on purpose: the debrief's true picture shows how far off you were. Another leg sharpens a solution. A straight runner trusts it completely, so it pays to wait for GOOD; a homing torpedo corrects its own aim on the way.

**Better sensors make better solutions.** Sharp bearings from a strong signal give a fast, tight solution. A civilian array on a faint warship may never get one.

### Doppler

The passive array also reads the **Doppler shift** on a target's narrowband lines: how fast it is opening or closing along the line of sight, relative to you. It is as sharp as the bearing in proportion, about 10 m/s for an attack boat's array at the threshold, and sharper on a strong signal. What it does for you:

- **It speeds up TMA.** Bearings alone can't give range from one straight leg; bearings with Doppler can (a test leg: 2,037 ± 34 km against a true 2,042). The solver allows for a target that may have changed course or speed: every bearing and Doppler reading counts for less the older it is, by how far a target could have strayed since, so fresh data leads and a manoeuvre doesn't drag the solution off.
- **It catches manoeuvres, even silent ones.** Once a contact has a FAIR or better solution, every Doppler reading is checked against what the solution predicts. When they drift apart by more than 50 m/s, the log calls it (`S1 manoeuvring, bearing 040°: its Doppler is off the solution. Starting over.`) and TMA starts over from there, as it does after a transient. A target that turns on its thrusters without lighting its drive can no longer hide the turn.

### Working the track by hand

The crew grades its solution and you wait for GOOD. You don't have to. **`track s1 1200 090 0.6`** gives the contact your own track: 1,200 km out along its latest bearing, moving level on course 090 at 0.6 km/s. While it stands, the crew's solver stands aside and fire control uses yours. The vessel window shows how it fits, `YOUR TRACK  fits at 1.2σ`, and a strip of the latest bearings, oldest first:

| Mark | The bearing heard sits, from your track's |
|---|---|
| `·` | within its own error: a fit |
| `›` `‹` | one to three errors right or left |
| `▶` `◀` | more than three errors right or left |

A strip of dots is a good track. A strip that drifts steadily one way says your course or speed is off; one that runs off at the newest end says the target has turned. Your track is graded by the crew's own rules, so a good one reaches GOOD as soon as the bearings support it, often before the crew's solver does, and one that misses them is graded down. It still needs a leg change: a track on one straight leg fits at many ranges, and it stays POOR, however well it seems to fit. A bad track is your own fault, and fire control fires on it. `track s1 off` hands the contact back to the crew.

### Trust the geometry

A bearing alone gives no range. Range comes from **parallax**: how far a bearing shifts as you move. Astronomers use it for a star's distance, with Earth's orbit as the baseline. Here your boat's own legs are the baseline, and the shift of the bearing across them gives the range.

A star holds still, but a ship moves. Part of a contact's bearing shift is her own motion, and one leg cannot tell it from parallax. A second leg, on a new course, separates the two. That is why TMA needs a leg change.

The level is a second, separate measure. Received power falls with the square of range. So if the solution has the range growing from r₁ to r₂, the level should fall by about 20·log₁₀(r₂/r₁) dB. That is about 6 dB for each doubling, 12 dB for four times the range, and 20 dB for ten times. When the two agree, the level fits the solution. A fade much faster than the solved range allows is a source getting quieter, not a ship leaving. So is a fade while the bearing and the solution stand still.

When geometry and level disagree, believe the geometry: **Trust the geometry.**

## 10. Active array

A ping finds things. It sends out a pulse and listens for the echo, which gives **range and bearing at once**. Two echoes a few seconds apart give a `GOOD` solution almost immediately.

**The catch.** The echo has to travel out and back; the ping only has to travel out. So **a ping is heard far beyond the range at which it finds anything.** The registry's active array table shows the gap: a destroyer's ping finds a hauler at about 2,400 km, and that hauler hears the ping from more than 45,000 km.

- **When you are pinged:** the `PING` pill flashes, the rose shows the pinger's bearing, and the log says so. The pinger now knows roughly where you are, if the echo reached it, and you can't tell whether it did. Assume it did.
- **How the crew call pings.** The first ping from a contact, or the first after five minutes without one, gets a full call: `PING. Active array, S3, bearing 270°.` After that they call it short, with what they can hear change: `PING. S3, 268°, louder.` or `fainter`, a change of 3 dB or more, and `pinging faster` when the beat quickens, which is how an attack run starts. Pings with nothing new fold into one line every three minutes or so, with a count: `PING x6. S3, 265°, same strength.` is six pings since the last line. When the pinging stops, the pings still folded are told three minutes after the last, or at once if the fight ends, with the trend as it stood, so the log keeps the end of an attack. The `PING` pill and the bell still mark every one.
- **"They may have us"** is the crew's judgement, and they say it only on something they heard: a strong ping (70 dB over threshold, which a warship's ping reaches well before its echo off a ghost has a fair chance), the beat quickening, or a contact closing on a constant bearing. Each is said once a run, and each quickening. They can be wrong both ways. A ping sounds fainter while your own drive is loud, though the pinger's echo is no weaker for it, and a civilian hull's array hears pings so faintly that its crew rarely calls one strong.
- **When you ping:** your own waterfall whites out for a second, and every ship within a very long range now knows exactly where you are.
- **Recharge:** after a ping, active array needs time to recharge (`ACT` on the own-ship panel).
- **Target strength, by hull shape:** a fat cargo hull returns a big echo; a lean warship less; a ghost's long, skinny hull hardly any. That is why a ghost is built like an old WWII submarine. A destroyer's ping finds a silent ghost at only about 150 km, inside the ghost's torpedo reach, so a ghost can close on a convoy without being pinged out first.

## 11. Gravity wells

Moons and planets pull on every ship, by the real inverse-square law.

- **Coasting near a moon puts you in an orbit.** Holding a straight line means fighting gravity, which costs propellant and, with flight assist, emissions.
- **Bodies block every sensor.** A moon between you and a hunter is perfect cover, for both of you.
- **Hitting one destroys the ship.** Watch `ALT`.

## 12. Nebulas

Nebulas are charted clouds. They are on every chart, like moons. Each kind does one thing to your sensors, and its colour tells you which:

| Colour | Kind | Effect | For both sides |
|---|---|---|---|
| Brown | **Dust** | Swallows signal. Anything heard through the cloud loses about 20 dB for every 1,000 km of the path inside it. Pings pay twice, out and back. | A burn inside it goes unheard, and a ship beyond it is hidden. |
| Electric blue | **Ion** | Static. A sensor *inside* the cloud hears a much louder background, so it goes deaf. Signals pass through it freely. | Any ship inside it goes deaf. Quiet military arrays suffer most. |
| Violet | **Storm** | Electric discharges: loud cracks from random points inside it, heard far away. Each one masks every array near it for a second. They are never contacts. | Every array near a crack is masked for a second, yours and theirs alike, so contacts flicker near one. |

- The rules are the same for every ship. A hunter in dust can't hear you, and a hunter in an ion cloud is deaf.
- Entering a nebula drops time compression back to x1 and lights a pill in the header.
- The log reports storm discharges at most once every two minutes per storm. Each report gives a bearing; it is weather, not a ship.
- **A burn heard outside the dust gives a ship away.** The drive takes time to spool down, and the near half of a cloud hides a burn better than its far edge.
- **A scenario may thicken a cloud, or make it glow.** A cloud's static, its dust and an infrared glow (a warm cloud is a bright backdrop, as a planet is) can each be set, so one cloud can blind the array, pings and heat together. `HEARD AT` allows for the cloud you are in.

**Rock fields** are asteroid fields and debris clouds, charted as one area because no one can chart every stone. They block signals as dust does, so a boat can hide in one or behind it. Anything moving inside gets struck. Strikes come more often the faster you go, and each one hurts with the square of your speed: at 0.1 km/s you can creep through, and at 3 km/s the field will break you. The enemy takes the same risk, and its captains read the chart: they keep off moons, go around a field at speed, and creep through slowly. To practise, the test bench's *The Asteroid Field* (`data/testbench/asteroid_field.ron`, loaded by path) puts three rows of rock across your way to a beacon, each with one gap.

**The chart is not complete.** Every ship sails with the fleet's chart of the known fields, and the overlays draw only what is on it. Some fields are missing from it. You find one when you pass within about 50 km of its edge, when a ping's echo comes back off it (rock fields, out to about 1,000 km), or when you strike it. The crew calls it (`NAV  Close aboard: rock field not on the chart, bearing 042°, edge 38 km. Marked as observed.`), and from then on it is on your overlays, marked *observed*. Until then the helm cannot warn of it and fire control cannot see it across a run. The enemy sails with the same chart, so a field it doesn't know can catch it too.

**Debris fields** are finer than rocks. They hide you less, and strikes come three times as often at a third of the damage, so a fast pass bleeds you rather than breaks you. **Wreck fields** are graveyards of dead hulls: small, thick with cover, and full of old steel that swamps magnetic sensors around anything inside.

**Belts.** A field can be a ring, not a sphere. A belt is a wall from the side and thin from above, and it has a clear hole in the middle. The plot draws it as it lies: a ring from above, a thin line in profile, tilted in the 3-D view. The way past a belt is often over the rim, and a tilted belt stands high on one side and low on the other. Check the profile before you trust the plan.

**Warm points.** Debris and wreck fields hold still, warm sources about as bright as a boat at rest. They show on the infrared waterfall as straight lines, and nothing marks them. A hull inside the field keeps that clutter as cover while it holds still: up to 12 dB in a wreck field. All of it is gone at 0.3 km/s, because a hunter sorts the lines for the one that moves. This holds for you and for the enemy: if a line on your waterfall is creeping, it is not scrap.

**The navigational shield.** `H` (with a Shift, because it is loud), or `shield up` and `shield down`, stops strikes up to its rated speed, 0.6 km/s on a boat and 0.8 km/s on a warship. Above that they come through. It draws on the weapons load and shows: it radiates about as loud as the autopilot, and it adds a big field to your hull. So it is a trade. With it up you can cross a field at twice the safe speed and be heard doing it. With it down you creep, or you take the strikes. Enemy captains raise theirs to pass a field at speed, except silent captains, who would rather be struck than heard.

**The helm calls fields too.** If your course runs into a field faster than is safe, the helm calls a collision course, as for a moon. A tired crew takes more strikes, because nobody calls the big ones in time.

#### Torpedoes and rock

A torpedo is a small ship, and rock stops it too. It is small, so it is struck less often than a boat on the same path, but at a torpedo's speed one strike ends the run. An armed warhead goes off on the rock, and everyone near hears it; an unarmed one breaks up. A homing torpedo picks its way past what its seeker can, so it is stopped about half as often as a straight runner. Across 500 km of rock, about two straight runners in three are stopped, and about one homing torpedo in two. The field also hides the target from a seeker, as it hides any signal.

So rock is torpedo cover as well as cover from ears. A boat tucked behind a field is hard to hit, and a good firing position has a clear line to the target. Fire control checks the run against the chart: the grid marks the cell `rock North Sill`, and the launch line warns. Your crew calls it when one of your torpedoes hits rock: `TORPEDO Tube 2: detonated on rock in the North Sill.`

## 13. Torpedoes

Torpedoes are the main weapon, yours and the enemy's. A torpedo is a small, fast ship with a warhead: it is heard like a ship, it hides in dust like a ship, and its seeker goes deaf in an ion cloud like any array.

**Two kinds.**

| | Straight runner (`MK1`) | Homing (`MK2H`) |
|---|---|---|
| Goes | to the point in space fire control aimed it at | after the loudest enemy its seeker hears, once armed |
| Against a coasting target | exact, if your solution is good | good |
| Against a target that burns after launch | misses | follows it |
| Against a quiet target | fine, if you had a track before it went quiet | hears it only close in |
| After its burn | coasts, almost silent | keeps burning while it steers |

**Fire control** aims a shot at a contact from *your* TMA solution, the way a WWII attack team set up a torpedo data computer. It needs at least a `FAIR` solution. A `GOOD` one is usually a hit; a `FAIR` one wants a spread (`salvo 3 s1`). The log reports each shot's course, run and time to impact, and the contacts table counts it down.

**Arming distance.** Like American WWII torpedoes, a warhead arms only after the torpedo is 40 km from the boat that fired it, so the blast can't reach the launcher. **Inside that distance a hit is a dud.** Torpedoes are useless at close range; fire control warns you when the meeting point is too close. It also warns when the run to the meeting point passes through a charted moon or planet ("The run crosses Mere: it will strike it.") or a rock field ("rock may stop it").

- **Boost, then coast.** `fire s1 burn 30` burns for 30 seconds and then coasts silently: a straight runner coasting is heard only from a few tens of km. Fire control allows for the shorter burn. **The speed setting** does the sum for you, as a WWII torpedo's speed setting did: `fire s1 speed 2` (or `fire 045 speed 2`) burns until the torpedo makes 2 km/s over your own speed, and the log gives the burn (`Set for 2.0 km/s: a 40 s burn`). A Mk 1 makes 6 km/s flat out, a Mk 4 about 8, a Mk 5 or Mk 0 about 3.6; a speed past the torpedo's best is refused with its top. Slower is quieter and shorter-ranged, and gives the target longer to move. Use a burn time or a speed, not both.
- **A launch has an edge.** A ghost launches cold, but the launch is still louder than the boat, even with its reactor up: a destroyer hears it to about 600 km. The torpedo's motor is small, and is heard no farther than the boat itself, about 250 km. Fire from beyond 600 km and nobody hears you shoot, but a straight runner reaches only about 1,200 km flat out and a homing torpedo about 1,000, so the band is narrow, and a solution is worse the farther off you are. Inside it, the launch is a transient anyone listening can hear, with its bearing. A warship's tubes are far louder.
- **Tubes reload** from the magazine, with the same kind if any is left, or the kind you ordered. Reloading takes minutes, and each torpedo room's crew loads one tube at a time: fire all three bow tubes and the last is ready three reloads later. The stern tube has a room and a crew of its own. See [Choosing what's in the tubes](#choosing-whats-in-the-tubes).
- **A hit is heard:** a detonation, and breaking-up noises if it sank her. There is no sound in space: the crew keeps the old name for the burst of EF and heat as her reactor and power fail and her air vents. With none, the torpedo reached a hull that stayed afloat. See [What a hit does](#what-a-hit-does). A torpedo that runs out its time without a hit scuttles itself, and the log says so.
- **Gravity is not in fire control's sums.** Near a moon, a straight runner curves and misses.

### What a hit does

A torpedo does damage in **hull points**, set by its warhead and how close it passed. Every hull has its own figure, listed in [Hits to sink](#hits-to-sink). The damage goes through the same path as a gauss slug, so it lands by direction, knocks systems, can start a fault, and can leave a captain crippled and running. See [Damage](#17-damage) and [Breaking off](#breaking-off).

- **The pass decides.** A warhead does the most at the hull and falls off across the kill zone. At the edge a proximity burst does a quarter of its best. A near miss hurts, and a direct hit hurts far more.
- **Small hulls still die to one good hit.** A ghost, a hauler, a raider or a freighter goes with one. A near miss can leave any of them afloat, hurt and angry.
- **Big hulls do not.** A destroyer takes one good hit and is usually crippled by it. A cruiser takes three or four, and a fleet tanker four or five. Bring the salvo the target needs, and count what is left in the racks before you start.
- **A hull that lives knows.** Its captain knows which way the torpedo came from and goes back down that line. Its mates go to the blast as they would to a sinking, and merchants run. Only a sinking counts for tonnage and goals, so a crippled ship left behind pays nothing.

**What the crew can tell you.** A hit that leaves a hull afloat says nothing of what it broke. For a quarter of an hour after the hit, the sensor station watches the contact and reports what changes, once each, in the log and on the vessel panel's `READS AS` line:

- **She lit her drive:** she is under power, whatever the hit broke.
- **She is quieter by so many dB:** her drive or reactor may be hurt.
- **She has not been heard since the hit:** she may be crippled and dark.
- **She has not pinged since the hit**, when she was pinging before: her pinger may be out.

Every one is an estimate. A captain who cuts her drive and goes silent reads exactly as a hurt one does, and the crew says so. They report only what the boat's own sensors heard.

**Sizing a salvo.** Fire control's default spread covers your solution's error, so that one torpedo in the fan reaches the hull. Against a ship you can sink in one, that is what you want. Against a cruiser or a tanker, a tight salvo on a `GOOD` solution puts more warheads on one hull: give the degrees yourself (`salvo 4 s1 0.2`). Once the crew has called a class, the fire control window's chosen row and `check s1` give the crew's count of good hits to sink it. It is an estimate, and only as good as the call.

### Torpedo flaws

Torpedoes fail, as WWII's did. Each one is rolled at launch for one flaw, at most:

| Flaw | What happens | Mk 1 | Mk 2H | Mk 3L |
|---|---|---|---|---|
| **Dud** | It strikes the hull and doesn't explode. The target lives, and knows. | 12% | 8% | 5% |
| **Premature** | It explodes on its own, short of the target, and the blast warns everyone. | 5% | 5% | 3% |
| **Wide** | Its gyro is off by 3°: about 10 km wide at 200 km. Straight runners only; a seeker corrects itself. | 8% | none | none |
| **Circular** | Once armed it comes back, flat out, for the boat that fired it. The log warns you. Run, drop a decoy, or both. | 1% | 2% | 1% |

The log reports a dud, a premature and a circular run on your own torpedoes. Fire a spread when it matters, and never wait in the path of your own shot.

### Torpedo wear

In a career each torpedo carries her log: the practice runs she has made in exercises since she was built. Each run raises all four of her flaw odds by about 1 per cent of the figures above, so a torpedo with 30 runs is about 30 per cent likelier to fail. A career's torpedoes carry the figures above in every era, and wear is the only addition: the war campaign's higher early-war odds do not apply in a career.

The depot issues them already run: about 20 runs each in the early war, some over 40; about 8 in the mid war; and about 2 late, when most are new from the factory. The crew load the freshest of each kind first and leave the worn ones for later shots, and each torpedo keeps her runs from the depot to the tube to the shot. Fire control's detail lists every torpedo in the tubes, the magazine and the racks with her runs (`MK1  23 runs`): see [Fire control](#fire-control). The runs are her log, and nothing more: whether she carries a flaw shows only when she runs.

Outside a career a torpedo carries no practice runs, so none adds to her odds. At base the yard can draw fresher torpedoes: see [The yard](#the-yard).

### Practice shots

In a lesson your torpedoes are practice shots, the way the earliest submarine crews trained: fired at a real ship, then hoisted back aboard to fire again. A practice shot carries an inert head as heavy as the warhead. She runs exactly as a warshot would, on the same solution, the same run and the same hit test. A shot that would have hit registers a training hit: the log reads `Training hit: she counts as sunk.`, and the target counts as sunk for the lesson's goals, so a lesson won by sinking her is won the same way. The target takes no harm. She acknowledges the hit and stands out of the exercise. The header reads `TRAINING`, and so do the log and the debrief. A training hit is never counted as a sinking, on the ladder or in any record.

At the end of her run a practice shot stops her motor, lights her beacon and drifts. The plot labels her `T1 adrift`, and the contacts table lists her as `shot adrift`. `recover` brings her aboard: close within 2 km of her, all but stop, and hold steady for 10 minutes, as for a life pod. A lesson won on a kill ends at once, and the debrief lists the shots left to be recovered. A shot lost on her run, to rock, a mine, a body or a gun, or one still out when a lesson ends without a win, costs the exercise a torpedo.

The debrief judges each practice shot by how close she passed the target: a training hit, a near pass, a loose pass, or wide.

### Carriers

A **carrier** is a cold shell with two homing torpedoes aboard. The attack boat carries two, in place of two Mk 1s. `carrier s1 40m` sends one at S1, to release its torpedoes in 40 minutes. It needs a `FAIR` solution. A carrier holds for 10 minutes to 6 hours.

A kick motor throws it from a tube, and then it coasts, about as quiet as a mine. When its time comes it lets its torpedoes go, 300 km short of where fire control reckons the target will be. The enemy hears torpedoes on a bearing that leads nowhere near you, and it may run down that bearing. By then you can be somewhere else.

- **It knows only what it was told.** It hears nothing, and no link reaches it. A target that turns or burns after launch is not where the carrier thinks. The seekers may still find it, and they may not.
- **A longer hold is a longer gamble.** The longer it coasts, the more an error in your solution grows.
- **A short hold may be out of reach.** The kick is small: about 2 km/s. If fire control can't get it there in time, it says so.
- **It takes a tube.** The order takes the next ready tube. That tube's torpedo goes back to the magazine, and the tube then reloads as usual.
- **It is never a reload.** A carrier leaves a tube only when you send it.
- **It is not invisible.** A pinger can find it, and a crew that hears it may call it a torpedo.

Computer captains don't use carriers yet.

**What a failure tells the enemy.** Each one tells a different story. A premature is a blast on the way from your boat, heard for 1,500 km, and enemy captains go to it. A dud that strikes tells its target which way it came from, and the captain goes back along that line. A wide run tells nobody.

**The war.** Torpedoes improve as the war goes on. In the war campaign, early war's dud, premature and wide odds are half as high again as this table, and late war's are 0.6 of it, for both sides. A boat keeps the odds it sailed with.

### The exploder setting

You choose how each salvo's warheads go off.

| | Proximity (`prox`), the standard | Contact |
|---|---|---|
| Goes off | passing within 8 km of a hull | only much closer in: 3.2 km |
| At the hull | 85% of the warhead: it bursts clear of the plates | all of it |
| At the edge of its zone | about a fifth of the warhead | four fifths: a contact hit is a true hit |
| Duds | as the table | half as many again |
| Prematures | as the table | a tenth as many |
| Choose it for | a shot you can't afford to miss, at the cost of more near misses | a good solution on a big hull, or when an early blast would give you away |

`fire s1 contact` or `salvo 3 s1 contact` sets one salvo. `exploder contact` and `exploder prox` set fire control's standing setting, and the `FIRE CONTROL` window shows it. Fire control sizes a spread for the setting, so a contact spread is tighter. The computer captains use proximity.

### The seeker setting

A homing torpedo's seeker normally switches on as the warhead arms, and listens all round for the loudest enemy. Against a target behind an escort, that is the escort. Two settings change it:

- **`seeker 800`:** the seeker stays off until the torpedo has run 800 km. Until then it holds the course fire control gave it, and a ship it passes on the way is never heard.
- **`seeker narrow`:** once on, the seeker listens only in a cone 20° either side of the torpedo's nose. A ship off to the side is ignored, however loud.

Together, `seeker 800 narrow` shoots past a screen at the ship behind it: aim at the target, and set the seeker to switch on beyond the escort. `seeker wide` widens the cone again, and `seeker off` goes back to the standard: on at arming, all round. Straight runners have no seeker and ignore the setting. The computer captains use the standard.

**The setting stands until you change it,** like the exploder setting. The `FIRE CONTROL` window shows it beside the exploder setting whenever it is not the standard. A homing shot whose meeting point is nearer than the seeker's distance would run past its target deaf: its cell reads `seeker 800km` in amber, `Enter` never offers it, and the launch line warns you if you fire it anyway. Set it for the shot, and give `seeker off` after (`seeker 800 narrow; fire s1; seeker off`).

### Choosing what's in the tubes

A tube fires what is in it, and it reloads with the same kind. You can change either.

| Order | Does |
|---|---|
| `load 2 mk2h` | Swaps tube 2's torpedo for an MK2H now. The old one goes back to the magazine. It takes a full reload, and the handling gear radiates while it moves the weapon: 105 dB of EF for 10 seconds on an attack boat. |
| `reload 2 mk1` | Tube 2 takes an MK1 next time, whatever it holds now. This is silent and costs nothing. `reload 2 same` undoes it. |
| `load 2 empty`, `reload 2 empty` | Tube 2 stays empty, now or after it next fires. Use it to stop the last homers going to a tube that won't bear. |

An order given while a tube is already reloading changes what arrives, at no cost. If the kind you ordered runs out, the tube takes whatever is left. The `TUBES` line and the fire control window mark an order as `1:MK1>MK2H`, and `>--` for a tube held empty.

The mine bay does not use the tubes, so an empty tube holds nothing back for a mine.

### Choosing the load before sailing

On the title screen, `l` steps through the loads a boat may sail with, and shows what each one trades. The choice holds for every launch from that screen. Today the attack boat has four besides the standard. A hull without that load sails with its standard one.

| Load | Carries | What it trades |
|---|---|---|
| `standard` | 6 MK1, 4 MK2H, 2 carriers | |
| `fast` | 8 MK4F, 4 MK2H | The fast runner arrives in about three-quarters of the time, but its motor is heard far beyond the boat. |
| `quiet` | 8 MK5Q, 4 MK2H | The cold runner is barely louder than a drifting boat, but it is slow and has less reach. |
| `escape` | 8 MK1, 2 MK2H, 2 MK6D | The defensive homer arms at 15 km and runs about 300 km. It is for a hunter already on top of you, at the cost of two ship-killers. |
| `racks` | 8 MK1, 4 MK2H, and 4 MK1 on external racks | Four more shots, at a price. |

**External racks.** `load 2 rack` brings a torpedo in from outside the hull. It takes three reloads' time, it is 10 dB louder than a swap, and it can't be done inside a cloud. A rack torpedo's dud, premature and wide odds grow by a tenth for every hour since sailing. The racks never fill a tube by themselves.

### Countermeasures

Two things to throw at a torpedo, or at a hunter:

- **Static buoy** (`j`, or `buoy` on the conn): drops astern and roars for 90 seconds, louder than any hull at rest. Anyone listening toward it hears its static on top of everything near its bearing, so targets there fade. A homing torpedo chases the loudest thing in its cone, so it goes for the static buoy.
- **Decoy** (`d`, or `decoy`, or `decoy 090` for a course): a drone that sounds and echoes like your ship did at the moment you launched it, and runs on along your course (or the one you give it) for ten minutes. A tracker or a seeker can't tell it from you.

The `CM` gauge shows what you have left and the launcher's reload. Your countermeasures are on the nav plot as `○` (static buoy) and `◎` (decoy) with their seconds left.

**A drilled crew is harder to fool.** A seeker can't tell a lure from a ship, but a crew may, given time. Once the crew calls a contact a lure, a drilled captain leaves it alone. Green and pirate crews chase anything loud.

**Straight runners ignore both.** A straight runner goes to a point in space, and its fuze answers only to a real hull. Countermeasures beat homing torpedoes and confuse hunters; against a straight runner, only moving off its point works.

### Gauss guns and beams

Destroyers carry a **gauss gun**; cruisers carry a gauss gun and two **beams**; a ghost carries one weak beam, its deck gun. Both wear down a hull a little at a time: watch `HULL`.

**Armour** depends on the hull and what it is made of. A ghost's hull is built to damp its emissions, the opposite of armour, so it takes every hit in full. Merchants carry commercial plate, raiders and hunters light steel, destroyers heavy steel, and cruisers ceramic laminate, which shrugs off a beam's heat best. Armour stops slugs and beams. A torpedo or mine blast is too big for plate, and the hull's frames answer for it: see [What a hit does](#what-a-hit-does).

| Hull | Material | Slug damage taken | Beam damage taken |
|---|---|---|---|
| Ghost | damped skin | all of it | all of it |
| Hauler, freighter | commercial plate | about 3/4 | about 5/6 |
| Raider, hunter | light steel | about 3/4 | about 5/6 |
| Destroyer | heavy steel | about half | about 5/8 |
| Cruiser | ceramic laminate | half | about 2/5 |

- **Gauss gun** (`g`, or `gauss s1`; `rail s1` still works): a coilgun. A row of coils pulls an iron slug down the barrel and fires a burst at 10 km/s, aimed where the target will be and spread across its uncertainty. Slugs are silent in flight, but the coils leave them magnetised: a ship with a magnetometer feels a burst passing within a few tens of km. It gets a log line (`MAG  Gauss slugs passing, bearing 045°, 18 km. Someone is firing at us.`), short marks on the rose's ring and `∴` marks on the plot in the magnetic colour. That is a second or two before they pass, too late to dodge, but it tells you someone is firing at you and roughly where from. The burst itself thumps on sound and flashes on EM. Fire control needs a ping echo from the last 30 seconds or a FAIR solution, and won't shoot beyond 60 km: very short range, but rapid fire with no long charge, and it chews through a ghost's bare hull in a single burst. Ping, then fire.
- **Gauss burst into an area** (`K`, or `gauss s1 area`). A burst into the area of your estimate of S1: its solution, or the middle of its range band. It needs no solution, hits only by chance, and tells everyone where you are.
- **Beam** (`lase s1`): one shot from a capacitor, which then takes a long time and a lot of power to charge: a cruiser's two each take 60 s and between them the whole reactor; a ghost's one takes 90 s and most of its reactor. Light arrives at once, so nothing dodges it. It hits if your aim is good, which takes a sharp bearing and a fresh echo: easy close in, hopeless at the limit of its reach (200 km for a cruiser, 60 km for a ghost). A miss wastes the charge. Its damage falls with the square of range. Every shot lights you up on every ESM receiver for thousands of km, and the `BEAM` pill shows while a capacitor charges. A hit also heats the target's hull: a ship under a beam glows on infrared for minutes afterwards, which makes it easier to find again. A beam is light, so the ship it hits sees where it comes from: `BEAM ON US from bearing 180`, with a flash on the rose. Fire it again and again and the shooter's bearings pile up.
- **Beam against a torpedo:** a beam can shoot down a torpedo, and any hit kills it. The sum is how late you find it against how long a shot takes to come round: hold your fire until it is close, because a shot at long range is usually wasted. A cruiser that does stops most single torpedoes, but it has two shots, so a spread of three gets through. A ghost's deck gun is a lucky shot, no more. A torpedo that coasts in from far off may not be found in time at all.

**Why a ghost uses torpedoes.** Guns and beams give the shooter away: the thump, the EM flash and the beam's own light all point back at you. A torpedo, used well, hides where it came from, is hard to see on its way, and does more damage at a stroke than either. Warships are big, loud and heavy; they rush in and use the beam at medium range and the gauss gun close in. That is why a destroyer that has found you wants to get close.

**Overloading the guns** (`overload on`, `overload off`): damage and charging power rise to 130%. Each burst or shot has a 10% chance that something gives. About a third of those hurt the guns. The rest trip the weapons breaker for a few seconds. Use it to finish something, not as a habit.

### Mines

Mines wait. They are nearly silent, cold, small and still, and they never go off for their own side. A mine's blast is in hull points, like a torpedo's, but a mine has no aim to be true or wide: it does the same at any distance inside its zone.

| Mine | Goes off | What it misses |
|---|---|---|
| **Acoustic** | when something loud passes within 15 km | a quiet ship: a drifting boat passes close and lives. A static buoy within 15 km sets it off |
| **Magnetic** | when a hull's field is strong enough at the mine, within 15 km | a weak field: a running attack boat trips one at about 4 km, one with her reactor shut down only within about 2 km. Hard turns near one widen its reach |
| **Captor** | when it hears anything over 80 dB within 100 km: it launches a homing torpedo that arms almost at once | a quiet ship: it hears a boat on silent running only within about 13 km. Its torpedo homes like any other, so a static buoy draws it. One that fires at you has detected you, as a hunter would |

**Finding them is hard, but not impossible.** Passive array and infrared won't find a mine. A ping will, out to about 120 km from an attack boat, but a ping tells everyone where you are. A magnetometer feels one within about 2 km. Found mines show as `✱` in the contacts table (`MINE`), on the plot and on the chart, where they stay. Charted minefields are drawn as boxes.

**Laying mines** (`lay`, `lay acoustic`, `lay magnetic`, `lay captor`): an attack boat carries two of each. A mine stops dead where it is laid; yours are drawn as `✱` in your own colour and never go off for you. The `MINES` line shows what is left.

**Clearing mines.** A mine is as deadly to a destroyer as to a ghost, so the navy sweeps. The sweeper craft (`mil-sweeper`) does the job: a small craft from a carrier's deck with a crew of two, a pure ceramic hull a magnetic mine barely feels, and a quiet sweep. A destroyer carries loud gear as a stopgap. `sweep on` streams the gear and `sweep off` recovers it. It works only at its speed or under, and the crew tells you when you are too fast.

| Gear | Lane | Speed | Heard | Its own field |
|---|---|---|---|---|
| Sweeper craft | 20 km wide | 0.3 km/s or less | next to nothing, and a faint pulse on a magnetometer | ceramic: a magnetic mine barely feels it |
| Destroyer | 6 km wide | 0.15 km/s or less | loud on every array and magnetometer | steel: it still trips a magnetic mine about 4 km off, outside its lane |

A working sweep clears magnetic mines within half its lane's width, and acoustic mines out to their own 15 km reach and that half-width again, since the sweep sets them off ahead of the hull. **A sweep does not stop captors.** A captor hears a loud ship from 100 km and fires long before any sweeper reaches it, and one that is swept fires at the loudest thing it hears. A captor misses a quiet ship, and its torpedo follows a lure like any homing torpedo.

**Sweepers go out long before the fleet.** A sweeper works the whole well, with three days of crew. A carrier that has an enemy field on its chart sends two at once, however far off the field is: they fly out to its near edge, sweep side by side through it on the carrier's line, about 40 km of channel, and come home with the lane swept. `launch sweep` sends them from your own deck. A destroyer's captain sweeps only after mines go off near it, and only while it holds no contact, since its first job is the hunt.

![Torpedo in the black. The TORPEDO window gives its bearing and signal, the console is at condition red, and the rose tags the torpedo and the destroyer that fired it.](screenshots/torpedo-in-the-black.png)

**When one is coming.** The log calls `TORPEDO IN THE BLACK` with its bearing, the `TORPEDO` pill flashes, and time compression drops to x1. A homing torpedo follows emissions. Burning away makes you louder, so the classic answer is to drop a static buoy, slide off the torpedo's line, then go quiet and let it take the static buoy. A seasoned captain does the same to you. Against a straight runner, any burn takes you off the point it is running to.

## 14. Electronic warfare: jamming and ECCM

A jammer is a transmitter that spams static on every band. Anyone inside its cone hears that static on top of everything near its bearing, so contacts there fade and new ones hide behind it.

> [!NOTE]
> **The misconception:** that jamming hides the jammer. It does the opposite. A jammer is the loudest thing in the sky, on its true bearing. It hides *what lies behind it* from the ships *inside its cone*, and it breaks the lock of guided torpedoes. That is all it does.

![Jammed in a duel. A destroyer jams the boat as it closes: the jamming strobe masks a wedge of the rose and lays a wall of static across the waterfall, and it tells the captain exactly where the destroyer is.](screenshots/duel-jammed.png)

### Who a jammer affects

```mermaid
%% Does this jammer affect me?
flowchart TD
  A{"Am I inside<br/>its cone?"} -->|no| N["Nothing, but I can hear<br/>exactly where it is"]
  A -->|yes| B{"What is it<br/>jamming?"}
  B -->|"my ears"| C{"Do I have ECCM on?"}
  C -->|"no (pirates and traders)"| D["Contacts near its bearing fade;<br/>close in, my displays break up"]
  C -->|yes| E["Most of it rejected:<br/>a narrow sector fades"]
  B -->|"a homing seeker"| F["The seeker loses its lock<br/>and runs on past"]
  B -->|"a straight runner"| G["Nothing: it is aimed at a point"]
```

| Against | Jamming is | Why |
|---|---|---|
| Pirates and traders | effective | their arrays have no ECCM |
| Civilian hunters | partly | a hunter's array rejects 6 dB |
| Warships | iffy | ECCM rejects 12 to 15 dB |
| Ghosts | weak | the best ECCM in the fleet: 25 dB |
| Homing torpedoes | effective | a swamped seeker loses its lock |
| Straight runners | useless | nothing to jam |

### Using a jammer

There are two kinds:

- **A ship's jammer** (`jam 045`, `jam s1` to follow a contact, `jam off`; add `low`, `half` or `full`): very directional. It jams only what is inside its cone (20° on a destroyer, 25° on a cruiser, 30° on a civilian set); outside the cone it does nothing. Warships run it at any setting; a **civilian set runs at low only**. A destroyer captain jams the ship it is attacking; an **escort** jams any raider it hears at once and moves between it and the traders it guards; and a **trader jams the pirate it is running from**: the common way for a merchant to break a pirate's lock.
- **A jammer drone** (`jammer`, or `jammer 090` for a course): runs off on a bearing and jams all round for five minutes. The ghost carries two.

**It costs.** A jammer draws power while it is on (10 MW on a destroyer: heat and battery), and a lower setting draws less and jams less (a quarter of the power is 6 dB less). It weakens with range, like any emission. **It blinds you that way**: its static floods your own array, so you can't hear anything inside your own cone (the IR telescope still sees heat). And **it is a confession**: inside the cone it is the loudest thing in the sky, on its true bearing; EM intercept hears it from any side. Use it when you have been found anyway.

**What it does to whom.** Against pirates and traders, whose civilian arrays can't fight it, jamming works. Against warships it is iffy: their arrays carry **ECCM**, which steers a null onto the jammer's bearing, rejecting part of it and shrinking what it hides. Against a ghost it is weak: a ghost's ECCM is the best in the fleet.

**Choosing the power.** The jammer and ECCM each take a share of their full power, not just on or off. `jam s1 60%` sets a share, `low` and `half` are a quarter and a half, and `jam +` and `jam -` move it a quarter at a time. The `EW` gauge shows both settings. The lowest setting is 10%. Less power jams less, draws less and shows less: half the power is 3 dB less. So you can jam just hard enough to beat a seeker, or keep the plant cool on a long run.

**ECCM takes power too.** At full it draws 0.1 MW for each dB it rejects: 2.5 MW on a ghost. `eccm 60%` rejects 60% of its rated dB for 60% of the power and EF, and `eccm +` and `eccm -` step it. ECCM shares the jammer's breaker, so a board setting that sheds the jammer sheds ECCM as well. Computer captains run ECCM at full whenever they are jammed.

**ECCM** (`eccm on`, `eccm off`): if your array has it, switching it on rejects jamming (25 dB on a ghost, 12 to 15 on a warship) and narrows the masked sector. It isn't free: nulling is active electronics, so with it on you radiate a little more EF. Computer captains switch it on only while jammed. On a ghost it is a real trade: see past the jammer, or stay quiet.

**Torpedoes: jamming's best use.** Jamming is mostly a defence against guided weapons. The drill: *torpedo in the black!* *Begin jamming!* (`J`, or `jam steady` then `jam s5`). Jam it steady: in a look-through pause the seeker can reacquire. A homing seeker inside your cone is swamped, loses its lock and runs on past, so jam toward it and get off its line. That is why a ghost keeps its torpedoes quiet until the last moment. A linked torpedo's datalink is cut when a jammer's cone covers it and outshouts the launcher's link (close to the launcher, the link burns through); it then runs on its last course. A straight runner, aimed by hand, has nothing to jam.

### Look-through

A jammer deafens its own ship inside its cone. To listen, a jammer pauses: **silent for 5 seconds in every 25**, a practice called *look-through*. In the pause it jams nothing, and your array hears the cone again. Each ship's cycle is offset, so a group of jammers never pauses together.

- `jam look` (the default): pause to listen. Use it when you are screening, or running from a ship that might shoot.
- `jam steady`: no pauses, and no hearing in the cone. Use it against an incoming homing torpedo: in a pause, its seeker can reacquire you. `J` always jams steady.

Computer captains follow the same doctrine: look-through while screening, steady at an incoming weapon. Jammer drones have no receiver and always run steady.

### Being jammed

A jammer over your floor shows as a strobe: a flickering wedge on the rose across the sector it masks, a line out from you on the nav plot, and a wall of static on the waterfall. The `EW` gauge gives its bearing and how far it stands over your floor. Close in, past about 40 dB, your displays break up: false strobes jump about the rose and plot, and static covers the array's windows. Jamming raises condition YELLOW. To see past a jammer, switch on ECCM if you have it, or move so the target and the jammer part, or slip out of its cone.

## 15. Power, heat and signatures

Every ship runs on a reactor and a battery, makes heat, and shows up on more than one sensor. **AUTO** runs all of it like a sensible engineer, so you can ignore this section and play as before. Or open the **engineering** window (`v`) and run the plant yourself: power against emissions, against speed, against sensors, against heat.

**Power.** The reactor's output can only change slowly, and it gets louder as it works harder. A reactor that has gone cold must also run through a start before it makes any power: about 90 seconds on a warship, and longer on a merchant. The start can be heard. The battery covers what the reactor can't yet supply and charges from any surplus. On AUTO the reactor tops the battery up whenever it is under 95%, but once the heat sink is over half full it charges only as fast as the hull sheds the heat, so a warm boat recharges slowly. `reactor 100` charges faster and heats the boat. It hums a little while it discharges hard. The drive is by far the biggest load; if supply can't meet demand, the drive browns out first (engineering shows how far).

**The board.** Every load has a breaker and a place on a priority list: life support, sensors, tubes, pinger, weapons, jammer, drive. When power runs short, the board feeds that list from the top. The drive and the weapon capacitors can run on part of what they ask for. Any other load gets all of it or trips, and a tripped breaker stays open for 10 seconds. A dark load's work stands still: tubes stop reloading and the pinger stops recharging. The attitude motors that turn and pitch the boat ride the drive's breaker: a turn under the quiet-helm rate costs nothing, and a hard one draws up to a tenth of the drive's power, from the battery when the reactor is down. A hard turn also shows a little on EF, and how much a hunter makes of it grows through the war: nothing early, a little mid war, a noticeable tell close in by late war. A turn under the quiet-helm rate shows nothing in any era. Set your course before you go dark.

- `board` lists the board's named settings, and `board patrol` sets one. You never need to touch them: a ship sails on **Standard Running**, and the crew minds it. A capped reactor also runs its pumps slower, so the hull hums a little quieter: the tighter the cap, the more. **Long Patrol** caps the reactor at 30% to save fuel, but has no pinger or jammer and answers slowly when the shooting starts. **Rig for Quiet** saves battery and EF but has no pinger, jammer or reloads, and the drive starves first. **Battle Stations** puts the weapons first with the plant at full, at a cost in fuel and EF. Engineering's `SETTING` line names the one you're on, and says `By hand` once you change something yourself.
- `S` shows what each setting would do on your boat, from her own plant figures at their rating. `REACTOR` is the most the setting lets the reactor make. `DRIVE` is the share of full drive it can hold with the battery flat. `FUEL` is fuel for each second of drive against Standard Running: a reactor burns less per MW at low output, so a gentle burn goes further. `SHOWS` is how much more the whole boat shows at this throttle. `ANSWER` is how long the reactor takes to reach full. Choose a row to read its cost, and `Enter` sets it. `board preview patrol` gives the same on the conn.
- **The chief engineer may mention the board.** The chief speaks in the log, when nothing is happening, and only to a captain still on Standard Running. Each subject is raised once, and at most once an hour: tanks under a quarter, or a defect the crew has found that the board can answer. A word from the chief never slows the clock, and you can ignore it.
- `shed tubes` opens a breaker, and `restore tubes` closes it. `restore all` closes every breaker. Shedding `life` secures the scrubbers and electrolysis.
- `priority tubes` puts a load first, `priority tubes 3` puts it third, and `priority auto` restores the list.
- What you power is what you show. Dark sensors make the boat a little quieter and cut its EF, and tubes, pinger and guns show while they draw, even on the battery.

**Buses.** Two buses carry the loads. Bus A carries the drive, tubes and weapons. Bus B carries the sensors, pinger, jammer and life support. A damaged bus carries less. A failed bus drops its loads until the crew cross-ties them to the other bus, about 30 seconds later. One bus then carries the whole boat at 60% of its rating, so the priority list decides what stays lit.

**Generator.** A small auxiliary generator (`aux on`, `aux off`, `aux auto`) starts in about 15 seconds. It carries the hotel load and charges the battery slowly, but it is loud and burns four times the fuel for the same energy. On AUTO it runs when the reactor is lost, or when the reactor is down and the battery is under 15%. Silent running turns it off.

**Battery banks.** The battery is two banks, A behind bus A and B behind bus B. They share the work. `bank a off` isolates a bank and holds its charge in reserve, at half the discharge rate. A bank that fails loses its charge, and a bank behind a dead bus can't be reached until the buses are tied.

**Fuel.** The reactor and generator burn fuel, and tanks do not fill at sea. A reactor has an economical speed: it burns about twice as much per MW at full output as at idle, so a gentle burn reaches the same speed on less fuel, but takes longer. With none left, the reactor goes out and the battery is all you have. A friendly tanker or base fills your fuel and propellant together. Lie within 20 km of it, moving under 50 m/s against it, and order `refuel`. Drift off and the hoses part; `refuel stop` lets go. A tanker's cargo is finite, and a sunk tanker's fuel goes with it.

Outside the tutorials, a fight finds every ship part way through a patrol: each starts with 40% to 100% of its fuel and standard rations, drawn at launch, unless the scenario sets them.

**Bases.** A base is huge and doesn't move. It has six sections, each with its own hull. A hit lands on one section, and twenty direct hits take a section. A lost section takes its share of the fuel store, and the rest of the base stands. Armour turns gauss slugs. A base falls only when its last section goes.

**Silent running** (`b`, or `silent`): shut the reactor down and live on the battery. The coolant pumps stop, so the hull hum drops: an attack boat goes from 110 to 102 dB, which cuts a destroyer's hearing range on it by more than half. The reactor's coils go cold too, and the boat's magnetic field falls to about a tenth, the steel hull's own: a magnetometer that felt it at 14 km must now come within about 6 to 7 km. The battery lasts about half an hour at hotel load, much less if you burn. Restarting the reactor is a rise in emissions a listener may call as a transient. `normal` puts everything back on automatic.

**Pushing the drive** (`push`, `push off`): the drive runs at 125% of its rating. You get a quarter more thrust for a quarter more power and propellant, and it is 3 dB louder. The battery covers what the reactor can't, and the heat follows. Each second at full throttle has a 0.4% chance that something gives, so expect about four minutes. About a third of those failures damage the drive. The rest trip its breaker, and the drive is dead for a few seconds. Either way the push ends, and you must order it again. A boat that has pushed but is coasting risks nothing. Use it to outrun a torpedo, not to save time. Veteran enemy captains push too, when they run from a torpedo.

**Heat.** All the reactor's power ends up as heat in a heat sink. The hull sheds some; drifting, that is enough. Burning or charging hard fills the sink. **Radiators** shed heat fast, but they glow: radiators out show in infrared from thousands of km. On AUTO they come out at 85% and go in below 60%. If the sink fills, the reactor scrams itself to save the ship.

**The channels.**

| Channel | What shows | Who reads it |
|---|---|---|
| EF | drive, hum, reactor, battery | every passive array |
| Infrared | hull warmth (more as it heats), radiators, drive plume | military IR sensors, out to a few tens of km on a cool hull; thousands on radiators or a plume |
| EM | transmissions, such as a hunting group's datalink | ESM receivers. A group transmits whenever it shares a contact, so a group that has found something is suddenly loud on EM |
| Magnetic | the reactor's coils and the hull's own field; a shield's coils; every hard turn | magnetometers: in mid war a destroyer's feels an attack boat at about 14 km with the reactor running and about 6 to 7 km with it shut down, a big hull at about 20 km. Silence doesn't hide it; a cold reactor and gentle turns shrink it |

All sensors feed the same tracker, so a contact may be held on EF, refined by infrared, and found again by its magnetic field. The `HEAR` column says which.

EF is the electric field a ship gives off. Space carries no sound, so nothing here is sound. Crews say *hear*, *loud* and *quiet* out of submarine habit, and they mean EF.

**What engineering shows:** reactor mode and output; battery charge and flow, bank by bank; the generator; fuel and how long it lasts at this burn; heat and the radiators; the load (demand, supply, any brownout); what you are showing the world on every channel, including whether you are transmitting; and the board, when the window is tall enough. A short window lists only what is shed, cut or dark.

## 16. Life support

Your crew breathes. As on a real submarine, **CO₂ is the clock on running quiet**: the scrubbers that remove it are pumps and fans, and they radiate.

- **Rig for ultra-quiet** (`ultra`, or `rig for ultra-quiet`): silent running, and the scrubbers secured too. An attack boat drops another 3 dB, to about 99 dB. CO₂ starts to climb, about 0.08% an hour on an attack boat: a full point every 12 hours.
- **Ultra-quiet holds the boat still, and it costs.** For as long as the scrubbers are off:
  - **No reloads.** Moving a weapon is heard. A reload under way pauses where it is and goes on when you come off ultra-quiet; the fire control grid shows the tube as `held`. A `load` order is refused, and a `reload` order only sets what goes in next. The countermeasure launcher waits the same way. A torpedo already in a tube still fires.
  - **No damage-control parties.** A party at work knocks on the hull, so repairs stop, whatever `dc work` says, and a growing fault goes on growing. Damage control tells you once. The work goes on afterwards from where it stopped.
  - **The crew tires three times as fast**, and never slower than on Blue, so even WHITE rests nobody: a Blue crew is tired in about two hours and spent in four, sooner than the air or the battery turns. A tired crew answers, hears and works slower. They rest as usual once the scrubbers run again.
  - Your sensors work exactly as on silent running: ultra-quiet changes what you give off, not what you hear. A crew it has worn down hears worse, as any tired crew does.
- **Blue saves air.** On condition Blue, the crew off watch lie still on personal air, and the boat uses 15% less: CO₂ builds more slowly and oxygen lasts longer. WWII crews did the same, sent to their bunks to save what they had. White and Yellow are normal stations, and at war nobody is resting.
- **The crew feels it.** Past 1% CO₂, or under 19% oxygen, they start to slip; by 4% they are badly impaired. A crew short of air makes **worse sensor operators** (faint contacts are missed), **slower reloads**, a **slower helm** and **slower repairs**.
- **Oxygen** comes from electrolysis (it needs power) or from candles (`candle`, a few carried). With no power at all, the chief burns candles to keep oxygen up, but nothing removes the CO₂.
- **The chief of the boat runs the air on AUTO** (`air auto`): scrubbers and electrolysis on. Only an order (`scrubbers off`, `electrolysis off`) or a dead plant changes that. `normal` puts everything back on automatic.
- The COB reports each step of CO₂ past 1% in the log (`COB  CO₂ at 2.1%: headaches, mistakes creeping in.`). The `ULTRA` pill shows while the scrubbers are off, and `AIR 2.1%` once the crew is slipping.
- **Bad air kills.** At 10% CO₂, or 10% oxygen, the crew is lost and the ship with them, in every scenario, at every difficulty, on either side. With the scrubbers off that is about five days on a ghost, so it only reaches a boat that stays down by choice. The COB warns you 12 hours out and again at 2 hours, says what is off (or that the plant can't keep up), and each warning drops time compression to x1; the air gauge shows it coming. With healthy scrubbers running it never comes.
- **Two clocks.** To hide you shut the reactor down and live on the battery. A ghost running silent has about 40 hours. Then you must bring the reactor back, and its EF and heat tell anyone listening where you went. Refuse, and the air gets you instead.
- **A holed hull bleeds air.** A breach lets the air out, and the crew feels the pressure fall as if the oxygen were thinner. The chief holds the boat at 92 kPa from the reserve air while the breach is open, and brings her back to normal once it is patched. The reserve fills the boat once, and is refilled only at base. See [Damage](#17-damage).
- **Life support can be hit.** It is a damage system like any other. Its health scales how well the scrubbers and the oxygen plant work, so a boat can be quiet, safe and slowly suffocating, and repairing it may mean making noise. See [Damage](#17-damage).

**Food.** A ship carries rations for a set number of days: a ghost 60 standard and 15 emergency, a destroyer 30 and 7.5. Standard rations are sealed meals that keep indefinitely. Emergency rations feed the same in a quarter of the space, and crews hate them. The crew eats standard rations first. The engineering detail shows one bar with each kind in its own colour. In a single engagement these are only figures: they run down, and nothing happens when they reach zero. On a career patrol an empty larder matters: see [The career](#22-the-career).

## 17. Damage

A hit does more than wear the hull: it knocks one or more of your systems, more for a heavier hit. A damaged system works in proportion to its health; below 25% it **fails** and stops working altogether.

**Facing matters.** A hit reaches the systems nearest its side first. From astern it finds the drive, the generator and the reactor. From ahead it finds the array, the pinger and the tubes. On the beam it finds what lies amidships: the buses, life support and the batteries. The nearest system is up to four times as likely to be knocked as the farthest. The crew calls where each hit came from. So a boat running from a gun gives it the drive, and one that turns to fight gives it the ears. This applies to gauss, beams, mines, collisions and torpedoes, so a salvo from astern is the one that stops a ship.

| System | Damaged | Failed |
|---|---|---|
| Drive | less thrust, and it rattles when it burns | no thrust, and no drive noise |
| Reactor | less output | no output |
| Battery | holds less | holds nothing |
| Radiators | shed less heat | shed nothing |
| Array | higher floor, wider bearings | deaf |
| Pinger | wider range and bearing errors | can't ping |
| Sensors | IR, ESM and magnetometer less sensitive | off |
| Tubes | slower reloads | can't fire |
| Guns | a weaker beam | can't fire |
| Datalink | works | can't share with your group |
| Life support | scrubbers and oxygen plant work less well | the air goes bad until it is repaired |

The buses, the generator and the second battery bank take hits too: [Power, heat and signatures](#15-power-heat-and-signatures) says what each does damaged or failed.

**Damage control** repairs one system at a time, about 3% a minute, so a badly damaged system takes tens of minutes, and only back to 90%: a full repair needs a dockyard. On AUTO the parties take failed systems first, then damaged ones, most important first (drive, reactor, the buses, life support, array, radiators, generator, the battery banks, tubes, pinger, sensors, guns, datalink). `repair array` puts them on the array instead; `repair auto` hands the choice back. The log reports each system brought back to working.

**Faults that grow.** A knock on the reactor, a battery bank, the radiators, life support or the drive may start a fault: a coolant leak, a cell going bad, a bearing running hot. About three knocks in ten do. A fault eats that system's health, about 2% a minute, until a party has given it five minutes of work. That work stops the fault and mends nothing, so a mend comes after it. On AUTO the parties take faults first. The report marks them `GROWING`. A bad cell also fouls the air.

**Parties show on EF.** Repair is electronic work: a party runs test sets, arc welders, powered tools and the equipment it is mending, and all of it radiates EF; an arc welder is the worst, a broadband spark across the radio bands. On a running boat that is 3 dB under the plant's own EF, which covers it. On a silent boat a party at work can be the strongest emitter aboard, and it can give you away. `dc quiet` stands them down, and `dc work` sends them back. Rigging for silent stands them down by itself. So the choice is yours: keep quiet and watch a fault grow, or stop it and be heard.

**Breaches.** A hit that costs the hull 5% or more holes it. A breach is a slow bleed that a patch stops. The hole is 1 cm² for every percent of hull the hit cost, so a 20% hit makes a 20 cm² hole. Through it the air flows out into space: a ghost with one such hole would lose half her air in a little over an hour. Damage control reports the breach in the log, and on AUTO the parties patch it before anything else, the largest first, in about five minutes each. A patch stops the bleed and gives nothing back: the hull and every system stay as the hit left them. Only the yard mends the hull, and with it every patch.

While a breach is open, the chief lets air in from the reserve to hold the boat at 92 kPa, just above the point where the crew starts to slip. Once every breach is patched, the chief brings her back to normal pressure. So a working crew loses only some reserve air, about a twentieth of it for one 20 cm² hole. Stand the parties down, or rig for ultra-quiet, and the hole bleeds on. One 20 cm² hole on a ghost then empties the reserve in under two hours, and after that the crew has about an hour before the air kills them. The air gauge and the COB count it down, as for bad air. The reserve fills the boat once and is refilled only at base, so a patrol that has spent it is short of air for every hit that follows. On a dark boat the escaping air also takes a little heat from the cabin. The damage report shows the breaches open and patched, and the engineering window shows the pressure and the reserve.

**The damage report** (put it in a window with `v`) opens on the captain's summary: the hull, what damage control is doing and how long it will take ("On the array (AUTO): working again in about 40 s"), and what you can and can't do, by job: MOVE, POWER, HEAR, FIGHT, TALK. Press `i` for the detail: every system with a bar, its health and its state (`OK`, `DAMAGED`, `FAILED`); `◀` marks the system being repaired and `★` your priority. Damage control also reports in the log each time it starts on a system, with its estimate.

**The annunciator.** A damaged system lights `MASTER CAUTION`; a failed one, or the hull below 30%, lights `MASTER WARNING`. It flashes until you acknowledge it with `a`, and the dynamic DAMAGE window shows what is hurt until you do.

**Screens fail too.** A window fed by a damaged system breaks up into static: the waterfall, rose, contacts and nav plot as the array fails, engineering as the reactor does. A failed system's window reads `NO SIGNAL`. The chart is paper and never fails.

Enemy ships take damage the same way, and their crews repair the same way.

### Broken gauges

A knock on a system can break a gauge it feeds. About four knocks in ten do. The gauges and the systems they hang on:

| Gauge | Instrument | System |
|---|---|---|
| `HDG`, `PTCH` | gyro repeater | sensors |
| `CSE`, `VEL` | velocity log | sensors |
| `ALT` | altimeter | sensors |
| `ACCEL` | accelerometer | drive |
| `PROP` | propellant gauge | drive |
| `FUEL` | fuel gauge | reactor |
| `BATT` | battery meter | bank a |
| `SINK` | heat-sink gauge | radiators |
| `AIR` | air sensors | life support |
| `CABIN` | cabin thermometer | life support |

A gauge breaks in one of three ways:

- **Dead.** The label is struck through and the reading says `× NO DATA`. Damage control says so in the log. A pill the gauge lights, such as `BATT` or `HEAT`, stays dark.
- **Stuck.** The gauge keeps its last reading, colour and all. Nothing marks it.
- **Wrong.** The gauge reads live but drifts further off, up to about a third of its scale.

The crew reads its own instruments: the chief counts the battery's cells and the helm reads the inertial platform. So a crew report, a gauge's name at the console (`battery`, `helm`) and the engineering window's own meters all read true. When a gauge and the crew disagree, believe the crew.

Damage control replaces a gauge as part of the work on its system, in about four minutes. The parties know of a dead gauge at once. They know of a stuck or wrong one only when you put them on its system: `repair battery`, and they look the system over and find it. `gauges` lists what they know, and the damage report shows it as `GAUGES`. The test bench's *Broken Gauges* (`data/testbench/broken_gauges.ron`) starts with four broken.

### Quirks and wear

No two hulls are quite alike. At the start every ship, yours and the enemy's, rolls its quirks from `data/quirks.ron`. These include:

- an array that reads a couple of degrees off;
- a reactor that runs loud, or a sweet pump train that runs quiet;
- a drive or battery that never makes its rating;
- a pinger or datalink that drops out now and then;
- a gauge that sticks or drifts (see [Broken gauges](#broken-gauges)).

You don't know your boat's quirks at the start. The crew reports each one when it bites, or once its system has run long enough for someone to notice. Each report lands in the log as `QUIRK`, and damage control lists every quirk found so far. A worn system can't be repaired past its quirk; that needs a dockyard. An enemy's quirks are real too, and only its behaviour gives them away.

- a yard that did good work on the lagging, or rushed it: the hull sheds heat a quarter faster, or a fifth slower, than the book.

Damage control's detail view also shows how long each system has been in use: its wear. On most hulls wear is a record only.

### Breakdowns on an old boat

A hull from the last war breaks down by age: about once an hour of running, something in use fails for two minutes. You may wait, or jury rig it (`u`, or `jury`). A rig brings it back now, and every rig makes the next failure come sooner, for the rest of the exercise. So the question each time is whether you need that system in the next two minutes more than you need a quiet hour later.


## 18. How the enemy thinks

Computer captains play by your rules. Each has its own sensor picture, built from what its own ship hears; none of them knows where you really are. They fly with the same controls, through crews that take the same time to answer. What differs is **doctrine**: how a captain decides what to do with what it hears. Doctrine is in `data/captains.ron`. A modder finds each captain's fields there, and where its rules live in section 5 of the developer's manual (`docs/dev-manual.md` in the source).

> [!NOTE]
> **The misconception:** that the enemy knows where you are once it is coming for you. It knows a bearing, perhaps a rough range. A destroyer charging down your bearing is following the bearing, not you.

### Alert states

Every captain is in one of three states. The state decides how it moves, how often it pings and whether it shoots.

```mermaid
%% A captain's alert states
stateDiagram-v2
  [*] --> Patrol
  Patrol --> Search: heard you enough to believe it,<br/>a ping, a sinking nearby,<br/>or a launch (counterattacking captains)
  Search --> Attack: your signal is strong
  Attack --> Search: lost you
  Search --> Patrol: nothing heard for its patience
```

| State | What it does | What you see |
|---|---|---|
| **Patrol** | Holds its course, listens, pings now and then (some never do) | a steady contact; occasional `PING` |
| **Search** | Heads for where it last heard you, by **sprint and drift**: burns, then cuts the drive to listen; looks above and below the track as well as beside it | transients as it lights its drive; pings while it drifts |
| **Attack** | Closes at speed, pings often, fires when its solution is good enough | `COND RED`; frequent pings; `TORPEDO IN THE BLACK` |

**Sprint and drift.** A ship burning its drive is half deaf, so a careful hunter alternates: sprint toward you, then drift and listen. A green captain sprints and never drifts. A seasoned one sprints and drifts by turns. A silent attack boat creeps, and drifts for long spells.

**Pings.** A captain in Search pings only while drifting, unless it sweeps the area hot: a ping sent with the drive burning comes back to a receiver deafened by its own drive's EF. In Attack it pings freely; close in, the echo is strong enough.

### Lying in wait

Every captain knows space has an up and a down. A contact it had solved close by, or had loud and then lost, is near and quiet, and whoever moves first loses. So it comes up on a lost contact slowly, because a ship at speed coasts out of the fight, and when it is close it makes a short burn out of that contact's plane, up or down as its own coin falls, cuts the drive, puts its nose on the track and listens. A green crew waits briefly; an attack-boat captain waits longest. Only green crews ping while they wait. Hearing the contact again, it attacks; its patience run out, it searches on. It never hides from a contact it still holds, however faint: that one it fights. So the ship that came down your bearing and went quiet may be coasting cold off it, waiting for you to show yourself.

**When they lose you.** Having lost you, an enemy captain does not always give up. Some lie cold where they last held you, drive and reactor quiet, and wait for you to move. Some sweep the area hot, pinging as they pass back and forth across it. Some make as if to leave, their signal fading as a departing ship's would, and stay. A group may part, one ship staying while the others go. A burn they hear on more than one ship tells them where you are heading, and a warp spin-up is loud.

### After a sinking: the datum

When a ship is sunk, or takes a torpedo and lives, every captain on its side nearby races to the spot, the **flaming datum**, and searches there. A green captain stops at the wreck. An escort pings all the way there, burning or not, and searches the spot when it arrives.

### The counterattack

Seasoned and escort captains have learned better. When one hears a **launch**, a transient and a torpedo in the water, close together, it:

1. wakes at once, even from Patrol;
2. takes the bearing of the launch, from where it heard it;
3. leaves its station, even an escort's, and sweeps outward along that bearing line for a time, pinging as it drifts.

```mermaid
%% The counterattack: hunting the firing point
flowchart LR
  A["Hears a launch:<br/>transient + torpedo"] --> B["Bearing line<br/>from where it heard it"]
  B --> C["Sweeps out along the line,<br/>pinging while drifting"]
  C -->|"echo"| D["Attack"]
  C -->|"nothing heard"| E["Back to the convoy"]
  style D fill:#ffdce0,stroke:#cf222e,color:#1a1a1a
```

So after a launch, the firing point lies on a line the escort knows.

**Shooting back.** A drilled captain may answer a launch at once, before she turns, with straight runners back down its bearing. Green, silent, pirate and hunter captains never answer this way.

### Torpedo defence

A captain who hears a torpedo first asks whether it is coming **at it**: a steady bearing and a rising signal mean a collision course. A torpedo aimed at someone else is ignored. For one coming at it:

- **Most captains turn away and burn.** All but green ones drop a static buoy and a decoy, and jam the torpedo if they have a jammer.
- **Counterattacking captains comb the tracks**: they turn *toward* the torpedo, the narrowest target, which is also toward you, and keep pinging.

### Escorts and convoys

An **escort** captain guards the merchants near it:

- **On station.** With nothing heard, it stays close to its convoy.
- **Screening.** When it holds a threat, it jams it at once and moves out between the threat and the merchants, so the convoy sits inside its jamming cone from the threat's side. It is on a leash: it may go only so far from the convoy, and farther while attacking.
- **A counterattack stretches the leash** as far as an attack does. At speed it turns for home in time to stop at its limit, not past it.

**Merchants listen too.** A convoy that hears a warship or a torpedo makes an emergency turn away and runs. A freighter's ears are poor: she hears an attack boat with its reactor up only within about 4 km, but a burning one within about 440 km. When one of them goes up, the rest scatter flat out from the blast: loud, fast, and hard to catch.

**Merchants run; they don't weave.** Until they hear trouble they sail straight and true. A skipper who hears you puts their stern to you and runs flat out. A towed hulk or a tanker in orbit can't run, and stands fast.

In late war, convoys sail with an **escort group**: two escorts sharing every bearing. See [The war campaign](#21-the-war-campaign).

### Flight decks: carriers and their craft

A **carrier** is the heart of a battle group: the biggest, loudest hull in the fleet, with a flight deck and a hangar of **craft**, small fast ships flown by two pilots. It can hardly fight on its own. Its craft are its eyes and its reach, and its escorts are its safety. It is the best prize a ghost can take.

**Launches.** A deck launches one craft at a time, under a minute apart. The catapult and a small drive lighting off beside the hull make a loud transient, and the crew calls it: `Launch transients on S1, bearing 312°. Craft leaving a flight deck.` A launch tells you where the deck is, and that craft are coming.

**Three missions.**

- **Pickets** fly far out, coast on station and listen. What a picket hears goes over the group's datalink, so the destroyers have it at once. A carrier keeps a standing patrol of pickets up, and sends more once it is alerted.
- **Strikes** carry two homing torpedoes out along the carrier's track on a target, fire from stand-off range and turn for home.
- **Screens** stay close to the carrier and shoot at torpedoes and enemy craft that come in.

**What a craft is like.** It burns nearly all the time, so you hear it a very long way off. The same burn deafens it: its small array sits beside its drive. Burning, it hears a quiet boat only alongside. Coasting on station, it hears a drifting ghost at about 50 km, and one running silent at about 20. A destroyer hears the same drifting ghost at over 200 km. A craft's gauss gun is deadly to a boat it catches close. It is almost impossible to torpedo: it out-accelerates and out-turns a torpedo, and a proximity fuze sees its small hull only at a tenth of the usual distance. A homing torpedo chases the loudest thing in its cone, and a craft is loud, so a carrier's craft can draw off a homing spread. Straight runners take no notice of them.

**Short legs.** A craft must keep the Δv to get back to its deck, and its pilots last about two hours. It ranges only within a radius of its carrier, and the radius moves with the carrier. A craft that chases hard burns its reserve and turns for home soon after.

**How they show.** The crew calls a craft `fighter?`, then by class, `Fighter` or `Strike fighter`. On the plot, the chart, the rose and the contacts table, a craft wears the top half of its affiliation's frame, as air tracks do on a military plot: `⋀` hostile, `◠` friendly, `⊓` neutral, `⌒` unknown. The carrier's own signature is unmistakable once the crew has it: they call it `Carrier`, and the vessel window lists its flight deck.

**What a craft does with what it hears.** It reports it over the group's datalink, and the destroyers come to it. A craft finds what is loud; the destroyers it calls in do the hunting.

**When the deck is gone.** Sink the carrier and its craft have nowhere to land. They fight on until their fuel or their pilots give out.

**In the record.** The end screen counts craft shot down (`Craft down`). Craft are not hulls: they count for neither the ships sunk nor the tonnage. The replay draws them as `⋀`, and the debrief says how many flew, how many heard you and how close the nearest came. A craft that lands, or runs out of fuel far from its deck, is nobody's kill.

### Commanding a carrier

A carrier's captain fights with the deck. Her own hull is the loudest in the fleet and hears a quiet boat only a few hundred km off, so her craft are her ears and her reach. Choose a carrier in the Duel, learn the deck in the guided exercise *The Flight Deck*, and take a carrier group against a ghost in *Flight Quarters*. On the house colour, the console takes on the carrier's colours, Cold Steel, when you sail one; if you chose another theme, you keep it. `t` changes them, and your own come back afterwards.

**The deck.** `deck` gives the hangar: each kind of craft, what it flies, how many are ready, and how many are being refuelled and rearmed with the time to the next. It also gives what is waiting to launch and how many are aloft. The `DECK` row in your status window says the same in short, where a torpedo boat shows its tubes.

**Launching.** `launch picket`, `launch screen` and `launch strike s3` put craft in the launch queue. Add a number for more: `launch picket 2`. A strike flies two unless you say, and it needs a contact with a solution: its pilots are handed your track on it. The deck launches one craft every 45 seconds, from those ready that fly the mission. Every launch is loud, and anyone listening hears where the deck is.

- **Pickets** fly about 1,500 km out ahead of you, or toward the loudest threat you hold, then coast on station and listen. What a picket hears comes home over the datalink, so you and your escorts have it at once, and two bearings from two places make a cross-fix. When one finds something new, the deck says so: `Picket 1, picket, reports a new contact, S4: the craft is 1,480 km out on 012°.`
- **Screens** stay within a few tens of km and fly at any torpedo they hear coming for you, with their gauss guns. Launch one when you hear `TORPEDO IN THE BLACK`, or before, if you expect one.
- **Strikes** fly out along your track on the target, fire their torpedoes from stand-off range and turn for home.

**Reading the craft.** `sorties` (or `craft`) lists each craft aloft: its mission, its range and bearing from you, its Δv and the share of its propellant left, its pilots' time left, and whether it is coming home and why. `show deck` opens the **flight deck window**: the bays, the launch queue, and every craft with a Δv bar and an endurance bar, green, then amber under a quarter, red under a tenth. Your craft fly on the rose and the plot in the friendly air frame, `◠`, by their short names. On the plot each has a faint ring round you, tagged `Picket 1 home 6,200 km`: how far out that craft can be and still make the deck in time, on the Δv and endurance it has left. A craft near its own ring is near bingo. `layer craft` hides the rings.

**Bringing them home.** A craft turns for home by itself on bingo fuel, when its pilots near the end of their two hours, or when a strike has fired everything. `recall` calls them all home now; `recall picket` only the pickets. Launches still waiting are struck off. Craft wait 12 km off the deck and land one a minute; one that came back empty takes 15 minutes to refuel and rearm. A craft still out 25% past its pilots' endurance is posted lost.

**What the deck says.** The deck reports through the crew's reports (`reports all`, `normal` or `quiet`). Launches, landings and craft you recalled are routine, said only at `all`. A craft turning home on bingo fuel or with empty racks, and a picket's new contact, are said at `normal`. A craft lost, shot down or overdue, is said even at `quiet`.

**What each mission needs.** A strike needs a solution, and a carrier's own array rarely gives one on a quiet boat; a picket's bearings can. Pickets that burn are half deaf, and one that rushes what it hears empties its tanks within minutes. A craft caught outside its ring is lost. A carrier that runs from a torpedo pulls her craft's radius with her.

### Breaking off

A captain badly hurt gives up the fight for good. How badly hurt depends on its crew: a green crew breaks first and a veteran one last, and nerve moves it. It turns away, stops pinging and shooting, and runs. It leaves its station, its convoy and its friends. A hunter with nothing left to fire and no mates does the same. A captain who sailed already hurt breaks only at a new wound.

**Nerve.** A crew can also lose its nerve before its hull gives out. Every crew's nerve falls as the odds turn against it: a mate sunk nearby, its own hull hit, torpedoes heard coming, a long search that finds nothing. Quiet patrol brings it slowly back. The worst blow is the one with no explanation. A mate that blows up when nobody aboard heard a launch, a ping or a contact is a ghost at work, and it shakes a crew harder than a loss it can explain.

How much a crew can take depends on who it is. Pirates break soonest, and civilian hunters next. A navy crew is very tough: it breaks on nerve only when it is also alone or badly hurt, and an unnerved crew counts itself badly hurt sooner than a steady one. A near miss doesn't do it; a real hit usually does. A green crew breaks sooner than a seasoned one, and a veteran crew later still. A crew that loses its nerve breaks off as a badly hurt one does, and it reads the same way on your instruments.

You won't be told. What you have is what the crew hears: the pings stop, the bearing steadies and the contact opens. They may say it looks like a break-off, and they may be wrong. When a contact turns away and keeps opening after a blast, a sinking or your own shot, they may say it has lost its nerve. They read only what it does. A ship that has broken off no longer counts as tracking you. Some engagements, such as the Duel, count it as finishing the fight. It is still out there, and you can still sink it.

**Every hunter has a clock.** A pirate gives up a hunt that has found nothing, and a civilian hunter is more patient. An escort that has been off its station too long goes back to its traders, and one whose traders are all gone leaves once its search is over. A patrol is relieved after a long watch on station. Outside a Nightmare hold, every captain keeps the propellant it needs to get home: out of contact, one that has burned down to it goes home.

### Reading the escort

A hunter's quality is hidden. It shows in how the hunter behaves, and the crew reports what they notice. These lines appear in the log as `SENSORS`, and in the vessel window as `READS AS`. Every one is an estimate.

- **Habits.** After a few pings they call its style. A fast beat with no stopping to listen reads as a green crew. Sprint and drift reads as a drilled one. A slow beat reads as a careful one. A good crew in a hurry can look like a green one.
- **Counting.** The crew counts the torpedoes they hear and the gauss bursts they feel. Once they have called a class, they set that count against what the book says it carries. A hunter that has fired most of its load may be running short.
- **Magazines are counted.** Every shot comes out of a real magazine. Early in the war escorts sail short. A hunter that runs dry with no friends breaks off. One with friends stays and keeps the contact for them.

### Pirates and traders

**Pirates prey on traders.** A raider hunts what it hears, civilian or not, fires on a FAIR solution from too far, and runs a long way from a torpedo.

**Traders run at the first sign of trouble.** A trader that hears a pirate or a torpedo, is pinged, hears a feared drive light up nearby, is hit, or hears that a mate was hit or sunk turns away and burns. She burns hard for a while, then coasts on. A civilian trader with a jammer jams the pirate it is fleeing, at the low setting civilian sets allow, pausing now and then to listen (look-through). A wartime merchant sails dark and jams only a torpedo coming at it, steadily. See [Electronic warfare](#14-electronic-warfare-jamming-and-eccm).

### Crews

Every ship's crew takes time to answer: about 3 seconds at the helm and 4 in the engine room for an average navy crew. Merchant crews take longer (your own civilian hull is the exception: its autopilot answers at once), and pirates a little longer than the navy; a civilian hunter's hand-picked crew is a little quicker than the navy's. A green captain's crew is as slow as a merchant's; a seasoned, escort or silent captain's is quicker. **A slow crew turns late**, and overshoots.

### Captains at a glance

| Captain | Flies | Hunts | Shoots | Counterattacks | Lies in wait |
|---|---|---|---|---|---|
| green | early-war escorts, raw crews | charges your bearing, pings constantly, never drifts | on a FAIR solution | no: goes to the wreck | barely, and keeps pinging |
| seasoned | the navy's regulars | sprint and drift, plans an intercept | on a GOOD solution; jams what it attacks | yes | yes |
| escort | convoy escorts under doctrine | screens its convoy, jams any threat at once | as seasoned | yes, on a long leash | yes, on its leash |
| silent | enemy attack boats | creeps, never pings, long drifts; goes for traders first, and keeps well off warships | on a GOOD solution from far off, or FAIR closer in | no | the longest of all |
| pirate | raiders | hunts anything it hears | on a FAIR solution, from too far | no | briefly |
| hunter | civilian hunters | patient, quiet, orders and manoeuvres | on a GOOD solution | no | yes |

These are the templates. `regular` and `veteran` fill out the navy's ladder between and above `green` and `seasoned`. A veteran believes a contact on fewer hearings and commits to an attack on a fainter signal. It pings more often, fires again sooner, and takes a FAIR solution close in. It never fires at a contact its crew has not called a ship. Who actually turns up is rolled.

### Who is in the chair

Every computer-flown captain, and every merchant skipper, is a person, rolled fresh each play. The scenario says what sort of captain to expect; the dice say who you get. A captain of a grade is as strong as any other of that grade by points, but built differently: one is patient and slow to answer, another quick and reckless. **You don't get to see any of this during the fight.** You feel it in how they hunt, and find out who it was afterwards.

A **sheet** holds:

- **Attributes**, 1 to 10, who they are. **Nerve:** patience, closing the range before firing, how long they wait in ambush and how long before they give you up. **Cunning:** leading a target, and how far and from how far they step off the plane. **Aggression:** speed and burn. **Shiphandling:** how fast the crew answers.
- **Skills**, 0 to 5, what they trained. **Hunting:** coming after a fainter signal. **Gunnery:** the reach of guns and beams. **Countermeasures:** how long they keep evading a torpedo. **Stealth:** pinging less often.
- **A speciality**, for a warship captain. **Ambusher:** waits longer. **Comber:** works a torpedo track longer. **Gunner:** more reach on guns and beams. **Listener:** acts on less, sooner.
- **A flaw**, for some. **Hothead:** shoots on a poorer solution. **Glory Hound:** chases longer, and breaks off from a torpedo too soon. **Timid:** runs from a torpedo longer, and comes on slower. A flawed captain has more attribute points to make up for it.
- **A name, a rank and a line of record.** They come from every culture and every gender, because in this war everyone serves.

A sheet leans on the captain's template; it never changes what the captain is for. **Role** is doctrine: Line, Silent, Escort, Pirate or Hunter. **Grade** is how good: Green, Regular, Seasoned or Veteran. A Silent boat that rolls well is a better Silent boat. It doesn't start pinging.

**Most captains are what the scenario says, and a few aren't.** A die moves each one along the grades, and the odds get worse as the war goes on:

| When | One worse | As written | One better | Two better |
|---|---|---|---|---|
| Early war | 2 in 6 | 3 in 6 | 1 in 6 | never |
| Mid war, and free play | 1 in 6 | 3 in 6 | 1 in 6 | 1 in 6 |
| Late war, first half | never | 2 in 6 | 2 in 6 | 2 in 6 |
| Late war, second half, and Hard | never | 1 in 6 | 3 in 6 | 2 in 6 |

Now and then you will meet a really good one. Late in the war, the good ones are the rule.

**Reading a captain afterwards.** Once the outcome is decided, open the replay (`r`). WHO YOU FOUGHT lists every computer-flown ship on the other side, with its sheet, and a merchant skipper as one line; WITH YOU lists your own side's the same way. A captain the scenario fixes, the same in every play, is listed as a standard captain. It was a good fight, or a bad one, and now you know who it was with. A skipper's sheet is only who they were: it changes nothing a merchant does.

### Difficulty

Chosen on the title screen before you sail, and kept with the save.

| Level | Captains | The enemy's edge |
|---|---|---|
| **Standard** | Rolled on the odds above | None |
| **Hard** | Rolled on the worst row of the table, in any era | None |
| **Nightmare** | Every enemy warship a Veteran, at the top of the budget | Labelled, below |

**Nightmare is the bad day every sub skipper dreads:** every destroyer and cruiser in the sector, working together, the best crews in the navy, on their best day. It is not for a new captain. It breaks none of the rules in this manual: nobody knows where you are unless they heard you, the dice are the same dice, and when you die you can see why on the replay and the sheets. They are simply better people with better equipment. The trainer says so wherever it counts, in these words: `NIGHTMARE: elite crews (reaction ×0.5), finer arrays (ears −6 dB), coordinated, fully loaded, they hold where they lost you, their best day, steady nerves, the captains have had their Earl Grey`.

This reaches the enemy's navy only. Pirates and civilian hunters come at Veteran and keep their own scale and doctrine. Every enemy warship is:

- **Coordinated.** All of them are one hunting group, with one shared picture, one pinger and spread search lanes. The datalink's radio silence is lifted, and you can hear the price of that.
- **Veteran**, on a full budget, with no flaw.
- **Fully loaded.** Full magazines, full tubes, undamaged, whatever the scenario says.
- **Quick.** Crews answer in half the time of the quickest crew otherwise afloat.
- **Sharp of ear.** Arrays 6 dB finer, and merchants share the ears.
- **On their best day.** No equipment quirks, no wear, a rested crew and no dud torpedoes.
- **Steady.** Every blow to a crew's nerve counts a fifth as much: a loss, a wound, a torpedo heard, a long search that finds nothing. A lone hunter keeps up a fruitless search long after any other captain would have given up.
- **Hunting you to exhaustion.** No enemy warship gives up of its own accord; a crew's nerve is what ends a hunt. Having lost you, it holds the area of your last fix, the group spread in lanes through it, and waits for your battery and your air. A launch heard pulls them off to counterattack. An escort with merchants to guard keeps its leash.

**Unfair, not hopeless.** Nightmare is built to be unfair, and it is not built to be hopeless. A hold is only as good as the fix it rests on, and the way out of one is yours to find.

**Risk against reward.** At Nightmare a ghost can often get away, but the prize means taking the big risk. The reward matches it: a win here outranks the same win at any easier level in the same iron mode (below).

Your crew tires on anything but White, and so does theirs. In a long hold that is a third clock, for the hunters as well as the hunted.

A win at Nightmare stands apart in the records: on the title screen it counts above a win at an easier level in the same iron mode, however quick, and the best says Nightmare.

## 19. Your boat and theirs

A game of patience. Run silent, run dark. Every system here pays the captain who waits, listens and closes quietly, and charges the one who hurries. Patience is not doing nothing: the patient captain still has to act when the moment comes.

### Your boat

**The ghost.** Your boat is the quietest ship in the fleet. An attack boat drifting gives off 110 dB. A destroyer drifting gives off 148, and a cruiser 150. That gap is the whole game. You hear them long before they hear you because they are loud, not because your ears are better: a cruiser's array is finer than yours. Every burn, ping, transmission and hard turn spends some of the gap.

**The weaker ship.** A civilian hull is always the weaker ship. Identified and located, she is close to death.

- A drifting boat is quiet; a burn is heard far off.
- A ping tells everyone where you are, far beyond its echo's reach.
- A moon or a dust cloud between two ships hides each from the other.
- The baffles hide what lies astern until you turn.
- Transients and pings are what the hunter does, heard.

**A coasting boat goes where her last burn sent her.** Every correction afterwards costs battery, a little magnetism and noise. Standing orders (`standing`) and night orders (`night`) set before a fight let the crew answer a torpedo at once.

**Heat is the clock.** Nothing hides in space for ever. A drifting boat sheds her heat through the hull, slowly. A burn, a hard charge or a jammer fills the heat sink, and radiators empty it only by glowing on infrared from thousands of km. So hiding is a budget: with the sink filling, the choice is radiators out and seen, or silent running.

**Silent running** (`b`) drops an attack boat's hum from 110 to 102 dB, which cuts a destroyer's hearing range on her by more than half, and cuts her magnetic field to about a tenth. The battery is short, and restarting the reactor is a transient a listener may call.

**Close in, magnetism.** Silence does not hide the hull's field. A destroyer's magnetometer feels an attack boat at about 14 km with the reactor running, and at about 6 to 7 km with it shut down. A cold reactor and gentle turns shrink it.

### Theirs

**The destroyer.** The navy's hunter of ghosts: fast (1.2 g), nimble, two tubes, and gauss guns to 60 km. It hunts by sprint and drift: it burns towards you, then cuts the drive to listen. It hears a drifting ghost at over 200 km, and its ping finds one within about 150 km. It comes down your bearing when it hears you, and may step out of your plane and wait when it loses you close in. After you fire, a seasoned or escort captain sweeps out along the launch bearing, pinging as it drifts, and a drilled one may fire straight runners straight back down it.

**Hunting groups.** Warships that hunt together share every bearing over a datalink. Two of them hearing you is a cross-fix: they have your range at once, with no leg change. A group staggers its sprints, so one ship is always listening, and only its lead pings while the others listen in silence. If it loses you, the ships spread out and search their own lanes. The ship with the strongest active array is the group's **flagship** and does all the pinging; a cruiser always takes that job. Group-mates know where each other are over the datalink, so they are never contacts: your own group shows on the nav plot and the chart as `▲` with each ship's name. A group shares what each ship hears, so a faint blip that one ship would doubt, a group hearing it from several ships believes.

**Transmissions.** Every bearing a group shares is a transmission. A group that was quiet and is suddenly loud on EM has found something, perhaps you. A jammer is a confession: inside its cone it is the loudest thing in the sky, on its true bearing, and it floods its own ship's array along that cone.

**Captains differ.** A green captain charges, pings constantly and fires on a FAIR solution; a seasoned one sprints, drifts, listens, plans an intercept, and waits for a GOOD solution before it shoots. A **silent** captain flies an attack boat as a ghost is meant to be flown: it never pings, creeps at low throttle with long drifts to listen, and shoots from far off on a GOOD solution. Same hull, different danger.

**The cruiser.** The flagship of a battle group, with the finest array in the fleet (a long towed array, see [Passive array](#8-passive-array)), the loudest ping (185 dB), six tubes, gauss guns to 60 km, and two beams that reach 200 km and hit hardest inside 50. It rarely misses what it holds, and it takes a whole salvo to sink. It is big and loud: it gives off 150 dB drifting, turns at under 1° a second, and is deaf in a wide arc astern (70°). Its linked torpedoes are steered by its latest solution, so while one runs the cruiser is transmitting.

**The carrier.** The biggest, loudest hull in the fleet, and the best prize a ghost can take. It has no tubes and only short-range guns (40 km), and its own array hears a quiet boat only a few hundred km off. Its craft are its eyes and its reach. Pickets fly far out and listen, strikes carry homing torpedoes, and screens stay close and shoot down what comes in. Every launch is a loud transient that tells you where the deck is. Craft have short legs: a craft ranges only within a radius of its carrier. A craft finds what is loud, and calls in the destroyers. A loud craft can draw off a homing spread; straight runners take no notice of craft. Sink the carrier and its craft have nowhere to land.

**Escorts and convoys.** An escort stays close to its convoy, and with a threat in hand it jams it and moves between it and the merchants. Merchants that hear trouble turn their sterns to you and run flat out, and when one goes up the rest scatter. In late war two escorts sail together and share every bearing.

### Cover

**Terrain hides both sides.** A moon or a planet blocks every sensor, for you and for the hunter. Dust swallows signal, about 20 dB for every 1,000 km of path inside it, so a burn deep inside a cloud is hidden better than one at its edge. An ion cloud deafens whatever is inside it. A storm's cracks mask every array near them for a second. A rock field hides a ship and stops torpedoes, but it strikes a ship by the square of her speed, and the shield that stops the strikes is heard. In a wreck field a ship holding still is one warm line among many, and the only one that creeps when she moves. The chart is not complete, for you or the enemy.

### The attack

**The torpedo's window.** A torpedo fired too far out gives the target time to change course; one fired too close never arms. One good hit sinks a merchant of ordinary size and only cripples a destroyer, and a cruiser or tanker takes a whole salvo.

**After the launch.** Your firing point is on a line every escort that heard the launch now knows, and a drilled captain may answer down it at once.

**When a torpedo comes.** The drive can be pushed (`push`: a quarter more thrust, 3 dB louder, and about four minutes before something gives). A decoy (`d`) along your old course draws a homing torpedo while you turn away, and a jammer breaks a seeker's lock. Nothing jams a straight runner: only moving off its line beats it. A standing order for a lure answers the first call at once.

**Three dimensions.** Every display is flat and every habit is too, yours and the enemy's. A ship that has your bearing comes down it, on the plane it last saw you on. A captain that had you and lost you close in may drop out of your plane and wait. Clearing the baffles works up and down as well as round. In a cloud, nothing hears far and homing seekers are deaf. Crews call the drop a *Quirk's Standoff*: one ship hangs under the other's plane, cold and silent, and whoever speaks first loses. Naval 2 teaches it.

**The burn knuckle.** A hard turn under a hard burn (half your turn rate or more, at three quarters of full burn or more) leaves your plume hanging where you turned, and it fades over about two and a half minutes. The helm says so when you lay one. Infrared sees whichever is hotter, you or the knuckle, and takes it for you, so a hunter watching on infrared keeps its eye on the knuckle while a boat that cut her drive goes cold. It is neither the decoy nor going quiet, and it is paid for in fuel and in the drive's noise, which the array still hears. One knuckle a minute at most. The enemy lays them too, on purpose or not: a hunter that sprints and turns hard leaves its plume, and your infrared puts it there. Those bearings go into your track on her like any other, so a knuckle can pull your solution off until the plume fades. When infrared stands well off the array's bearing on a contact, the crew says so (`SENSORS  S1: infrared stands 18° off the array's bearing. A knuckle, maybe`).

## 20. Goals and scoring

Every engagement has goals. Required goals decide the result; optional ones (`(optional)` on the goals line) earn credit but never fail you. The engagement is **won** when every required goal is done, and **lost** the moment one fails or your vessel is.

> [!NOTE]
> **The misconception:** that sinking the target wins. In many engagements it is only half the patrol. A patrol is what it sank *and* whether it got home.

| Goal | Done when | Fails when |
|---|---|---|
| Reach | you come within its circle (`⊕ WPT` on the rose and plot) | — |
| Hear, Solution, Ping | you hear the named ship, get a solution of that quality, or ping | — |
| Drift | you have drifted, drive and thrusters off, that long in a row | — |
| Sink, Sink count | the named ship is sunk, or that many enemies are | — |
| Drive off | the named ship is sunk, or so hurt that it breaks off for good | — |
| Survive | you are still in one piece after that long | your vessel is lost |
| Spare | — (kept to the end) | the named ship is sunk, by anyone |
| **Stay undetected** | — (kept to the end) | any hostile warship **tracks** you, or a captor mine hears you and fires |
| **Stay undetected until you open fire** | your first shot (torpedo, gauss gun or beam) | a hostile warship tracks you, or a captor mine fires at you, before it |
| **Get clear** | once every other required goal is done, no hostile ship tracks you for that long, in a row | — (being tracked starts the clock again) |

**Tracked** means heard at least 5 times within a minute: one lucky faint detection doesn't count, though the hunter may come looking. Civilian ships and weapons hearing you never count. **A captor mine is the exception.** One that hears your boat and fires has detected you, and the end-of-mission box says `detected, by a captor mine`. One that fires at a static buoy has not.

```mermaid
%% A convoy patrol, goal by goal
flowchart LR
  A["Approach<br/>undetected"] -->|"first shot"| B["Attack<br/>sink three"]
  B -->|"third sinking"| C["Get clear<br/>20 minutes unheld"]
  C --> W["Patrol complete"]
  A -->|"tracked before firing"| L["Patrol failed"]
  style L fill:#ffdce0,stroke:#cf222e,color:#1a1a1a
```

### The replay

When an engagement is over, press `r` on the end-of-mission box. The replay shows the whole encounter **as it really was**: every ship's and torpedo's true track, which the console could never show you while you fought. It is the after-action report: where you were found, how close the hunters came, why a torpedo missed.

- **The map** is flat, but its viewpoint moves in three dimensions: `a`/`d` turn it, `w`/`s` tilt it from overhead to edge-on, `[`/`]` zoom, `o` looks straight down with north up, and `c` centres on your ship. Every ship stands on a drop line to a gridded reference plane, so height reads at any angle: the third dimension the rose and plot can only give as numbers.
- **Lines show who hears whom:** amber from a hostile ship that heard you, red from one tracking you, faint from you to the ships you held.
- **The timeline** runs along the foot: `Space` plays, `←`/`→` step, `+`/`-` change speed, and `n`/`p` jump to the next or previous key moment, marked on the timeline. The strip above it shows **detection pressure**: the taller the bar, the closer a hunter came to tracking you, and a full bar means one did.
- **The debrief** beside the map: for each hunter, the most times it heard you in a minute against the 5 it needed to track you, when, and how far off; who heard whom first, and by how long; your closest approach to each ship; your loudest moment and why; how long you burned and drifted. Below it, every key moment: first contacts, launches, each torpedo's hit or miss distance, what each hit cost the hull and whether it sank her, sinkings and pings. The moments keep their own part of the panel, so a long fight never scrolls the captains' sheets away; when the sheets are too long to fit, `PgUp` and `PgDn` scroll them.

- **The ledger** in the debrief: what you spent, your tanks and battery at the start and the end, and `HIT`, `MISS` and `DUD` totals. One line per torpedo gives its time, tube, weapon and solution grade at launch (`GOOD`, `FAIR`, or `BRG` for a shot down a bearing), then how it ended: hit (with the share of the hull it cost, and `sunk` if it finished her), a dud, went off early, decoyed, target turned, no solution, ran wide, circled back, shot down or ran out. The score follows, part by part: goals, tonnage and escape. Last comes the peak detection pressure, with its time.
- **The log** under the debrief: the lines the boat logged, up to the moment on the timeline, newest at the foot. Step back and you read what it said as it happened; lines from later stay hidden until the timeline reaches them. A short terminal drops the log to leave room for the debrief.

`q` or `r` closes the replay.

**Watching one later.** A finished engagement's replay is kept automatically, in `ghostboat/replays/` beside the saved exercises (`$XDG_DATA_HOME`, or `~/.local/share`), as `<date>-<scenario>-<outcome>.ron` (date and time in UTC, outcome `won` or `lost`). The newest 50 are kept, and older ones are deleted unless you kept them. **Saved Exercises** on the main menu lists them among the saves, newest first, and `Enter` opens one. From a shell:

```
ghostboat --replay ~/.local/share/ghostboat/replays/2026-11-04-125919-duel-won.ron
```

opens the viewer alone and quits when you close it. A replay holds where everyone really was, so it only exists once an engagement is decided: nothing is saved, or can be opened, while one is running. If the file can't be written (a full disk, a folder you can't write to), the log says so in one line and the exercise carries on.

### Verdict bands

Every engagement at every difficulty gets a verdict as well as a result: **Defeat, Draw, Marginal, Substantial** or **Decisive**. It is scored out of 100 from the goals you met, how much of the enemy's tonnage you sank and whether you got out. With something to sink, that is 30 for the goals, 50 for tonnage and 20 for getting out; on a run with nothing to sink, 70 for the goals and 30 for getting out. Tonnage counts every ship not on your side, traders included, except one your orders say to spare.

| Band | Score |
|---|---|
| Decisive | 85 and up |
| Substantial | 60 to 84 |
| Marginal | 35 to 59 |
| Draw | 15 to 34 |
| Defeat | under 15 |

**The instructor's note.** After a failed exercise, at every level, the end-of-mission box may carry an `INSTRUCTOR'S NOTE · THE BLATHER`: one blather, and what to try next time. The instructor finds the point the fight turned against you, usually the first time a hunter tracked you, and names your last action that could answer for it: a burn near a hunter, an early ping, holding course on the firing bearing, a shot without a good solution, a straight runner fired on less than GOOD, emptied tubes, a contact held on one leg, or speed through a rock field. A note says no more than the debrief does, and if nothing clear stands out there is no note. A won exercise gets a note for one thing only: a straight runner fired on less than a GOOD solution that missed, so a miss is blamed on the solution, not the weapon. Press `i` on the box, or point at `i the moment`, to open the replay at the moment it blames. In the replay, `i` or a click on the note goes back there, and a `◆` marks it on the timeline. The note stays in a kept replay.

A band doesn't change whether you won or what unlocks next. It says how well it went: sinking two destroyers and dying is not a Defeat. The verdict shows on the end-of-mission box and in the replay, and goes into your records. At Nightmare, the band is the point.

**Tonnage.** The end-of-mission box and the replay also show the tons you sank and the tons there to sink: each ship's dry mass, not counting your own side or a ship you were told to spare. A ship counts as yours if your weapons sank her, or if she was lost to rock, a body or a mate's torpedo while hunting you: you led her there, and the box lists those apart (`2 wrecked chasing you`). A ship that wrecks herself on patrol is nobody's. In a career fight a wrecked hunter counts only if she had heard you in that fight: one hunting something else was not led there by you. Tons are raw, as WWII aces were ranked. The level and iron mode are shown beside them and never multiplied in, and a boat that was lost keeps what it sank.

**Records.** Each finished engagement is recorded: won or lost, the time, the iron mode, ships sunk, hull left, the level, the band and the tons sunk. The title screen shows each engagement's best, and your heaviest bag and running total of tons; a win in a stricter iron mode beats a faster one in a gentler mode, and at the same mode a harder level beats an easier one. See [Title screen](#title-screen).

## 21. The war campaign

The war is an arms race in three eras, after the Battle of the Atlantic. Every technique arrives with its counter, in the same era or the next: pings against dark running, homing torpedoes against static buoys and jamming, jamming against ECCM, convoy masking against an escort outside the convoy.

![The War Campaign page: nine engagements in three eras, each with its rating, the later ones locked until the one before is won.](screenshots/campaign.png)

The campaign has its own page, **War Campaign** on the main menu: nine engagements in order. Each opens once you have won the one before it; the first is always open.

| Era | Engagements | What changes | How it feels |
|---|---|---|---|
| **Early war** | First Shot, The Atoll, Convoy | No jamming or ECCM yet. Escorts carry straight runners only. Every enemy crew is a grade greener: seasoned captains fight as green ones. Magnetometers are a tenth as keen, so a hull is felt at under half the range. Enemy merchants still broadcast their positions; by mid war they run dark. Torpedoes fail half as often again. | The happy time. A quiet ghost with a good solution owns the dark. |
| **Mid war** | Knife Fight, Escorted Convoy, Wolfpack | Nothing: the trainer's baseline. | The counters arrive: drilled escorts that jam and counterattack, homing torpedoes, hunting groups. |
| **Late war** | The Barrier, Gauntlet, Run Home | Warship ears 5 dB sharper. Every enemy crew a grade better: green fights as seasoned, seasoned as escort. Every convoy gets a second escort. Torpedoes fail 0.6 as often. Magnetometers are three times as keen: a ghost close in is felt half as far again. | The hunters win. Every patrol is a fight to get home. |

```mermaid
%% Who the enemy captains are, era by era
flowchart LR
  E["Early war<br/>green escorts"] --> M["Mid war<br/>seasoned and escort captains<br/>counterattack"]
  M --> L["Late war<br/>escort groups<br/>sharper ears"]
```

**Magazines.** Early-war destroyers sail with 60% of their load and cruisers with 70%, gauss slugs and torpedoes alike.

**War news.** The enemy's guns grow more lethal in 3130, in the middle of the mid war. From then on destroyer and cruiser guns do 20% more damage. An engagement dated 3129 opens with a warning on the wireless, and one dated 3130 with the news. Plan your hull margins by the date.

In free play the same engagement is the mid-war version, unless `w` on the title screen chooses another war. The campaign lives in `data/campaign.ron`, so you can write your own.

### Choosing a boat

The **boat** setting on the title screen (`b`) puts you in a different hull wherever an engagement gives you the standard attack boat. All of them do the same job. They differ in how much room for error they give you, and the sheet for each is in the [ship registry](#24-ship-registry-and-specifications).

| Boat | Room for error | What it costs |
|---|---|---|
| **Standard** | The fleet's balance | Nothing |
| **Cold hull** | Goes cold in about half the time, so it can shoot closer and still get away | Four torpedoes fewer, and no mines |
| **Heavy hull** | Armoured, and the bigger heat sink takes a long burn | Slower to turn and to burn, and half again as long to go cold |
| **Leaky boat** | A nimble hull, and an old torpedo that always runs true | Everything else |

**The leaky boat** is a self-set challenge: a boat from the last war in place of a modern ghost. The Mk 0 torpedo has no duds, prematures or wide runs, and the hull turns half again as fast as the standard boat. Against that it has three bow tubes and no stern tube, seven torpedoes, under half the velocity change, a louder hull, duller ears, no shield, no mines, no jammers and no ECCM. It is slow to go cold, and something breaks about every hour.

Pick the war to suit. In the **early** war the old boat fights a matched fight: green hunters with straight runners and no jammers, and merchants that still broadcast. In the **late** war it is simply a harder boat than the one the hunters were built to catch.

## 22. The career

A career is one captain, one boat and one war, fought in patrols from base. **New Game** on the main menu starts one (see [Title screen](#title-screen)). The war lasts about five and a half years, in three eras. The career ends when the boat is lost, after a third failed patrol in a row, when the captain retires at base, or when the war ends.

A new career opens on a letter from command, once: it welcomes you to the fleet by rank and name, names the boat you are given and her base, and says what command expects of you. It comes as a naval signal, as all of command's orders do: `FM COMGHOSTFLT` (from the Commander, Ghost Fleet), `TO` the addressee, and `BT`, the break, before the text and after it. The letter goes to you by rank and name (`TO LT AMES`); orders, recalls and diversions go to the boat by her name (`TO CORVID`). `Enter` takes you to the base. The war diary keeps the letter as its first entry, so you can read it again.

Each patrol starts at base with orders: most often a zone to patrol and the days to keep station there (other kinds are in [Orders and the briefing](#orders-and-the-briefing)). Command sends a boat only to a zone it can reach and come back from on half a tank. A patrol of a zone keeps station as many days as the other half lasts; a watch has its own days, and a mail run keeps no station. Drift Station, a station of ours on the way to the enemy's system, refuels a boat on the way out and on the way home. It does not feed or rest the crew: only base does. Command orders places beyond it reckoning the fuel from the station. When the fuel for base runs short, `warp to base` lays the course by the station. The sector has six zones. One is the Greystone Gap, on the Ember Run where it passes nearest the enemy's star: in the last war, boats nobody heard sank a third of a convoy there in one night. A quiet zone sees less traffic than a busy one, and some patrols meet nothing at all. A patrol may meet convoys, some with escorts; lone merchants, among them stragglers, fast ships and tankers; and warships hunting alone or in groups. **Sail** fits out the boat (full tanks, the class's food, a rested crew and the standard load, drawn from the depot) and puts to sea. After each patrol the boat goes into the yard before the next orders. The refit is paid in days, by the jobs the captain chooses there: the essentials alone take 30, and every other job adds its own (see [The yard](#the-yard)). The longer the refit, the fewer patrols the war has left. The navy names the first boat from its class's names on her first patrol. A lesser boat after a relief, or a better boat accepted, comes with her name the day the captain takes her over, and the crew screen shows it at once.

### The career's lessons

Three lessons at the end of the ghost track on the Training page teach the career before a first war: *Ghost 10: Base and Orders*, *Ghost 11: The Patrol* and *Ghost 12: Home from Patrol* (see [Tutorials](#tutorials)). Each is a career on its own screens, in a war that is always the same. A `LESSON` row shows the step and its hint on the base screens and the patrol chart, and in a fight the hint shows where a tactical lesson's does. Each hint names the key or order to use first. In a lesson the patrol column is wider, so on the patrol chart and the base screens every hint shows whole on a console of 80 by 24. In a fight a long hint may still be cut short at that size. The chart stops at each step met, so you can read the next. A lesson writes no save, no career record and no diary file, and it counts toward nothing: no verdict is banked, and rank, standing and patrols stay as they were. Retiring, accepting a boat and leaving for base before reaching the orders' place are refused. Coming home before the lesson asks you to ends it, not passed. `q` leaves the lesson for the title, after asking; it cannot be saved or resumed. A lesson won is marked on the Training page.

### The patrol chart

At sea the console shows the patrol chart: the sector, north up and fixed to space, as the Chart window is in a fight. It shows what the boat knows and nothing more:

- the bodies, each with the edge of its gravity well dashed round it;
- the places: our base and Drift Station, the enemy's harbours, the convoy lanes, a lone trader's lane and the patrol zones;
- our boat, its name and its course;
- each contact report as an estimate: `◇r1` at the reported position, inside a circle of its error. The circle grows as the report ages. A report can be stale, or wrong;
- each wreck the boat has found, as `✕ wreck`, for three days;
- the chart overlays the boat holds, each as a layer labelled with what it shows, who gave it and its age (see [Charts shared](#charts-shared)).

Traffic nobody has reported is not drawn. Beside the chart, the patrol column lists the orders by their own place (a watch names its site, not the zone nearest it), the days kept on station or the watch time left, anyone aboard beyond the crew and the days of food they cost, the course, the warp speed set, the radio, the reports with their age and error, the news heard this patrol with each item's age, and the patrol log. Command sends up to two reports as the boat sails; more come by radio at sea.

**Warp and the wells.** The boat crosses the chart in a warp bubble, in a straight line. A bubble cannot hold inside a gravity well. At a well's edge it drops to normal space, and the boat sails on at 2 km/s, on fuel, until it is clear of the well and goes back to warp. The edge lies farther out for a stronger body: a star's well is wide, a moon's small. A base, a station or a harbour inside a well is reached in normal space from the edge. Well edges are where traffic is pulled out of warp, so they are where most fights are found.

**The three clocks.** The strip under the chart shows them. None is restored at sea, except fuel at Drift Station; the base restores all three.

| Clock | Spent by | When it runs low |
|---|---|---|
| Fuel | Distance in warp (fuel an hour grows with the square of the speed), time in normal space, keeping station in the zone (at the normal-space rate), and manoeuvring in a fight | The navigator keeps the fuel to reach the nearer of base and Drift Station at standard warp, plus a reserve of 10%, reckoned as the course would be laid: round a star's well rather than through it. The strip marks that line with `│`. When fuel falls below it, the navigator calls bingo and the strip shows `BINGO`. The call is made once a patrol; a refuel at Drift Station clears it. On most patrols the bingo call is what sends the boat home. Below the line, getting home is the captain's gamble. |
| Food, which includes the water rations | Every day at sea, faster with people aboard beyond the crew: everyone aboard eats, and the strip gives the days it lasts for all of them | When it runs out the crew goes on emergency rations. After 14 days of them the boat is lost. |
| Crew wear | Every day at sea, and a share of each fight's fatigue | A worn crew hears less and reacts more slowly in a fight. Wear falls only at base. |

**Events.** As the hours pass, things turn up at sea. Each is logged as the boat learns of it, and nothing the boat cannot know is logged.

| Event | What happens |
|---|---|
| Breakdown | A system the boat has fitted fails on its own and works at 50% until damage control mends it. The log names it. |
| Ion storm | For some hours warp runs at half the speed set, for the boat and for all traffic. Time and fuel follow the slower speed. The strip shows `ION STORM` and the hours left. |
| Wreck | Found near the boat and marked on the chart for three days. `drop in` within reach of it builds a fight that holds the wreck. It never forces a drop. |
| Lone trader | A single merchant, out of reach and bound for a harbour. The sensors give its bearing and nothing more. It never forces a drop by itself. |
| MAYDAY | A ship in distress, holed and adrift. Her call comes in on channel 16 in the distress form: her name, her position from the nearest body, the nature of her distress, and the persons on board. When she is within reach, the boat drops in. |
| Unseen contact | A warship nobody saw coming. Nothing is logged. When it is within reach, the boat drops in. |

**Chart time.** The war moves on the chart an hour at a step. Outside iron mode the chart opens paused. Chart time runs in every iron mode, and pausing follows the exercise's rule: never in full iron, and three pauses of 30 seconds each in limited iron. `Space` runs or stops it, and `+` and `-` choose how fast: 10 minutes, an hour, 6 hours or a day for each real second. Chart time drops to its slowest when something happens: a report, an event, a well's edge, the bingo call, reaching the zone, keeping the station time. It keeps running whatever the boat is doing, adrift included.

| Key | Does |
|---|---|
| `Enter` or `:` | Open the conn line for a chart order. `↑` brings back earlier ones |
| `Space` | Run or stop chart time |
| `+` `-` `=` | Chart time faster, slower, slowest |
| `[` `]` | Zoom the chart in and out |
| `←` `↑` `↓` `→` | Move the chart a quarter of its width the way the arrow points. A drag moves it too. The title reads "moved, h home" while it is off the boat |
| `h` | Bring the chart home, centred on the boat |
| `c` | Show the crew in the side column, or the patrol again |
| `d` | Drop in: leave the chart for the tactical console, as the order `drop in` does |
| `q` | Save and go back to the title |

| Order | Does |
|---|---|
| `warp to anvil station`, `warp to base`, `warp to zone` | Set course for a place on the chart by its name, for the base, or for the zone in the orders, at the warp speed set. A course set inside a well starts in normal space. `warp to zone` steers for the ordered place; reach the forward station by its name, `warp to drift station`. When the fuel for base, with the reserve, is more than the boat holds, `warp to base` lays the course for Drift Station and says so; order it again there. A refuel at the station puts the orders back in force: a bingo call no longer excuses leaving station. If station time is still owed, go back to the zone; going home instead fails the patrol unless another sound reason has come up. Still at base, before the zone is reached, `warp to base` would end the patrol at once, failed, so it asks first: the same order again confirms it, and any other order drops the question |
| `warp to wreck` | Set course for the nearest wreck still marked |
| `warp speed 3000` | The warp speed, from 500 to 4000 km/s; standard is 2000. A fast bubble burns fuel steeply and is easier for hunters to notice: at twice the speed, four times as easy. So is a loud boat: an older class, a drive rattling from damage or run after it has failed, a hull that hums. A couple of decibels louder makes a boat several times as easy to notice. A boat lying adrift is ten times harder to notice than one at standard warp. A slow one costs days, and days cost food and wear |
| `drop in` | Leave the chart for the tactical console, where the boat is (the key `d`) |
| `intercept r1` | Set course to wait just clear of the well edge where a convoy lane near report r1's estimate crosses it, the crossing nearest the estimate. With no lane near, the course is for the estimate itself. The contact may cross elsewhere, or never come |
| `pause`, `resume`, `x3k` | Chart time, by order: `x1k` runs 10 minutes a second, `x3k` an hour, `x30k` 6 hours, `x100k` a day |
| `orders` | Read the order the boat is under and the date command issued it. A diversion is dated when the boat heard it |
| `news` | Read the news heard this patrol, by radio and at Drift Station, newest first, each item with its age when it arrived: the newest three, then how many older |
| `send report` | Send the boat's report to command now, by the relay in reach: her sightings since the last signal, each with its time. The first signal goes even with nothing seen. Every signal is a transmission, heard on its bearing; an enemy hunting group near enough to hear it comes looking. Out of every relay's reach it is refused, and the report goes home with the boat |
| `intel`, `intel lanes off`, `intel areas on`, `intel sightings off` | List the overlays held, each with its source, its date and its age, and whether it is shown; or hide or show one kind of them |

The navigator lays a course the way its fuel is reckoned: round a star's well, by a waypoint wide of it, rather than through it, and says so: `NAV  The course skirts Hearth's well.` A planet's well is crossed. The `COURSE` line names where the course ends, how far that is along it, and the wells it goes round, and the chart draws each leg.

A course never ends, or passes, where the drive cannot hold the boat. When the end of a course lies inside a body, nearer its surface than 1,000 km, or deeper in its pull than half the boat's full drive can hold, the navigator cuts it back along the line to the first point clear and says how high over the body it now ends: `NAV  Course ends 19,386 km clear of Kindle.` A course whose line would pass that near a body on the way is cut the same way, where it first comes that near. From where a course was cut, an order that heads further in makes no way and is refused: `NAV  No course: the line to r1's estimate runs deeper into Kindle's pull than the drive can hold.` An order that heads out is laid as usual. A base, a station or a harbour is a berth and is never moved; each lies where even the lesser boat's drive can hold her, and the way in to one is not cut short by the body it lies at. The boat does not steer round a body on the chart, so a course whose straight line passes through one is refused, and nothing changes: `NAV  No course: the line to r1's estimate passes through Kindle.` Set course first for a place whose line clears the body.

### Radio and news

Radio is light. Every message arrives late by the time light takes to cross the gap, and it fades beyond a system. Command reaches its relays by fixed links between our stations, but a boat hears a relay only within its reach. Between systems news travels by ship: a port is where a boat learns it, always as old as the voyage that carried it.

It is the same light-speed delay the sensors obey in a fight. A relay's broadcast reaches about the breadth of a system, 200 million km. Our relays are at Anvil Station and Drift Station; command's word goes to Drift Station by a fixed link, about 32 minutes of light, and is broadcast from there. The patrol column's `RADIO` line states the radio as a fact: `In reach of Anvil Station, 6 min light time.` gives the relay the boat hears and how late command's word is when it arrives; `Enemy system: their traffic only.` means the boat hears the enemy's transmissions and nothing of ours; `No signal.` means she is between systems and hears nothing.

In reach, the radio brings command's orders (a recall, or a diversion to new orders), command's contact reports, our other boats' sightings, and, in the enemy's system, the enemy's traffic: its bearing, elevation and strength, enciphered. One of our boats' sightings is a report like command's, marked with her name, so the boat can `intercept` it. A recall or a diversion is command's signal to the boat, logged as it was received: `RADIO  FM COMGHOSTFLT TO CORVID BT Recalled: return to base. BT`. An order sent while the boat was out of reach is never heard at sea: she learns it at the next port. A recall learned there binds her from then. A diversion binds while its window runs, and after that it is only news.

The ports are Anvil Station and Drift Station. At either the boat gets a briefing: the news she missed and command's news since, the war's news and command's bulletins, the mess's talk and the mail, each item dated. At Drift Station our boats' sightings are handed over too, and those she had not heard join her reports. The chart keeps the news when the radio falls silent: `news` reads it, and the patrol column lists the latest.

### Charts shared

Charts are shared like news. An overlay is a layer on the chart: the traffic lanes, the enemy's hunter patrol areas, or sightings. Each names its source and the date it stood as of, and shows its age. Command hands over its overlays at base, in place of all the boat held. Drift Station hands over its own and our boats' sightings, as far as they have reached it. Our boats within 10 million km share theirs by datalink, late by the light time. An overlay is only as good as its source: command may not know every lane, a patrol area is where a group patrols and not where it is, and a sighting says where a contact was when she was seen. A contact heard on a bearing only is drawn as a line from where she was heard, since a bearing gives no range.

The captain's sheets of glass stay the captain's own: an overlay is a layer to show or hide with `intel`, never a sheet to draw on. When the boat reports in, by `send report` or at base, her own sightings go to command, and later briefings carry them.

### Dropping in

`drop in` builds a fight where the boat is: the bodies near it, the terrain rolled for the well it is in, every group within reach, and the boat itself with its fuel, food, torpedoes, damage and wear. The fight is dated by the war's calendar. Four things drop the boat in without an order: reaching a well's edge with traffic in reach, being noticed by a hunting group in reach, a ship calling MAYDAY within reach, and an unseen contact within reach. A wreck or a lone trader never does: dropping in on them is the captain's choice. The briefing gives the place and the boat's own state, never who else is there; only the sensors can say that. A convoy or a lone trader within the array's hearing gives its bearing as it comes into hearing, and a louder ship is heard further off. Hunting groups run quiet and give none.

The fight is played in the full tactical console, with its setups, windows and themes. `setup patrol` puts the patrol chart, as it stood at the drop, in the main window. A drag moves it, as it moves the plots, and `c` brings it home to the boat with them; there the arrow keys stay the helm's. A career fight ends in one of two ways: the boat warps out, or the boat is lost. Nothing else ends it, whoever is or is not out there. Inside a well the goals line reads "Clear the well.", because warp needs clear space; meeting it ends nothing. In open space there is no goal. If the boat is lost, `q` goes back to the record. While the fight runs, `q` does not leave it: the way out is to warp out.

| Order | Does |
|---|---|
| `warp out` | Spin up the warp bubble and leave the fight for the chart. The bubble moves and the boat inside it does not, so it forms only round a boat at rest, clear of every well's edge, with her drive cold. Moving, `warp out` is refused: order `full stop` first, and the braking burn is heard. Inside a well the reply names the well: a well's pull distorts the bubble, which is why it cannot form there, and why nearing one drops a ship out of warp. No contact stops the bubble, warship or not. The cost is the spin-up itself (`warp_spinup_s` in `tuning.ron`, 15 minutes by default, counted down as WARP on the top bar), and it is a dangerous time. Powering up the warp crystal radiates as hard as the boat's drive at full power and throws out a strong magnetic field, so warships hear you and their magnetometers feel you hundreds of kilometres off; and the crystal's noise deafens your own array until you warp. A well entered or the drive lit meanwhile stops it; drifting in a body's pull does not, since the boat and the bubble fall together. A ghost cannot warp out of a bad situation. Get clear and break contact first, then stop and spin up where no hunter is near |
| `recover` | Bring aboard the people of the lifeboat or pod close aboard: within 2 km of her and all but stopped beside her. It takes 10 minutes, the boat holding close and steady all that time. How many she holds is unknown until they are aboard. Those the boat has no room for stay in the pod. In a lesson the same order brings aboard a practice shot (see [Practice shots](#practice-shots)) |
| `land` | Put the operatives ashore at the ordered landing point: within 5 km of it and all but stopped. It takes 30 minutes |
| `search s3` | Send a party across to search crippled merchant s3: afloat at under half her hull, the boat within 2 km of her and all but stopped beside her. It takes three hours. The party learns her cargo, takes any papers, or a mail packet's dispatches, and brings off a passenger who matters, as a prisoner: the one kind of prisoner the boat takes. There is no fighting aboard |
| `confirm fire` | Carry out an order to fire on a contact the crew have called a life pod or lifeboat. The crew query any such order, by key or at the conn, and time drops to x1. A torpedo fired at another ship, or down a bearing, whose line passes within 5 degrees of one is queried the same way; for a spread, the 5 degrees are counted from each wing. So is a carrier sent at one. Only this order, typed within 30 seconds, fires; no key does. Any other order, or the time running out, withdraws it. Hitting a pod is a breach of the rules of war. Firing on one on purpose is a grave breach: the patrol fails, the captain is relieved on return, and a second ends the career |

Every life pod carries a distress beacon. Any ship with an EM intercept receiver hears it: a warship out to about 630 km, a cruiser out to about 790 km, and the few merchants that carry one out to about 60 km. Most merchants, the minesweeper and fighters carry none, and hear a pod only by her hum. The beacon is never heard from the patrol chart. A ghost hears a pod's faint hum now and then out to a few hundred km, so a warship hears the beacon farther than the hum. An ion cloud's static costs the beacon no more than it costs the array. So while your sensors are sound, wherever the crew can hear a pod, they hear her beacon too. Damage to the sensors shortens the beacon's reach, as damage to the array shortens the hum's, and a pod heard only by her hum may be taken for something else. The crew know a pod heard on her beacon for a lifeboat at once and for certain, so they never call her a torpedo, and she reads as neutral whoever's people she carries. Hunters within reach hear her too, and never take her for a target. No ship passes her on over the datalink.

`Q` saves the fight as it stands and goes back to the title; Continue opens it again. In a career fight, `save` and the end box's `s` keep nothing apart: the career has its one save.

Back on the chart, the fight's time has passed on the calendar. If the fight took the fuel below the line for home, the navigator calls bingo then. The boat is where the fight left it, on the course it had, or adrift on the fight's last velocity if it had none. It keeps what the fight left of it: fuel, food, torpedoes, hull and system damage, and a quarter of the fatigue the fight added. Damage control goes on mending damaged systems on the chart, slowly and one at a time: the engineer the drive, reactor and radiators, the COB the rest. A tired, green or short-handed crew mends slower. Nothing is mended past what can be done at sea, and the hull is mended only at base. Ships sunk leave the chart. A ship left under half its hull limps on alone, slowly. A group that lost a ship, or had one hit, stays alert for two days. A group that lost nothing stays quiet, even one that saw the boat. A convoy or a lone trader that was hit radios the hunting groups in its system. The call travels at the speed of light, so a group in that system hears it within minutes and answers within the hour, and a group in another system never hears it. A group that has heard sweeps the area where the attack was reported for those two days, in a widening square, and notices a boat more readily and from further off. Tonnage sunk is pending: it counts only once the boat is home, and it is lost with the boat. Losing the boat ends the career.

### Station and coming home

Time on station counts while the boat is inside the zone, on the chart or in a fight begun there. Keeping station is a patrol under way, so it burns fuel at the normal-space rate. Command judges a patrol when the boat comes home. It passes when the boat reached its zone, kept station for the ordered days or left for a sound reason, and came home. Leaving the zone before the station time is kept, by `warp to base` or by any course out of it, records the sound reason the facts give at that moment, in this order: the bingo call, tubes and racks empty, damage (the hull, or any system, under half), or a worn-out crew (80% wear or more). With none of them, command fails the patrol for leaving early, and a reason that comes later, a bingo called while chasing a convoy beyond the zone, say, does not excuse it. A refuel at Drift Station spends a bingo call, as it would a reason to leave, so the station time owed is owed again; any other reason stands. On arrival at base the patrol report comes up, then the yard, then the base, with new orders once the refit is confirmed.

**Rank.** The career's rank comes from patrols passed, time in service and standing together. Standing rises with tonnage, in proportion to what command expects for the era, and with warships sunk, and falls with each failed patrol. A relief costs a rank.

| Rank | Patrols passed | Time in service | Standing at least |
|---|---|---|---|
| Lieutenant | 0 | 0 | none |
| Lieutenant Commander | 4 | 1 year | -1 |
| Commander | 9 | 2½ years | 1 |
| Captain | 15 | 4 years | 3 |

A Captain with outstanding standing when the war ends is made Commodore. Keeping station and sinking nothing passes a patrol, but it never earns more than Lieutenant Commander. Standing only holds back a promotion: a rank once earned is kept when standing falls, and only a relief takes one away. At the yard, rank sets what the yard will do and standing how fast it works: see [The yard](#the-yard).

### The yard

After the patrol report the boat goes into the yard, before command's orders are drawn. The yard screen lists each job the yard offers, with its days, then the total and the day she sails if the choice stands. `↑` and `↓` move, and `Enter` chooses a job or drops it. The last row, **Confirm the refit**, confirms it: its days pass, and command's orders come dated for the day she sails, since a boat in dock does not know her next orders. `Esc` goes back to the base with the refit still waiting, and the boat cannot sail until it is confirmed. **Yard** on the base menu, or `yard` on the conn line, opens it again. While command's offer of a newer boat stands, the yard will not confirm the refit: accept the offer or decline it first, so the refit is done to the boat that sails.

| Job | Days | Who may order it |
|---|---|---|
| The essentials: fuel, stores, torpedoes from the depot and rest for the crew | 30 | Always done |
| Mend the hull | By the damage. The days grow fast as the damage grows | Always done |
| Repair a damaged system in full | By the damage | Everyone |
| Patch a damaged system | 2 | Everyone |
| Fix one known quirk | 10 | Commander and above |
| Fresh torpedoes: the least worn the depot holds | 3 | Commander and above |
| Fit new equipment | 15 | Captain and above |

**Rank opens jobs.** A job above the captain's rank is shown greyed, with the rank that opens it (`from Commander`), so the screen shows what a promotion brings. One quirk and one fit a refit.

**Yard priority.** Standing above +2 moves the boat up the yard's queue. Every job's days are cut, more the higher the standing, up to a quarter at the highest. The rows show the days after the cut, and `YARD PRIORITY` says how many days it saved. Shore leave is never cut: its 14 days come on top. A captain relieved of command serves the months ashore first, and the work is done within them.

**Patch or repair.** The hull is always mended before the boat sails. Each damaged system is set to a full repair, and `Enter` on its row patches it instead: 2 days, but the system works no better than 90% until a later refit repairs it. Damage control mends it at sea and in a fight, up to that cap and no further. The base and the patrol column show each patched system with its cap: `The drive patched: 90% at best until a refit repairs it.`

**Paid off.** A boat whose hull would take more than about 180 days to mend is paid off. She goes out of service, her history is closed, and her fits and patched systems go with her. Command gives the captain another boat at once, by the same steps as an accepted offer: the newer class if command had offered one, otherwise another of her class. It cannot be declined. Name who comes to her, then the yard fits her out.

**Worn torpedoes and the depot.** At each return the boat's torpedoes go back to the depot, and she sails with a new issue. Each torpedo comes with her log of practice runs: about 20 in the early war, some over 40, about 8 in the mid war and about 2 late, mostly new from the factory. Standing above +2 buys better stocks: the depot draws each torpedo twice and issues the fresher. From Commander, **Fresh torpedoes** takes the least worn the depot holds. A worn torpedo is a little likelier to fail: see [Torpedo wear](#torpedo-wear).

**New equipment.** From Captain the yard may fit new equipment, one fit a refit. Each enters service through the war, as the newer classes do, and changes a figure the boat already has. A fit brings an older boat part of the way toward the newer classes, never past them.

| Fit | In service | What it changes |
|---|---|---|
| Resilient mounts | Mid war | Her own noise: she is a little quieter |
| Array processing | Mid war | The array hears a fainter ship |
| Reload gear | Mid war | The tubes reload faster |
| Cold-running fit | Late war | The hull sheds heat faster, so she goes cold sooner after a burn |

A fit stays with the boat and is in her history. A new fit may show a small fault on its first patrol: a new quirk the crew find, as quirks are found. If the boat is paid off, her fits go with her, and the next boat starts without them.

**The record.** The patrol report names the boat's fits. The career's record lists, for each boat, her fits, her patched systems and every refit: the day the yard took her, its days and the jobs done.

### The crew

The boat has nine named crew and the hands, the rest of her company taken together. Crews are mixed: each crew member is a person with a name and their own pronoun, and nothing about who they are changes what they can do. The named crew are:

| Post | Watch | Skill | What it changes |
|---|---|---|---|
| Executive officer (the exec), navigator, weapons officer | Take turns as officer of the deck, in charge of the watch | Ship handling | How quickly helm and engine orders are carried out |
| Three sensor operators | One on each watch | Sensors | How faint a contact is heard, and how often a class call is wrong |
| Chief of the boat (COB) | Day worker | Damage control | Repair speed |
| Engineer | Day worker | Machinery | Repairs to the drive, the reactor and the radiators |
| Torpedo petty officer | Day worker | Torpedoes | Reload time |

**Skill and wear in words.** Skill runs from Green through Qualified, Steady and Seasoned to Expert. A Steady crew member does the job exactly as every exercise in the trainer assumes; a Green one is slower and hears less, an Expert one quicker and sharper. Each crew member also carries their own patrol wear: Fresh, Tired, Worn or Spent. Wear rests only at base.

**Watches.** The captain chooses the watch scheme, at base or on the chart:

- **Three sections**, the default. Each crew member stands four hours in twelve: one officer of the deck and one sensor operator at a time, while the others rest.
- **Port and starboard.** Two of the three sections are on watch at a time, eight hours in twelve. Two sensor operators share the watch. The better one keeps the live array and sets what it hears. The second reviews the waterfall's history, a minute at a time, and can find a faint contact that holds steady, one the live watch keeps missing. A contact the second operator follows is lost only after two minutes of history have missed it too, so a faint one stays on your screen. The crew tire about twice as fast.

The COB, the engineer and the torpedo petty officer are day workers: they tire when they work. From 0200 to 0600 ship's time, the middle watch, those on watch work as if a little more tired than they are. Who stands it is the captain's choice: `swap` trades two crew members' watches. **Battle stations** (condition red) puts everyone at their post, and the best sensor operator takes the array. Nobody reviews the history then. In a fight battle stations is the only change: watches are changed between fights.

**Learning.** A crew member gets better at their own job by doing it: a sensor operator with each new contact heard on their watch, the torpedo petty officer with each reload, the COB and the engineer with each repair, an officer with each hour in charge of the watch in a fight. Gains shrink as skill rises. On station the captain may order **drill**: everyone improves slowly, and everyone, the hands too, tires faster. `exec attack` gives the exec the next attack. The exec has the conn for the whole fight, whatever the watch, and does not rest until it is over, even at WHITE. Helm and engine orders take about 15% longer in the exec's hands, and the exec learns at twice the rate.

**Losses.** A hit on a system can hurt or kill the crew member working it: a sensor operator on watch at the array, the officer of the deck in the control room, a day worker where they are working. At battle stations everyone at their post is exposed. A hit can also kill or hurt some of the hands. The log says so plainly, and the patrol report names those killed and hurt. A crew member who is hurt misses the next patrol. Until base one of the hands covers their post; for the next patrol a newcomer stands in, and leaves when they come back. Losses are not made good at sea: below the boat's full complement every reload and repair, and every helm and engine order, takes longer, and the crew tire faster, in proportion to those lost. The killed no longer eat or breathe; the hurt still do. At base the boat is brought back to full strength, by newcomers who are mostly Green or Qualified.

**At base.** Command moves people as the war goes on:

- At each refit a crew member may be transferred to another boat, about one in twenty, and never more than two at once. A newcomer takes their post and watch.
- Command may take the exec for a command of their own, more often for a skilled exec under a captain in good standing. The captain cannot refuse, and must choose the new exec before sailing: the navigator promoted, with a new navigator joining, or the officer command sends, likely Qualified.
- A relieved captain asks the exec to come to the lesser boat. The longer they have served together, the likelier the exec is to come; a Seasoned or Expert exec would sooner wait for a boat of their own. The rest of the crew stay with the old boat.

**Knowing the boat.** Each crew member, and the hands as a group, come to know the boat patrol by patrol: none, some, good, and full after about ten patrols. It shows in her routine, not in a fight's outcome: reloads a little quicker, faults the crew have met before mended a little faster, fewer slips when running quiet, and a warning before a fault they know cuts out. Newcomers start knowing nothing of her.

**A crew's character.** Most crews have none. Some stick together: fewer ask to leave, and the exec is likelier to follow the captain. Some do not stay long. Nobody says which until it shows in what they do; then the COB remarks on it, and the boat's history keeps it. It never changes how well anyone works in a fight.

**A newer boat.** From mid war, command may offer a Commander or above in good standing a newer class: the heavy hull from mid war, the cold hull from late war. The base lists **Accept** and **Decline** while the offer stands. Declining costs nothing, and command may offer again at a later refit. The offer comes as the boat goes into the yard, and the yard confirms no refit until you answer it. Accepting asks the exec and up to two others you pick to come; the rest stay with the old boat. The navy names the new boat, her history opens, and nobody aboard knows her yet. A crew who do not stay long may refuse to come.

**Shore leave.** At base, **Shore leave** sends the crew ashore for 14 days beyond the refit. For the next three patrols their wear builds a quarter more slowly. Leave at two refits running costs a little standing.

| At base | Does |
|---|---|
| **Yard** | The refit waiting: each job and its days, and the day she sails (see [The yard](#the-yard)). Listed first until the refit is confirmed |
| **Crew** | The crew screen: each crew member's post, name, skill, wear, watch and how well they know the boat, then the hands and the watch scheme. `Space` picks a crew member, `s` trades the watches of the two picked, `w` changes the scheme |
| **Promote the navigator**, **Take command's officer** | Choose the new exec, while command has taken the old one |
| **Accept**, **Decline** | Answer command's offer of a newer boat, while it stands. Accept opens a pick of up to two to come along |
| **Shore leave** | Leave for the crew, once a refit |
| **Retire** | Leave the service: asks first (`y` retires), then the career ends and its record is banked |

On the chart, `c` shows the crew in the side column, with `▸` against those on watch and the sections who have it. In a fight, `show crew` puts the crew window in the focused window, as the fight has them.

| Order | Does |
|---|---|
| `watch three`, `watch port` | Three sections, or port and starboard. At base or on the chart |
| `swap nav weps`, `swap exec okafor` | Trade two crew members' watches, each named by post (`exec`, `nav`, `weps`) or family name. Both must stand watch, both officers or both sensor operators, and both be fit for it; the reply says why not |
| `drill`, `drill off` | Drill on station, or stop it. Leaving the zone stops it |
| `exec attack`, `exec attack off` | The exec leads the next attack, or the captain does |
| `show crew` | The crew window, in a career fight |

**The report and the record.** The patrol report names the killed and the hurt, the hands lost, and what happened at base: transfers, the exec taken, a relief or an offer. When the career ends, its record lists every boat the captain commanded, with her history, and everyone who served, with their posts, their boats and what became of them.

### Orders and the briefing

At base command issues the orders for the next patrol, dated. With standing above +2, command offers two orders and the captain keeps one; a special mission is never offered beside another. The order says what to do and where: patrol a zone, sink a tonnage there, watch a place and report what is seen, or a mission. A mail run has no station time: it names where the dispatches are collected and where they are delivered, or where to meet our mail packet. Our packets keep to a schedule. An order to meet one says when she is due at the meeting, as a date and time: the first time she passes it that a boat sailing straight there can be there to meet her. The patrol column shows it on the `PACKET` row until her dispatches are aboard, and `orders` repeats it. The chart stands still while you fight, and she with it, so her time moves on by the length of any fight after she sails. If she has not passed by an hour after her time, command sends word that she is late, with her new time. The word comes by radio, light-lagged, or at a port if the boat is out of reach. The meeting itself is out of our radio's reach, so a boat waiting there hears no such word at sea. She learns it at her next port. Operatives for a landing come aboard as the boat sails.

The briefing gives everything else command and the port have for the boat, each item dated. A contact report says where the contact was when she was seen, and its error has grown since; its age is how old it was when it reached base. The mess's talk is word from other crews, sometimes rumour and sometimes wrong. The mail is letters for the crew, or none, and the crew say what they think of either.

The patrol report gives command's verdict on the order on its own terms: an order met or not, a mission done or failed, a lifeguard station graded by how many of those adrift came home, or a landing made whose outcome is not yet known. That news comes later, in the report of the patrol that hears it. The report lists each ship sunk with the cargo command learned she carried; the rest are "cargo unknown". The record lists each patrol's order and verdict, and says plainly when a patrol failed and why, and when the captain was relieved.

| At base | Does |
|---|---|
| **Order 1**, **Order 2** | Keep one of command's two orders, while two are offered |
| **Briefing** | The briefing in full |

| Order | Does |
|---|---|
| `orders` | Read command's order, or the two offered, and the date issued. At base, or on the chart |
| `order 1`, `order 2` | Keep one of command's two orders. At base, while two are offered |
| `news` | Read the news, each item with its age: at base, the briefing in full; on the chart, the news heard this patrol |

**The orders.** Each order says what command asks, and command judges the patrol on it:

| Order | What it asks | Done when |
|---|---|---|
| Patrol | Keep station in a zone for the days ordered | The station time is kept, or the boat left for a sound reason |
| Sink | Sink a tonnage in a zone, keeping station there | The tonnage is sunk; short of it, it is judged as a patrol |
| Watch | Keep watch on a place (where a lane crosses a well's edge, or a harbour's approaches) for the days ordered, and report what is seen | The watch is kept and the report delivered, by `send report` or carried home. A quiet watch honestly reported is a success |
| Pick up survivors | Take survivors, of any side, from lifeboats and pods in a zone, after a sinking or wherever the boat finds them, and bring home a number of them | That many come home alive. A prisoner taken off a searched merchant is not a survivor and does not count |
| Lifeguard | Stand by a place where command expects crews adrift, of any side, and bring home whom the boat can | Graded by how many of those adrift came home |
| Landing | Put the operatives ashore at a place near an enemy body or harbour | The landing is made. Whether it went well comes later, as news |
| Mail run | Collect dispatches at one port and deliver them at another, or meet our mail packet at a place and bring her dispatches home | The dispatches are delivered. It has no station time |
| Mail sweep | Sweep the run of our mail packet, Kittiwake, ahead of her sailing, and report what lies in wait on her road, or sink it | The packet arrives. The grade follows what the boat reported or sank, and command's verdict waits for word of her fate |

**People aboard.** Survivors, operatives and prisoners all eat and breathe. On the chart the food runs down faster, and in a fight the air fouls faster. A boat takes aboard no more than half her class's crew. The patrol column lists who is aboard and the days of food they cost.

**Cargo.** Every merchant carries a cargo, and the contacts list never shows it. It shows in three ways. A hit may set off a volatile cargo in a flash the sensors see; the crew say what they make of it, and they can be wrong. A search of a cripple finds it. And at base the patrol report says what command learned each ship sunk carried; the rest are "cargo unknown".

A merchant may carry any of these:

- Warp crystals, which are to this war what oil was to the last. Volatile.
- Munitions: ammunition, torpedoes and mines for the front. Volatile.
- Fertiliser and chemicals. Volatile.
- Priority cargo: what the war needs at once, such as machinery, spares and reactor parts.
- Ore and ingots for the yards. This is the bulk trade.
- Scrap for the smelters.
- Water ice, for life support and oxygen.
- Small craft on deck.
- Food.
- Consumer goods.
- Medical supplies.
- Crews and troops in passage.
- A passenger who matters: an officer, or a defector.
- Papers and cipher material.
- Mail. Mail packets carry it.

What the lanes carry changes with the war. Water ice is commoner early in the war, and scrap late.

Mail and warp crystals are the war's two most valuable cargoes. On a patrol that passes, each ship sunk earns standing for her tonnage. When command learned what she carried, her cargo's value adds a little more: most for crystals and mail, then munitions and priority cargo, and a little for the trade cargoes. Tonnage still counts most. Whatever she carried, a ship sunk is another ship the other side doesn't have.

**Mail.** Between systems only a ship carries news, and mail packets are the ships that carry it. An enemy packet carries the enemy's dispatches between systems: sinking her delays the enemy's news, and searching her takes the dispatches. Our own mail reaches the boat only at base or Drift Station, as letters for the crew, or none, and the crew have something to say about either.

**Mail sweep.** A mail sweep sends the boat along the run of our mail packet, *Kittiwake*, ahead of her sailing. The order names her two ports and when she sails. The patrol column's `MAIL` row shows her sailing, then the latest word command has sent of her: held, sailed, rerouted, recalled, in or overdue. Enemy warships may lie in wait on her road, though not for ever. `send report` sends the places of your fights; it reaches command only after the light time, and only from within a relay's reach. Command acts only on what it has heard. A reported place near her road ahead is a mark. A mark heard before she sails holds her in port, never more than a day past her sailing. After she sails, command sends her a new course round the marks, or turns her back to the port she left when only the way back is clear, and posts her overdue if she does not come in. A course reaches her only where a relay reaches her. A report of a sinking, as your crew called it, clears the marks near it. Her fate is decided out of your sight, and the verdict waits for word of it. The grade: *Cleared* when she arrived, the approaches were swept, every threat was sunk or reported in time, and you reported after sweeping the far approaches and before she reached them; *Through* when she arrived otherwise. If she is lost, the mission fails, and command's trust in you falls unless the threat that sank her had been reported in time. A sweep whose far approaches you never reached fails the patrol.

### The war diary

Each career keeps a war diary: one dated record of the war, entered as things happen, in the terse voice of an official log. It holds command's welcome letter, then the patrols (sailing, reaching station, a call at a port or station, leaving early and why, a mission's outcome, and the return with command's verdict), each fight (where, what was met, the ships sunk, and the hands hurt or killed), the crew's changes (wounded, killed, transferred, newcomers, those who stay with a boat you leave, the exec taken, shore leave, a promotion or a relief), the boat's (commissioned, an offer made, declined or accepted, the near-loss, each refit with its jobs and days, paid off), command's news on the day it was heard with the day it was sent (orders changed by radio among it), your own notes, and the war's end.

The diary holds only what you were shown. A contact the crew never identified stays as they called it, a quirk is entered only once the crew find it, and command's private opinion of you is never entered. Keeping the diary changes nothing in play.

**Opening it.** At base, **War diary** on the base menu, or `diary` on the conn line. At sea, `diary` on the patrol chart's conn line. The diary never stops the chart: chart time runs on behind it, in iron mode or not. Anything that would stop the chart (a drop into a fight, an arrival, news, an alarm) closes the diary back to the chart, so you see what happened. A note you were typing goes to the chart's conn line, to be finished there. If the boat came home, it waits on the base's conn line after the patrol report. In a fight the diary does not open: the fight's own log serves, and the diary enters the fight when it ends.

**The page.** One scrolling page under a heading of two lines: the captain and the boat, then the war's first and latest dates, In service or how the war ended, and the tonnage. A heading opens each patrol (`Patrol 2: Lantern Reach`) and each spell at base (`At base: Gantry`). Each entry is a line or two under its date.

| Key | Does |
|---|---|
| `j` `k`, `↑` `↓` | Move |
| `PgUp` `PgDn` | The previous or next patrol |
| `Home` `End` | The war's start, or today |
| `Enter` | On a sailing or a return: open that patrol's report. On a fight: open it at that fight's attack data. In the report: its chart log |
| `n` | Write a note |
| `w` | Write the diary's files now |
| `Esc` | Back a level, then out of the diary. `q` does the same |

**Notes.** `n` opens a note line at the foot of the diary: type the note, then `Enter` enters it, or `Esc` drops it. `note <text>` on the conn line does the same at base or on the chart. A note is one line of at most 120 characters, entered under today's date and marked as yours. An empty note is not entered. A note that is too long is refused, and the line stays open with your text so you can shorten it. Notes made at sea are the patrol report's remarks.

**The war patrol report.** Each patrol has a report, laid out after the real form. It is kept while the patrol runs and closed when the boat comes home, or when the war ends at sea. Its heading gives the patrol's number, the boat, the zone, the orders and the verdict. Then:

| Section | What it holds |
|---|---|
| SHIP CONTACTS | Each contact met in a fight, as the crew called it: the day, the range if the crew had a solution, and what was done (`attacked`, `attacked, presumed sunk` or `met`) |
| ATTACK DATA | For each fight, each torpedo fired: the tube, the type, her practice runs, the target and the result. A target is named only where the debrief named her, for a hit or a dud |
| DAMAGE AND DEFECTS | The systems damaged or patched, and the hull at the return |
| PERSONNEL | The crew's changes this patrol |
| ENDURANCE LEFT | Fuel, food and torpedoes at the return |
| DURATION | Days at sea, and days on station |
| REMARKS | Your notes made during the patrol |

`↑` `↓` scroll the report, `PgUp` `PgDn` page it, `Enter` opens the patrol's chart log, every line of it, and `Esc` goes back. The patrol at sea has no report yet: it is written when the boat comes home.

**The files.** When the war ends, however it ends, the diary is written to two files in `ghostboat/diaries/` beside the saved exercises (`$XDG_DATA_HOME`, or `~/.local/share`), named by the war's code: `7F3A-91C2-K4M0.txt`, plain text laid out for 80 columns, and `7F3A-91C2-K4M0.md`, the same in Markdown. `w` in the diary writes them at any time, and a later write replaces the earlier. Each holds the whole diary in date order, then every patrol report with its chart log. If the files cannot be written, a notice says so and the game goes on.

**The War diaries list.** **War diaries** on the main menu lists the diaries written, newest first, each by its two heading lines. `↑` `↓` choose, `PgUp` `PgDn` page, and `Enter` opens one in the game's reader, where `↑` `↓` scroll, `PgUp` `PgDn` page, `Home` `End` go to either end, `/` searches as the manual does (`n` and `N` step through the matches) and `Esc` goes back. A finished war is read from its file, so its diary outlasts its save.

**A war from before the diary.** A career saved before the diary existed begins one on the day it next loads: "The diary begins here.", after what its save lets the diary rebuild: the orders sailed on, the refits and the boats commissioned, each on its own date. The patrols rebuilt have no reports, and `Enter` on one says so.

## 23. Scenarios

Lessons live in `data/tutorials/`, one folder per track (`civilian/`, `naval/`, `ghost/`, `hunter/`), and challenges in `data/scenarios/`. The title screen lists the lessons under **Training** and the challenges under **Scenarios**. Choose one there, or start one directly with `cargo run --release -- data/tutorials/<track>/<file>` or `cargo run --release -- data/scenarios/<file>`. A third folder, `data/testbench/`, holds physics and sensor checks. They are not exercises for a captain: load one by path (see the development guide).

### Tutorials

| Scenario | File | What it teaches |
|---|---|---|
| Civilian 1: The Console | `civilian/01_tutorial_console.ron` | **Start here.** Nothing to do but look: the rose, the contacts table, the waterfall, time compression, and where the menus and manual are. |
| Civilian 2: Flying in Space | `civilian/02_tutorial_flying.ron` | Newton, not the sea: turn, burn, coast, turn your tail to your course and burn to a stop, then fly to a beacon with flight assist. |
| Civilian 3: Up and Down | `civilian/03_tutorial_up_down.ron` | Space is 3-D and the screens are flat: read a contact's elevation (`EL`), pitch the nose, and climb to a beacon using the profile view. |
| Civilian 4: Range from Bearings | `civilian/04_tutorial_range.ron` | A passive contact gives bearing, never range: a leg change for a FAIR solution, a ping for a fix, then a beacon. |
| Civilian 5: Running Quiet | `civilian/05_tutorial_quiet.ron` | A patrol passes, listening. Drifting with the reactor up, your warm hull glows in infrared and it finds you; rig for silent running (`b`) and it goes by; burn and it hears you at once. |
| Civilian 6: The Board | `civilian/05b_tutorial_power.ron` | Short and quiet. Put the board on a named setting, burn on a capped reactor, cut a load by hand, and put it all back. You never have to touch the board, but it can stretch a tank or get you past a fault. |
| Civilian 7: Stopping on a Mark | `civilian/05c_tutorial_stopping.ron` | Stopping is a burn the other way, and it covers ground. Burn to 1 km/s (`burn to 1`), work out how far out to start, turn end for end (`reverse two thirds`), slow to a crawl (`slow to 0.1`), drift in and stop (`full stop`). |
| Civilian 8: Meeting a Moving Ship | `civilian/05d_tutorial_meeting.ron` | To meet a ship, match her velocity before you close. Match a tender by hand from the contacts table, close on her once she sits still on the plot, then match again with the aid (`match s1`): it points the helm, and you burn. |
| Civilian 9: Gravity | `civilian/05e_tutorial_gravity.ron` | A moon bends every coasting course. Watch CSE on the TURN gauge and the helm's collision call show a line that missed on a ruler hit, use the autopilot to get onto a safe line, then coast past by hand. |
| Civilian 10: The Long Passage | `civilian/05f_tutorial_passage.ron` | Three charted waypoints and over 30,000 km. Cross them on the Chart view with time compression (`+`, `step 5m`, `call me waypoint`), see it drop back to x1 when something happens, and plan the stop at the end. |
| Civilian 11: Radio and Comms | `civilian/05g_tutorial_radio.ron` | **Ships talk.** Hear the traffic on the working channels, answer a patrol's challenge with `reply`, hail a freighter with `hail s1` and follow her to a working channel, and light your transponder. Every call puts you on the air (`TX`), and anyone listening hears your bearing. |
| Naval 1: Taking Command | `naval/06_naval_command.ron` | **The advanced track starts here.** A warship has no autopilot: dial an order and give it with `Enter`, ring the engine telegraph, order all stop, stop the ship with `full stop`, and make for a beacon with a controlled burn (`burn to 1`). Your crew answers in its own time. |
| Naval 2: Think in Three Dimensions | `naval/07_naval_three_dimensions.ron` | **The duel in the cloud, taught, aboard a ghost.** A hurt cruiser, the *Pequod*, her drive wrecked, comes down on you inside the Shroud, each of you with a FAIR fix on the other, and she fights on a plane. Pitch the nose down, cut the drive, rig for silent running and sink out of her plane; turn your bow tubes to where she will go; hear her pass over, ping for a GOOD solution, and sink her with straight runners as she opens out, keeping the beam to finish her. In a cloud only straight runners and the beam work. The drop has a crew's name, a *Quirk's Standoff*: you hang below her and say nothing. Stay on the plane and she finds you first. Her captain is the same every launch. |
| Naval 3: Torpedo in the Water | `naval/07a_naval_torpedo_in_the_water.ron` | **The answer to a torpedo, and why.** A crippled destroyer shoots at your ghost with homing torpedoes. Turn the torpedo astern, burn, drop a noisemaker and a decoy (`j`, `d`), cut the drive and rig for silent, then get clear. Noisemakers and decoys draw a seeker, and going quiet leaves it nothing better; none of it stops a straight runner, which only getting off its line beats. |
| Naval 4: Damage Control | `naval/07b_naval_damage_control.ron` | **Mend first what you need next.** Start hurt, with the drive failed, the array damaged and the battery meter stuck. Put the parties on the drive (`repair drive`), find the lying gauge by asking the crew (`battery`, `repair battery`, `gauges`), bring the array back, then rig for silent to stand the parties down. |
| Naval 5: Heat and the Radiators | `naval/07c_naval_heat.ron` | **Run hot, cool down unseen.** Burn with the radiators in until the sink is 75% full, put the radiators out and watch the infrared jump (`sig`), bring them in again, and coast cold while the hull sheds the rest. Radiators are fast and seen from thousands of km; the hull is slow and nearly invisible. |
| Naval 6: Ears and Voices | `naval/07d_naval_ears_and_voices.ron` | **The aid points; the captain flies.** Hear a merchant with her beacon on, set how much the crew says (`reports all`, `normal`, `quiet`), and shadow her: `match s1` points the nose for the matching burn, the TURN gauge and `turn status` show how hard the helm is swinging, and you burn it yourself. Then coast beside her at a steady range. |
| Naval 7: Night and Standing Orders | `naval/07e_naval_night_orders.ron` | **The watch, by your orders.** Choose the night orders that say what wakes you (`N`, `night patrol`), ask for a call (`call me at 01:00`), and set the standing order the crew carries out before you can answer (`S`, `standing pinged silent`). Then run time fast while a destroyer pings far off: time drops to x1 at the ping, and the crew rigs for silent running by itself. The crew runs a drill; it cannot tell whether a ping found you. |
| Ghost 1: Silent Running, and Why | `ghost/09_ghost_silent_running.ron` | **The warship's choice.** A destroyer sweeps past 170 km off, listening, and your battery is low. Rig for silent running (`b`), then ultra-quiet (`ultra`), and she goes by; run normally and she finds you. Watch the price on `battery` and `air`, then bring the reactor back (`normal`) once she is far off and before the battery decides for you. |
| Ghost 2: The Solution | `ghost/10_ghost_solution.ron` | **No shooting.** Hear a dark merchant, hold one leg for a FAIR solution, change leg with a short burn, and coast to GOOD. A solution is an estimate from bearings, never the truth: the replay's true picture shows how far off it was. |
| Ghost 3: Straight Runners | `ghost/11_ghost_straight_runners.ron` | **The ghost's own shot.** A freighter that has not heard you: make the solution GOOD while she is far off, coast in, put the bow on her (`steer s1`) and fire a fan of three (`salvo 3 s1 straight`). A straight runner can't be jammed, but it trusts your solution completely. |
| Ghost 4: Homing Torpedoes | `ghost/12_ghost_homing.ron` | **Once you are found.** A hurt destroyer knows where you are and dodges what she hears. Fire homing torpedoes on a FAIR solution (`salvo 2 s1 homing`) and watch the seekers follow her turn. |
| Ghost 5: The Line-Up | `ghost/13_ghost_line_up.ron` | **The ghost's attack, by hand.** A freighter 80 km above your level. Pitch up, burn briefly, turn the nose down while you coast, and stop the climb level with her with the same burn the other way. Then set the quiet helm (`helm quiet`), bring the bow on without showing on MAG, and fire straight runners on GOOD. |
| Ghost 6: Jamming | `ghost/14_ghost_jamming.ron` | **The counter to homing.** A hurt destroyer with a jammer swamps your homing torpedo's seeker, and it loses her. Change leg for GOOD and sink her with straight runners, which have no seeker to jam. |
| Ghost 7: The Beam | `ghost/15_ghost_beam.ron` | **The deck gun.** Close on a crippled freighter that already knows you are there, stop, ping for a fresh echo and finish her with `lase s1`. The beam is for a close target that has found you, or a cripple; never while you still want to be unheard. |
| Ghost 8: Mines | `ghost/15a_ghost_mines.ron` | **Lay them, then leave.** Lay an acoustic, a magnetic and a captor mine (`lay acoustic`, `lay magnetic`, `lay captor`), then one more with a plain `lay`, reading the `MINES` line as it counts down. A mine stops dead where it is laid and never goes off for your own side; a ping finds one out to about 120 km and a magnetometer within about 2 km. Where to lay them is left to you. |
| Ghost 9: Pods and People Aboard | `ghost/15b_ghost_pods.ron` | **A lifeboat adrift, and operatives to land.** Hear a pod's distress beacon, then order a shot at her (`fire s1`) to hear the crew's query and stand down: only `confirm fire`, typed within 30 seconds, carries it out, and a hit on a pod is a breach of the rules of war. Close, stop within 2 km and `recover` her people, which takes ten minutes held steady. Then take four operatives to a point 120 km north, stop within 5 km and `land` them. Everyone aboard costs food on the chart and air in a fight. |
| Ghost 10: Base and Orders | `ghost/15c_ghost_base_and_orders.ron` | **The career, from your first day.** A career lesson on the career's own screens, in a war that is always the same. Read command's letter, look over the base, open the briefing (`news`), keep one of two orders (`order 1` or `order 2`), look over the crew and sail. Command sends a boat only where she can reach and come back from on half a tank, and the other half sets her days on station. See [The career's lessons](#the-careers-lessons). |
| Ghost 11: The Patrol | `ghost/15d_ghost_patrol.ron` | **A whole patrol.** Sail with the tanks part full, set the warp speed (`warp speed 4000`) and warp toward a watch beyond Lodestone. Hear the navigator call bingo, come out of warp at a well's edge, keep the watch three hours, then drop in (`d`) when a destroyer comes. Bring the boat to rest, spin up the bubble (`warp out`), and come home (`warp to base`). |
| Ghost 12: Home from Patrol | `ghost/15e_ghost_home.ron` | **The end of a patrol.** A day from base, the hull at 70%, the array damaged and one of the hands hurt. Come home (`warp to base`), read command's verdict, choose a job in the yard, look over the crew and the watch scheme, then open the war diary and the patrol's report, and write a note (`n`). |
| Hunter 1: The Ping | `hunter/16_hunter_ping.ron` | **The destroyer's way.** Your EF array holds a dark raider's bearing but no range. Ping, and the echo gives a GOOD solution at once; then sink her with homing torpedoes. Every receiver for far around now knows where you are. |
| Hunter 2: Guns and the Beam | `hunter/17_hunter_guns.ron` | **A cruiser's guns.** Close on a crippled raider, stop, ping, and finish her with `gun s1` bursts and `lase s1`. Slugs are slow and want her close and her place exact; beams hit at once and drain the reactor. |
| Hunter 3: Escort | `hunter/18_hunter_escort.ron` | **An escort's job.** Take station on a freighter with `match s1`, hear the raider who comes for her, and drive her off: stay with the freighter when she runs, ping the raider, fire if she presses. The freighter is the job, not the kill. |
| Hunter 4: The Flight Deck | `hunter/19_hunter_flight_deck.ron` | **Command a carrier, guided.** One step at a time, with a hint for each: launch two pickets and read the sorties, let a picket find a hauler adrift far past your own hearing, launch a screen, then recall the craft and land three. The way into *Flight Quarters*. See [Commanding a carrier](#commanding-a-carrier). |

### Challenges

The Scenarios page shows each challenge's rating, from Routine through Testing, Demanding and Hard to Severe, and lists each kind of boat's challenges easiest first. The ratings are a first draft.

| Scenario | File | What it teaches |
|---|---|---|
| Blind Man's Bluff | `blind_mans_bluff.ron` | **The duel in a cloud.** Two hurt cruisers inside the Shroud, each with the same poor fix on the other from the fight that drove them in. Nothing hears past a few tens of km, a ping reaches 60, seekers are deaf, and a torpedo's motor is all but silent. Choose other ships and captains as in Duel. Teaches: the third dimension as a weapon, and that the enemy has it too. |
| Tollgate Run | `tollgate_run.ron` | **The pirate's side of Bounty.** You fly a raider against two traders escorted by a navy destroyer. The escort jams you the moment it hears you and screens between you and its charges, so the traders vanish inside its cone. Its jammer blinds the destroyer that way and tells you exactly where it is. Take a trader and get away. Teaches: jamming from the receiving end, and why a civilian array can't beat it head on. |
| Bounty | `bounty.ron` | **The civilian hunter's first job, and training for the war.** Escort two traders past the Tollgate Shoal, where two raiders lie in the dust, and collect the bounty on both. You fly the `civ-hunter`: civilian ears like the raiders', but a hand-picked crew, homing torpedoes, and the patience they lack. Your licensed beacon is on at the start; the raiders hear it. Pirates prey on traders, and traders run from pirates and torpedoes. Teaches: the beacon as a choice, escorting, and a homing seeker's taste for the loudest thing in its cone. |
| Pirate Waters | `pirate_waters.ron` | **The overpowered test.** Detached from the war to scout pirate space: converted haulers lie in wait round the dust they call home, one to four of them, placed afresh each time, and the briefing never says how many. Clear the sector without ever being seen; you learn the count by listening: if any raider holds you on its array, the patrol fails. A pirate is a civilian with guns, ears included: a raider hears a drifting ghost at about 15 km and a burning one at 1,500; you hear it drifting at 500 km and burning at 7,000. They fire on half a solution from too far, and they run a long way from a torpedo. |
| Convoy | `convoy.ron` | **The classic.** Six merchants and one green escort cross your patrol. When a merchant goes up, the rest scatter flat out from the blast and the escort races to the spot. Merchants listen too: a convoy that hears a warship or a torpedo makes an emergency turn away and runs. You start on patrol ahead of the convoy, south of its track. The convoy's own emissions mask the escort's hearing, but only toward the convoy. You must stay undetected until you open fire; after that, the escort hunting you is the fight. Then **get clear**: go 20 minutes with no one tracking you to bring the patrol home. Three sunk is a good patrol; five is a famous one. |
| Escorted Convoy | `convoy_escorted.ron` | **Convoy's hard version.** The same six merchants, but the lone escort is a drilled crew under escort doctrine: she jams anything she hears at once and screens between it and the convoy. The convoy vanishes inside her jamming cone. ECCM sees through it, at a cost in emissions. Her jammer blinds her that way and shows you exactly where she is. You start ahead of the convoy, as in Convoy, must stay undetected until you open fire, and must get clear afterwards. |
| Fuel Run | `fuel_run.ron` | **Choosing your target.** One tanker, the *Severn*, in a screen of cheap hulls that are worth far less. A tanker is slow to answer a scatter. |
| Cheap Hulls | `cheap_hulls.ron` | **Torpedo economy.** Ten war-standard freighters and thin cover, and twelve torpedoes. They carry no jammers. |
| The Ledger | `the_ledger.ron` | **Weighing the prize against the risk.** 60,000 tons, however you make it up. The heavy hulls lead beside a drilled escort; the cheap ones straggle far astern, and all three together still leave you short. |
| False Flag | `false_flag.ron` | **Who is who.** Five transponding ships in a convoy, all reading friendly (`○`). One is a raider wearing a stolen beacon. Sink it, and spare the four honest freighters: sinking one fails the patrol. |
| Lame Duck | `lame_duck.ron` | **Sailing with defects.** Your boat leaves with a loud reactor, an array that drops out and a weak drive, all listed in damage control. Get home, 7,000 km off, past a destroyer picket that meets on your line. Every hard turn costs magnetism. |
| The Atoll | `the_atoll.ron` | **The bait.** A rich tanker sits alone in orbit inside a dusty moon's well. Two destroyers wait cold in the same orbit. When the tanker goes up, everything on its side that hears the blast races to the spot (a flaming datum). Sink it, then get clear. |
| Wolfpack | `wolfpack.ron` | **Leading a pack.** Two more ghosts wait 2,000 km behind you, cold, under radio silence. Lifting it (`datalink on`) is their signal to attack, and shares every bearing for fast cross-fixes, but the escorts' receivers hear every report. Sink both tankers. |
| Minefield Run | `minefield_run.ron` | **Real fuzes, and a clock.** A strait sown with EF, magnetic and captor mines that read real signatures. You start stopped, with scrubbers beyond repair and barely any propellant: coast and you never arrive, go round and the air runs out. |
| The Narrows | `the_narrows.ron` | A charted enemy minefield across the only way to the exit: acoustic, magnetic and captor mines. Teaches silent running and minefields. |
| The Veil | `the_veil.ron` | Goals: reach the exit 6,000 km off, undetected. A dust cloud lies across your route, with an ion cloud and a storm either side and a patrol beyond. |
| Duel | `duel.ron` | **Choose both ships and the enemy captain.** One on one in open space: attack boat, destroyer, cruiser or (for yourself) a carrier, against any of the first three, under a seasoned, green or silent captain. Sink the other ship. |
| Dry Tanks | `dry_tanks.ron` | **Why a ghost goes home.** The patrol ran long: the tanks hold a twentieth of a percent of fuel and the battery a tenth of its charge, too little to make the trip on it alone. Depot Twelve lies 800 km off, and a destroyer patrols the approach. The stop costs as much as the start. Come alongside, stopped, and take on fuel with `refuel`. Teaches: fuel, the generator's thirst, and matching a base. |
| First Shot | `first_shot.ron` | **Torpedo school.** Get a FAIR solution on a crossing target hulk, then sink it. Teaches fire control, `f`, spreads and time to impact. |
| Gauntlet | `gauntlet.ron` | Sink a cruiser crossing your front with a destroyer on each bow. The group shares what it hears, and the cruiser's ears are better than yours. |
| The Flattop | `the_flattop.ron` | **A carrier group.** The carrier *Empyrean* crosses your front with a destroyer on each bow and pickets flying far out. Sink her, then get clear. Her craft are loud and half deaf, and you will hear them long before they hear you. Teaches: launch transients, going dark under air cover, and a long stalk on a loud prize. |
| The Jammer Screen | `the_jammer_screen.ron` | **A jammed convoy.** A convoy of four, warned that a boat is about, with two escorts who start with a rough bearing on you and jam down it from the first minute. A homing torpedo fired into their cone goes blind. |
| Flight Quarters | `flight_quarters.ron` | **The Flattop from the other side.** You command the carrier *Aerie* with two destroyers, and a silent ghost waits somewhere ahead for the best prize in the fleet. Your hull is too loud to hear it, so your craft are your ears. Find it, and sink it or drive it off. Teaches: commanding a flight deck. |
| Run Home | `run_home.ron` | **Start already hurt:** hull 45%, drive and array damaged, tubes wrecked, battery and propellant low. Two destroyers comb your track behind you, and pickets watch the way home, 10,000 km off. |
| Hunter-Killer | `hunter_killer.ron` | **You have the flag:** a cruiser leading two destroyers, hunting two silent attack boats. Your destroyers share what they hear and leave the pinging to you; they hunt by their own doctrine. |
| Raider | `raider.ron` | A lone cruiser against a convoy: two freighters and a destroyer escort. Sink the freighters. |
| The Barrier | `the_barrier.ron` | Goals: reach the exit 9,000 km off, undetected, past a hunting group of three destroyers in a line. Drifting straight on passes one too close. |
| Knife Fight | `knife_fight.ron` | Goal: sink a destroyer that shoots back. Your attack boat against a seasoned captain with homing torpedoes. |
| Behind the Rock | `behind_the_rock.ron` | **A duel among the rocks.** A destroyer works through the Cinders, rock clumps in a debris haze, placed fresh each time and more than 4,000 km off. Rock stops a torpedo, hers and yours. Fire control marks a run through rock. |
| Mines Among the Rocks | `mines_among_the_rocks.ron` | **A minefield sown through rock**, laid fresh each time, with high rock either side and one clump the chart leaves out. A burn wakes the acoustic mines and a hard turn the magnetic ones. |
| The Swept Channel | `the_swept_channel.ron` | **Our field, their sweepers.** Our side has mined the Gate, the one passage between two rock sills, and an enemy carrier group is bound through it. The navy will not enter a charted field unswept: the group waits short of it while the carrier's two sweeper craft clear a lane, then comes down the lane. Sink the carrier, or turn her back: with both sweepers gone and no lane, she cannot pass. Sweepers are quiet craft that hear a dark boat a few hundred km off, and a torpedo will not find one. Rated Severe: a carrier and her fighters are meant to frighten a lone ghost. Teaches: the enemy's sweeping, a chokepoint, and choosing between the sweepers and the ambush. |
| Casual Patrol | `casual_patrol.ron` | **Nobody home.** Cruise an empty enemy sector, its moons, its belt and its debris, with no goal but the patrol and no clock. A shakedown cruise for a new captain or a new boat: leave with `q` when you like. Its friendly twin is *The Cozy Well*. |
| The Cozy Well | `the_cozy_well.ron` | **Fine weather, good company.** A quiet well on the home side of the war, in the hauler. Friendly traders work its orbits and talk on the working channels, so it is a gentle place to practise hailing (`hail s1`). Its moons, belts, debris and dust are placed fresh each time, so there is always something new to steer round. No combat, no goal and no clock: only the rocks can hurt you. Leave with `q` when you like. |
| Datum | `datum.ron` | **The hunt, from the destroyer.** A freighter blew up ten minutes ago; you have the destroyer *Vigilant* and the cruiser *Ardent*, and the datum. The ghost has a start, placed fresh each time somewhere round the wreck. Find her and sink her, or drive her off. |
| Hold the Line | `hold_the_line.ron` | **Escort, from the escort's bridge.** Four freighters, four hours, and you in the destroyer *Kestrel* with *Merlin* on the far side. An attack boat waits ahead, placed fresh each time, and you will hear her only when she fires. Bring all four through. |
| Distress Call | `distress_call.ron` | **No clean answer.** On patrol under radio silence, ordered to stay unseen, you hear a MAYDAY from the freighter *Halcyon*, off a debris haze in pirate waters. She may be what she says, or a raider calling a false MAYDAY, and there may be raiders lying near her; it changes every time. Help her and risk your orders, or hold your line and leave her. A hail tests her story, but only after you lift radio silence. |

## 24. Ship registry and specifications

<!-- specs:start -->

*Generated from `data/classes.ron` and `data/tuning.ron` by `cargo run -p sim --example manual_specs -- docs/manual.md`. Do not edit by hand.*

### Fleet depot (`base-depot`)

A fuel store with a dock and a beacon, parked where the fleet can find it. It does not move, it does not fight, and every ship in the war needs one sooner or later.

| | |
|---|---|
| Drive | 0.000 km/s² (0.00 g), full power in 1 s |
| 0 to 1 km/s | inf s at full throttle |
| Propellant | 0 s of full burn: 0.0 km/s of velocity change in all |
| Turning | up to 0.0°/s, reached in 0 s |
| Crew | answers the helm in 3.0 s and the engines in 4.0 s (1.0× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 125.0 dB |
| EF, full burn | 125.0 dB |
| Target strength | 30 dB (how well its hull returns a ping) |
| Passive array | none |
| Active array | none |
| Flight assist | none |
| Torpedo tubes | none |
| Size | 5.00 km hull radius (what a slug must pass within) |
| Countermeasures | none |
| Radar cross-section | 50,000 m² |
| EF given off | drive 0.0 yW, reactor 0.0 yW, idle 50 W, datalink 1.0 kW |
| Thermal | hull 30,000 m², emissivity 0.90; plume 33 W at full |
| Rocket | 2,072,000 t dry + 0 t propellant; thrust 1.0 kN; exhaust 1 km/s; Δv 0 km/s; 0.00 g loaded (crew limit 0.0 g) |

### Freighter, bulk (`civ-freighter`)

A big, slow merchant hull carrying the cargo the war is really about. It has no weapons and poor ears, and it is loud enough to be heard across a sector. Its one defence is to turn directly away from danger and run flat out, which spoils a torpedo shot more often than you would hope.

| | |
|---|---|
| Drive | 0.002 km/s² (0.20 g), full power in 33 s |
| 0 to 1 km/s | 500 s at full throttle |
| Propellant | 7200 s of full burn: 14.4 km/s of velocity change in all |
| Turning | up to 0.5°/s, reached in 25 s |
| Crew | answers the helm in 4.5 s and the engines in 6.0 s (1.5× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 152.0 dB |
| EF, full burn | 159.0 dB |
| Target strength | 30 dB (how well its hull returns a ping) |
| Passive array | floor 85 dB, threshold 6 dB, bearings ±5.0° at the threshold, baffles 90° astern |
| Active array | none |
| Flight assist | holds up to 2.0 km/s, corrects at 0.001 km/s², thrusters 150 dB |
| Torpedo tubes | none |
| Power | reactor 30 MW, 300 s from cold; generator 2.0 MW; battery 5000 MJ in two banks (926 min at hotel load); idle draw 0.1 MW; drive 20 MW at full; fuel 12000 GJ |
| Heat | sink 50000 MJ; hull sheds 2 MW, radiators 20 MW; silent running 2 dB quieter |
| Time to go cold | 1.6 h to shed half a five-minute burn, radiators in |
| Signatures | IR 115 dB (radiators out 145, plume 140) |
| Size | 1.00 km hull radius (what a slug must pass within) |
| Countermeasures | none |
| Telescope | 0.2 m aperture; sees 10 fW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 3.0 m aperture at 10 cm; floor 10 aW/m²; own-ship leakage 2e-18 of its EF per m² |
| Magnetometer | floor 1.0 nT; bearings ±40° at the threshold |
| Radar cross-section | 20,000 m² |
| EF given off | drive 217 W, reactor 50 W, idle 400 mW, datalink 1.0 kW, transponder 50 W |
| Magnetic moment | reactor coils 1.0 MA·m², hull 1.3 MA·m² |
| Thermal | hull 20,000 m², emissivity 0.90; plume 604 MW at full |
| Rocket | 45,000 t dry + 20,000 t propellant; thrust 128 MN; exhaust 150 km/s; Δv 55 km/s; 0.20 g loaded (crew limit 1.0 g) |
| Life support | 20 crew; cabin loses 80 W per kelvin; 20 oxygen candles |

### Hauler, civilian (`civ-hauler`)

A small civilian cargo ship with a small, hard-pressed crew and an autopilot that does the flying. It is easy to fly and forgiving, and it has no business in a fight. It is loud and half deaf, so anything with a warship's ears hears it long before it hears them.

| | |
|---|---|
| Drive | 0.004 km/s² (0.41 g), full power in 20 s |
| 0 to 1 km/s | 250 s at full throttle |
| Propellant | 3600 s of full burn: 14.4 km/s of velocity change in all |
| Turning | up to 1.0°/s, reached in 25 s |
| Crew | answers the helm in 4.5 s and the engines in 6.0 s (1.5× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 118.0 dB |
| EF, full burn | 140.0 dB |
| Target strength | 20 dB (how well its hull returns a ping) |
| Passive array | floor 80 dB, threshold 6 dB, bearings ±4.0° at the threshold, baffles 70° astern |
| Active array | 165 dB ping, ranges ±10 km, recharge 20 s |
| Flight assist | holds up to 3.0 km/s, corrects at 0.003 km/s², thrusters 128 dB |
| Torpedo tubes | none |
| Power | reactor 15 MW, 180 s from cold; generator 1.0 MW; battery 5000 MJ in two banks (2381 min at hotel load); idle draw 0.0 MW; drive 12 MW at full; fuel 6000 GJ |
| Heat | sink 20000 MJ; hull sheds 0 MW, radiators 12 MW; silent running 3 dB quieter |
| Time to go cold | 2.6 h to shed half a five-minute burn, radiators in |
| Navigational shield | stops strikes to 0.6 km/s; draws 0.5 MW, radiates 30 W (122 dB), adds 400 kA·m² to the field |
| Signatures | IR 105 dB (radiators out 140, plume 125) |
| Other sensors | ESM |
| Size | 0.50 km hull radius (what a slug must pass within) |
| Countermeasures | 2 static buoys, 0 decoys; one every 30 s |
| Telescope | 0.2 m aperture; sees 10 fW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 3.0 m aperture at 10 cm; floor 10 aW/m²; own-ship leakage 2e-18 of its EF per m² |
| Magnetometer | floor 1.0 nT; bearings ±40° at the threshold |
| Radar | 1.0 MW peak EIRP; ranges ±0.50 km |
| Radar cross-section | 300 m² |
| EF given off | drive 54 W, reactor 10 W, idle 40 mW, datalink 1.0 kW, transponder 50 W |
| Magnetic moment | reactor coils 300 kA·m², hull 48 kA·m² |
| Thermal | hull 800 m², emissivity 0.90; plume 51 MW at full |
| Rocket | 1,700 t dry + 1,000 t propellant; thrust 11 MN; exhaust 150 km/s; Δv 69 km/s; 0.41 g loaded (crew limit 1.5 g) |
| Life support | 12 crew; cabin loses 68 W per kelvin; 10 oxygen candles |

### Hunter, civilian (`civ-hunter`)

A bounty crew's ship, built to run pirates down on the civilian scale. It is quiet for a civilian hull, its crew is hand-picked, and it is patient and hard to bluff. It is still a civilian hull: slow, thin-skinned and far below a warship's ears.

| | |
|---|---|
| Drive | 0.004 km/s² (0.41 g), full power in 20 s |
| 0 to 1 km/s | 250 s at full throttle |
| Propellant | 3600 s of full burn: 14.4 km/s of velocity change in all |
| Turning | up to 1.0°/s, reached in 25 s |
| Crew | answers the helm in 2.7 s and the engines in 3.6 s (0.9× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 112.0 dB |
| EF, full burn | 139.0 dB |
| Target strength | 20 dB (how well its hull returns a ping) |
| Passive array | floor 70 dB, threshold 5 dB, bearings ±2.5° at the threshold, baffles 60° astern |
| Active array | 165 dB ping, ranges ±10 km, recharge 20 s |
| Flight assist | holds up to 3.0 km/s, corrects at 0.003 km/s², thrusters 128 dB |
| Torpedo tubes | 2, reload 600 s; carries 4 × MK2H, 2 × MK1; launch 152 dB |
| Power | reactor 15 MW, 150 s from cold; generator 1.0 MW; battery 5000 MJ in two banks (2381 min at hotel load); idle draw 0.0 MW; drive 12 MW at full; fuel 6000 GJ |
| Heat | sink 20000 MJ; hull sheds 0 MW, radiators 12 MW; silent running 3 dB quieter |
| Time to go cold | 2.6 h to shed half a five-minute burn, radiators in |
| Navigational shield | stops strikes to 0.6 km/s; draws 0.5 MW, radiates 30 W (122 dB), adds 400 kA·m² to the field |
| Signatures | IR 103 dB (radiators out 138, plume 125) |
| Other sensors | ESM |
| Size | 0.50 km hull radius (what a slug must pass within) |
| Countermeasures | 4 static buoys, 1 decoys; one every 30 s |
| Telescope | 0.5 m aperture; sees 2.0 fW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 6.0 m aperture at 10 cm; floor 2.0 aW/m²; own-ship leakage 1e-18 of its EF per m² |
| Magnetometer | floor 10 pT; bearings ±25° at the threshold |
| Radar | 1.0 MW peak EIRP; ranges ±0.50 km |
| Radar cross-section | 300 m² |
| EF given off | drive 40 W, reactor 4.0 W, idle 8.0 mW, datalink 1.0 kW, transponder 50 W |
| Magnetic moment | reactor coils 400 kA·m², hull 13 kA·m² |
| Thermal | hull 800 m², emissivity 0.90; plume 12 MW at full |
| Rocket | 460 t dry + 200 t propellant; thrust 2.6 MN; exhaust 150 km/s; Δv 54 km/s; 0.41 g loaded (crew limit 1.5 g) |
| Life support | 16 crew; cabin loses 68 W per kelvin; 10 oxygen candles |
| Default captain | hunter |

### Freighter, war standard (`civ-liberty`)

A mass-built wartime freighter: a third of a bulk carrier, welded fast and sent out in numbers. It is slow, has no jammer and carries a green crew, so it is the easiest tonnage in a convoy, and there are always more of them.

| | |
|---|---|
| Drive | 0.002 km/s² (0.15 g), full power in 33 s |
| 0 to 1 km/s | 667 s at full throttle |
| Propellant | 7200 s of full burn: 10.8 km/s of velocity change in all |
| Turning | up to 0.5°/s, reached in 25 s |
| Crew | answers the helm in 5.1 s and the engines in 6.8 s (1.7× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 149.0 dB |
| EF, full burn | 156.0 dB |
| Target strength | 26 dB (how well its hull returns a ping) |
| Passive array | floor 85 dB, threshold 6 dB, bearings ±5.0° at the threshold, baffles 90° astern |
| Active array | none |
| Flight assist | holds up to 2.0 km/s, corrects at 0.001 km/s², thrusters 150 dB |
| Torpedo tubes | none |
| Power | reactor 30 MW, 300 s from cold; generator 2.0 MW; battery 5000 MJ in two banks (926 min at hotel load); idle draw 0.1 MW; drive 20 MW at full; fuel 12000 GJ |
| Heat | sink 50000 MJ; hull sheds 2 MW, radiators 20 MW; silent running 2 dB quieter |
| Time to go cold | 1.6 h to shed half a five-minute burn, radiators in |
| Signatures | IR 115 dB (radiators out 145, plume 140) |
| Size | 1.00 km hull radius (what a slug must pass within) |
| Countermeasures | none |
| Telescope | 0.2 m aperture; sees 10 fW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 3.0 m aperture at 10 cm; floor 10 aW/m²; own-ship leakage 2e-18 of its EF per m² |
| Magnetometer | floor 1.0 nT; bearings ±40° at the threshold |
| Radar cross-section | 8,000 m² |
| EF given off | drive 222 W, reactor 50 W, idle 400 mW, datalink 1.0 kW, transponder 50 W |
| Magnetic moment | reactor coils 1.0 MA·m², hull 490 kA·m² |
| Thermal | hull 10,000 m², emissivity 0.90; plume 177 MW at full |
| Rocket | 17,500 t dry + 7,500 t propellant; thrust 38 MN; exhaust 150 km/s; Δv 54 km/s; 0.15 g loaded (crew limit 1.0 g) |
| Life support | 20 crew; cabin loses 80 W per kelvin; 20 oxygen candles |

### Liner, fast (`civ-liner`)

A big, fast passenger hull with a drive built for speed. It runs to a timetable with troops, passengers and urgent cargo, and it sails alone, because nothing in the lanes can keep up with it. The speed costs fuel and noise: its drive is heard from far off, but a boat in the wrong place when it passes never catches it.

| | |
|---|---|
| Drive | 0.003 km/s² (0.31 g), full power in 25 s |
| 0 to 1 km/s | 333 s at full throttle |
| Propellant | 7200 s of full burn: 21.6 km/s of velocity change in all |
| Turning | up to 0.6°/s, reached in 20 s |
| Crew | answers the helm in 4.5 s and the engines in 6.0 s (1.5× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 146.0 dB |
| EF, full burn | 163.1 dB |
| Target strength | 28 dB (how well its hull returns a ping) |
| Passive array | floor 85 dB, threshold 6 dB, bearings ±5.0° at the threshold, baffles 90° astern |
| Active array | none |
| Flight assist | holds up to 4.0 km/s, corrects at 0.002 km/s², thrusters 150 dB |
| Torpedo tubes | none |
| Power | reactor 60 MW, 300 s from cold; generator 4.0 MW; battery 10000 MJ in two banks (407 min at hotel load); idle draw 0.4 MW; drive 45 MW at full; fuel 30000 GJ |
| Heat | sink 100000 MJ; hull sheds 3 MW, radiators 45 MW; silent running 2 dB quieter |
| Time to go cold | 2.2 h to shed half a five-minute burn, radiators in |
| Signatures | IR 117 dB (radiators out 147, plume 142) |
| Size | 0.80 km hull radius (what a slug must pass within) |
| Countermeasures | none |
| Telescope | 0.2 m aperture; sees 10 fW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 3.0 m aperture at 10 cm; floor 10 aW/m²; own-ship leakage 2e-18 of its EF per m² |
| Magnetometer | floor 1.0 nT; bearings ±40° at the threshold |
| Radar cross-section | 12,000 m² |
| EF given off | drive 444 W, reactor 100 W, idle 800 mW, datalink 1.0 kW, transponder 50 W |
| Magnetic moment | reactor coils 2.0 MA·m², hull 560 kA·m² |
| Thermal | hull 14,000 m², emissivity 0.90; plume 496 MW at full |
| Rocket | 20,000 t dry + 15,000 t propellant; thrust 105 MN; exhaust 150 km/s; Δv 84 km/s; 0.31 g loaded (crew limit 1.0 g) |
| Life support | 48 crew; cabin loses 143 W per kelvin; 48 oxygen candles |

### Life pod (`civ-pod`)

An escape pod or lifeboat, a hull a few metres long that a crew takes to when their ship is lost. It has no drive to speak of and no weapons, so it drifts on the way its ship was going, and its distress beacon tells any ship with an intercept receiver that it is a lifeboat, out to about 630 km for a warship. To take its people aboard, close within 2 km, all but stop and order recover.

| | |
|---|---|
| Drive | 0.000 km/s² (0.00 g), full power in 1 s |
| 0 to 1 km/s | inf s at full throttle |
| Propellant | 0 s of full burn: 0.0 km/s of velocity change in all |
| Turning | up to 0.0°/s, reached in 0 s |
| Crew | answers the helm in 3.0 s and the engines in 4.0 s (1.0× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 100.0 dB |
| EF, full burn | 100.0 dB |
| Target strength | 5 dB (how well its hull returns a ping) |
| Passive array | none |
| Active array | none |
| Flight assist | none |
| Torpedo tubes | none |
| Size | 0.01 km hull radius (what a slug must pass within) |
| Countermeasures | none |
| Radar cross-section | 20 m² |
| EF given off | drive 0.0 yW, reactor 0.0 yW, idle 10 mW, datalink 1.0 kW |
| Thermal | hull 40 m², emissivity 0.90; plume 32 W at full |
| Rocket | 20 t dry + 0 t propellant; thrust 1.0 kN; exhaust 1 km/s; Δv 0 km/s; 0.01 g loaded (crew limit 0.0 g) |
| Life support | 12 crew; cabin loses 20 W per kelvin; 10 oxygen candles |

### Tanker, fleet (`civ-tanker`)

A vast hull full of propellant, the fuel the whole war burns. It is the heaviest merchant in the black and the slowest to turn, and it is worth a convoy's worth of tonnage to anyone who can reach it. Escorts put it in the middle for that reason.

| | |
|---|---|
| Drive | 0.001 km/s² (0.10 g), full power in 33 s |
| 0 to 1 km/s | 1000 s at full throttle |
| Propellant | 7200 s of full burn: 7.2 km/s of velocity change in all |
| Turning | up to 0.3°/s, reached in 15 s |
| Crew | answers the helm in 4.5 s and the engines in 6.0 s (1.5× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 154.0 dB |
| EF, full burn | 161.0 dB |
| Target strength | 33 dB (how well its hull returns a ping) |
| Passive array | floor 85 dB, threshold 6 dB, bearings ±5.0° at the threshold, baffles 90° astern |
| Active array | none |
| Flight assist | holds up to 2.0 km/s, corrects at 0.001 km/s², thrusters 150 dB |
| Torpedo tubes | none |
| Power | reactor 30 MW, 300 s from cold; generator 2.0 MW; battery 5000 MJ in two banks (926 min at hotel load); idle draw 0.1 MW; drive 20 MW at full; fuel 12000 GJ |
| Heat | sink 50000 MJ; hull sheds 2 MW, radiators 20 MW; silent running 2 dB quieter |
| Time to go cold | 1.6 h to shed half a five-minute burn, radiators in |
| Signatures | IR 115 dB (radiators out 145, plume 140) |
| Size | 1.00 km hull radius (what a slug must pass within) |
| Countermeasures | none |
| Telescope | 0.2 m aperture; sees 10 fW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 3.0 m aperture at 10 cm; floor 10 aW/m²; own-ship leakage 2e-18 of its EF per m² |
| Magnetometer | floor 1.0 nT; bearings ±40° at the threshold |
| Radar cross-section | 30,000 m² |
| EF given off | drive 212 W, reactor 50 W, idle 400 mW, datalink 1.0 kW, transponder 50 W |
| Magnetic moment | reactor coils 1.0 MA·m², hull 1.6 MA·m² |
| Thermal | hull 28,000 m², emissivity 0.90; plume 600 MW at full |
| Rocket | 57,000 t dry + 70,000 t propellant; thrust 127 MN; exhaust 150 km/s; Δv 120 km/s; 0.10 g loaded (crew limit 1.0 g) |
| Life support | 20 crew; cabin loses 80 W per kelvin; 20 oxygen candles |

### Carrier, military (`mil-carrier`)

The heart of a battle group: a huge, loud hull that carries fighters and strike craft and can hardly fight on its own. Its craft find what its escorts then hunt, and their launches give its position away. Get to it past the escorts, and its craft have nowhere left to land.

| | |
|---|---|
| Drive | 0.006 km/s² (0.61 g), full power in 17 s |
| 0 to 1 km/s | 167 s at full throttle |
| Propellant | 10000 s of full burn: 60.0 km/s of velocity change in all |
| Turning | up to 0.6°/s, reached in 15 s |
| Crew | answers the helm in 3.0 s and the engines in 4.0 s (1.0× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 153.0 dB |
| EF, full burn | 166.2 dB |
| Target strength | 26 dB (how well its hull returns a ping) |
| Passive array | floor 56 dB, threshold 3 dB, bearings ±1.5° at the threshold, baffles 60° astern |
| Active array | 178 dB ping, ranges ±2 km, recharge 15 s |
| Flight assist | none |
| Torpedo tubes | none |
| Power | reactor 90 MW, 120 s from cold; generator 8.0 MW; battery 40000 MJ in two banks (267 min at hotel load); idle draw 2.5 MW; drive 66 MW at full; fuel 36000 GJ |
| Heat | sink 180000 MJ; hull sheds 6 MW, radiators 90 MW; silent running 4 dB quieter |
| Time to go cold | 555.6 h to shed half a five-minute burn, radiators in |
| Navigational shield | stops strikes to 0.8 km/s; draws 2.0 MW, radiates 60 W (128 dB), adds 1200 kA·m² to the field |
| Signatures | IR 118 dB (radiators out 154, plume 145); datalink 128 dB |
| Other sensors | infrared, ESM |
| Gauss gun | 6 slugs at 10 km/s every 6 s, 15% hull each; 240 carried; fire control to 40 km |
| Size | 0.80 km hull radius (what a slug must pass within) |
| Countermeasures | 6 static buoys, 3 decoys; one every 25 s |
| Telescope | 1.0 m aperture; sees 10 aW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 10.0 m aperture at 10 cm; floor 10 zW/m²; own-ship leakage 2e-21 of its EF per m² |
| Magnetometer | floor 10 fT; bearings ±20° at the threshold |
| Radar | 20 GW peak EIRP; ranges ±0.15 km |
| Radar cross-section | 6,000 m² |
| EF given off | drive 1.7 kW, reactor 2.5 W, idle 1.0 mW, datalink 1.0 kW |
| Magnetic moment | reactor coils 2.5 MA·m², hull 540 kA·m² |
| Thermal | hull 12,000 m², emissivity 0.85; plume 1.3 GW at full |
| Rocket | 19,200 t dry + 5,000 t propellant; thrust 142 MN; exhaust 300 km/s; Δv 69 km/s; 0.60 g loaded (crew limit 2.0 g) |
| Life support | 1200 crew; cabin loses 1.6 kW per kelvin; 600 oxygen candles |
| Default captain | carrier |

### Cruiser, military (`mil-cruiser`)

The flagship of a battle group: the best ears in the fleet, the loudest ping, six tubes, guns and beams. It rarely misses what it holds, and it takes a lot of sinking. It turns slowly and is heard a long way off, so a quiet boat can choose its moment, and its escorts are the real problem.

| | |
|---|---|
| Drive | 0.008 km/s² (0.82 g), full power in 12 s |
| 0 to 1 km/s | 125 s at full throttle |
| Propellant | 10000 s of full burn: 80.0 km/s of velocity change in all |
| Turning | up to 0.8°/s, reached in 16 s |
| Crew | answers the helm in 3.0 s and the engines in 4.0 s (1.0× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 150.0 dB |
| EF, full burn | 164.2 dB |
| Target strength | 22 dB (how well its hull returns a ping) |
| Passive array | floor 50 dB, threshold 3 dB, bearings ±1.0° at the threshold, baffles 70° astern |
| Active array | 185 dB ping, ranges ±2 km, recharge 12 s |
| Flight assist | none |
| Torpedo tubes | 6, reload 360 s; carries 8 × MK2H, 4 × MK3L, 6 × MK1; launch 155 dB |
| Power | reactor 80 MW, 120 s from cold; generator 8.0 MW; battery 40000 MJ in two banks (392 min at hotel load); idle draw 1.7 MW; drive 64 MW at full; fuel 32000 GJ |
| Heat | sink 150000 MJ; hull sheds 5 MW, radiators 80 MW; silent running 5 dB quieter |
| Time to go cold | 6.5 h to shed half a five-minute burn, radiators in |
| Navigational shield | stops strikes to 0.8 km/s; draws 2.0 MW, radiates 60 W (128 dB), adds 1000 kA·m² to the field |
| Signatures | IR 115 dB (radiators out 152, plume 143); datalink 125 dB |
| Other sensors | infrared, ESM |
| Gauss gun | 7 slugs at 10 km/s every 6 s, 20% hull each; 200 carried; fire control to 60 km |
| Beam | 2 × 30% hull a shot at 50 km, 7.5 at 100 km; recharges in 60 s at 40 MW each; fire control to 200 km |
| Size | 0.60 km hull radius (what a slug must pass within) |
| Countermeasures | 6 static buoys, 3 decoys; one every 25 s |
| Telescope | 2.0 m aperture; sees 3.0 aW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 20.0 m aperture at 10 cm; floor 3.0 zW/m²; own-ship leakage 1e-21 of its EF per m² |
| Magnetometer | floor 5.0 fT; bearings ±15° at the threshold |
| Radar | 30 GW peak EIRP; ranges ±0.15 km |
| Radar cross-section | 3,000 m² |
| EF given off | drive 1.4 kW, reactor 2.0 W, idle 800 µW, datalink 1.0 kW |
| Magnetic moment | reactor coils 2.0 MA·m², hull 360 kA·m² |
| Thermal | hull 8,000 m², emissivity 0.85; plume 1.2 GW at full |
| Rocket | 12,800 t dry + 4,000 t propellant; thrust 132 MN; exhaust 300 km/s; Δv 82 km/s; 0.80 g loaded (crew limit 3.0 g) |
| Life support | 700 crew; cabin loses 1.1 kW per kelvin; 400 oxygen candles |
| Default captain | seasoned |

### Destroyer, military (`mil-destroyer`)

The navy's hunter of ghosts: fast, loud, nimble and well armed, with torpedoes, gauss guns and the patience to search by sprint and drift. Its strength is that it comes for you, and it rarely comes alone. You beat it by hearing it far off, staying out of its ping, and shooting from outside what it can hear.

| | |
|---|---|
| Drive | 0.012 km/s² (1.22 g), full power in 7 s |
| 0 to 1 km/s | 83 s at full throttle |
| Propellant | 7200 s of full burn: 86.4 km/s of velocity change in all |
| Turning | up to 2.0°/s, reached in 13 s |
| Crew | answers the helm in 3.0 s and the engines in 4.0 s (1.0× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 148.0 dB |
| EF, full burn | 162.2 dB |
| Target strength | 15 dB (how well its hull returns a ping) |
| Passive array | floor 55 dB, threshold 3 dB, bearings ±1.5° at the threshold, baffles 50° astern |
| Active array | 180 dB ping, ranges ±2 km, recharge 10 s |
| Flight assist | none |
| Torpedo tubes | 2, reload 480 s; carries 6 × MK2H, 4 × MK1; launch 155 dB |
| Power | reactor 60 MW, 90 s from cold; generator 6.0 MW; battery 20000 MJ in two banks (476 min at hotel load); idle draw 0.7 MW; drive 50 MW at full; fuel 24000 GJ |
| Heat | sink 60000 MJ; hull sheds 3 MW, radiators 60 MW; silent running 4 dB quieter |
| Time to go cold | 2.5 h to shed half a five-minute burn, radiators in |
| Navigational shield | stops strikes to 0.8 km/s; draws 1.0 MW, radiates 40 W (125 dB), adds 600 kA·m² to the field |
| Signatures | IR 110 dB (radiators out 150, plume 141); datalink 120 dB |
| Other sensors | infrared, ESM |
| Gauss gun | 5 slugs at 10 km/s every 6 s, 20% hull each; 200 carried; fire control to 60 km |
| Size | 0.40 km hull radius (what a slug must pass within) |
| Countermeasures | 4 static buoys, 2 decoys; one every 30 s |
| Telescope | 1.0 m aperture; sees 10 aW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 10.0 m aperture at 10 cm; floor 10 zW/m²; own-ship leakage 2e-21 of its EF per m² |
| Magnetometer | floor 10 fT; bearings ±20° at the threshold |
| Radar | 10 GW peak EIRP; ranges ±0.15 km |
| Radar cross-section | 1,000 m² |
| EF given off | drive 700 W, reactor 1.0 W, idle 400 µW, datalink 1.0 kW |
| Magnetic moment | reactor coils 1.0 MA·m², hull 130 kA·m² |
| Thermal | hull 3,000 m², emissivity 0.85; plume 701 MW at full |
| Rocket | 4,800 t dry + 1,500 t propellant; thrust 74 MN; exhaust 300 km/s; Δv 82 km/s; 1.20 g loaded (crew limit 3.0 g) |
| Life support | 300 crew; cabin loses 500 W per kelvin; 200 oxygen candles |
| Default captain | seasoned |

### Fighter, military (`mil-fighter`)

A small, fast craft from a carrier's deck, flown by pilots who take far more g than any warship's crew, with a gauss gun deadly to a boat it catches near and a drive no torpedo can outfly. It burns nearly all the time, so it is heard from far off, and the same burn leaves it half deaf: it hears what is loud or close and little else. Go dark when you hear one coming, because the destroyers it calls in are the real danger.

| | |
|---|---|
| Drive | 0.060 km/s² (6.12 g), full power in 2 s |
| 0 to 1 km/s | 17 s at full throttle |
| Propellant | 300 s of full burn: 18.0 km/s of velocity change in all |
| Turning | up to 25.0°/s, reached in 2 s |
| Crew | answers the helm in 1.5 s and the engines in 2.0 s (0.5× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 126.0 dB |
| EF, full burn | 160.0 dB |
| Target strength | -5 dB (how well its hull returns a ping) |
| Passive array | floor 62 dB, threshold 4 dB, bearings ±3.0° at the threshold, baffles 90° astern |
| Active array | none |
| Flight assist | none |
| Torpedo tubes | none |
| Power | reactor 10 MW, 20 s from cold; generator 1.0 MW; battery 2000 MJ in two banks (476 min at hotel load); idle draw 0.1 MW; drive 5 MW at full; fuel 600 GJ |
| Heat | sink 6000 MJ; hull sheds 0 MW, radiators 10 MW; silent running 3 dB quieter |
| Time to go cold | 1.1 h to shed half a five-minute burn, radiators in |
| Signatures | IR 108 dB (radiators out 132, plume 146); datalink 125 dB |
| Gauss gun | 4 slugs at 10 km/s every 3 s, 15% hull each; 40 carried; fire control to 30 km |
| Size | 0.05 km hull radius (what a slug must pass within) |
| Countermeasures | none |
| EF array | 1.0 m aperture at 10 cm; floor 1.0 aW/m²; own-ship leakage 1e-17 of its EF per m² |
| Radar | 100 MW peak EIRP; ranges ±0.30 km |
| Radar cross-section | 20 m² |
| EF given off | drive 200 W, reactor 200 mW, idle 100 µW, datalink 1.0 kW |
| Magnetic moment | reactor coils 10 kA·m², hull 1.1 kA·m² |
| Thermal | hull 80 m², emissivity 0.90; plume 57 MW at full |
| Rocket | 40 t dry + 60 t propellant; thrust 4.5 MN; exhaust 400 km/s; Δv 367 km/s; 4.59 g loaded (crew limit 9.0 g) |
| Default captain | pilot |

### Strike fighter, military (`mil-fighter-strike`)

A fighter carrying two homing torpedoes, which it fires from a range the carrier could never reach unheard. It flies out along its carrier's track on a target and turns for home once they are gone. It is heard long before its torpedoes are.

| | |
|---|---|
| Drive | 0.050 km/s² (5.10 g), full power in 2 s |
| 0 to 1 km/s | 20 s at full throttle |
| Propellant | 320 s of full burn: 16.0 km/s of velocity change in all |
| Turning | up to 22.0°/s, reached in 2 s |
| Crew | answers the helm in 1.5 s and the engines in 2.0 s (0.5× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 127.0 dB |
| EF, full burn | 160.0 dB |
| Target strength | -3 dB (how well its hull returns a ping) |
| Passive array | floor 62 dB, threshold 4 dB, bearings ±3.0° at the threshold, baffles 90° astern |
| Active array | none |
| Flight assist | none |
| Torpedo tubes | 2, reload 99999 s; carries 2 × MK2H; launch 150 dB |
| Power | reactor 10 MW, 20 s from cold; generator 1.0 MW; battery 2000 MJ in two banks (476 min at hotel load); idle draw 0.1 MW; drive 5 MW at full; fuel 600 GJ |
| Heat | sink 6000 MJ; hull sheds 0 MW, radiators 10 MW; silent running 3 dB quieter |
| Time to go cold | 1.1 h to shed half a five-minute burn, radiators in |
| Signatures | IR 108 dB (radiators out 132, plume 146); datalink 125 dB |
| Gauss gun | 4 slugs at 10 km/s every 3 s, 15% hull each; 20 carried; fire control to 30 km |
| Size | 0.06 km hull radius (what a slug must pass within) |
| Countermeasures | none |
| EF array | 1.0 m aperture at 10 cm; floor 1.0 aW/m²; own-ship leakage 1e-17 of its EF per m² |
| Radar | 100 MW peak EIRP; ranges ±0.30 km |
| Radar cross-section | 25 m² |
| EF given off | drive 200 W, reactor 200 mW, idle 100 µW, datalink 1.0 kW |
| Magnetic moment | reactor coils 10 kA·m², hull 1.4 kA·m² |
| Thermal | hull 90 m², emissivity 0.90; plume 57 MW at full |
| Rocket | 50 t dry + 60 t propellant; thrust 4.5 MN; exhaust 400 km/s; Δv 315 km/s; 4.17 g loaded (crew limit 9.0 g) |
| Default captain | pilot |

### Attack boat, military (`mil-ghost`)

The ghost, a submarine in space: small, cold and very quiet, with sharp ears, four tubes and a thin hull. It fires first, from a solution nobody heard it build, and it decides whether there is a fight at all. Once found it is fragile, and a boat that is heard and then pinged has very little left but to run.

| | |
|---|---|
| Drive | 0.008 km/s² (0.82 g), full power in 10 s |
| 0 to 1 km/s | 125 s at full throttle |
| Propellant | 5400 s of full burn: 43.2 km/s of velocity change in all |
| Turning | up to 1.5°/s, reached in 15 s |
| Crew | answers the helm in 3.0 s and the engines in 4.0 s (1.0× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 110.0 dB |
| EF, full burn | 150.0 dB |
| Target strength | -28 dB (how well its hull returns a ping) |
| Passive array | floor 58 dB, threshold 4 dB, bearings ±2.0° at the threshold, baffles 60° astern |
| Active array | 172 dB ping, ranges ±3 km, recharge 15 s |
| Flight assist | none |
| Torpedo tubes | 4, reload 600 s; carries 6 × MK1, 4 × MK2H, 2 × CAR; launch 118 dB |
| Power | reactor 20 MW, 90 s from cold; generator 1.5 MW; battery 20000 MJ in two banks (1961 min at hotel load); idle draw 0.2 MW; drive 16 MW at full; fuel 8000 GJ |
| Heat | sink 100000 MJ; hull sheds 1 MW, radiators 20 MW; silent running 8 dB quieter |
| Time to go cold | 3.5 h to shed half a five-minute burn, radiators in |
| Navigational shield | stops strikes to 0.6 km/s; draws 0.5 MW, radiates 20 W (122 dB), adds 400 kA·m² to the field |
| Signatures | IR 95 dB (radiators out 140, plume 128) |
| Other sensors | infrared, ESM |
| Beam | 1 × 15% hull a shot at 15 km, 3.8 at 30 km; recharges in 90 s at 15 MW each; fire control to 60 km |
| Size | 0.25 km hull radius (what a slug must pass within) |
| Countermeasures | 6 static buoys, 3 decoys; one every 20 s |
| Telescope | 1.0 m aperture; sees 10 aW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 10.0 m aperture at 10 cm; floor 10 zW/m²; own-ship leakage 2e-21 of its EF per m² |
| Magnetometer | floor 10 fT; bearings ±20° at the threshold |
| Radar | 1.0 GW peak EIRP; ranges ±0.15 km |
| Radar cross-section | 2 m² |
| EF given off | drive 300 W, reactor 300 mW, idle 40 µW, datalink 1.0 kW |
| Magnetic moment | reactor coils 500 kA·m², hull 50 kA·m² |
| Thermal | hull 1,500 m², emissivity 0.80; plume 178 MW at full |
| Rocket | 1,800 t dry + 600 t propellant; thrust 19 MN; exhaust 300 km/s; Δv 86 km/s; 0.80 g loaded (crew limit 3.0 g) |
| Life support | 70 crew; cabin loses 155 W per kelvin; 40 oxygen candles |

### Attack boat, cold hull (`mil-ghost-cold`)

The attack boat rebuilt to lose heat: a lagged reactor space and a hull that sheds half as much again as the standard build. It goes cold fast, so it can shoot closer and still get away. The price is the magazine, four torpedoes fewer, and no mines.

| | |
|---|---|
| Drive | 0.008 km/s² (0.82 g), full power in 10 s |
| 0 to 1 km/s | 125 s at full throttle |
| Propellant | 5400 s of full burn: 43.2 km/s of velocity change in all |
| Turning | up to 1.5°/s, reached in 15 s |
| Crew | answers the helm in 3.0 s and the engines in 4.0 s (1.0× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 110.0 dB |
| EF, full burn | 150.0 dB |
| Target strength | -28 dB (how well its hull returns a ping) |
| Passive array | floor 58 dB, threshold 4 dB, bearings ±2.0° at the threshold, baffles 60° astern |
| Active array | 172 dB ping, ranges ±3 km, recharge 15 s |
| Flight assist | none |
| Torpedo tubes | 4, reload 600 s; carries 5 × MK1, 3 × MK2H; launch 118 dB |
| Power | reactor 20 MW, 90 s from cold; generator 1.5 MW; battery 20000 MJ in two banks (1961 min at hotel load); idle draw 0.2 MW; drive 16 MW at full; fuel 8000 GJ |
| Heat | sink 100000 MJ; hull sheds 2 MW, radiators 20 MW; silent running 8 dB quieter |
| Time to go cold | 1.8 h to shed half a five-minute burn, radiators in |
| Navigational shield | stops strikes to 0.6 km/s; draws 0.5 MW, radiates 20 W (122 dB), adds 400 kA·m² to the field |
| Signatures | IR 95 dB (radiators out 140, plume 128) |
| Other sensors | infrared, ESM |
| Beam | 1 × 15% hull a shot at 15 km, 3.8 at 30 km; recharges in 90 s at 15 MW each; fire control to 60 km |
| Size | 0.25 km hull radius (what a slug must pass within) |
| Countermeasures | 6 static buoys, 3 decoys; one every 20 s |
| Telescope | 1.0 m aperture; sees 10 aW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 10.0 m aperture at 10 cm; floor 10 zW/m²; own-ship leakage 2e-21 of its EF per m² |
| Magnetometer | floor 10 fT; bearings ±20° at the threshold |
| Radar | 1.0 GW peak EIRP; ranges ±0.15 km |
| Radar cross-section | 2 m² |
| EF given off | drive 300 W, reactor 300 mW, idle 40 µW, datalink 1.0 kW |
| Magnetic moment | reactor coils 500 kA·m², hull 50 kA·m² |
| Thermal | hull 1,500 m², emissivity 0.80; plume 178 MW at full |
| Rocket | 1,800 t dry + 600 t propellant; thrust 19 MN; exhaust 300 km/s; Δv 86 km/s; 0.80 g loaded (crew limit 3.0 g) |
| Life support | 70 crew; cabin loses 155 W per kelvin; 40 oxygen candles |

### Attack boat, heavy hull (`mil-ghost-heavy`)

The attack boat with a thicker pressure hull and a bigger heat sink. It carries the standard load and takes a hit the standard build would not, so it has more room for a mistake under fire. It answers the helm slowly and sheds heat slowly, so it needs a long lead to go cold.

| | |
|---|---|
| Drive | 0.007 km/s² (0.71 g), full power in 10 s |
| 0 to 1 km/s | 143 s at full throttle |
| Propellant | 5400 s of full burn: 37.8 km/s of velocity change in all |
| Turning | up to 1.2°/s, reached in 15 s |
| Crew | answers the helm in 3.0 s and the engines in 4.0 s (1.0× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 110.0 dB |
| EF, full burn | 150.0 dB |
| Target strength | -28 dB (how well its hull returns a ping) |
| Passive array | floor 58 dB, threshold 4 dB, bearings ±2.0° at the threshold, baffles 60° astern |
| Active array | 172 dB ping, ranges ±3 km, recharge 15 s |
| Flight assist | none |
| Torpedo tubes | 4, reload 600 s; carries 8 × MK1, 4 × MK2H; launch 118 dB |
| Power | reactor 20 MW, 90 s from cold; generator 1.5 MW; battery 20000 MJ in two banks (1961 min at hotel load); idle draw 0.2 MW; drive 16 MW at full; fuel 8000 GJ |
| Heat | sink 120000 MJ; hull sheds 1 MW, radiators 20 MW; silent running 8 dB quieter |
| Time to go cold | 5.7 h to shed half a five-minute burn, radiators in |
| Navigational shield | stops strikes to 0.6 km/s; draws 0.5 MW, radiates 20 W (122 dB), adds 400 kA·m² to the field |
| Signatures | IR 95 dB (radiators out 140, plume 128) |
| Other sensors | infrared, ESM |
| Beam | 1 × 15% hull a shot at 15 km, 3.8 at 30 km; recharges in 90 s at 15 MW each; fire control to 60 km |
| Size | 0.25 km hull radius (what a slug must pass within) |
| Countermeasures | 6 static buoys, 3 decoys; one every 20 s |
| Telescope | 1.0 m aperture; sees 10 aW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 10.0 m aperture at 10 cm; floor 10 zW/m²; own-ship leakage 2e-21 of its EF per m² |
| Magnetometer | floor 10 fT; bearings ±20° at the threshold |
| Radar | 1.0 GW peak EIRP; ranges ±0.15 km |
| Radar cross-section | 2 m² |
| EF given off | drive 300 W, reactor 300 mW, idle 40 µW, datalink 1.0 kW |
| Magnetic moment | reactor coils 500 kA·m², hull 50 kA·m² |
| Thermal | hull 1,500 m², emissivity 0.80; plume 178 MW at full |
| Rocket | 1,800 t dry + 600 t propellant; thrust 19 MN; exhaust 300 km/s; Δv 86 km/s; 0.80 g loaded (crew limit 3.0 g) |
| Life support | 70 crew; cabin loses 155 W per kelvin; 40 oxygen candles |

### Attack boat, last war (`mil-ghost-old`)

A boat from the last war, kept in service because the yards are full: worn, short-legged and short of everything. Age left it a nimble hull and an old torpedo that always runs true, and took its stern tube, its shield and its reserves. Something aboard fails every hour or so, and the crew spend the patrol keeping it alive.

| | |
|---|---|
| Drive | 0.005 km/s² (0.51 g), full power in 10 s |
| 0 to 1 km/s | 200 s at full throttle |
| Propellant | 2400 s of full burn: 12.0 km/s of velocity change in all |
| Turning | up to 2.4°/s, reached in 13 s |
| Crew | answers the helm in 3.0 s and the engines in 4.0 s (1.0× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 114.0 dB |
| EF, full burn | 153.0 dB |
| Target strength | -22 dB (how well its hull returns a ping) |
| Passive array | floor 64 dB, threshold 4 dB, bearings ±3.0° at the threshold, baffles 60° astern |
| Active array | 172 dB ping, ranges ±3 km, recharge 15 s |
| Flight assist | none |
| Torpedo tubes | 3, reload 720 s; carries 7 × MK0; launch 118 dB |
| Power | reactor 12 MW, 180 s from cold; generator 1.5 MW; battery 9000 MJ in two banks (882 min at hotel load); idle draw 0.2 MW; drive 10 MW at full; fuel 3000 GJ |
| Heat | sink 100000 MJ; hull sheds 1 MW, radiators 12 MW; silent running 4 dB quieter |
| Time to go cold | 10.3 h to shed half a five-minute burn, radiators in |
| Breakdowns | about one every 60 min running; each down 120 s unless jury rigged |
| Signatures | IR 100 dB (radiators out 142, plume 128) |
| Other sensors | infrared, ESM |
| Beam | 1 × 15% hull a shot at 15 km, 3.8 at 30 km; recharges in 120 s at 10 MW each; fire control to 40 km |
| Size | 0.25 km hull radius (what a slug must pass within) |
| Countermeasures | 3 static buoys, 1 decoys; one every 20 s |
| Telescope | 1.0 m aperture; sees 10 aW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 10.0 m aperture at 10 cm; floor 10 zW/m²; own-ship leakage 2e-21 of its EF per m² |
| Magnetometer | floor 10 fT; bearings ±20° at the threshold |
| Radar | 1.0 GW peak EIRP; ranges ±0.15 km |
| Radar cross-section | 2 m² |
| EF given off | drive 300 W, reactor 300 mW, idle 40 µW, datalink 1.0 kW |
| Magnetic moment | reactor coils 800 kA·m², hull 60 kA·m² |
| Thermal | hull 1,500 m², emissivity 0.80; plume 35 MW at full |
| Rocket | 1,500 t dry + 240 t propellant; thrust 7.5 MN; exhaust 150 km/s; Δv 22 km/s; 0.44 g loaded (crew limit 3.0 g) |
| Life support | 70 crew; cabin loses 155 W per kelvin; 40 oxygen candles |

### Sweeper craft, military (`mil-sweeper`)

A small craft from a carrier's deck with a crew of two, sent ahead to clear mines quietly before the fleet passes. Its pure ceramic hull barely stirs a magnetic mine and is not built for warp, so it works the well it was launched in. It is as hard to hear as a ghost, and only the faint pulse of its sweep shows on a magnetometer.

| | |
|---|---|
| Drive | 0.020 km/s² (2.04 g), full power in 2 s |
| 0 to 1 km/s | 50 s at full throttle |
| Propellant | 600 s of full burn: 12.0 km/s of velocity change in all |
| Turning | up to 15.0°/s, reached in 2 s |
| Crew | answers the helm in 1.5 s and the engines in 2.0 s (0.5× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 108.0 dB |
| EF, full burn | 145.0 dB |
| Target strength | -8 dB (how well its hull returns a ping) |
| Passive array | floor 62 dB, threshold 4 dB, bearings ±3.0° at the threshold, baffles 90° astern |
| Active array | none |
| Flight assist | none |
| Torpedo tubes | none |
| Power | reactor 2 MW, 20 s from cold; generator 0.3 MW; battery 800 MJ in two banks (333 min at hotel load); idle draw 0.0 MW; drive 1 MW at full; fuel 200 GJ |
| Heat | sink 2000 MJ; hull sheds 0 MW, radiators 2 MW; silent running 3 dB quieter |
| Time to go cold | 0.8 h to shed half a five-minute burn, radiators in |
| Signatures | IR 94 dB (radiators out 126, plume 132); datalink 120 dB |
| Size | 0.04 km hull radius (what a slug must pass within) |
| Countermeasures | 2 static buoys, 0 decoys; one every 30 s |
| EF array | 1.0 m aperture at 10 cm; floor 1.0 aW/m²; own-ship leakage 1e-17 of its EF per m² |
| Radar | 30 MW peak EIRP; ranges ±0.40 km |
| Radar cross-section | 15 m² |
| EF given off | drive 42 W, reactor 50 mW, idle 30 µW, datalink 1.0 kW |
| Magnetic moment | reactor coils 2.0 kA·m², hull 50 A·m² |
| Thermal | hull 60 m², emissivity 0.90; plume 9.0 MW at full |
| Rocket | 34 t dry + 30 t propellant; thrust 954 kN; exhaust 300 km/s; Δv 191 km/s; 1.53 g loaded (crew limit 6.0 g) |
| Default captain | pilot |

### Raider, pirate (`pir-raider`)

A pirate's converted trader, a little quieter than the ships it preys on and armed to take them. It is dangerous to merchants, and it shoots too soon and from too far. Against a navy ship it is outheard and outgunned, so hear it first and let it waste its torpedoes.

| | |
|---|---|
| Drive | 0.004 km/s² (0.41 g), full power in 20 s |
| 0 to 1 km/s | 250 s at full throttle |
| Propellant | 3600 s of full burn: 14.4 km/s of velocity change in all |
| Turning | up to 1.0°/s, reached in 25 s |
| Crew | answers the helm in 3.6 s and the engines in 4.8 s (1.2× a navy crew; under the computer, its captain's crew) |
| EF, drifting | 116.0 dB |
| EF, full burn | 139.0 dB |
| Target strength | 20 dB (how well its hull returns a ping) |
| Passive array | floor 80 dB, threshold 6 dB, bearings ±4.0° at the threshold, baffles 70° astern |
| Active array | 165 dB ping, ranges ±10 km, recharge 20 s |
| Flight assist | holds up to 3.0 km/s, corrects at 0.003 km/s², thrusters 128 dB |
| Torpedo tubes | 2, reload 900 s; carries 4 × MK1; launch 152 dB |
| Power | reactor 15 MW, 150 s from cold; generator 1.0 MW; battery 5000 MJ in two banks (2381 min at hotel load); idle draw 0.0 MW; drive 12 MW at full; fuel 6000 GJ |
| Heat | sink 20000 MJ; hull sheds 0 MW, radiators 12 MW; silent running 3 dB quieter |
| Time to go cold | 2.6 h to shed half a five-minute burn, radiators in |
| Navigational shield | stops strikes to 0.6 km/s; draws 0.5 MW, radiates 30 W (122 dB), adds 400 kA·m² to the field |
| Signatures | IR 103 dB (radiators out 138, plume 125) |
| Other sensors | ESM |
| Size | 0.50 km hull radius (what a slug must pass within) |
| Countermeasures | 2 static buoys, 0 decoys; one every 30 s |
| Telescope | 0.2 m aperture; sees 10 fW/m² cued (4 targets at once), the wide survey 20 dB less |
| EF array | 3.0 m aperture at 10 cm; floor 10 aW/m²; own-ship leakage 2e-18 of its EF per m² |
| Magnetometer | floor 30 pT; bearings ±30° at the threshold |
| Radar | 1.0 MW peak EIRP; ranges ±0.50 km |
| Radar cross-section | 300 m² |
| EF given off | drive 40 W, reactor 4.0 W, idle 20 mW, datalink 1.0 kW |
| Magnetic moment | reactor coils 600 kA·m², hull 26 kA·m² |
| Thermal | hull 800 m², emissivity 0.90; plume 12 MW at full |
| Rocket | 460 t dry + 200 t propellant; thrust 2.6 MN; exhaust 150 km/s; Δv 54 km/s; 0.41 g loaded (crew limit 1.5 g) |
| Life support | 12 crew; cabin loses 68 W per kelvin; 10 oxygen candles |
| Default captain | pirate |

### Torpedoes

**Torpedo, captor mine.** The torpedo a captor mine launches, which arms almost at once and goes straight for what the mine heard. It is short ranged, and it homes on EF. Go quiet and drop a static buoy.

**Carrier, torpedo.** A cold shell that coasts silently for up to six hours, then lets two homing torpedoes go. The enemy hears them on a bearing that leads nowhere near you. It hears nothing and takes no orders after launch, so it is only as good as your solution.

**Torpedo Mk 0, old pattern.** The old straight runner from the last war: a simple contact fuze, a plain gyro and nothing to go wrong. It is slower and shorter-legged than the Mk 1 and it hits when it is aimed right. Nobody in the fleet misses the Mk 1's bad days, and nobody on an old boat has any.

**Torpedo Mk 1, straight-running.** The straight runner goes to the point fire control aimed at and nowhere else. It is exact against a ship that keeps coasting, hard to hear once its motor stops, and takes no notice of decoys. Any ship that burns after the launch simply isn't there when it arrives.

**Torpedo Mk 2, homing.** The homing torpedo chases the loudest enemy its seeker hears, once it has armed. It follows a ship that burns and forgives a rough solution. A quiet target is hard for it to hear, and a static buoy or a decoy can draw it off.

**Torpedo Mk 3, linked homing.** A homing torpedo its launcher steers until it arms and tracks all the way, carried by ships that don't mind being heard, which means cruisers. It starts on the right target and the launcher always knows where it is. The link is a transmitter, so the launcher lights up for the whole run and points the way back to itself.

**Torpedo Mk 4, fast.** The fast runner closes in three-quarters of the time, so a target has less warning and less room to turn. Its hot motor is heard far beyond the boat that fired it, and the line of it points home. It is beaten by anyone who hears it early and moves.

**Torpedo Mk 5, cold.** The cold runner is barely louder than a drifting boat, so a shot from inside the screen can arrive unannounced. It is slow and short-legged. A target that burns away is gone, and a long shot gives a poor solution time to go stale.

**Torpedo Mk 6, defensive.** The defensive homer arms at 15 km, where every other torpedo is still a dud, and it runs barely 300 km. It exists for the hunter already on top of the boat. Firing it ends the hunt or tells the hunter exactly where to look.

| Torpedo | Guidance | Velocity change | EF burning / coasting | Arms at | Fuze | Warhead | Run |
|---|---|---|---|---|---|---|---|
| Torpedo, captor mine (`CAPT`) | homing (gain 4) | 8.0 km/s over 160 s | 112 / 95 dB | 5 km | 8 km | 120 | 600 s |
| Carrier, torpedo (`CAR`) | straight | 2.0 km/s over 40 s | 100 / 70 dB | 0 km | 0 km | 0 | 28800 s |
| Torpedo Mk 0, old pattern (`MK0`) | straight | 3.6 km/s over 90 s | 110 / 90 dB | 40 km | 8 km | 130 | 240 s |
| Torpedo Mk 1, straight-running (`MK1`) | straight | 6.0 km/s over 120 s | 110 / 90 dB | 40 km | 8 km | 140 | 260 s |
| Torpedo Mk 2, homing (`MK2H`) | homing (gain 4) | 10.0 km/s over 200 s | 112 / 95 dB | 40 km | 8 km | 120 | 200 s |
| Torpedo Mk 3, linked homing (`MK3L`) | homing (gain 4) | 10.0 km/s over 200 s | 112 / 95 dB | 40 km | 8 km | 120 | 200 s |
| Torpedo Mk 4, fast (`MK4F`) | straight | 8.1 km/s over 90 s | 124 / 90 dB | 40 km | 8 km | 120 | 170 s |
| Torpedo Mk 5, cold (`MK5Q`) | straight | 3.6 km/s over 120 s | 99 / 90 dB | 40 km | 8 km | 120 | 300 s |
| Torpedo Mk 6, defensive (`MK6D`) | homing (gain 4) | 5.5 km/s over 110 s | 112 / 95 dB | 15 km | 8 km | 90 | 110 s |

### Hits to sink

Good hits to sink each hull, by the warhead figure in the torpedo table: proximity then contact, or one figure where they agree. A near miss does far less.

| Hull | Hull points | 140 | 130 | 120 | 90 |
|---|---|---|---|---|---|
| Fleet depot | 140 | 142 / 120 | 153 / 130 | 165 / 140 | 220 / 187 |
| Freighter, bulk | 100 | 1 | 1 | 1 | 2 |
| Hauler, civilian | 90 | 1 | 1 | 1 | 2 / 1 |
| Hunter, civilian | 80 | 1 | 1 | 1 | 2 / 1 |
| Freighter, war standard | 90 | 1 | 1 | 1 | 2 / 1 |
| Liner, fast | 150 | 2 | 2 | 2 | 2 |
| Life pod | 10 | 1 | 1 | 1 | 1 |
| Tanker, fleet | 500 | 5 / 4 | 5 / 4 | 5 | 7 / 6 |
| Carrier, military | 320 | 3 | 3 | 4 / 3 | 5 / 4 |
| Cruiser, military | 390 | 4 / 3 | 4 / 3 | 4 | 6 / 5 |
| Destroyer, military | 160 | 2 | 2 | 2 | 3 / 2 |
| Fighter, military | 30 | 1 | 1 | 1 | 1 |
| Strike fighter, military | 35 | 1 | 1 | 1 | 1 |
| Attack boat, military | 100 | 1 | 1 | 1 | 2 |
| Attack boat, cold hull | 100 | 1 | 1 | 1 | 2 |
| Attack boat, heavy hull | 125 | 2 / 1 | 2 / 1 | 2 | 2 |
| Attack boat, last war | 90 | 1 | 1 | 1 | 2 / 1 |
| Sweeper craft, military | 30 | 1 | 1 | 1 | 1 |
| Raider, pirate | 80 | 1 | 1 | 1 | 2 / 1 |

### Countermeasures

| Countermeasure | Does | EF | Lasts |
|---|---|---|---|
| Decoy drone | runs off at 0.4 km/s, sounding and echoing like its launcher | its launcher's | 600 s |
| Jammer drone | runs off at 0.5 km/s and jams all round; masks targets within 20° of its bearing; lures homing seekers | 155 dB | 300 s |
| Static buoy | drops astern at 0.3 km/s; masks targets within 20° of its bearing; lures homing seekers | 158 dB | 90 s |

### Mines

**Mine, acoustic.** A mine that goes off when something loud passes close. Ships that burn through a field find it the hard way, and a drifting boat can pass close and live. A static buoy nearby sets it off harmlessly.

**Mine, captor.** A mine that listens from a long way off and launches a homing torpedo at what it hears. It covers far more space than a plain mine. Silent running gets you very close before it hears anything, and a static buoy deals with its torpedo.

**Mine, magnetic.** A mine that feels a hull's field and goes off close by, however quiet that hull is. Silence won't save you, but a shut-down reactor shrinks the danger a great deal. Keep clear: a ping can find one, at the price of telling everyone where you are.

| Mine | Fuze | Effect | Echo |
|---|---|---|---|
| Mine, acoustic | acoustic, 105 dB at the mine | 80 hull points within 15 km | -25 dB |
| Mine, captor | captor, hears 80 dB out to 100 km | launches a Torpedo, captor mine | -22 dB |
| Mine, magnetic | magnetic, 1 dB field | 80 hull points within 15 km | -25 dB |

### Passive detection ranges, target drifting

Range in km at which the listener (row), drifting, has an even chance each second of hearing the target (column). Baffles and moons ignored.

| Listener | civ-freighter | civ-hauler | civ-hunter | civ-pod | mil-carrier | mil-cruiser |
|---|---|---|---|---|---|---|
| civ-freighter | 550 | 11 | 5 | 1 | 620 | 440 |
| civ-hauler | 1,820 | 36 | 18 | 5 | 2,040 | 1,450 |
| civ-hunter | 7,020 | 140 | 70 | 18 | 7,880 | 5,580 |
| mil-carrier | 18,220 | 360 | 180 | 46 | 20,440 | 14,470 |
| mil-cruiser | 43,690 | 870 | 440 | 110 | 49,020 | 34,700 |
| mil-destroyer | 28,960 | 580 | 290 | 73 | 32,490 | 23,000 |
| mil-fighter | 6,670 | 130 | 67 | 17 | 7,490 | 5,300 |
| mil-ghost | 31,610 | 630 | 320 | 79 | 35,470 | 25,110 |
| mil-sweeper | 19,570 | 390 | 200 | 49 | 21,950 | 15,540 |
| pir-raider | 1,880 | 38 | 19 | 5 | 2,110 | 1,490 |

| Listener | mil-destroyer | mil-fighter | mil-ghost | mil-sweeper | pir-raider |
|---|---|---|---|---|---|
| civ-freighter | 350 | 28 | 4 | 3 | 9 |
| civ-hauler | 1,150 | 91 | 14 | 11 | 29 |
| civ-hunter | 4,430 | 350 | 56 | 44 | 110 |
| mil-carrier | 11,490 | 910 | 140 | 110 | 290 |
| mil-cruiser | 27,560 | 2,190 | 350 | 280 | 690 |
| mil-destroyer | 18,270 | 1,450 | 230 | 180 | 460 |
| mil-fighter | 4,210 | 330 | 53 | 42 | 110 |
| mil-ghost | 19,950 | 1,580 | 250 | 200 | 500 |
| mil-sweeper | 12,350 | 980 | 160 | 120 | 310 |
| pir-raider | 1,190 | 94 | 15 | 12 | 30 |

### Passive detection ranges, target burning

Range in km at which the listener (row), drifting, has an even chance each second of hearing the target (column). Baffles and moons ignored.

| Listener | civ-freighter | civ-hauler | civ-hunter | civ-pod | mil-carrier | mil-cruiser |
|---|---|---|---|---|---|---|
| civ-freighter | 1,230 | 140 | 120 | 1 | 2,820 | 2,230 |
| civ-hauler | 4,070 | 460 | 410 | 5 | 9,360 | 7,400 |
| civ-hunter | 15,680 | 1,770 | 1,570 | 18 | 36,070 | 28,510 |
| mil-carrier | 40,660 | 4,590 | 4,080 | 46 | 93,570 | 73,960 |
| mil-cruiser | 97,500 | 11,010 | 9,790 | 110 | 224,360 | 177,340 |
| mil-destroyer | 64,630 | 7,300 | 6,490 | 73 | 148,730 | 117,560 |
| mil-fighter | 14,890 | 1,680 | 1,500 | 17 | 34,270 | 27,080 |
| mil-ghost | 70,560 | 7,970 | 7,080 | 79 | 162,370 | 128,340 |
| mil-sweeper | 43,670 | 4,930 | 4,380 | 49 | 100,490 | 79,430 |
| pir-raider | 4,200 | 470 | 420 | 5 | 9,660 | 7,630 |

| Listener | mil-destroyer | mil-fighter | mil-ghost | mil-sweeper | pir-raider |
|---|---|---|---|---|---|
| civ-freighter | 1,770 | 1,380 | 440 | 250 | 120 |
| civ-hauler | 5,870 | 4,580 | 1,450 | 810 | 410 |
| civ-hunter | 22,650 | 17,650 | 5,580 | 3,140 | 1,580 |
| mil-carrier | 58,750 | 45,770 | 14,470 | 8,140 | 4,090 |
| mil-cruiser | 140,870 | 109,750 | 34,700 | 19,520 | 9,800 |
| mil-destroyer | 93,380 | 72,760 | 23,000 | 12,940 | 6,500 |
| mil-fighter | 21,510 | 16,760 | 5,300 | 2,980 | 1,500 |
| mil-ghost | 101,950 | 79,430 | 25,110 | 14,120 | 7,100 |
| mil-sweeper | 63,100 | 49,160 | 15,540 | 8,740 | 4,390 |
| pir-raider | 6,060 | 4,720 | 1,490 | 840 | 420 |

### Hearing a torpedo

Range in km at which the listener, drifting, has an even chance each second of hearing the torpedo.

| Listener | CAPT burning | CAPT coasting | CAR burning | CAR coasting | MK0 burning | MK0 coasting |
|---|---|---|---|---|---|---|
| civ-freighter | 6 | never | 1 | never | 4 | never |
| civ-hauler | 18 | 3 | 5 | never | 15 | 1 |
| civ-hunter | 71 | 10 | 18 | never | 56 | 6 |
| mil-carrier | 180 | 26 | 46 | 1 | 150 | 14 |
| mil-cruiser | 440 | 62 | 110 | 3 | 350 | 35 |
| mil-destroyer | 290 | 41 | 73 | 2 | 230 | 23 |
| mil-fighter | 67 | 9 | 17 | never | 53 | 5 |
| mil-ghost | 320 | 45 | 79 | 3 | 250 | 25 |
| mil-sweeper | 200 | 28 | 49 | 2 | 160 | 16 |
| pir-raider | 19 | 3 | 5 | never | 15 | 1 |

| Listener | MK1 burning | MK1 coasting | MK2H burning | MK2H coasting | MK3L burning | MK3L coasting |
|---|---|---|---|---|---|---|
| civ-freighter | 4 | never | 6 | never | 6 | never |
| civ-hauler | 15 | 1 | 18 | 3 | 18 | 3 |
| civ-hunter | 56 | 6 | 71 | 10 | 71 | 10 |
| mil-carrier | 150 | 14 | 180 | 26 | 180 | 26 |
| mil-cruiser | 350 | 35 | 440 | 62 | 440 | 62 |
| mil-destroyer | 230 | 23 | 290 | 41 | 290 | 41 |
| mil-fighter | 53 | 5 | 67 | 9 | 67 | 9 |
| mil-ghost | 250 | 25 | 320 | 45 | 320 | 45 |
| mil-sweeper | 160 | 16 | 200 | 28 | 200 | 28 |
| pir-raider | 15 | 1 | 19 | 3 | 19 | 3 |

| Listener | MK4F burning | MK4F coasting | MK5Q burning | MK5Q coasting | MK6D burning | MK6D coasting |
|---|---|---|---|---|---|---|
| civ-freighter | 22 | never | 1 | never | 6 | never |
| civ-hauler | 73 | 1 | 4 | 1 | 18 | 3 |
| civ-hunter | 280 | 6 | 15 | 6 | 71 | 10 |
| mil-carrier | 730 | 14 | 39 | 14 | 180 | 26 |
| mil-cruiser | 1,740 | 35 | 94 | 35 | 440 | 62 |
| mil-destroyer | 1,150 | 23 | 62 | 23 | 290 | 41 |
| mil-fighter | 270 | 5 | 14 | 5 | 67 | 9 |
| mil-ghost | 1,260 | 25 | 68 | 25 | 320 | 45 |
| mil-sweeper | 780 | 16 | 42 | 16 | 200 | 28 |
| pir-raider | 75 | 1 | 4 | 1 | 19 | 3 |

### Active array ranges

**Finds** is the range at which the pinger, drifting, has an even chance of an echo from that target. **Heard by** is the range at which that ship, drifting, hears the ping itself. The gap between the two is why pinging is dangerous.

| Pinger | Target | Finds it at | Heard by it at |
|---|---|---|---|
| civ-hauler | civ-freighter | 400 | 2,460 |
| civ-hauler | civ-hauler | 230 | 8,140 |
| civ-hauler | civ-hunter | 230 | 31,380 |
| civ-hauler | civ-pod | 96 | never |
| civ-hauler | mil-carrier | 320 | 81,380 |
| civ-hauler | mil-cruiser | 250 | 195,130 |
| civ-hauler | mil-destroyer | 170 | 129,350 |
| civ-hauler | mil-fighter | 54 | 29,800 |
| civ-hauler | mil-ghost | 14 | 141,220 |
| civ-hauler | mil-sweeper | 45 | 87,400 |
| civ-hauler | pir-raider | 230 | 8,400 |
| civ-hunter | civ-freighter | 750 | 2,460 |
| civ-hunter | civ-hauler | 420 | 8,140 |
| civ-hunter | civ-hunter | 420 | 31,380 |
| civ-hunter | civ-pod | 180 | never |
| civ-hunter | mil-carrier | 590 | 81,380 |
| civ-hunter | mil-cruiser | 470 | 195,130 |
| civ-hunter | mil-destroyer | 310 | 129,350 |
| civ-hunter | mil-fighter | 100 | 29,800 |
| civ-hunter | mil-ghost | 27 | 141,220 |
| civ-hunter | mil-sweeper | 84 | 87,400 |
| civ-hunter | pir-raider | 420 | 8,400 |
| mil-carrier | civ-freighter | 3,020 | 10,970 |
| mil-carrier | civ-hauler | 1,700 | 36,350 |
| mil-carrier | civ-hunter | 1,700 | 140,150 |
| mil-carrier | civ-pod | 720 | never |
| mil-carrier | mil-carrier | 2,400 | 363,490 |
| mil-carrier | mil-cruiser | 1,910 | 871,630 |
| mil-carrier | mil-destroyer | 1,270 | 577,810 |
| mil-carrier | mil-fighter | 400 | 133,120 |
| mil-carrier | mil-ghost | 110 | 630,800 |
| mil-carrier | mil-sweeper | 340 | 390,410 |
| mil-carrier | pir-raider | 1,700 | 37,520 |
| mil-cruiser | civ-freighter | 7,420 | 24,570 |
| mil-cruiser | civ-hauler | 4,170 | 81,380 |
| mil-cruiser | civ-hunter | 4,170 | 313,750 |
| mil-cruiser | civ-pod | 1,760 | never |
| mil-cruiser | mil-carrier | 5,890 | 813,760 |
| mil-cruiser | mil-cruiser | 4,680 | 1,951,350 |
| mil-cruiser | mil-destroyer | 3,130 | 1,293,550 |
| mil-cruiser | mil-fighter | 990 | 298,020 |
| mil-cruiser | mil-ghost | 260 | 1,412,180 |
| mil-cruiser | mil-sweeper | 830 | 874,020 |
| mil-cruiser | pir-raider | 4,170 | 83,990 |
| mil-destroyer | civ-freighter | 4,270 | 13,810 |
| mil-destroyer | civ-hauler | 2,400 | 45,760 |
| mil-destroyer | civ-hunter | 2,400 | 176,440 |
| mil-destroyer | civ-pod | 1,010 | never |
| mil-destroyer | mil-carrier | 3,400 | 457,610 |
| mil-destroyer | mil-cruiser | 2,700 | 1,097,320 |
| mil-destroyer | mil-destroyer | 1,800 | 727,420 |
| mil-destroyer | mil-fighter | 570 | 167,590 |
| mil-destroyer | mil-ghost | 150 | 794,130 |
| mil-destroyer | mil-sweeper | 480 | 491,500 |
| mil-destroyer | pir-raider | 2,400 | 47,230 |
| mil-ghost | civ-freighter | 2,820 | 5,500 |
| mil-ghost | civ-hauler | 1,580 | 18,220 |
| mil-ghost | civ-hunter | 1,580 | 70,240 |
| mil-ghost | civ-pod | 670 | never |
| mil-ghost | mil-carrier | 2,240 | 182,180 |
| mil-ghost | mil-cruiser | 1,780 | 436,850 |
| mil-ghost | mil-destroyer | 1,190 | 289,590 |
| mil-ghost | mil-fighter | 380 | 66,720 |
| mil-ghost | mil-ghost | 100 | 316,150 |
| mil-ghost | mil-sweeper | 320 | 195,670 |
| mil-ghost | pir-raider | 1,580 | 18,800 |
| pir-raider | civ-freighter | 410 | 2,460 |
| pir-raider | civ-hauler | 230 | 8,140 |
| pir-raider | civ-hunter | 230 | 31,380 |
| pir-raider | civ-pod | 97 | never |
| pir-raider | mil-carrier | 330 | 81,380 |
| pir-raider | mil-cruiser | 260 | 195,130 |
| pir-raider | mil-destroyer | 170 | 129,350 |
| pir-raider | mil-fighter | 55 | 29,800 |
| pir-raider | mil-ghost | 15 | 141,220 |
| pir-raider | mil-sweeper | 46 | 87,400 |
| pir-raider | pir-raider | 230 | 8,400 |

### Ranges on the physical model

These apply in engagements with the physical channels on (Thermal Range, Shadow of the Giant). Each is the range at which the signal reaches the sensor's detection threshold, in open space, with the listener drifting.

**EF array hears a ship, reactor running, drifting.**

| Listener | civ-freighter | civ-hauler | civ-hunter | civ-pod | mil-carrier | mil-cruiser |
|---|---|---|---|---|---|---|
| civ-freighter | 305k km | 136k km | 86k km | 4,300 km | 68k km | 61k km |
| civ-hauler | 316k km | 141k km | 89k km | 4,450 km | 70k km | 63k km |
| civ-hunter | 708k km | 316k km | 200k km | 9,980 km | 158k km | 141k km |
| mil-carrier | 10.0 Mkm | 4.5 Mkm | 2.8 Mkm | 141k km | 2.2 Mkm | 2.0 Mkm |
| mil-cruiser | 0.1 AU | 8.2 Mkm | 5.2 Mkm | 258k km | 4.1 Mkm | 3.7 Mkm |
| mil-destroyer | 10.0 Mkm | 4.5 Mkm | 2.8 Mkm | 141k km | 2.2 Mkm | 2.0 Mkm |
| mil-fighter | 1.0 Mkm | 448k km | 283k km | 14k km | 223k km | 200k km |
| mil-ghost | 10.0 Mkm | 4.5 Mkm | 2.8 Mkm | 141k km | 2.2 Mkm | 2.0 Mkm |
| mil-sweeper | 1.0 Mkm | 448k km | 283k km | 14k km | 224k km | 200k km |
| pir-raider | 317k km | 141k km | 89k km | 4,460 km | 71k km | 63k km |

| Listener | mil-destroyer | mil-fighter | mil-ghost | mil-sweeper | pir-raider |
|---|---|---|---|---|---|
| civ-freighter | 43k km | 19k km | 24k km | 9,620 km | 86k km |
| civ-hauler | 45k km | 20k km | 24k km | 9,960 km | 89k km |
| civ-hunter | 100k km | 45k km | 55k km | 22k km | 200k km |
| mil-carrier | 1.4 Mkm | 632k km | 774k km | 316k km | 2.8 Mkm |
| mil-cruiser | 2.6 Mkm | 1.2 Mkm | 1.4 Mkm | 577k km | 5.2 Mkm |
| mil-destroyer | 1.4 Mkm | 632k km | 774k km | 316k km | 2.8 Mkm |
| mil-fighter | 141k km | 63k km | 77k km | 32k km | 283k km |
| mil-ghost | 1.4 Mkm | 632k km | 774k km | 316k km | 2.8 Mkm |
| mil-sweeper | 141k km | 63k km | 77k km | 32k km | 283k km |
| pir-raider | 45k km | 20k km | 24k km | 9,980 km | 89k km |

**EF array hears a ship, burning at full.**

| Listener | civ-freighter | civ-hauler | civ-hunter | civ-pod | mil-carrier | mil-cruiser |
|---|---|---|---|---|---|---|
| civ-freighter | 703k km | 344k km | 284k km | 4,300 km | 1.8 Mkm | 1.6 Mkm |
| civ-hauler | 728k km | 356k km | 294k km | 4,450 km | 1.8 Mkm | 1.7 Mkm |
| civ-hunter | 1.6 Mkm | 798k km | 659k km | 9,980 km | 4.1 Mkm | 3.7 Mkm |
| mil-carrier | 0.2 AU | 11.3 Mkm | 9.3 Mkm | 141k km | 0.4 AU | 0.4 AU |
| mil-cruiser | 0.3 AU | 0.1 AU | 0.1 AU | 258k km | 0.7 AU | 0.6 AU |
| mil-destroyer | 0.2 AU | 11.3 Mkm | 9.3 Mkm | 141k km | 0.4 AU | 0.4 AU |
| mil-fighter | 2.3 Mkm | 1.1 Mkm | 933k km | 14k km | 5.8 Mkm | 5.3 Mkm |
| mil-ghost | 0.2 AU | 11.3 Mkm | 9.3 Mkm | 141k km | 0.4 AU | 0.4 AU |
| mil-sweeper | 2.3 Mkm | 1.1 Mkm | 933k km | 14k km | 5.8 Mkm | 5.3 Mkm |
| pir-raider | 729k km | 357k km | 295k km | 4,460 km | 1.8 Mkm | 1.7 Mkm |

| Listener | mil-destroyer | mil-fighter | mil-ghost | mil-sweeper | pir-raider |
|---|---|---|---|---|---|
| civ-freighter | 1.1 Mkm | 609k km | 746k km | 280k km | 284k km |
| civ-hauler | 1.2 Mkm | 630k km | 772k km | 290k km | 294k km |
| civ-hunter | 2.6 Mkm | 1.4 Mkm | 1.7 Mkm | 650k km | 659k km |
| mil-carrier | 0.3 AU | 0.1 AU | 0.2 AU | 9.2 Mkm | 9.3 Mkm |
| mil-cruiser | 0.5 AU | 0.2 AU | 0.3 AU | 0.1 AU | 0.1 AU |
| mil-destroyer | 0.3 AU | 0.1 AU | 0.2 AU | 9.2 Mkm | 9.3 Mkm |
| mil-fighter | 3.7 Mkm | 2.0 Mkm | 2.4 Mkm | 921k km | 933k km |
| mil-ghost | 0.3 AU | 0.1 AU | 0.2 AU | 9.2 Mkm | 9.3 Mkm |
| mil-sweeper | 3.7 Mkm | 2.0 Mkm | 2.4 Mkm | 921k km | 934k km |
| pir-raider | 1.2 Mkm | 631k km | 773k km | 291k km | 295k km |

**Magnetometer feels a ship.** Reactor running / shut down.

| Listener | civ-freighter | civ-hauler | civ-hunter | civ-pod | mil-carrier | mil-cruiser |
|---|---|---|---|---|---|---|
| civ-freighter | 613 m / 508 m | 326 m / 172 m | 346 m / 119 m | never | 672 m / 384 m | 618 m / 336 m |
| civ-hauler | 613 m / 508 m | 326 m / 172 m | 346 m / 119 m | never | 672 m / 384 m | 618 m / 336 m |
| civ-hunter | 3 km / 2 km | 2 km / 799 m | 2 km / 554 m | never | 3 km / 2 km | 3 km / 2 km |
| mil-carrier | 28 km / 24 km | 15 km / 8 km | 16 km / 6 km | never | 31 km / 18 km | 29 km / 16 km |
| mil-cruiser | 36 km / 30 km | 19 km / 10 km | 20 km / 7 km | never | 39 km / 22 km | 36 km / 20 km |
| mil-destroyer | 28 km / 24 km | 15 km / 8 km | 16 km / 6 km | never | 31 km / 18 km | 29 km / 16 km |
| mil-ghost | 28 km / 24 km | 15 km / 8 km | 16 km / 6 km | never | 31 km / 18 km | 29 km / 16 km |
| pir-raider | 2 km / 2 km | 1 km / 554 m | 1 km / 384 m | never | 2 km / 1 km | 2 km / 1 km |

| Listener | mil-destroyer | mil-fighter | mil-ghost | mil-sweeper | pir-raider |
|---|---|---|---|---|---|
| civ-freighter | 483 m / 241 m | 104 m / 49 m | 380 m / 177 m | 59 m / 19 m | 397 m / 147 m |
| civ-hauler | 483 m / 241 m | 104 m / 49 m | 380 m / 177 m | 59 m / 19 m | 397 m / 147 m |
| civ-hunter | 2 km / 1 km | 481 m / 229 m | 2 km / 819 m | 274 m / 89 m | 2 km / 684 m |
| mil-carrier | 22 km / 11 km | 5 km / 2 km | 18 km / 8 km | 3 km / 888 m | 18 km / 7 km |
| mil-cruiser | 28 km / 14 km | 6 km / 3 km | 22 km / 10 km | 3 km / 1 km | 23 km / 9 km |
| mil-destroyer | 22 km / 11 km | 5 km / 2 km | 18 km / 8 km | 3 km / 888 m | 18 km / 7 km |
| mil-ghost | 22 km / 11 km | 5 km / 2 km | 18 km / 8 km | 3 km / 888 m | 18 km / 7 km |
| pir-raider | 2 km / 776 m | 333 m / 159 m | 1 km / 568 m | 190 m / 62 m | 1 km / 474 m |

**Radar.** *Finds* is the range of an echo from that target (the radar equation: EIRP × cross-section / (4π)² r⁴ against the pinger's own EF floor). *Heard by* is how far the target's EF array hears the pulse itself (one way, over 4πr²). The gap is why a ping is a confession.

| Pinger | Target | Finds it at | Heard by it at |
|---|---|---|---|
| civ-hauler | civ-freighter | 1,330 km | 0.3 AU |
| civ-hauler | civ-hunter | 470 km | 0.7 AU |
| civ-hauler | civ-pod | 240 km | never |
| civ-hauler | mil-carrier | 990 km | 9.4 AU |
| civ-hauler | mil-cruiser | 830 km | 17.3 AU |
| civ-hauler | mil-destroyer | 630 km | 9.5 AU |
| civ-hauler | mil-fighter | 240 km | 0.9 AU |
| civ-hauler | mil-ghost | 130 km | 9.5 AU |
| civ-hauler | mil-sweeper | 220 km | 0.9 AU |
| civ-hauler | pir-raider | 470 km | 0.3 AU |
| civ-hunter | civ-freighter | 2,000 km | 0.3 AU |
| civ-hunter | civ-hauler | 700 km | 0.3 AU |
| civ-hunter | civ-pod | 350 km | never |
| civ-hunter | mil-carrier | 1,480 km | 9.4 AU |
| civ-hunter | mil-cruiser | 1,240 km | 17.3 AU |
| civ-hunter | mil-destroyer | 940 km | 9.5 AU |
| civ-hunter | mil-fighter | 350 km | 0.9 AU |
| civ-hunter | mil-ghost | 200 km | 9.5 AU |
| civ-hunter | mil-sweeper | 330 km | 0.9 AU |
| civ-hunter | pir-raider | 700 km | 0.3 AU |
| mil-carrier | civ-freighter | 89k km | 40.7 AU |
| mil-carrier | civ-hauler | 31k km | 42.1 AU |
| mil-carrier | civ-hunter | 31k km | 94.3 AU |
| mil-carrier | civ-pod | 16k km | never |
| mil-carrier | mil-cruiser | 56k km | 2439.9 AU |
| mil-carrier | mil-destroyer | 42k km | 1336.5 AU |
| mil-carrier | mil-fighter | 16k km | 133.6 AU |
| mil-carrier | mil-ghost | 8,930 km | 1336.5 AU |
| mil-carrier | mil-sweeper | 15k km | 133.6 AU |
| mil-carrier | pir-raider | 31k km | 42.2 AU |
| mil-cruiser | civ-freighter | 134k km | 49.8 AU |
| mil-cruiser | civ-hauler | 47k km | 51.6 AU |
| mil-cruiser | civ-hunter | 47k km | 115.5 AU |
| mil-cruiser | civ-pod | 24k km | never |
| mil-cruiser | mil-carrier | 99k km | 1636.8 AU |
| mil-cruiser | mil-destroyer | 63k km | 1636.9 AU |
| mil-cruiser | mil-fighter | 24k km | 163.6 AU |
| mil-cruiser | mil-ghost | 13k km | 1636.9 AU |
| mil-cruiser | mil-sweeper | 22k km | 163.7 AU |
| mil-cruiser | pir-raider | 47k km | 51.7 AU |
| mil-destroyer | civ-freighter | 75k km | 28.8 AU |
| mil-destroyer | civ-hauler | 26k km | 29.8 AU |
| mil-destroyer | civ-hunter | 26k km | 66.7 AU |
| mil-destroyer | civ-pod | 13k km | never |
| mil-destroyer | mil-carrier | 56k km | 945.0 AU |
| mil-destroyer | mil-cruiser | 47k km | 1725.2 AU |
| mil-destroyer | mil-fighter | 13k km | 94.5 AU |
| mil-destroyer | mil-ghost | 7,510 km | 945.1 AU |
| mil-destroyer | mil-sweeper | 12k km | 94.5 AU |
| mil-destroyer | pir-raider | 26k km | 29.8 AU |
| mil-fighter | civ-freighter | 7,510 km | 2.9 AU |
| mil-fighter | civ-hauler | 2,630 km | 3.0 AU |
| mil-fighter | civ-hunter | 2,630 km | 6.7 AU |
| mil-fighter | civ-pod | 1,340 km | never |
| mil-fighter | mil-carrier | 5,560 km | 94.5 AU |
| mil-fighter | mil-cruiser | 4,670 km | 172.5 AU |
| mil-fighter | mil-destroyer | 3,550 km | 94.5 AU |
| mil-fighter | mil-ghost | 750 km | 94.5 AU |
| mil-fighter | mil-sweeper | 1,240 km | 9.4 AU |
| mil-fighter | pir-raider | 2,630 km | 3.0 AU |
| mil-ghost | civ-freighter | 42k km | 9.1 AU |
| mil-ghost | civ-hauler | 15k km | 9.4 AU |
| mil-ghost | civ-hunter | 15k km | 21.1 AU |
| mil-ghost | civ-pod | 7,510 km | never |
| mil-ghost | mil-carrier | 31k km | 298.8 AU |
| mil-ghost | mil-cruiser | 26k km | 545.6 AU |
| mil-ghost | mil-destroyer | 20k km | 298.8 AU |
| mil-ghost | mil-fighter | 7,510 km | 29.9 AU |
| mil-ghost | mil-sweeper | 6,990 km | 29.9 AU |
| mil-ghost | pir-raider | 15k km | 9.4 AU |
| mil-sweeper | civ-freighter | 5,560 km | 1.6 AU |
| mil-sweeper | civ-hauler | 1,950 km | 1.6 AU |
| mil-sweeper | civ-hunter | 1,950 km | 3.7 AU |
| mil-sweeper | civ-pod | 990 km | never |
| mil-sweeper | mil-carrier | 4,110 km | 51.8 AU |
| mil-sweeper | mil-cruiser | 3,460 km | 94.5 AU |
| mil-sweeper | mil-destroyer | 2,630 km | 51.8 AU |
| mil-sweeper | mil-fighter | 990 km | 5.2 AU |
| mil-sweeper | mil-ghost | 560 km | 51.8 AU |
| mil-sweeper | pir-raider | 1,950 km | 1.6 AU |
| pir-raider | civ-freighter | 1,330 km | 0.3 AU |
| pir-raider | civ-hauler | 470 km | 0.3 AU |
| pir-raider | civ-hunter | 470 km | 0.7 AU |
| pir-raider | civ-pod | 240 km | never |
| pir-raider | mil-carrier | 990 km | 9.4 AU |
| pir-raider | mil-cruiser | 830 km | 17.3 AU |
| pir-raider | mil-destroyer | 630 km | 9.5 AU |
| pir-raider | mil-fighter | 240 km | 0.9 AU |
| pir-raider | mil-ghost | 130 km | 9.5 AU |
| pir-raider | mil-sweeper | 220 km | 0.9 AU |


<!-- specs:end -->

## 25. Glossary

| Term | Meaning |
|---|---|
| Annunciator | The master alarm: MASTER CAUTION for damage, MASTER WARNING for a failure. Acknowledge with `a`. |
| Arming distance | How far a torpedo must run from the tube before its warhead can explode. Closer than that, a hit is a dud. |
| Baffles | The deaf cone astern of a passive array. |
| Band | The verdict on an engagement, from Defeat to Decisive. |
| Beam weapon | A weapon of light: instant, strong close in, weak with range, loud on EM. |
| Bearing | Compass direction to something, 0° to 360°, measured clockwise from north. |
| Bingo | The navigator's call that fuel has fallen to the line for home: the fuel to reach the nearer of base and Drift Station at standard warp, plus a reserve. Called once a patrol |
| The black | Space, in the fleet's slang. A torpedo "in the black" has been launched and is running; "underway" means away from a dockyard. |
| Blather | A tactical error that loses an engagement or puts the boat at risk. The term is fleet usage, after an ensign of that name. The instructor's note after a failed exercise names the blather that decided it. |
| Boat | A ghost, by tradition: submariners call their ship a boat, whatever her size, and the fleet's ghost crews kept the word. |
| Briefing | Command's word to a boat at a port, each item dated: the orders, contact reports, war news, the mess's talk, the mail and chart overlays. |
| BT | The break in a naval signal, between its heading and its text, and again after the text. |
| Captor mine | A mine that listens, and launches a homing torpedo at what it hears. |
| COB | Chief of the boat: the senior rating, who runs the air on AUTO and reports it. The title is a holdover from the wet navies, where a submarine's senior enlisted sailor was its chief of the boat. |
| COMGHOSTFLT | Commander, Ghost Fleet: command, as a signal's heading names it. The Navy builds such names from the post, as COMSUBPAC was Commander, Submarine Force, Pacific. |
| Course | The direction you are actually moving. |
| Craft | A small crewed ship flown from a carrier's deck: a fighter or a strike fighter. Loud, fast and half deaf. |
| Cross-fix | A position found where bearings from two places cross. A hunting group gets one from two ships at once. |
| Damage control | The crew that repairs systems underway, one at a time, back to 90% at best. |
| dB | Decibel. A logarithmic scale: +10 dB is ten times the power, +3 dB about double. |
| Decoy | A drone that sounds like your ship and runs off on its own course. |
| Difficulty | How hard the trainer plays: Standard, Hard or Nightmare. Chosen before you sail. |
| Echo | The return of a ping off a hull. |
| Elevation | Angle above (+) or below (−) the reference plane. |
| ESM | Electronic support measures: a receiver that hears other ships' transmissions. |
| Fast liner | A big, fast merchant that sails alone at half again a boat's standard warp, with troops, passengers and urgent cargo. Its drive is heard from far off. |
| Fire control | The computer that aims torpedoes and guns from your TMA solution or ping echoes. |
| Fit | New equipment the yard fits a boat at a refit, from Captain. It stays with her, and is lost if she is paid off. |
| Flagship | The ship in a hunting group with the strongest active array: it does the group's pinging. |
| Flaw | A weakness on a captain's sheet, such as Hothead or Timid. One captain in four has one. |
| Gauss gun | A gun that fires unguided slugs at 10 km/s, silent in flight. |
| Grade | How good a captain and crew are: Green, Regular, Seasoned or Veteran. |
| Heading | The direction the nose points. |
| Hold | At Nightmare, a hunting group spread in lanes around your last fix, waiting for your battery and air to run out. |
| Hull integrity | How much damage the hull can still take, 100% to 0. |
| Hunting group | Warships that hunt together and share every bearing over a datalink. |
| Influence mine | A mine set off by a ship's emissions (an acoustic fuze, named for the WWII original) or magnetic field (magnetic), without touching it. |
| Leg change | A change of course made to let TMA find range. |
| Light time | How late a message or a signal arrives: the time light takes to cross the gap, about 5.6 minutes over 100 million km. |
| Magnetometer | Feels a hull's magnetic field, at very short range. |
| Mess's talk | Word from other crews at a port. Sometimes rumour, sometimes wrong. |
| Nebula | A charted cloud that changes what sensors hear: dust, ion or storm. |
| Overlay (chart) | A layer on the patrol chart handed over by command, a port or one of our boats: traffic lanes, hunter patrol areas or sightings, each with its source and age. Not a sheet of glass: `intel` shows or hides it. |
| Paid off | Taken out of service: a boat whose hull would take too long to mend. The captain is given another. |
| Patch | A quick repair at the yard. The system works, but no better than 90% until a later refit repairs it. |
| Patrol chart | A career's map of the sector at sea, north up: the bodies and their wells, the places, our boat, and contact reports as estimates. |
| Ping | A pulse of active array. |
| Practice runs | A torpedo's log: how many times she has been fired in exercises and recovered. Each run makes her a little likelier to fail. |
| Practice shot | A torpedo with an inert head, fired in a lesson. A hit counts, and sinks nothing; afterwards she drifts by her beacon, to be recovered. |
| Radiators | Panels that shed heat fast, and glow in infrared while they do. |
| Refit | The boat's time in the yard between patrols, paid in days by the jobs chosen. |
| Relay | A station of ours that broadcasts command's word to boats within its reach, about the breadth of a system. Command reaches each by a fixed link. |
| Role | What a captain is for: Line, Silent, Escort, Pirate or Hunter. A good roll never changes it. |
| Sail | To put out on a voyage. Nothing out here has sails: *sail*, *boat*, *tubes*, *convoy* and the like are nautical holdovers, kept by tradition. |
| Salvo, spread | Several torpedoes fanned across the target's track, to cover the uncertainty in a solution. |
| Scram | Shutting the reactor down at once. |
| Scrubbers | The pumps and fans that remove CO₂ from the air. They radiate, so ultra-quiet secures them. |
| Sheet | A captain's or skipper's numbers, name and record, rolled each play and shown only afterwards. |
| Signal excess | How far a signal is above what you need to detect it. |
| Silent running | Reactor shut down, living on the battery: quieter than drifting, for as long as the battery lasts. |
| Sink | To destroy a ship. Nothing sinks in space. The fleet kept the word from naval tradition, along with tonnage and torpedoes. |
| Speciality | A warship captain's standout habit, such as Ambusher or Listener. |
| Static buoy | A countermeasure that roars, masking nearby bearings and luring homing torpedoes. |
| Straggler | A merchant fallen behind her convoy, alone or with one escort. |
| Target strength | How strongly a hull returns a ping. |
| TMA | Target motion analysis: range, course and speed from bearings. |
| Transient | A sudden rise in a contact's emissions, usually a drive lighting up or a torpedo launch. |
| TTI | Time to impact: how long until a torpedo reaches the point fire control aimed it at. |
| War diary | A career's dated record of the war, in the official log's voice: the patrols, fights, the crew's and the boat's changes, command's news and the captain's notes. Written as things happen, and to a file when the war ends. |
| War patrol report | A patrol's report in the diary, after the real form: contacts, attack data, damage, personnel, endurance, duration, remarks and the chart log. |
| Warp bubble | How a boat crosses the patrol chart. It cannot hold inside a gravity well. |
| Waterfall | The display of passive array output over time. |
| Well edge | Where a warp bubble drops to normal space: farther out for a stronger body. |
| Yard priority | High standing's place in the yard's queue: every job's days cut, up to a quarter. |

## 26. Enclosures

*Papers issued with this manual. Keep them with it.*

### Letter of appointment

> **Flotilla Personnel Office. To the officer named below, on appointment to command.**
>
> You are appointed to command of a ghost boat of this flotilla, and you will report to the Fleet Tactical Trainer until the Flotilla Commander releases you. Your boat, your crew and your first patrol will be assigned from your record there.
>
> Keep your own log. Records will ask for it.
>
> Hours on the trainer are logged in full. Time on the trainer does not count toward time in the black. Do not ask this office to change that.
>
> *Countersigned by the Duty Clerk. Do not reply to this letter.*

### Fleet Bulletin 3127-41

> **ALL BOATS. POSTED AT EVERY TRAINER ROOM.**
>
> 1. Captains are reminded that heavy haulers run on a low burn and open up only to escape. A sudden rise on a steady trace means she has heard you. Shoot then, or let her go.
> 2. Two boats this quarter reported "torpedo running hot" against a target that turned out to be a static buoy. A fish costs more than a captain's patience. Classify before you shoot.
> 3. Trainer returns are due at the end of each watch. Every exercise goes in the return, including the ones that ended badly. Records will not accept "exercise only" as an entry.
> 4. Do not bring food into the trainer room.

### Page from a notebook

*Found in the wardroom of a boat refitting at Depot Twelve. The cover is gone and the name with it.*

> Sixth week. Drift, listen, drift. The new exec asks why I still run the trainer on my off watches. I told him you can't lose a boat twice, and he laughed, so I didn't tell him the rest.
>
> Reactor down makes the hum go away, and you hear your own crew breathing. Nobody tells you that. Nobody tells you the worst hour is the one after the escort stops pinging, when you don't know if she gave up or just got patient.
>
> Rule I wish I'd had at the start: if it looks easy, somebody wants it to look easy.
>
> Records sent back my trainer returns again. The dates are wrong, or mine are. Asked the clerk. He looked at me for a long time and said to keep my own log.
>
> I keep it.
