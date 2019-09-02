## Table of Contents
* [Scope](#scope)
* [Design](#design)
  * [SRP](#srp)
  * [Roman numerals](#roman-numerals)
* [Installation](#installation)
* [Usage](#usage)
  * [Input](#input)
  * [Output](#output)

## Scope
This gem is the Ruby implementation of the `Merchant's Guide to the Galaxy` code-kata.

## Design

### SRP
The code design follows the single responsibility principle by using a dedicated class/module for any specific task.  

### Roman numerals
The design behind the `Roman numerals` logic was inspired by Sandi Metz's [solution](https://www.sandimetz.com/blog/2016/6/9/make-everything-the-same): in the beginning roman numerals can be expressed both with `subtractive` (eg `IV`) and `additive` (eg `IIII`) form. 
Switching to the additive form makes easier to convert to Arabic numerals.  

## Installation
Install the gem from your shell:
```shell
gem install galaxy_converter
```

## Usage

### Input
The gem provides a CLI interface accepting as input a file containing several conversion notes:
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

### Output
Just pass the file path to the program:
```shell
galaxy_converter ~/notes.txt
> pish tegj glob glob is 42
> glob prok Silver is 68 Credits
> glob prok Gold is 57800 Credits
> glob prok Iron is 782 Credits
> I have no idea what you are talking about
```
