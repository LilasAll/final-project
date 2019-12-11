# Bootstrap-Slider-Rails

This Gem integrates [Seiyara's fork](https://github.com/seiyria/bootstrap-slider) of [Bootstrap Slider](http://www.eyecon.ro/bootstrap-slider/). The original has no public Github Repo, issues tracking etc.

It integrates this fork with your Rails project and is versioned to track the fork's version.

## Installation

Add this line to your application's Gemfile:

    gem 'bootstrap-slider-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bootstrap-slider-rails

## Usage

This gem uses a Rails Engine to make Bootstrap Slider's assets available to you.

Require the JavaScript files from your `application.js` or wherever needed using:

```
//= require bootstrap-slider
```

Require the CSS files from your `application.scss` or wherever needed using:

```
*= require bootstrap-slider
```

## Gem release

In the case you'd like to create a new release when [seiyria](https://github.com/seiyria) release a new version of his bootstrap-slider library, you just need to run the following:

```
$ ./make_new_release.sh
Ensuring Docker image zedtux/bootstrap-slider-rails exists ...
Updating library code to version 5.3.3 ...
Downlading Bootstrap-slider 5.3.3 ...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 51140  100 51140    0     0   124k      0 --:--:-- --:--:-- --:--:--  124k
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  8238  100  8238    0     0  28698      0 --:--:-- --:--:-- --:--:-- 28703
Done!
Committing new version ...
Releasing gem ...
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
