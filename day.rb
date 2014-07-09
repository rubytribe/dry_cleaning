class Day
  attr_accessor :start_time, :end_time, :working
  
  # working requires a boolean
  def initialize(working, start_time = nil, end_time = nil)
    @working = working
    @start_time = start_time
    @end_time = end_time
  end
  
end