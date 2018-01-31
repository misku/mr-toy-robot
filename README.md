# Mrrobot - toy robot simulator

* The application was written as an exercise and is a simulation of a
toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
* There are no other obstructions on the table surface.
* The robot is free to roam around the surface of the table,
but must be prevented from falling to destruction.
Any movement that would result in the robot falling
from the table must be prevented, however further
valid movement commands must still be allowed.

## Installation

Build the gem:
```bash
$ gem build mrrobot.gemspec
```

Install the gem:
```bash
$ gem install --local mrrobot-0.1.0.gem
```

## Usage

```bash
mrrobot -f <path_to_example_file>
```

## Examples
Example files are located inside `examples` directory.

## Specs and style

```bash
rake spec
```

```bash
rubocop
```

## Documentation
As a project I am pretty unhappy because I'm lacking documentation :( I'm going
to have a serious discussion with the developer regarding this matter!

## Application requirements

Create an application that can read in commands of the following form:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

* `PLACE` will put the toy robot on the table in position X,Y
and facing `NORTH`, `SOUTH`, `EAST` or `WEST`.
* The origin (0,0) can be considered to be the `SOUTH WEST` most corner.
* The first valid command to the robot is a `PLACE` command,
after that, any sequence of commands may be issued, in any order,
including another `PLACE` command.
The application should discard all commands in the sequence
until a valid `PLACE `command has been executed.
* `MOVE` will move the toy robot one unit forward
in the direction it is currently facing.
* `LEFT` and `RIGHT` will rotate the robot 90 degrees
in the specified direction
without changing the position of the robot.
* `REPORT` will announce the X,Y and F of the robot.
This can be in any form, but standard output is sufficient.

* A robot that is not on the table can choose
to ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.
* Input is taken from a file.
* Provide test data to exercise the application.
* It is not required to provide any graphical output
showing the movement of the toy robot.

## Constraints

The toy robot must not fall off the table during movement.
This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

Example Input and Output:

```
# Example a
PLACE 0,0,NORTH
MOVE
REPORT
# Output: 0,1,NORTH
```


```
# Example b
PLACE 0,0,NORTH
LEFT
REPORT
# Output: 0,0,WEST
```


```
# Example c
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
# Output: 3,3,NORTH
```

## Acknowledgement

The Toy Robot Challenge was originally formulated by
[Jon Eaves](https://twitter.com/joneaves)

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
