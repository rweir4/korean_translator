## This README is incomplete until the gem has officially been registered. This message will be removed when that has been done.

# Installation - on hold

Add this line to your application's Gemfile:

gem 'korean_translator'
And then execute:

$ bundle install

Or install it yourself as:

$ gem install korean_translator

# Usage

The initial intention for this gem was for integration with larger learning applications or for practice alone. The application takes any sentence and replaces individual words that it finds on a basic vocabulary list.

To run on its own, open terminal and run the main file: $ ruby lib/korean_practice.rb

A prompt will appear in the terminal to ask if romanization should be on or off, and then it will ask the user to type in a sentence.

# Versioning
Semantic versioning (http://semver.org/spec/v2.0.0.html) is used.

For a version number MAJOR.MINOR.PATCH, unless MAJOR is 0:

MAJOR version is incremented when incompatible API changes are made,
MINOR version is incremented when functionality is added in a backwards-compatible manner,
PATCH version is incremented when backwards-compatible bug fixes are made.
Major version "zero" (0.y.z) is for initial development. Anything may change at any time. The public API should not be considered stable. Furthermore, version "double-zero" (0.0.x) is not intended for public use, as even minimal functionality is not guaranteed to be implemented yet.

# Dependencies
gimchi,
json

# Contributing
Fork it ( https://github.com///fork )
Create your feature branch (git checkout -b my-new-feature)
Commit your changes (git commit -am 'Add some feature')
Push to the branch (git push origin my-new-feature)
Create a new Pull Request