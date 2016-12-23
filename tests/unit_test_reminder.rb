require 'active_record'
require '../controllers/reminder'
require '../controllers/customer'

require './no-rails/test_environment'

class ReminderTest < Test::Unit::TestCase

  def test_reminder_work
    assert_equal true, Reminder.new.add(1, "Quaterly", Date.new(2017,1,03))
  end
  
  def test_reminder_wo_date
    assert_equal false, Reminder.new.add( 1, "Quaterly", nil)
  end

  def test_reminder_wo_customer_id
    assert_equal false, Reminder.new.add(nil,"Quaterly", Date.new(2017,1,03))
  end

  def test_reminder_wo_rule
    assert_equal false, Reminder.new.add( 1, nil, Date.new(2017,1,03))
  end

  def test_rule_not_accurate
    assert_equal false, Reminder.new.add(1 ,"SomethingStrange", Date.new(2017,1,03))
  end

  def test_id_customer_no_match
    assert_equal false, Reminder.new.add(200 ,"Quaterly", Date.new(2017,1,03))
  end

end