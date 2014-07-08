require_relative 'dry_cleaning'


describe DryCleaning do
  before {@cleaner = DryCleaning.new}
  
  
  specify 'when pick up time is today' do
    Time.stub(:now).and_return(Time.mktime(2014,7,7,12))
    expect(@cleaner.pickup_time).to eq(Time.mktime(2014,7,7,14))
  end
  
  context 'when pickup time is the next day' do
    specify 'Monday' do
      Time.stub(:now).and_return(Time.mktime(2014,7,7,15))
      expect(@cleaner.pickup_time).to eq(Time.mktime(2014,7,8,9))
    end
    
    specify 'Friday' do
      Time.stub(:now).and_return(Time.mktime(2014,7,11,15))
      expect(@cleaner.pickup_time).to eq(Time.mktime(2014,7,14,9))
    end
    
  end
  
  it 'should change to next month in the last day of the month' do
    Time.stub(:now).and_return(Time.mktime(2014,7,31,15))
    expect(@cleaner.pickup_time).to eq(Time.mktime(2014,8,1,9))
  end
  
  it 'should change to next year in the last day of the year' do
    Time.stub(:now).and_return(Time.mktime(2014,12,31,15))
    expect(@cleaner.pickup_time).to eq(Time.mktime(2015,1,1,9))
  end
  
  context 'when clothes are brought after the end of the program' do
    it 'should add the cleaning time to the opening hour tomorrow' do
      Time.stub(:now).and_return(Time.mktime(2014,7,7,17))
      expect(@cleaner.pickup_time).to eq(Time.mktime(2014,7,8,10))
    end
  end
  
  context 'when clothes are brought before the program starts' do
    it 'should add the cleaning time to the opening hour today' do
      Time.stub(:now).and_return(Time.mktime(2014,7,7,7))
      expect(@cleaner.pickup_time).to eq(Time.mktime(2014,7,7,10))
    end
  end
  
end
