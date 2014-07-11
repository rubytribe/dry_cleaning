require_relative "cleanning.rb"

describe DryCleanning do
  
  before { @dr = DryCleanning.new(8,17) 
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
      expect(@dr.get_ok_time(@hour)).to eq(Time.mktime(2014,7,14,9))
    end
    
  end
  
end

