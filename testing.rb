require "test/unit"
require_relative "dry_cleaner.rb"


class TestDryCleanning < Test::Unit::TestCase

  def setup
    free_days = ["tuesday", "saturday", "sunday"]
    @dc = DryCleanning.new(free_days,8,13)
  end
  
  def test_today
    time = 2*60*60
    today = @dc.today(time).hour
    assert_equal(today, 10)
  end
  
  def test_tomorrow
    time = 2*60*60
    tmr = @dc.tomorrow(time).day
    assert_equal(tmr, 12)
  end
  
  def test_remaining
    time = 2*60*60
    remain = @dc.remaining_hours_tomorrow(time)
    assert_boolean(remain != 0)
  end
  
  def test_current_day
    day = 1
    current_day = @dc.current_day(day)
    assert_equal(current_day, "monday")
  end
  
  def test_free_day
    day = Time.now
    free_day = @dc.check_free_day(day)
    assert_boolean(free_day == true)
  end
  
  def test_next_free_days
    day = Time.now
    nr = @dc.nr_next_free_days(day)
    assert_equal(nr, 2)
  end
  
  def test_check_cleanning_hours
    current_time = Time.now
    day = @dc.check_cleanning_hours(current_time, 2*60*60).day
    assert_equal(day, 14)
  end
  
end