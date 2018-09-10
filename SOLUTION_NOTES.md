Solution Notes
==============

Solution Overview
-----------------

*TODO: Overview of how I tackle this*


Dev Diary
---------

### - Thurs 2nd Aug: 1 hour

I didn't have a lot of time here, but I got the problem copied into an overview, structured my README and set up the Gemfile. Plan to spend the next little bit of time working out my design plan.

### - Fri 3rd Aug: 1/2 hour

Started out by creating this Dev Diary to note down progress notes. Next up will be to brainstorm the problem and go about implementing a high level solution so I might TDD it.

#### Design Sketchpad
>Nouns to consider: *ROBOT*, *POSITION*, *TABLE*, *COMMANDS*, *PLACE*, *MOVE*, *TURN*, *FACING*, *LEFT*, *RIGHT*, *REPORT*, *PREVENT*

From this I can see a few options for classes:

>**Robot**: Could be a main class to create an instance of a `Robot`. This robot could keep track of it's *POSITION* on the table, it's *FACING* direction, and perhaps some other features such as it's *NAME*. It could have methods to *TURN* itself, *MOVE* itself, and *DETECT* the edge to *PREVENT* itself from falling off. These could be sent as messages from a **COMMANDS** module that takes and parses input
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