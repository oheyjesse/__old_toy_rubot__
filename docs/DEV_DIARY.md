Dev Diary
---------
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Thurs 2nd Aug](#thurs-2nd-aug)
- [Fri 3rd Aug](#fri-3rd-aug)
  - [Design Sketchpad](#design-sketchpad)
- [Mon, 10th Sept](#mon-10th-sept)
- [Tue 11th Sept](#tue-11th-sept)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Thurs 2nd Aug

I didn't have a lot of time here, but I got the problem copied into an overview, structured my README and set up the Gemfile. Plan to spend the next little bit of time working out my design plan.

## Fri 3rd Aug

Started out by creating this Dev Diary to note down progress notes. Next up will be to brainstorm the problem and go about implementing a high level solution so I might TDD it.

### Design Sketchpad
>Nouns to consider: *ROBOT*, *POSITION*, *TABLE*, *COMMANDS*, *PLACE*, *MOVE*, *TURN*, *FACING*, *LEFT*, *RIGHT*, *REPORT*, *PREVENT*

From this I can see a few options for classes:

>**Robot**: Could be a main class to create an instance of a `Robot`. This robot could keep track of it's *POSITION* on the table, it's *FACING* direction, and perhaps some other features such as it's *NAME*. It could have methods to *TURN* itself, *MOVE* itself, and *DETECT* the edge to *PREVENT* itself from falling off. It can *REPORT* it's position and facing, too. These could be sent as messages from a **COMMANDS** module that takes and parses input
>
>**Table**: Will be a simple class, barely a class at all, with which to store the world size. This could just be hard-coded into the robot... but it doesn't feel like the right place to put it. The robot should have to query the table for it's size.
>
>**Commands**: (class << self ?) This class will parse commands from the user input, and pass them back as symbols (to be passed as messages to the robot)
> - *PARSE*:
>   - *PLACE (X,Y,Facing)* - Parses PLACE command and return (:parse, args)
>   - *LEFT/RIGHT* - Parse left/right and return :turn(left/right)
>   - *MOVE* - Parse move return send :move
>   - *REPORT* - Parse report return send :report
>
>**Output**: (class << self ?) - Possibly just here to handle output to the user, enable prettifying it a bit easier, keep it consistent, etc.
>
>**ToyRobot**: Main class - This will likely just run the main program loop, store the `Robot` itself, and the `Table`. It will have a few methods, most likely, for passing commands to the robot and table.

This is just a rough plan, I'll try to TDD it from here with this all in mind. I'll start with the `Robot` class.

## Mon, 10th Sept

Had to take a bit of a break from this for a month whilst I did my internship and PyConAU. But I'm back, and into it.

Got into it today - TDD'd my way through most of the `Robot` class. `position` and `move` were easy enough. `turn` was more open to interpretation. I initially started just using numbers (+1 and -1) to turn left or right, but I decided eventually to use symbols `:left` and `:right`. Implemented a `compass` variable to hold the `:north, :east, :south, :west` directions. Adding 1 or -1 to the array would return the result.

## Tue 11th Sept

Realised a problem when iterating through `compass` - eventually it'd fall out of range if +1 went over compass.length. Used `rotate()` to fix the issue, though it took a few goes. Tests added for turning through the whole range and back again (doing *sick* 360 burnouts?)

Decided against having the robot `detect` the edge. I'd need to pass it the `table`. Instead, I'm leaning toward adding a `game` class, to hold the `table`, `robot` and run logic like this.

## Wed 12th Sept

Refactoring today. Decided to move away from using individual arguments for setting x, y positions and sizes, first into an array, and then, decided to use `**args` to my advantage and get *really rather ruby* and do everything with hashes and symbols. It works, and it's kinda neat, but it's also a bit rails-y and I'm not sure how I feel about it 😂

I'll keep going with it. Whilst some would say the decision to use `:symbols` and pass arguments as `:hashes` everywhere is unreadable to the non-ruby types... Well, I'd agree. But I'm writing a solution to a problem in *ruby*, so I'll go with some ruby convention. Plus, it doesn't hurt for me to understand the syntax better.

## Thurs 13th Sept

Moved on from individual `robot` and `table` methods into `game` methods. Made the main logic method `check_valid`, which will grab the robot's `next_position` (had to go make that one) and check if it's good.

Learned a *lot* about `**args`, as well as `keyword_arguments` in ruby today, and it's all *really freaking sweet*. I am really enjoying writing in this way, making the code clear and readable. It seems like a pretty nice way to self-document (as long as I make sure I clarify what `**args` are where possible).