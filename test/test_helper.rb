ENV['RAILS_ENV'] ||= 'test'
require "maxitest/autorun"
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require File.expand_path('../../config/environment', __FILE__)
require File.expand_path('../helpers/auth_helpers', __FILE__)
require File.expand_path('../helpers/request_helpers', __FILE__)
require File.expand_path('../helpers/resource_helpers', __FILE__)

require 'rails/test_help'
require 'spy/integration'

p Rails.env

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  include Helpers::AuthenicationHelpers
  include Helpers::RequestHelpers
  include Helpers::ResourceHelpers
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...

  # Runs assert_difference with a number of conditions and varying difference
  # counts.
  # Code from http://wholemeal.co.nz/blog/2011/04/06/assert-difference-with-multiple-count-values/
  # Call as follows:
  # assert_differences([['Model1.count', 2], ['Model2.count', 3]])
  def assert_differences(expression_array, message = nil, &block)
    b = block.send(:binding)
    before = expression_array.map { |expr| eval(expr[0], b) }

    yield

    expression_array.each_with_index do |pair, i|
      e = pair[0]
      difference = pair[1]
      error = "#{e.inspect} didn't change by #{difference}"
      error = "#{message}\n#{error}" if message
      assert_equal(before[i] + difference, eval(e, b), error)
    end
  end
end
