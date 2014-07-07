require_relative 'dry_cleaning'


describe DryCleaning do
  before {@cleaner = DryCleaning.new}
  
  
  specify 'when pick up time is today' do
    Time.stub(:now).and_return(Time.mktime(2014,7,7,12))
    expect(@cleaner.pickup_time).to eq(Time.mktime(2014,7,7,14))
  end
  
  specify 'when pick up time is tommorow' do
    Time.stub(:now).and_return(Time.mktime(2014,7,7,15))
    expect(@cleaner.pickup_time).to eq(Time.mktime(2014,7,8,9))
  end
  
  it 'should change to next month in the last day of month' do
    Time.stub(:now).and_return(Time.mktime(2014,7,31,15))
    expect(@cleaner.pickup_time).to eq(Time.mktime(2014,8,1,9))
  end
  
  it 'should change to next year in the last day of the year' do
    Time.stub(:now).and_return(Time.mktime(2014,12,31,15))
    expect(@cleaner.pickup_time).to eq(Time.mktime(2015,1,1,9))
  end
  
end
