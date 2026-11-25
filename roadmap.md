---
title: The road to 1.0
---

# The road to 1.0

*What each release has brought, what comes next, and the plan to 1.0.*

Ghost Boat is built in small steps. A release that adds features is followed by one that adds none: it balances and tests what came before. The game should take a long time to master, and repay it.

1.0 is the war: a captain sails a career in a ghost from the first patrol to the war's end. The civilian and privateer careers come after, in 2.0.

## In play-testing: 0.11.0-rc.1

0.11.0 is balance for the career, and a clear first hour. Its first release candidate is with play-testers now, and their reports shape the release. The candidate brings:

- Three lessons teach the career before a first war: base and orders, a whole patrol, and coming home.
- New lessons: night and standing orders, mines, and pods and the people aboard them.
- Rank is harder to earn. It takes credit for challenges won and hours played.
- Port and starboard: the second sensor operator reads back the waterfall's history for faint contacts.
- Fewer empty patrols. A boat holding still is quiet, not invisible, and a loud boat is noticed more.
- The warp spin-up is a dangerous time: a quarter of an hour, at rest, loud and deaf.
- A boat dropped from warp arrives at rest.
- Command's signals come in naval form, and a new career opens on command's welcome letter.
- A sixth patrol zone, the Greystone Gap.
- `helm wpt` points the bow at the next waypoint.
- `brief` shows the briefing and its goals again, mid-exercise.
- `/` searches the manual, the quick reference and the war diaries, as in `less`.
- The patrol chart moves with the arrow keys or a drag, and `d` drops into a fight.
- A theme menu on `T`, and six new themes: five light ones and a combat information centre's.
- Every theme reads better: text at 4.5:1 or more, and the alarms apart under red-green colour blindness.
- Crowded fights run up to several times faster.
- A war's code plays the same war on Linux, macOS and Windows.
- The helm warns when the propellant left would barely stop the boat.
- Warships may hold a boat down: lying quiet, pressing passes, or feigning a departure. None holds for ever.
- Nightmare's crews have steady nerves.
- Range comes from geometry. A fading signal may be a ship going quiet, not a ship leaving.
- `K` fires a gauss burst into a contact's area with no solution: loud, and a hit is chance.
- A new order, protect the mail: sweep the packet's road before she sails.
- The mail packet keeps a schedule.
- A fast liner joins the merchants, and freighters carry lesser cargoes. Every cargo has a value.
- A holed hull bleeds air until the damage parties patch it.
- Career fights keep the rules of war. More merchants run dark as the war goes on.
- The conn refuses an order it cannot read whole, rather than guess.
- `away wpt` and `beam wpt2`, and the helm takes a charted body or a note by name.
- One conn line everywhere, a solution's grade as a word on the plot, red for refusals only, and the mouse on the career's screens.
- The manual says how the enemy behaves, never how to beat it, and has a part on accessibility.
- Teaching notes for students: ideas in physics, maths and computing, walked through the game's own code.
- Fixes: `full stop` near a well, a fighter's burn misread, fuel under a cap, names for every ship in a career fight, `helm s1`, heading goals met too soon, and the own-ship window at 80 by 24.

## The plan to 1.0

The plan as it stands. Each feature release is followed by its balance release.

- **0.12.0, the generated galaxy.** A generated galaxy of wells, with satellites, beacons and a living roster of ships. The career moves into the galaxy. Follow a ship between wells by her jump wake. Skim for fuel. Survivors become a real choice. The crew's spirit rises and falls with the war. Theatres and bases. Rank worth having, and awards for an outstanding patrol. New Game offers the galaxy's size.
- **0.13.0**, balance for the galaxy and the career.
- **0.14.0, intelligence.** The cipher plant and broken traffic. A false-flag game on the radio. Wolfpacks, and banked intelligence.
- **0.15.0**, balance for intelligence.
- **0.16.0, the living war.** A storyteller that sets up all sorts of situations, the lopsided ones plainly labelled. The amateur bands come to life. Wear, repair and replacement. Crew losses and rescues.
- **0.17.0**, balance for the living war.
- **0.18.0, the finish.** Instruments that zoom. A lean layout for small screens, and a single-station layout. A console that follows the boat's condition. The manual and the lessons brought up to the whole game.
- **0.19.0, the 1.0 beta.** The last feature freeze. Balance across the whole game, polish for new players, installers and fonts.
- **1.0.** A career in a ghost, from the first patrol to the war's end, in a generated galaxy. Every system in it tested and play-tested. It installs on Linux, macOS and Windows. It is held to the classics: *Silent Service II*, *Silent Hunter III* and *IV*, *UBOAT*, *Cold Waters* and *Dangerous Waters*.
- **2.0.** The civilian and privateer careers.

## Shipped

