<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Solution Notes](#solution-notes)
  - [Solution Overview](#solution-overview)
  - [Class Breakdown](#class-breakdown)
    - [**Nouns to consider**:](#nouns-to-consider)
    - [**ToyRobot (Module)**:](#toyrobot-module)
    - [**Game**:](#game)
    - [**Robot**:](#robot)
    - [**Table**:](#table)
    - [**Command**:](#command)
    - [**Display**:](#display)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Solution Notes
==============

Solution Overview
-----------------

*TODO: Overview of how I tackle this*

Class Breakdown
---------------
### **Nouns to consider**: 
>*ROBOT*, *POSITION*, *TABLE*, *COMMANDS*, *PLACE*, *MOVE*, *TURN*, *FACING*, *LEFT*, *RIGHT*, *REPORT*, *PREVENT*

### **ToyRobot (Module)**: 
>This will likely just run the main program loop. 

### **Game**:
>Main game logic class. Stores the `Robot` and the `Table` instances. Central point for message routing.

### **Robot**: 
>The robot is our main feature. It tracks it's own position, yet does not know anything about the world it is in. It knows how to move itself around, and that's it. It relies on other classes with more access to the `table` to decide on valid moves.
>
>`class Robot`: Creates an instance of a `Robot`.
> - **@position** (*hash*) 
>   - x_pos (*integer*)
>   - y_pos (*integer*)
>   - facing (*symbol ie :north, :south*)
> - **@name** (*string - default 'Ruby'*) 
>
>Public methods: `move`, `turn`

### **Table**: 
>Basically a storage class, that has a method which can determine if cooordinates are in bounds or not. This can be used for placing and checking valid moves.
>
>`class Table`: Creates an instance of a `Table`.
> - **@size** (*hash*) 
>   - x (*integer - default 5*)
>   - y (*integer - default 5*)
>
>Public methods: `in_bounds?`

### **Command**:
>Parses commands from the user input, and returns them back as symbols (to be passed as messages to the `Robot` and `Table`)
>
>`class Command` (`class << self`): Class methods only (No instances)
>
>Public methods:
> - `parse`:
>   - *PLACE (x,y,facing)* - Parses PLACE command and return (:parse, args)
>   - *LEFT/RIGHT* - Parse left/right and return (:turn, args)
>   - *MOVE* - Parse move return :move
>   - *REPORT* - Parse report return :report

### **Display**:
>Handles output to the user. Prettifies it. 
>
>`class Display` (`class << self`): Class methods only (No instances)
>
>Public methods:
> - `output` (*message*, *style(optional)*)
> - `report` (*position*)
> - `intro`
> - `dev_info` (reports position info etc after each move)

