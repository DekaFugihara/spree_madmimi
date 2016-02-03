# SpreeMadmimi

A Madmimi integration for Spree. It's customized for my application (Retroca) but you are free to use it as a base to your own integration.

For now, it only implements subscription and unsubscription functionality.

Requires the original Madmimi gem: https://github.com/madmimi/madmimi-gem

**About Madmim:** deliver emails, track statistics, and manage your subscriber base with ease.

## Installation

Add these lines to your application's Gemfile:

```ruby
gem 'httparty', :git => 'git://github.com/DekaFugihara/httparty' # requirement for madmimi
gem 'spree_madmimi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spree_madmimi

## Usage

First, Edit and add these lines to your application's config/initializers/env_vars.rb

```ruby
ENV['MAD_EMAIL'] = 'your_madmimi_login@email.com'
ENV['MAD_APIKEY'] = 'y0ur_m4dm1m1_4p1_k3y'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/spree_madmimi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
