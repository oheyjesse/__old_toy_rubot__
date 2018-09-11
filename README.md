 🤖 '**Toy Robot**' 🤖 - A classic Ruby Code Challenge solution by *<a href="http://www.github.com/oheydrew">@oheydrew</a>*
===================

Documentation
-------------
- **[PROBLEM.md](./docs/PROBLEM.md)** : The supplied problem outline in full
- **[SOLUTION_OHEYDREW.md](./docs/SOLUTION_OHEYDREW.md)** : Outline of my solution, class breakdown & general mechanics
- **[DEV_DIARY.md](./docs/DEV_DIARY.md)** : Longer form day-by-day dev diary

Overview
--------

This is my attempt at the "Toy Robot" coding challenge. I'm doing this in Ruby as the first project after my Coder Academy bootcamp course, as a way to check my learning and see what I can make happen.

### Things I plan to use / learn

- Ruby Enumerable methods
- OOP Design Principles (taken mostly from Sandi Metz's amazing <a href="http://www.poodr.com/">POODR</a> guide)
- Domain Driven Design, then Test Driven Development
- Smarter testing practices (again, taken from Sandi Metz's <a href="http://jnoconor.github.io/images/unit-testing-chart-sandi-metz.png">The Testing Minimalist</a> talk)

The Brief
---------

In short, the challenge is to write a command-line program that takes a number of user inputs, to direct a small toy robot on top of a table 5x5 units wide. The user must be able to PLACE the robot at the starting position, command the robot to turn LEFT, RIGHT or MOVE forward, and REPORT on it's location. 

If the robot is at the edge of the 5x5 table, it must not exceed it (it must not be allowed to fall off).

The full brief was found online and can be found at [PROBLEM.md](./docs/PROBLEM.md). I will be sticking firmly to this brief in terms of INPUT and REPORTing from the robot- Though I may add a feature to give the robot some personality. :)

Getting Started
---------------

> *TODO: Insert instructions here!*

Installation
------------

> *TODO: Insert instructions here!*

Running Tests
-------------

### Standard RSpec tests

To run the full test suite navigate to the project root (eg: `~/toy_robot/`) and run:

```
~/toy_robot/ $ rspec
```

### Guard-RSpec for auto-running tests

This project has [guard](https://github.com/guard/guard#readme) insatalled with the `guard-rails` plugin. This can automate your tests, watching in the background for any changes. To run tests in this way, run:

```
~/toy_robot/ $ bundle exec guard
```

This will run `guard`, and watch for changes.

Author
------

Drew Noll - <a href="mailto:drew@oheydrew.me">drew@oheydrew.me</a> | <a href="http://www.oheydrew.me">www.oheydrew.me</a>

Acknowledgements
----------------

- <a href="https://github.com/radar">Ryan Bigg</a> at Culture Amp for encouraging me to do this challenge and his mentorship
- David Christ at REA Group for the initial <a href="https://github.com/dctr/rea-robot">PROBLEM.md</a>