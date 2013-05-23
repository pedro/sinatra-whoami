# Sinatra Whoami

Sinatra extension that adds the original route signature to the `sinatra.route` env so that you can log it for better endpoint-specific metrics, monitoring and alerting.

## Usage

```ruby
class MyApplication < Sinatra::Base
  register Sinatra::Whoami

  after do
    log :route => env["sinatra.route"] # ie "/products/:id/photos"
  end
end
```

## License

Released under the [MIT License](http://www.opensource.org/licenses/MIT).
