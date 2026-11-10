# Repository publication status

**Checked 2026-11-10 — GitHub `main` branch.** This is a **private course-material repository**, not an official Tiny Tapeout submission.

## Uploaded and verified in the repository file tree

| File | Location | Size on GitHub |
| --- | --- | ---: |
| Analog student lab guide | [Analog PDF](../analog/inverter/SKY130_Analog_Inverter_Magic_KLayout_Student_Lab_Guide.pdf) | 461,288 bytes |
| Digital fabrication slides | [Digital slides PDF](../digital/adder2/fabrication-flow-slides%201.pdf) | 5,788,112 bytes |
| Detailed digital report | [Digital report HTML](../digital/adder2/fabrication-report.html) | 4,687,851 bytes |

Also uploaded: main README, analog and digital project READMEs, SKY130 setup instructions, external reference links, a local design-file collection script, and `.gitignore`.

**Verification scope:** GitHub returned valid file entries, paths and nonzero byte counts for all three documents. This confirms the uploads exist; it is not a full content-integrity comparison against the original author files.

## Still missing for full reproducibility

- Editable analog **Xschem schematic and simulation sources** from `/foss/designs/inverter`
- Analog **Magic hierarchy** (`.mag`), verified centered wrapper, GDS, LEF, DEF and extraction/verification outputs from `/foss/designs/tt_inverter`
- Digital **SystemVerilog RTL**, testbenches, generated design outputs, configuration files and tool logs from the original digital workspace

The [collection script](../scripts/collect_local_designs.sh) can gather existing local sources into a separate checkout for review. No script or upload step should recreate these originals from screenshots.

## Verification and scope boundaries

- Centered analog wrapper: locally verified DRC and extracted interface connectivity; GDS re-import checks passed.
- Analog alternative placement: discussed for teaching, **not fully verified**.
- Digital results: reported in the uploaded documents; **not rerun from this repository**.
- Official Tiny Tapeout CI / future shuttle acceptance: **not established by this repository**.
- [Panteloukos testcircuit](https://github.com/Panteloukos/IC_Design_Course_DUTh/tree/main/testcircuit) remains an **external reference link**, not a copied source directory.

Confirm redistribution permissions and licensing before changing the repository's visibility.
