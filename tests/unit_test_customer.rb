require 'active_record'
require '../controllers/customer'
require './no-rails/test_environment'

class CustomerTest < Test::Unit::TestCase

  def test_customer_work
    assert_equal true, Customer.new.add("Company", "84544C")
  end
  
  def test_customer_wo_code
    assert_equal false, Customer.new.add("Company",nil)
  end

  def test_customer_wo_name
    assert_equal false, Customer.new.add( nil, "404NOP")
  end

end