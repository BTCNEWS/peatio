require 'spec_helper'

describe Market do

  it "should raise argument error on invalid market id" do
    expect { Market.new(id: 'dogecny') }.to raise_error(ArgumentError)
    expect { Market.new(id: 'dogcny') }.not_to raise_error
  end

  context 'visible market' do
    # it { expect(Market.orig_all.count).to eq(2) }
    it { expect(Market.all.count).to eq(1) }
  end

  context 'market attributes' do
    subject { Market.find('btccny') }

    its(:id)          { should == 'btccny' }
    its(:name)        { should == 'BTC/CNY' }
    its(:target_unit) { should == 'btc' }
    its(:price_unit)  { should == 'cny' }
    its(:visible)     { should be_true }
  end
end
