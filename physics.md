---
title: The physics
---

# The physics

*What the trainer simulates, and why the war in the black is fought the way it is.*

Ghost Boat takes its physics seriously. One thing in it is made up: the warp, which carries ships between the wells. The rest is physics as we know it, with engineering a step ahead of ours: compact fusion drives and better superconductors. Nothing is simplified for the recruit, and the enemy lives under the same laws you do.

This page is the plain version. The [captain's manual](manual.md) has every figure, and its spec sheets print each ship's own.

## No sound in space

Space carries no sound. There is no water out here either, so a ship coasting at any speed makes no noise by going. What gives a ship away is what it cannot help giving off. Three channels carry it:

| Channel | What gives it off | What hides it |
|---|---|---|
| **Heat** (thermal infrared) | the hull at its temperature, the radiators, the drive's plume | a cold hull, radiators in, the drive off |
| **EF** (the electric field: radio and microwave) | the drive's plasma, the reactor and power electronics, every transmission and ping | the drive off, the reactor cold, the radio silent |
| **Magnetism** | the reactor's superconducting coils, the steel hull | a cold reactor, and distance |

Crews still say *hear*, *loud* and *quiet*, out of submarine habit. They mean EF. The passive array listens for it, and the waterfall draws what it hears.

**Why nobody looks.** A ghost has no portholes, and there is no lookout and no camera. Hulls are painted a non-reflective black, so a hull reflects almost no starlight, and its own heat outshines what little it does. Every rock and grain of dust catches the same light, so a glint could be anything at any range. And light is the easiest thing to fake. So the navies built their sensors for heat, EF and magnetism, and the telescopes aboard look in the infrared.

**What runs in real units.** Gravity and magnetism are real in every fight: the inverse square, and fields in tesla. Light-speed delay is real everywhere. Heat and EF are measured in decibels on a stand-in scale in most fights. The trainer also carries both in real units, kelvin and watts, and a few engagements run on them.

## Signal and noise

Every sensor works the same way. A ship is heard when her signal clears the noise:

```text
signal excess = what the target gives off
              - loss over distance
              - your own background
              - your sensor's threshold
```

- **Loss over distance.** A signal spreads over a sphere, so it falls with the square of the range: about 6 dB every time the range doubles.
- **Your own background.** The array's own floor, plus what your own boat leaks into it. Your drive is the loudest thing your array hears. Light it and you go deaf, as well as loud.
- **The threshold.** How good the sensor is. A bigger array hears better. Twice the width gathers about 6 dB more, and its bearings are twice as sharp, because a beam narrows as the array widens.

Near zero excess a contact fades in and out. Well above zero she is held steadily, with a sharper bearing.

**The baffles are real.** Every array is deaf in a cone astern, where its own drive is. A ship behind you can be close and unheard. To check, turn: that is clearing your baffles.

**The drive is loud; speed is not.** A destroyer hears a drifting ghost at about 230 km. She hears the same ghost at full burn at about 23,000 km. A hundred times the range is 40 dB. Even a burn at 1% is about 24 dB over a silent boat. Most of the job lives between drifting and burning.

**A ping is a confession.** A ping's echo goes out and back, so it pays the loss over distance twice: double the range and the echo comes back 12 dB fainter. Everyone else hears the ping one way. So a ping is heard far beyond the range at which it finds anything. A destroyer's ping finds a hauler at about 2,400 km, and the hauler hears the ping from more than 45,000 km. Hull shape matters too. A fat cargo hull returns a big echo, and a ghost's long, thin hull hardly any: a destroyer's ping finds a silent ghost at only about 150 km.

**Magnetism is the point-blank channel.** A magnet's field falls with the cube of the range: twice as far, an eighth of the field. In mid war a destroyer feels an attack boat at about 14 km with her reactor running. With it shut down, the coils' field all but goes, and the destroyer must come within about 6 to 7 km to feel the steel hull alone. Silence does not hide you from it.

**Weather.** Dust swallows signal, about 20 dB for every 1,000 km of the path inside it, and pings pay twice. An ion cloud fills every sensor inside it with static. A storm's discharges crack across every array near them. The rules are the same for every ship: a hunter in dust can't hear you either.

## Ranging by bearings

A passive sensor gives a bearing and a signal strength. It never says how far. Range comes from geometry, by target motion analysis, worked from bearings as a fire-control party did it.

Each bearing says *she was somewhere on this line, at this moment*. In space a coasting ship really does hold a steady velocity, so only one track fits all the lines. But not from a straight leg of your own. Hold your course and many tracks fit, near and slow or far and fast, however long you listen. Change course, a *leg change*, and the bearings from your two legs cross. The range comes out of the geometry.

The solution firms from `POOR` to `FAIR` to `GOOD`. `GOOD` means the uncertainty is under a tenth of the range, and `FAIR` under three tenths. Before it calls a solution `GOOD`, fire control works the bearings again from a nearer and a farther start. If another track fits them about as well, the range is not known, and the grade drops to match.

**A solution is an estimate.** Every bearing carries a little error, so even a `GOOD` solution can be off, and now and then badly off. After the fight, the debrief's true picture shows how far off you were.

**Doppler.** A ship's machinery leaks narrow radio lines, each class its own set. They arrive shifted by her speed along the line of sight, as on any radio link:

```text
Δf = -f · v / c
```

At 300 MHz, a ship opening at 5 km/s reads about 5 kHz low, and every line of one ship shifts by the same fraction. Read with the bearings, Doppler gives a range from a single straight leg. It also catches a ship that turns without lighting her drive.

You can work the track yourself, too. `track s1 1200 090 0.6` puts her 1,200 km out on her bearing, on course 090 at 0.6 km/s, and the vessel window shows how the bearings sit against your guess.

## Flying a Newtonian ship

- **You keep your velocity until you burn.** Turning the nose does not change where you are going. The console shows heading and course apart for that reason.
- **The main drive pushes along the nose.** To change course, point where you want the change to go, and burn. To stop, turn end for end and burn against your motion. Space has no brakes.
- **Everything takes time.** Turns build up and ease off, and the drive spools up and down.
- **Propellant is limited.** Every burn spends it. The helm keeps the Δv left, the change of speed still in the tanks, and calls when it would barely stop the boat.
- **Space has an up and a down.** A contact can be above your level or below it, and the 3-D plot stands each one on a line to your own level.
- **People have limits.** The helm calls acceleration near the crew's limit.

## Orbits and wells

Moons and planets pull on every ship by the inverse-square law.

- **Coasting near a moon puts you in an orbit.** Holding a straight line there means fighting gravity, and that costs propellant.
- **A body between you and a hunter blocks every sensor.** It is cover, for both of you.
- **A planet behind you hides you too.** Its warm disk drowns the few watts of a hull. A burning drive shines through. A magnetised planet's field drowns the magnetometers near it.
- **Hitting one destroys the ship.** Watch `ALT`.
- **Rock bites by speed.** In a rock field, strikes come more often the faster you go, and each one hurts with the square of your speed. At 0.1 km/s you can creep through. At 3 km/s the field will break you.

### Warp, and why the fights are at the wells

The warp is the one made-up thing. A warp bubble, after Miguel Alcubierre's warp metric of 1994, carries the boat across the patrol chart. Space contracts ahead of the bubble and expands behind it, and the boat inside sits at rest in flat space. Nothing moves through space faster than light.

- **A well's pull distorts the bubble.** It cannot form inside a gravity well, and nearing one drops a ship out of warp. At the well's edge the boat goes on in normal space, on her drive, where she can be heard and fought. Traffic comes out of warp at the edges, so that is where most fights are found.
- **The bubble moves; the boat does not.** She drops out of warp at rest. A bubble forms only round a boat at rest, so to leave a fight she must brake to a stop first, and the braking burn is heard.
- **Spinning up takes a quarter of an hour.** The warp crystal radiates as hard as the drive at full power and throws out a strong magnetic field, which warships feel hundreds of kilometres off. Its noise deafens your own array until you go. Drifting in a body's pull does not spoil it, because the boat and the bubble fall together. A ghost cannot warp out of a bad situation.
- **Speed costs fuel.** Fuel for an hour of warp grows with the square of the speed.

## Light is slow

Everything here travels at the speed of light: heat, radio, radar. At these distances, that takes time.

- **You always fight the past.** Every sensor shows a target where she was when her light left her: 3.3 seconds late at a million kilometres, 8.3 minutes at 1 AU.
- **An echo makes the round trip.** A ping's echo comes back after twice the light time.
- **Radio is late.** In a career, every message arrives late by the time light takes to cross the gap, about 5.6 minutes over 100 million km. A boat hears a relay only within its reach. Between systems the news travels by ship, so a port is where a boat learns it, as old as the voyage that carried it.

## Heat

**All the reactor's power ends up as heat.** It goes into a heat sink. Drifting, the hull sheds enough. Burning or charging hard fills the sink. Radiators shed heat fast, but they glow, and radiators out show in infrared from thousands of kilometres. If the sink fills, the reactor scrams itself to save the ship.

**In real units, colder pays twice.** A hull radiates with the fourth power of its temperature (the Stefan-Boltzmann law), so a hull at 50 K is about 1,300 times dimmer than one at 300 K. The radiators are panels along the sides: from ahead, astern, above or below they are edge-on and hidden, so point your bow at the hunter. A telescope's bearings are set by diffraction, and in the infrared they are extraordinarily sharp, thousandths of a degree.

## Every quiet has its price

Going quiet on one channel costs on another, or costs time.

| To go quiet | You pay with |
|---|---|
| Silent running: the reactor off, on the battery | the battery's charge, and a restart a listener may hear |
| Ultra-quiet: the scrubbers secured too | the air, a crew that tires three times as fast, and no reloads |
| Gravitic thrusters: course changes with no plume | a magnetic field while they push, and very little thrust |
| Radiators in | the heat sink fills |
| Shield down in a rock field | the strikes |
| Jamming a torpedo's seeker | every ship in the sky learns exactly where you are |

Staying dark is a clock, as a submarine's battery and air were. The heat sink fills, the battery drains, and the air goes bad. The trainer keeps all three.
