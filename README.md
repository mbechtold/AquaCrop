# AquaCrop


## Installation

Building the Aquacrop executable requires:

* GNU Make (>= v3.82 should work)
* a GNU or Intel Fortran compiler. GNU Fortran >= v6.4.0 and ifort >= v18.0.1
  should work. MinGW can be used to (cross)compile for Windows.
* (optional) a Free Pascal compiler (>= v3.2.0 should work).

The main `make` targets are `bin` (producing an `aquacrop` executable),
`lib` (producing a `libaquacrop.so` library). The default target is
`all`, which combines the `bin` and `lib` targets.

If the `FORTRAN_EXE` option is set to `0` (instead of the default `1`),
the `aquacrop` binary is built from the Pascal code instead, linked to
the (Fortran-compiled) `libaquacrop.so` library. This approach can
currently only be used together with a GNU Fortran compiler.

> Note: The coupling is rather trivial since the Pascal program consists
  of a single call to `StartTheProgram()`, but it still provides a basic
  check of the Pascal interface.

For example:
```bash
cd AquaCrop/src
make
make clean          # cleans all build artifacts (binaries, object files, ...)
make DEBUG=1        # uses debug options for compiling
make FORTRAN_EXE=0  # builds a Pascal-based executable (instead of Fortran-based)
make STATIC=1       # builds a statically-linked binary for distribution
                    # as a standalone executable (only for GNU Fortran and
                    # with DEBUG=0 and FORTRAN_EXE=1)
make FC=ifort       # use the Intel Fortran compiler instead of GNU Fortran
```

## Testing

Running the test suite requires:

* Python3 with the `pytest` and `NumPy` packages
* An `$AQUACROP_TEST_ROOT` environment variable pointing to the location
  where the test suite input and reference output files are stored.
* An `$AQUACROP_COMMAND` environment variable point to the AquaCrop
  executable that you want to use.

> Note: when using executables built with `FORTRAN_EXE=0`, you will need to add
  the directory with the `libaquacrop.so` library to your `$LD_LIBRARY_PATH`,
  because the AquaCrop executable is dynamically linked to it.

For example:
```bash
export AQUACROP_TEST_ROOT=/path/to/your/aquacrop/test/root/dir
export AQUACROP_COMMAND=$PWD/AquaCrop/src/aquacrop
export LD_LIBRARY_PATH=$PWD/AquaCrop/src:$LD_LIBRARY_PATH

cd AquaCrop/tests

# Run the whole test suite (will take about one hour):
pytest

# Run only 'Perennial' test case, with output shown:
pytest -s test_perennial.py

# Show all the so-called "parametrizations" of the "Europe" test case:
pytest test_europe.py --collect-only

# Run just two subcases of the "Europe" test case:
pytest test_europe.py -k 'False-1-16 or True-19-0'
```

> Note: by default, the tests will make use of temporary working directories
  inside $TMPDIR. The location of these directories can be changed by setting
  the `AQUACROP_TMPDIR` variable accordingly.
