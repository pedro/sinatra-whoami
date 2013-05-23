# Sinatra Whoami

Sinatra extension to give routes their own path

## Usage

```ruby
class HelloApp < Sinatra::Base
  register Sinatra::Whoami

  get "/products/:id" do |id|
    puts "got request to #{whoami}"
    Product.find(id).to_json
  end
end
```
