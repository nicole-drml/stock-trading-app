require 'rails_helper'

RSpec.describe Stock, type: :model do
  context 'new stock' do


    it "creates a new stock" do
      client = IEX::Api::Client.new
      msft = client.quote('MSFT')
      msft_info = client.company('MSFT')
      microsoft = Stock.create(symbol: msft.symbol, name: msft_info.company_name, price: msft.latest_price)
      

      expect(msft.latest_price).to_not be_nil
      expect(msft.company_name).to_not be_nil
      expect(microsoft.id).to_not be_nil
    end

    it "creates another stock" do
      client = IEX::Api::Client.new
      amzn = client.quote('AMZN')
      amzn_info = client.company('AMZN')
      amazon = Stock.create(symbol: amzn.symbol, name: amzn_info.company_name, price: amzn.latest_price)

      expect(amzn.latest_price).to_not be_nil
      expect(amzn_info.company_name).to_not be_nil
      expect(amazon.id).to_not be_nil
    end
  end
end
