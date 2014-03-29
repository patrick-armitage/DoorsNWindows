DoorsNWindows
=============

[![Build Status](https://travis-ci.org/patrick-armitage/DoorsNWindows.svg?branch=master)](https://travis-ci.org/patrick-armitage/DoorsNWindows)
[![Code Climate](https://codeclimate.com/github/patrick-armitage/DoorsNWindows.png)](https://codeclimate.com/github/patrick-armitage/DoorsNWindows)

The [DoorsNWindows.com](https://doorsnwindows.com/) Source Code Repository

[DoorsNWindows.com](https://doorsnwindows.com/) is a [Ruby 2.0.0](http://www.ruby-doc.org/core-2.0.0/) on [Rails 4.0.1](http://api.rubyonrails.org/) application which uses the following:

- Custom authentication/registration inspired by [RailsTutorial](http://ruby.railstutorial.org/chapters/sign-up#top) examples
- [Haml](http://haml.info/) for HTML generation
- [Sass](http://sass-lang.com/) for CSS generation
  * [Bourbon](http://bourbon.io/) for Sass mixins
  * [Bootstrap 2](http://getbootstrap.com/2.3.2/) for framework and base styling
  * [FontAwesome](http://fortawesome.github.io/Font-Awesome/) for Font-based icons
- [CoffeeScript](http://coffeescript.org/) for Javascript generation
- [Simple Form](https://github.com/plataformatec/simple_form/) for form generation
- [PostgreSQL](http://www.postgresql.org/) for the DB backend
- [Redis](http://redis.io/) and [Sidekiq](https://github.com/mperham/sidekiq) for asynchronous background processes (E.G. mailers)
- [Memcached](http://memcached.org/), [Dalli](https://github.com/mperham/dalli) and [Rack Cache](http://rtomayko.github.io/rack-cache/) for database/assets cache store
- [Public Activity](https://github.com/pokonski/public_activity) to track user activities in lead administration
- [Geocoder](http://www.rubygeocoder.com/) for determining location of new leads
- [RSpec 2](http://rspec.info/), [FactoryGirl](https://github.com/thoughtbot/factory_girl) and [Capybara](https://github.com/jnicklas/capybara) for automated testing.
- [Figaro](https://github.com/laserlemon/figaro) for environment variables and sensitive information
- [Rubber](https://github.com/rubber/rubber) and [Capistrano 2](https://github.com/capistrano/capistrano/tree/v2.15.4) for deployment via [Amazon AWS EC2](http://aws.amazon.com/ec2/)

About
-----

DoorsNWindows is a licensed home improvement company located in Greater Los Angeles area.
As a lead-driven small business, DoorsNWindows is leveraging the power and flexibility of
Ruby on Rails to provide clients with a simple way to request quotes and information,
and employees a straightforward and effective way to organize and track the status of leads
that are received.

DoorsNWindows' primary objectives for the web application:
- Present company products, services and offerings in a beautiful and readable format
- Offer visitors and potentials a fast, reliable way to get quotes and information
- Organize and track leads and potentials in a simple format via RESTful services
- Track all employee/user activities in order to maintain clear records for customer service

Contributing
------------

If you make improvements to this application, feel free to contribute to the codebase.

- Fork the project on GitHub.
- Make your feature addition or bug fix.
- Commit with Git.
- Send a pull request to [@patrick-armitage](https://github.com/patrick-armitage).

If you add functionality to this application, create an alternative implementation,
or build an application that is similar, please contact me and I'll add a note to
the README so that others can find your work.