# Scassh

Scassh is a tiny tool, that utilizes the [Scalarium](http://www.scalarium.com/) API to gather information, about clouds and their instances, required to start a SSH session on a single AWS EC2 instance.

You can select the cloud and the desired instance interactively:

    =============================================================

             Scassh - ssh to your Scalarium instance

    =============================================================


    Available Scalarium clouds:
    -----------------------------
      [1]. My Fancy Todo App
      [2]. Google-Clone
      [3]. Next big thing
      [4]. Blog in 5 minutes example
      [5]. Continuous Integration

    --> Please select cloud:
    

One could say that Scassh is the little sibling of [iScale](https://github.com/pixelpogo/iScale), which offers a lot more features, e.g. ssh to a whole bunch of instances based on Scalarium roles.


## Installation

    $ gem install scassh

## Usage

Just invoke 

    $ scassh

Hint: Scassh caches API requests by default in `~/.scalarium_api_cache` to improve speed.

Use the `-n` option if you want to avoid caching.

    $ scassh -n 

Clear the API cache with

    $ scassh -c


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