### 0.10.1 and 0.10.2, 20 November 2026

- Due north reads 000°, never 360°, in the plotter and the contacts table.

### 0.10.0, 20 November 2026: the career

- **New Game**: one captain, one boat and one war, fought in patrols from base.
- The patrol chart: warp between the wells, drop into a fight, warp out.
- Command's orders: patrol a zone, sink a tonnage, keep watch, pick up survivors, stand by as a lifeguard, land operatives, carry the mail.
- Radio at the speed of light, and the news at the ports.
- Every merchant carries a cargo. A search party can board a crippled one.
- Pods and survivors, and the rules of war about them.
- The yard: refits paid in days of the war.
- Worn torpedoes, and practice shots in the lessons.
- The war diary, with a war patrol report for each patrol, written out as text and Markdown.
- The navigator's ruler, and sheets of glass for each job.
- Orders relative to a target: `put`, `close`, `open`, `station`, `intercept`.
- Launch codes: one code starts the same launch, or the same war, again.
- *The Cozy Well*, a challenge with no combat, no goal and no clock.
- Six themes after the terminals and home computers of the 70s and 80s.
- Each captain keeps their own settings.
- Pings called as a crew calls them, and a radio stack in the comms window.

### 0.9.0, 14 November 2026: the first build for outside play-testers

- Merchants run at the first sign of trouble. Hunters give up a fruitless search, escorts go back to their traders, and patrols are relieved.
- The computer ghost hunts merchants. Veteran destroyer captains fight like veterans.
- Ultra-quiet costs more: no reloads, and a crew that tires fast.
- The transits reworked, and a new challenge, *The Swept Channel*.
- Keep playing after the end, or keep the play.
- Condition red sounds the klaxon.
- Three themes after the home computers of the early 80s.
- Thanks to Arya Bandari, play-tester, whose torpedo notes shaped fire control.

### 0.8.0, 11 November 2026: hazards, hulls, radio and the attack

- Challenges rolled fresh each time.
- Morale: a computer crew loses its nerve as the odds turn.
- Six new challenges, among them *Distress Call* and two from a destroyer's bridge.
- The bare conn: play from the header, the goals and the log alone.
- A training track for the hunters.
- Reading a ship's radio lines, and working a track by hand.
- Gravitic thrusters, for silent course corrections.
- Radio traffic, hailing, and a radio lesson.
- Clearing mines, and the sweeper craft.
- Uncharted hazards, and rock that stops torpedoes.

### 0.7.0, 11 November 2026: balance

- Recruiting posters on the title screen.
- Three new themes.
- `help <order>`, and several orders on one line.
- Tubes reload about five times slower, and turning draws power.
- The engine telegraph has the navy's steps.

### 0.6.0, 8 November 2026: the main menu and training

- A main menu, and the lessons in tracks.
- Challenge ratings, from Routine to Severe.
- *The Jammer Screen*, a new challenge.
- Steel hulls are magnetic.
- Fire control warns of a moon in the way.

### 0.5.0 and 0.5.1, 7 and 8 November 2026: carriers and fighters

- Carriers and fighters, flown by the computer or commanded by you.
- One magnetic model, in real units.
- Civilian, systems and ghost lessons: the ghost's six teach the boat's weapons.
- Crew reports, and gauges that answer at the console, and break.
- Ranks, awards and the rules of war.
- A `GOOD` solution closes a straight salvo's fan, and jamming beats a seeker.

### 0.4.0, 7 November 2026: cover

- Rock fields, belts, debris and wreck fields to hide in.
- Navigational shields.
- Night orders and standing orders.
- Signing in, and a captain's career: military, civilian or pirate.
- Choose your boat, and choose your war.
- Hits by direction, and faults that grow.

### 0.3.0 to 0.3.4, 6 November 2026: power

- The power board, its settings, and two buses.
- An economical speed, and a cap on the reactor.
- Gauges in engineering.

### 0.2.0 and 0.2.1, 4 and 5 November 2026

- Every enemy captain a rolled character, with a sheet to read after the fight.
- Difficulty: Standard, Hard and Nightmare.
- Bad air can kill.
- Verdict bands, from Defeat to Decisive.
- Replays, saved and watched later.
- A grease pencil for the plots, and bearing marks on the rose.

### 0.1.0, 2 November 2026: the first play-test release

- The console, the conn line, and orders carried out by the crew.
- Newtonian flight in three dimensions, gravity wells and nebulas.
- Passive detection on four channels, and range from bearings.
- Torpedoes with the early submarines' flaws, gauss guns, beams, mines, countermeasures and jamming.
- Enemy captains who know only what their sensors tell them.
- Five tutorials, 27 engagements, and a war campaign in three eras.
- Saves, iron mode and records.
- It plays over plain SSH with `--metered`.
