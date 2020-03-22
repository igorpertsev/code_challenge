# CodeChallenge

Welcome to my cool gem! Please, include it into your project in order to have easy acces to coding challenge API application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'code_challenge'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install code_challenge

## Usage

Please use `CodeChallenge::Client` class to access API. You can provide you custom url if needed for testing purpose by passing it to client inititalizer like this

```ruby
  CodeChallenge::Client.new('some funky URL')
```

To make api call you can use one of 2 methods `import` and `info`

`Import` method used to upload new data to API server. Data will be uploaded and then parsed in backgroud. Response contains information about request status. It accept 2 parameters, that are file names for zip_to_cbsa file and cbsa_to_msa file respectively.

```ruby
  client = CodeChallenge::Client.new
  client.import('path/to/zip_to_cbsa', 'path/to/cbsa_to_msa')
```

`Info` method used to fetch information for ZIP adress from API. It returns full list of information about specified ZIP if present on server. In other cases it returns empty response values.

```ruby
  client = CodeChallenge::Client.new
  client.info('00501')

  #  => {"cbsa"=>"99999", "name"=>"N/A", "lsad"=>"N/A", "pop_2010"=>"N/A", "pop_2011"=>"N/A", "pop_2012"=>"N/A", "pop_2013"=>"N/A", "pop_2014"=>"N/A", "pop_2015"=>"N/A", "zip"=>"505"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/code_challenge. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
