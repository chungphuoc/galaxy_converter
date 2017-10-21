# Table of Contents
* [Scope](#scope)
* [Design](#design)
* [Installation](#installation)
* [Usage](#usage)

# Scope
This gem is the Ruby implementation of the `Merchant's Guide to the Galaxy` code-kata.

# Design

## SRP
The code design follows the single responsibility principle by using a dedicated class/module for any specific task.  
In particular some value objects are used for the `Metal` and the `Unit` entities, allowing to deal with invalid names gracefully.  

## Roman numerals
The design behind the `Roman numerals` logic was inspired by Sandi Metz's [solution](https://www.sandimetz.com/blog/2016/6/9/make-everything-the-same): in the beginning roman numerals can be expressed both with `subtractive` (eg `IV`) and `additive` (eg `IIII`) form. 
Switching to the additive form makes easier to convert to Arabic numerals.  

# Installation
Once you've got the gem, just move to the download folder and install it locally by:
```shell
gem install --local ./galaxy_converter-2.1.0.gem
```

# Usage

## Library
Just include the library into your program and pass an array of notes to the `Responder` object:
```ruby
require "galaxy_converter"

notes = ["glob is I", "prok is V", "pish is X", "tegj is L", "glob glob Silver is 34 Credits", "glob prok Gold is 57800 Credits", "pish pish Iron is 3910 Credits", "how much is pish tegj glob glob ?", "how many Credits is glob prok Silver ?", "how many Credits is glob prok Gold ?", "how many Credits is glob prok Iron ?", "how much wood could a woodchuck chuck if a woodchuck could chuck wood ? "]

puts GalaxyConverter.call(notes)
# pish tegj glob glob is 42
# glob prok Silver is 68 Credits
# glob prok Gold is 57800 Credits
# glob prok Iron is 782 Credits
# I have no idea what you are talking about
```

## CLI
The gem provides a CLI interface. 
Once installed you will be able to use the `galaxy_converter` command from the terminal.  

### Help
You can print CLI help by:
```shell
galaxy_converter -h
Usage: galaxy_converter ~/notes.txt
    -h --help               Print this help
    <path-to-file>          Load conversion notes
```

### Possible inputs
The program accepts as an input a file containing conversion notes:
```txt
# ~/notes.txt
glob is I
prok is V
pish is X
tegj is L
glob glob Silver is 34 Credits
glob prok Gold is 57800 Credits
pish pish Iron is 3910 Credits
how much is pish tegj glob glob ?
how many Credits is glob prok Silver ?
how many Credits is glob prok Gold ?
how many Credits is glob prok Iron ?
how much wood could a woodchuck chuck if a woodchuck could chuck wood ?
```

Just pass the file path to the program:
```shell
galaxy_converter ~/notes.txt
> pish tegj glob glob is 42
> glob prok Silver is 68 Credits
> glob prok Gold is 57800 Credits
> glob prok Iron is 782 Credits
> I have no idea what you are talking about
```

## Tests
All the classes/modules of this gem are covered by (fast) unit testing.  
Decoupling from collaborators has been relaxed, since stubbing plain value objects and mocking simple arithmetics is pointless.  

To run the tests you first need to unpack the gem:
```shell
gem unpack ./galaxy_converter-2.1.0.gem
bundle exec rake
```
