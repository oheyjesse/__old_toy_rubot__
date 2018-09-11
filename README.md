💎🤖 '***Toy Rubot***' 🤖💎 - A classic Code Challenge solution in Ruby by *<a href="http://www.github.com/oheydrew">@oheydrew</a>*
===================

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Documentation](#documentation)
- [Overview](#overview)
  - [Coding Principles](#coding-principles)
- [The Brief](#the-brief)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Running Tests](#running-tests)
  - [Standard RSpec tests](#standard-rspec-tests)
  - [Guard-RSpec for auto-running tests](#guard-rspec-for-auto-running-tests)
- [Author](#author)
- [Acknowledgements](#acknowledgements)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Documentation
-------------
- **[PROBLEM.md](./docs/PROBLEM.md)** : The supplied problem outline in full
- **[SOLUTION_OHEYDREW.md](./docs/SOLUTION_OHEYDREW.md)** : Outline of my solution, class breakdown & general mechanics
- **[DEV_DIARY.md](./docs/DEV_DIARY.md)** : Longer form day-by-day dev diary

Overview
--------

This is my attempt at the "Toy Robot" coding challenge. I'm doing this in Ruby as the first project after my Coder Academy bootcamp course, as a way to check my learning and see what I can make happen.

### Coding Principles

- Test Driven Development
- OOP Design Principles (taken mostly from Sandi Metz's amazing <a href="http://www.poodr.com/">POODR</a> guide)
- Smarter testing practices (again, taken from Sandi Metz's <a href="http://jnoconor.github.io/images/unit-testing-chart-sandi-metz.png">The Testing Minimalist</a> talk)
- Ruby Enumerable methods

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
- [Cameo Langford](http://www.github.com/cameocodes) for all the code reviews and back-and-forth
- [Sandi Metz](http://www.poodr.com) - For her amazing book, **Practical Object Oriented Design in Ruby**, which I can't reccomend enough for any programmer interested in gaining an understanding of Object Oriented Design, even if you don't write ruby! 😅