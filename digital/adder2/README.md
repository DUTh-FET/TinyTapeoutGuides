# Digital design: two-bit unsigned adder

This experiment studies a combinational unsigned adder, with two 2-bit operands and a three-bit result (sum plus carry).

The provided teaching report follows **SystemVerilog → Verilator → Yosys → OpenROAD/LibreLane → OpenSTA → Magic/Netgen/KLayout** through a 1×1 Tiny Tapeout digital tile.

The report documents 16/16 exhaustive functional test cases and 15/15 local Tiny Tapeout prechecks. These are findings reported by that earlier run; they have **not** been rerun from this course repository.

## Documents

- `docs/digital/two_bit_adder_fabrication_flow.pdf` - 39-slide presentation (pending binary upload).
- `docs/digital/fabrication_report.html` - detailed report (pending upload).

## What is missing until collected

The original SystemVerilog source, flow config, GDS, LEF and run logs were not provided as stand-alone files. Copy them from the original workstation via `scripts/collect_local_designs.sh` and review them before publication.

The digital GDS looks dense even for a small adder because automated digital place-and-route inserts standard cells, well taps, power rails and filler/decap infrastructure. Analog custom layouts do not usually have the same regular filled-row appearance.
