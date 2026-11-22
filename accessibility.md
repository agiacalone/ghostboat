---
title: Accessibility
---

# Accessibility

*What the trainer does today for captains with a disability, what does not work, and how to tell us.*

Ghost Boat is all text, and text can be read aloud. The aim is a game every captain can play, blind captains included. It is not there yet. This page says plainly what a release build does today. It claims conformance to no standard. The [captain's manual](manual.md) carries the same statement, and in the game `F1` opens it.

## Keyboard only

- **The keyboard does everything.** Every action has a key, or an order typed at the conn line in plain naval words: `helm 045`, `ping`, `shield up`. `help` lists the orders.
- **No function key is needed,** and no mouse. The mouse and touch are extras, and `--no-mouse` turns them off. Tests check that every action works on a plain keyboard.
- **No key is ever held down,** and nothing asks for quick repeated presses. A heading can be typed rather than dialled.
- **Several orders go on one line,** split at `;`.
- **Standing orders** let the crew act before you can, for example rigging for silent running when pinged.

## Time and pace

- **Time drops to x1 whenever something happens.** Outside iron mode, `Space` pauses at any time, and you can still type orders while paused.
- **Reading stops the clock.** The manual, the quick reference and the full log pause the exercise, outside iron mode.
- **Night orders say what wakes you.** Each kind of event can be recorded, logged, dropped to x1 or made to pause the game.
- **Iron mode is your choice,** and it is off by default.
- **Lessons first.** 31 lessons in four tracks teach one idea each, with goals and a hint for each goal. Three levels of difficulty, Standard, Hard and Nightmare.

## Blind and low-vision captains

- **Words carry the boat.** The crew report in the log in plain language, and each line names the station that speaks: `HELM`, `SENSORS`, `COB`. `reports quiet`, `reports normal` and `reports all` set how much you hear.
- **Every gauge has a typed answer:** `battery`, `hull`, `air`, `fuel`, `pos` and the rest. `contacts` has the watch read out every contact held, with its bearing, its solution and the crew's call. Every bearing is a number in degrees.
- **The bare conn.** `o` on a launch page plays an exercise from the header, the goals and the log alone, with no gauges, rose, plot or waterfall. You run the boat by orders, by `status` replies and by what the watch reports. It works on the lessons, the challenges and the campaign.
- **The goals stay on screen,** with a hint for the current one, and `brief` shows the briefing again.
- **Text size is your terminal's.** Make the font as large as you like, while the window still holds 80 columns by 24 rows.
- **Plain language throughout,** with a glossary in the manual for the naval terms.

**Screen readers do not work well today.** The trainer redraws its whole window many times a second. Screen readers expect lines of text that arrive one after another, so they handle the trainer badly. Nobody has yet played it with a screen reader. The manual is a plain Markdown file with headings, and on this website it is an ordinary web page.

## Colour and contrast

- **Colour is never meant to be the only sign.** A contact's side is a shape as well as a colour: `○` friendly, `◇` hostile, `□` neutral, `✣` unknown. States are written as words: `PAUSED`, `BARE CONN`. A dead gauge says `NO DATA`.
- **Contrast.** In all 35 themes, text stands out from its ground by at least 4.5 to 1, and faint text by at least 3 to 1. Tests check the contrast of the alarms, labels and faint text in every theme.
- **Colour blindness.** In every theme the three alarms, caution, warning and threat, stay apart for captains with red-green colour blindness, and a test holds them there.
- **Choice.** `T` opens the theme menu: dark themes, five light ones, and the screens of old terminals and home computers. You can write your own theme.
- **256 colours** are enough, if your terminal has no 24-bit colour.

## Sound and motion

- **Sound is never the only sign.** The only sound is the terminal bell: once for a ping, a torpedo heard or a hit, three times for condition red. Each has a twin on screen, and `m` turns sound off.
- **Motion can be turned off.** `e` stops the flicker and glow of the effects, and `s` the scanlines. Effects start off when you play over SSH or mosh. With effects off, nothing flashes. What still moves is data: the waterfalls, the clock and the plot.

## What does not work today

- **Screen readers,** as above.
- **Real time.** A fight runs in real time, and in full iron mode there is no pause. A fast moment can ask more than a screen reader can say in time.
- **Keys cannot be changed.**
- **A few things need the mouse.** Free-hand pencil lines are drawn by dragging. The career's screens take no mouse at all, though every key works there.
- **Some meanings are colour alone.** On the plot, a solution's grade is shown by colour; the contacts window gives it as a word. Every notice is red, even when nothing was refused.
- **Flashing.** With effects on, alarms flash up to twice a second and a jammer's strobe flickers faster. Effects are on by default when you play locally; `e` turns them off.
- **Blue-yellow colour blindness.** In some themes two of the alarms are close for captains with tritanopia. No test checks it.
- **One sound.** The bell is the same for a ping, a torpedo and a hit.
- **A phone held upright** gives fewer than 80 columns, which is too narrow.

## This website

The site is text, in one monospaced face. Body text stands out from the dark ground by about 7.8 to 1. Every screenshot and poster has a written description, the title art has a text label, and a skip link leads past the header. The site has not been tested with a screen reader.

## Tell us

If something stops you playing, or plays badly with your screen reader, magnifier or other aid, write to Records, [records@ghost-boat.net](mailto:records@ghost-boat.net). Say which aid and which terminal you use, your operating system, the build (on the title screen's top border), and what happened. Nobody is named in the credits without asking.
