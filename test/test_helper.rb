require "minitest/spec"
require "minitest/autorun"
require "rack/test"
require "sinatra/whoami"

class MiniTest::Unit::TestCase
  include Rack::Test::Methods

  attr_reader :app

  def mock_app(base=Sinatra::Base, &block)
    @app = Sinatra.new(base, &block)
  end
end
