# Sinatra::Jekyll [![Build Status](https://travis-ci.org/theyworkforyou/sinatra-jekyll.svg?branch=master)](https://travis-ci.org/theyworkforyou/sinatra-jekyll)

Use Jekyll to render layouts in Sinatra.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sinatra-jekyll'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-jekyll

## Usage

This module provides a single `render_into_jekyll_layout` method which renders the given content into a Jekyll site layout.

Using this extension in classic style Sinatra apps is as simple as requiring the extension, defining `jekyll_site_path` and using the `render_into_jekyll_layout` method:

```ruby
require 'sinatra'
require 'sinatra/jekyll'

configure do
  set :jekyll_site_path, './my_jekyll_site'
end

get '/' do
  render_into_jekyll_layout '<p class="example">Hello world!</p>'
end
```

Sinatra::Base subclasses need to require and register the module explicitly using the `register` method:

```ruby
require 'sinatra/base'
require 'sinatra/jekyll'

class MyApp < Sinatra::Base
  register Sinatra::JekyllExtension

  configure do
    set :jekyll_site_path, './my_jekyll_site'
  end

  get '/' do
    render_into_jekyll_layout '<p class="example">Hello world!</p>'
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/theyworkforyou/sinatra-jekyll.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
