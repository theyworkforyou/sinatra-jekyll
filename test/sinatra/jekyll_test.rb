require 'test_helper'

class MockSinatraApp < Sinatra::Base
  register Sinatra::JekyllExtension

  set :jekyll_site_path, 'test/fixtures/jekyll_site'

  get '/' do
    render_into_jekyll_layout 'Hello, world'
  end

  get '/with_options' do
    render_into_jekyll_layout 'Test', layout: 'another', extra_class: 'foo'
  end
end

class Sinatra::JekyllExtensionTest < Minitest::Test
  include Rack::Test::Methods

  def test_that_it_has_a_version_number
    refute_nil ::Sinatra::JekyllExtension::VERSION
  end

  def app
    MockSinatraApp
  end

  def setup
    Jekyll.logger.log_level = :error
  end

  def test_it_exposes_the_jekyll_site
    assert_respond_to app, :jekyll_site
  end

  def test_exposes_jekyll_site_object
    assert_instance_of Jekyll::Site, app.jekyll_site
  end

  def test_rendering_into_jekyll_layout
    get '/'
    assert_equal '<div class="jekyll-layout">Hello, world</div>', last_response.body.strip
  end

  def test_passing_options_to_render_method
    get '/with_options'
    assert_equal '<div class="another-layout foo">Test</div>', last_response.body.strip
  end
end
