# Setting up IIC-OSIC-TOOLS and SKY130A

The course uses the open-source [IIC-OSIC-TOOLS](https://github.com/iic-jku/iic-osic-tools) Docker environment. Follow the upstream installation documentation for your host operating system. An additional illustrated walkthrough is [Kwantae Kim's Docker setup guide](https://kwantaekim.github.io/2024/05/25/OSE-Docker/).

In the observed lab container, designs were stored under `/foss/designs` and the SKY130A PDK under `/foss/pdks/sky130A`. Verify your machine's paths before using the commands below.

## Checks: Linux terminal

```bash
ls -ld /foss/designs /foss/pdks/sky130A
command -v xschem
command -v ngspice
command -v magic
command -v netgen
command -v klayout
```

## Magic: Linux terminal

```bash
cd /foss/designs/tt_inverter/mag
magic -rcfile /foss/pdks/sky130A/libs.tech/magic/sky130A.magicrc tt_um_panteloukos_inverter.mag
```

After Magic launches, commands beginning with `box`, `paint`, `drc`, `extract`, and `gds` run in the **Magic Tkcon % prompt**, not a Linux terminal.

```tcl
expand all
drc check
drc catchup
drc find 1
```

## KLayout: Linux terminal

```bash
klayout /foss/designs/tt_inverter/gds/tt_um_panteloukos_inverter.gds
```

Check the top cell and expand the hierarchy to see the PMOS/NMOS device cells.

## Other course references

- [Panteloukos / testcircuit](https://github.com/Panteloukos/IC_Design_Course_DUTh/tree/main/testcircuit) - a separate course experiment.
- [Tiny Tapeout analog specification](https://tinytapeout.com/specs/analog/) - consult the current version before any actual submission.

Never run commands from tutorials without checking that the intended PDK (SKY130A versus IHP SG13G2) is selected. Avoid old Docker-socket permission workarounds such as `chmod 666 /var/run/docker.sock`.
