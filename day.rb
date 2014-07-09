class Day
  attr_accessor :open, :close, :working
  
  # reuqires a boolean for working
  def initialize(working, open = nil, close = nil)
    @working = working
    @open = open
    @close = close
  end
  
end