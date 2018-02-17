## VHDL exercise solutions

This respository contains my solutions for the exercises in
[The Designer's Guide to VHDL](https://www.elsevier.com/books/the-designers-guide-to-vhdl/ashenden/978-0-12-088785-9)
by Peter Ashenden.

You will only find the solutions to exercises of the difficulty of 2, 3,
and 4(solutions to exercises of difficulty 1 are found in the book's appendix).

I'll be adding new solutions as I work through them.

Mind that I don't claim these to be the best or most efficient solutions.
Comments and suggestions are always welcome.

## Compiling the solutions

I used [GHDL](https://github.com/ghdl/ghdl) and [GTKWave](http://gtkwave.sourceforge.net) to test my solutions. Each chapter folder contains a README file describing which file
is associated with which exercise. Generally,
the workflow for building and viewing the waveform output will look like this:
```
ghdl -a solution.vhdl solution_tb.vhdl
ghdl -e solution_test_bench
ghdl -r solution_test_bench --vcd=solution_waveforms.vcd
gtkwave solution_waveforms.vcd
```
This can easily be done in a makefile, if you wish.
