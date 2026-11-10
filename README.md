# Tiny Tapeout & Open-Source ASIC Design Guides

**DUTh-FET educational repository** with two practical SKY130 ASIC design learning paths: a **custom analog CMOS inverter** and a **digital two-bit unsigned adder**. The aim is to explain what each tool does, which commands students run, and how to verify the final physical layout.

> **Course-material status:** The three teaching documents below are uploaded. Original standalone design source files (schematics, RTL, Magic hierarchy, GDS/LEF, and flow logs) have not all been added to this repository. This is **not** an official Tiny Tapeout submission.

## Start here: teaching materials

| Learning path | Main materials | Topics |
| --- | --- | --- |
| **[Analog CMOS inverter](analog/inverter/README.md)** | **[Illustrated analog lab guide (PDF)](analog/inverter/SKY130_Analog_Inverter_Magic_KLayout_Student_Lab_Guide.pdf)** | Xschem, ngspice, manual Magic layout, DRC, Netgen LVS, parasitic extraction, Tiny Tapeout 1×2 integration, GDS/LEF, KLayout |
| **[Digital two-bit adder](digital/adder2/README.md)** | **[Fabrication flow slides (PDF)](digital/adder2/fabrication-flow-slides%201.pdf)** · **[Detailed fabrication report (HTML)](digital/adder2/fabrication-report.html)** | SystemVerilog, Verilator, Yosys, LibreLane/OpenROAD, OpenSTA, Magic/Netgen/KLayout, 1×1 Tiny Tapeout |
| **Environment setup** | **[IIC-OSIC-TOOLS and SKY130 setup](docs/setup.md)** | Docker setup, selecting the PDK, running Magic and KLayout |
| **Further reading** | **[References and attribution](docs/references.md)** | IIC-OSIC-TOOLS, Docker tutorial, Panteloukos testcircuit, Tiny Tapeout and reference projects |

For the long HTML report, GitHub may show its source rather than render it as a webpage. Download the file and open it locally in a browser if necessary.

## Suggested student roadmap

1. **Set up the tools** using [the setup guide](docs/setup.md). Check that the PDK is **SKY130A** rather than the alternative IHP SG13G2 environment.
2. **Choose one path:** the [analog inverter](analog/inverter/README.md) for transistor-level custom layout, or the [digital adder](digital/adder2/README.md) for automated RTL-to-GDS design.
3. **Follow the accompanying guide or report**, saving your own source design and tool outputs.
4. **Verify, don't just view:** simulation, DRC, LVS and extraction are evidence of correctness; opening a GDS in KLayout alone is a visual inspection.
5. **Compare the physical implementations:** custom analog layouts may occupy very little area, whereas automatically placed standard cells, taps and filler cells make a digital GDS appear dense.

## Recorded results and their limits

### Analog inverter

- PMOS: W = 2 µm, L = 0.15 µm; NMOS: W = 1 µm, L = 0.15 µm; VDD = 1.8 V.
- Standalone inverter DRC and LVS passed; parasitic extraction and post-layout ngspice simulation were performed.
- Centered Tiny Tapeout analog 1×2 wrapper (161 × 225.76 µm) was DRC-clean. The extracted inverter instance was:
  `Xinv_layout_clean_0 ua[0] ua[1] VDPWR VGND inv_layout_clean`
- The exported GDS was re-imported in Magic, with clean DRC and equivalent extracted connectivity.
- Placing the inverter closer to the bottom analog pins was proposed as a **future optimization exercise**; that alternative placement is **not yet verified**.

### Digital adder

- The uploaded documents describe a combinational unsigned two-bit adder, with test results reported as **16/16** for RTL and wrapper simulations.
- The detailed report describes a standard-cell RTL-to-GDS flow and reports **15/15 local prechecks**. This repository has **not rerun** those tests.

Neither the uploaded documents nor these summaries establish current official tapeout acceptance.

## Repository contents

```text
README.md
analog/
  inverter/
    README.md
    SKY130_Analog_Inverter_Magic_KLayout_Student_Lab_Guide.pdf
digital/
  adder2/
    README.md
    fabrication-flow-slides 1.pdf
    fabrication-report.html
docs/
  setup.md
  references.md
  UPLOAD_STATUS.md
scripts/
  collect_local_designs.sh
```

## Adding the reproducible project sources

The verified analog layout and schematic artifacts are still in the lab workspace under `/foss/designs/inverter` and `/foss/designs/tt_inverter`. Original digital source files are also needed. The [collection script](scripts/collect_local_designs.sh) copies available files into a **separate checkout** without committing or pushing anything. Review copied files before publishing them.

See [upload status](docs/UPLOAD_STATUS.md) for the precise distinction between available course documentation and missing runnable design sources.

## Credits and reuse

Links to third-party examples are collected in [references](docs/references.md), rather than copying their source trees. Confirm the rights to distribute course-owned images and reports and add a suitable license before making this private repository public.
