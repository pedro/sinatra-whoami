# Sinatra Whoami

Extension that adds the original route signature to the `sinatra.route` env so that you can log it for better endpoint-specific metrics, monitoring and alerting.

In Sinatra 2.0 this [won't be necessary](https://github.com/sinatra/sinatra/commit/27434c13d4c8050bc80ef748f8657ac6c6545c8c).

## Usage

```ruby
class MyApplication < Sinatra::Base
  register Sinatra::Whoami

  after do
    log route: env["sinatra.route"] # ie "/products/:id/photos"
  end
end
```

## License

Released under the [MIT License](http://www.opensource.org/licenses/MIT).
