require_relative "dry_cleaner.rb"

describe DryCleanning do
  
  before {  @free_days = ["tuesday", "saturday", "sunday"]
            @dr = DryCleanning.new(@free_days,8,17) 
            @hour = 2*60*60
         }
  
   specify 'pick up clothes in the normal schedule today' do
    Time.stub(:now).and_return(Time.mktime(2014,7,10,12))
    expect(@dr.get_ok_time(@hour)).to eq(Time.mktime(2014,7,10,14))
  end
  
  context 'pick up clothes tomorrow' do
    
    specify 'Monday-Thursday -> pick up next day' do 
    Time.stub(:now).and_return(Time.mktime(2014,7,10,16))
    expect(@dr.get_ok_time(@hour)).to eq(Time.mktime(2014,7,11,9))
    end
  
    specify 'Friday -> pick up Monday' do
      Time.stub(:now).and_return(Time.mktime(2014,7,11,16))
      pickup_time = @dr.get_ok_time(@hour)
      expect(pickup_time.hour).to eq(9)
    end
     
    specify 'Today is a free day -> pick up clothes the next free day' do
      Time.stub(:now).and_return(Time.mktime(2014,7,12,16))
      expect(@dr.get_ok_time(@hour)).to eq(Time.mktime(2014,7,14,10))
    end

  end
  
end

