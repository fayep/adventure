# Adventure

The intention of this code is to provide a framework which will provide interest for more experienced attendees at
a coding course, and allow me to have new programmers be able to add their own code easily while getting instant gratification.

The course is intended to be several weeks long, start with basic types, move on to arrays and hashes, blocks, loops, conditions
objects, methods, testing with rspec, inheritance, mixins, metaprogramming.

It runs in irb, but I'd like it to be able to be repurposed to any kind of view.

>OH @grepory: Your code is ruby as f**k.

It is.  My challenge will be to keep the magic out of the way of the lessons and just let it do its job.
I would like to have rspec for each lesson so that you can get used to the concept of testing code and get feedback on whether you have
understood the concept being taught.

## Installation

Execute:

    $ bundle

## Usage

Execute:

    $ irb -r bundler/setup -r adventure -r adventure/views/irb
    IRB> Adventure::Game.instance.player.inventory
    IRB> Adventure::Game.instance.player.look

TODO: methods to implement command hierarchy.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/adventure. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

