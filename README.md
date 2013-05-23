# Sinatra Whoami

Sinatra extension to give routes their own path

## Usage

```ruby
class HelloApp < Sinatra::Base
  register Sinatra::Whoami

  get "/products/:id" do |id|
    log "got #{whoami}" # => got /products/:id
    Product.find(id).to_json
  end
end
```
