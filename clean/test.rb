require_relative "DryClean.rb"


describe Order do
  #before {@order = Order.new(8,15,60)}
  
  specify "When pickup is today" do
    Time.stub(:new).and_return(Time.mktime(2014,7,11,12,30))
    order = Order.new(8,15,60)
    expect(order.calculate(true)).to eq([13,30,"Today"])
  end
  
  specify "When pickup is monday, today is friday" do
    Time.stub(:new).and_return(Time.mktime(2014,7,11,14,30))
    order = Order.new(8,15,60)
    expect(order.calculate(false)).to eq([8,30,"Monday"])
  end
  
  specify "When today is closed" do
    Time.stub(:new).and_return(Time.mktime(2014,7,11,14,30))
    $free_days["Friday"]=true
    order = Order.new(8,15,60)
    expect(order.calculate(false)).to eq(["H","M","Closed!!!"])
    $free_days["Friday"]=false
  end
  
  specify "When pickup is tuesday, today is friday, monday is closed" do
    Time.stub(:new).and_return(Time.mktime(2014,7,11,14,30))
    $free_days["Monday"]=true
    order = Order.new(8,15,60)
    expect(order.calculate(false)).to eq([8,30,"Tuesday"])
  end
end


