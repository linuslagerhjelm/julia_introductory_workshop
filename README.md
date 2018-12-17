# Julia Introductory Workshop

This repository contains source code for a workshop that introduces Julia to a technical audience.
To get the most value out of this repository, it should be acompanied with a lecure on Julia. However
this repository should be able to function as a stand alone piece.

Before you do anything at all, you should make sure that you have installed and configured julia and
your development environment propperly. Instructions for how to do this can be found in [setup_instructions.md](setup_instructions.md).

## Using this repository

This repository contains three parts:

1. A document that introduces basic concepts in Julia
2. Basic exercises
3. A larger exercise where we buld something that looks like a real application

### Basic concepts

Read through the document [Examples.jl](Examples.jl) to get an introduction of how coding in Julia works.

### Basic exercises

To get a feel for and to get confortable coding in Julia, there are a set of exercises in the [Introduction](Introduction) folder.
The exercises come in the form of unit test cases. The task is to put code into the file [Introduction.jl](Introduction/src/Introduction.jl)
to make all the test cases pass.

To run the unit tests, activate the project in the Jula REPL. This can be done by starting a REPL in the Introduction folder, pressing `]`
to enter `pkg` mode. In this mode, write `activate .` to activate the project, followed by `test` to run the tests.

### Real world application

This task is quite similar to the previous task: Start by reading through the [introduction](Tickify/Introduction.md) and make the unit tests pass.
However, the test coverage for this application is not that great so feel free to add more tests if needed. Or add features without adding tests,
for example database access, http requests file IO and what not.

The most important thing to remember when completing this workshop is to have fun! 😃