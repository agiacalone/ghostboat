#!/bin/sh
# refresh-from-game.sh: copy the game's papers and colour tokens into the site.
#
# Usage: scripts/refresh-from-game.sh REF [GAME_REPO]
#
# REF is a branch or tag of the game's repository, such as 0.11.0 or v0.11.0.
# GAME_REPO defaults to ../dev beside this repository. Copies, from REF:
#
#   docs/manual.md    -> manual.md
#   docs/quickref.md  -> quickref.md
#   docs/tokens.json  -> _data/tokens.json   (the stylesheet's house colours)
#
# Jekyll reads _data/tokens.json when it builds the site, so the stylesheet
# takes Deep Signal's colours from it. Review with git diff, then commit.

set -eu

prog=$(basename "$0")
site=$(cd "$(dirname "$0")/.." && pwd)

case "${1:-}" in
-h | --help)
	sed -n '2,14p' "$0" | sed 's/^# \{0,1\}//'
	exit 0
	;;
'')
	echo "usage: $prog REF [GAME_REPO]" >&2
	exit 2
	;;
esac

ref=$1
game=${2:-$site/../dev}

if ! git -C "$game" rev-parse --verify --quiet "$ref^{commit}" >/dev/null; then
	echo "$prog: $ref: no such branch or tag in $game" >&2
	exit 1
fi

for pair in docs/manual.md:manual.md docs/quickref.md:quickref.md docs/tokens.json:_data/tokens.json; do
	from=${pair%%:*}
	to=$site/${pair#*:}
	git -C "$game" show "$ref:$from" >"$to.tmp"
	mv "$to.tmp" "$to"
done
