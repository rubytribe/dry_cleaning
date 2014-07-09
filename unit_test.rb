
require "./dry_cleaning"

describe DryClean do

  specify 'test monday at 14:00' do
    Time.stub(:now).and_return(Time.mktime(2014, 7, 14, 14, 0, 0))
    @dry = DryClean.new(120*60, 10, 18)
    expect(@dry.get_order).to eq(Time.mktime(2014, 7, 14, 14, 0, 0) + 120*60)
  end

  specify 'test monday at 17:00' do
    Time.stub(:now).and_return(Time.mktime(2014, 7, 14, 17, 0, 0))
    @dry = DryClean.new(120*60, 10, 18)
    expect(@dry.get_order).to eq(Time.mktime(2014, 7, 15, 11, 0, 0) )
  end

  specify 'test friday at 17:00 - result on monday' do
    Time.stub(:now).and_return(Time.mktime(2014, 7, 18, 17, 0, 0))
    @dry = DryClean.new(120*60, 10, 18)
    expect(@dry.get_order).to eq(Time.mktime(2014, 7, 21, 11, 0, 0) )
  end

 specify 'test friday at 19:00 - after schedule' do
    Time.stub(:now).and_return(Time.mktime(2014, 7, 18, 19, 0, 0))
    @dry = DryClean.new(120*60, 10, 18)
    expect(@dry.get_order).to eq(nil)
  end

  specify 'test weekend' do
    Time.stub(:now).and_return(Time.mktime(2014, 7, 19, 19, 0, 0))
    @dry = DryClean.new(120*60, 10, 18)
    expect(@dry.get_order).to eq(nil)
  end
end
