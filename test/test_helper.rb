ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
    # returns the full title on a per-page basis
  def full_title(page_title = '')
    base_title = "Learning App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
end
