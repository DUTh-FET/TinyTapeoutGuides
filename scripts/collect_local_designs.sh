#!/usr/bin/env bash
# Copy originals from the student lab workstation. NO git commits, NO pushes.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DESIGNS_ROOT="${DESIGNS_ROOT:-/foss/designs}"
A="${DESIGNS_ROOT}/tt_inverter"
S="${DESIGNS_ROOT}/inverter"
D="${DIGITAL_PROJECT_DIR:-}"
copy_one() {
  local src="$1" dst="$2"
  if [[ -f "$src" ]]; then
    mkdir -p "$(dirname "$dst")"
    cp -p "$src" "$dst"
    printf 'COPIED %s\n' "$src"
  else
    printf 'MISSING %s\n' "$src"
  fi
}
out="$ROOT/analog/inverter/tinytapeout"
for f in info.yaml src/project.v docs/info.md; do copy_one "$A/$f" "$out/$f"; done
for f in gds/tt_um_panteloukos_inverter.gds lef/tt_um_panteloukos_inverter.lef; do copy_one "$A/$f" "$out/$f"; done
for f in tt_um_panteloukos_inverter.mag inv_layout_clean.mag sky130_fd_pr__pfet_01v8_YR6QPW.mag sky130_fd_pr__nfet_01v8_Y5M242.mag tt_analog_1x2.def; do copy_one "$A/mag/$f" "$out/mag/$f"; done
if [[ -d "$S" ]]; then
  while IFS= read -r -d '' f; do
    rel="${f#"$S"/}"
    copy_one "$f" "$ROOT/analog/inverter/standalone_sources/$rel"
  done < <(find "$S" -type f \( -name '*.sch' -o -name '*.sym' -o -name '*.spice' -o -name '*.cir' -o -name '*.sp' \) -print0)
fi
if [[ -n "$D" && -d "$D" ]]; then
  while IFS= read -r -d '' f; do
    rel="${f#"$D"/}"
    case "$rel" in *credentials*|*secret*|*token*|*.env) continue ;; esac
    copy_one "$f" "$ROOT/digital/adder2/local_project/$rel"
  done < <(find "$D" -maxdepth 9 -type f \( -name '*.sv' -o -name '*.v' -o -name '*.sdc' -o -name '*.gds' -o -name '*.lef' -o -name 'config.json' -o -name 'info.yaml' \) -print0)
else
  echo 'Digital source not copied. Set DIGITAL_PROJECT_DIR to its real path.'
fi
echo 'Finished collecting local files. Review them before any git add/push.'
