# Getting started with julia - November 2018

## Setup julia

Install the julia binary

```shell
brew cask install julia
```

Open julia in a terminal and press ] to enter `pkg` mode.
In `pkg` mode, type:

```shell
add Revise
```

Add the following code to the file: $HOME/.julia/config/startup.jl (you will have to create it)

```julia
atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
    end
end
```

## Create a new project

Start julia and enter `pkg` mode, type:

```shell
generate Introduction
```

This creates a new project folder called Introduction with a set of basic
project files.

While still in julia, press ; to enter `shell` mode and cd into the newly
created directory. When there, enter `pkg` mode again and type:

```shell
activate .
```

This will create a new package space for this pkg instance. Meaning that
every package you add from here, will only be added to this project and not to
the global julia installation.

## Configure vscode (optional)

1. Install the julia language support extension to vscode

2. Download and install julia version [https://julialang.org/downloads/oldreleases.html](0.6)

3. Point the extension to the 0.6 binary by setting the "julia.executablePath" option in settings (for mac this would be: `/path/to/Julia-0.6.app/Contents/Resources/julia/bin/julia`)

4. Restart vscode
