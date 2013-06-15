*ActiveSupport's* `rescue_from` is elegant, but you can use it in Rails controllers only.

This gem makes it available on every Ruby object.

## How to do it?

If you don't want to have additional gem for this, you can do everything manually. You'll have to load *ActiveSupport*
in order to do so.

```ruby
# encoding: utf-8
require "active_support"

class C╯°□°D╯︵┻━┻ < StandardError; end

class Failer
  def throw_table!
    raise C╯°□°D╯︵┻━┻.new "I've had enough of this!"
  end
end

module FailerExceptionHandler
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def with_rescue_block(exception_class, *names, &blk)
      instance_eval do
        rescue_from(exception_class, &blk)
      end

      names.each do |name|
        method = instance_method(name)

        define_method(name) do |*args, &block|
          begin
            method.bind(self).call(*args, &block)
          rescue exception_class => ex
            rescue_with_handler(ex) || raise
          end
        end
      end
    end
  end
end

class Failer
  include ActiveSupport::Rescuable
  include FailerExceptionHandler

  with_rescue_block(C╯°□°D╯︵┻━┻, *instance_methods) do |exception|
    puts "Worker: #{exception.message}\nUniverse: Calm down, dude!"
  end
end

Failer.new.throw_table!
```

## Installation

Add this line to your application's Gemfile:

    gem 'rescue_from_ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rescue_from_ruby

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
