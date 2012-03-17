{Redcar}
========

[http://redcareditor.com/](http://redcareditor.com/)

## DESCRIPTION

A Ruby text editor.

 * written in Ruby from the ground up
 * runs on JRuby (a fast, compatible Ruby implementation)
 * is cross-platform (Linux, Mac OS X, Windows)
 * highly extensible

Some Redcar features:

 * supports Textmate themes and snippets
 * split screen mode
 * syntax checking for many languages
 * built in REPLs for Ruby, Groovy, Clojure and Mirah.

Some (current) limitations:

 * Only supports UTF-8 file encodings (and therefore ASCII)

![alt text](http://redcareditor.com/images/redcar-4-thumb.png "Title")
![alt text](http://redcareditor.com/images/redcar-1-thumb.png "Title")

## INSTALLATION

[see User Guide: Installation](https://github.com/redcar/redcar/wiki/Installation)

## USAGE

Run 

    $ redcar --help

To see full usage details.

## PROBLEMS?

* Irc at #redcar on irc.freenode.net
* Mailing list at http://groups.google.com/group/redcar-editor

## TESTS

NB. Redcar features are known to work with Cucumber 0.9.2, and known NOT to work with Cucumber < 0.9

To run the tests you need JRuby installed. You also need rspec and cucumber installed as JRuby gems. See jruby.org for this, or install with rvm.

To install the necessary gems:

$ jruby -S bundle install

To run all specs and all features:

    $ jruby -S rake

### Specs

On OSX:

    $ jruby -J-XstartOnFirstThread -S spec plugins/#{plugin_name}/spec/

On Linux/Windows:

    $ jruby -S spec plugins/#{plugin_name}/spec/

To just run all specs:

   $ rake specs  

### Features

On OSX:

    $ jruby -J-XstartOnFirstThread bin/cucumber --exclude ".*fixtures.*" plugins/#{plugin_name}/features

On Linux/Windows:

    $ jruby bin/cucumber --exclude ".*fixtures.*" plugins/#{plugin_name}/features/

To just run all features:

    $ rake cucumber

## LICENSE

Redcar is copyright 2007-2011 Daniel Lucraft and contributors.
It is licensed under the GPLv2. See the included LICENSE file for details.


{ gemqs }

## Description
  Command line interface to rubygems.org's search
 
## Ruby Compatability
  tested with ruby 1.8.7, 1.9.2, 1.9.3

## Installation

 gem install gemqs

## Usage

 gemqs [term1] [term2] [..etc]

## Example 
---  
  dave@ubuntu:~/$ gemqs rails test
  gemqs   searching http://rubygems.org on the terms: rails test
    sunspot-rails-tester (0.0.4)                  2,617 downloads     Enable sunspot during testing for *real* integration tests
    rails-test-serving (0.1.4.2)                    669 downloads     Makes unit tests of a Rails application run instantly
    universe-rails-testing (0.1.1)                  579 downloads     gem install universe-rails-testing
    rails-test-toolbox (0.2.0)                      422 downloads     An opinionated list of helpful testing tools for working with Ruby on Rails.

## License 

  MIT-style license. 
  
