require "test_helper"

describe Sinatra::Whoami do
  def app
    mock_app {
      register Sinatra::Whoami

      get "/products/:id/photos" do
        env["sinatra.route"]
      end
    }
  end

  it "register a helper with the current route name" do
    get "/products/42/photos"
    last_response.body.must_equal("/products/:id/photos")
  end
end