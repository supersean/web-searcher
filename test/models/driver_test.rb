require "test_helper"

class DriverTest < ActiveSupport::TestCase


  test "driver needs a name" do
    driver = Driver.new
    assert_not driver.save
  end
end

