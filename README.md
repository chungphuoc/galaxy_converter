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
I just arranged the logic to work nicely with intergalactic use cases.

## Invalid inputs
Invalid inputs are gracefully managed by assigning `zero` value to unknown unit/metal.  
This will have no impacts on final output and allows avoiding heavyweight exceptions handling.  
It is also more compliant to the `ruby-way` of coding.

# Installation
Once you've got the gem, just move to the download folder and install it locally by:
```shell
gem install --local ./galaxy_converter-1.2.3.gem
```

# Usage

## CLI
The gem provides a CLI interface. 
Once installed you will be able to use the `galaxy_converter` command from the terminal.  

### Help
You can print CLI help by:
```shell
galaxy_converter -h
Usage: galaxy_converter <input>
    -h --help               Print this help
    "how much is pish?"     Answer the question
    ~/questions.txt         Load questions file
```

### Possible inputs
Just pass your question as the unique argument (others will be discarded), wrapping it within double quotes:
```shell
galaxy_converter "how many Credits is glob prok Iron ?"
> glob prok Iron is 782 Credits
```

The same API works for plain units too:
```shell
galaxy_converter "how much is pish tegj glob glob ?"
> pish tegj glob glob is 42
```

And manage unknown answer as well:
```shell
galaxy_converter "how much wood could a woodchuck chuck if a woodchuck could chuck wood ?"
> I have no idea what you are talking about
```

There is no answer if no question is posted:
```shell
galaxy_converter "glob is I"
>
```

In case you have sketched your questions on a file like this:
```txt
# ~/questions.txt
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

You can use it by simply specifying its path:
```shell
galaxy_converter ~/questions.txt
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
gem unpack ./galaxy_converter-1.2.3.gem
bundle exec rake
```
