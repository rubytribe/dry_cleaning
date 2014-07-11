require "test/unit"
require_relative "cleanning.rb"


class TestDryCleanning < Test::Unit::TestCase

  def setup
    @dc = DryCleanning.new(8,14)
  end
  
  def test_today
    time = 2*60*60
    today = @dc.today(time).hour
    assert_equal(today, 10)
  end
  
  def test_tomorrow
    time = 2*60*60
    tmr = @dc.tomorrow(time).day
    assert_equal(tmr, 14)
  end
  
  def test_remaining
    time = 2*60*60
    remain = @dc.remaining_hours_tomorrow(time)
    assert_boolean(remain != 0)
  end
  
  def test_check_cleanning_hours
    current_time = Time.now
    hour = @dc.check_cleanning_hours(current_time, 2*60*60).hour
    assert_equal(hour, 13)
  end
  
end