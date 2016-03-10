[![Gem Version](http://img.shields.io/gem/v/creact.svg)](https://rubygems.org/gems/creact)
[![Build Status](https://travis-ci.org/disavowd/creact.svg?branch=master)](https://travis-ci.org/disavowd/creact)
[![Dependency Status](https://gemnasium.com/disavowd/creact.svg)](https://gemnasium.com/disavowd/creact)
# Creact

Creact is designed to seamlessly integrate React with the [cuba](https://github.com/soveran/cuba) microframework, but is ultimately framework agnostic.
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'creact'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install creact

## Usage

Don't. It's alpha!

But if you really want to give it a try...

First, generate the files Creact needs with: 
    
    creact generate

Then navigate to your homepage. You should see 'Hello, World'.

Congratulations - you just integrated React into your Cuba project!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/disavowed/creact.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

