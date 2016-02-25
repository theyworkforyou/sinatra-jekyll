require 'test_helper'

class Sinatra::JekyllTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Sinatra::Jekyll::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
