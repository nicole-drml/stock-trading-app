require 'rails_helper'

RSpec.describe Stock, type: :model do

  client = IEX::Api::Client.new

  it "creates a new stock" do
    msft = client.quote('MSFT')
    msft_info = client.company('MSFT')

    microsoft = Stock.create(symbol: msft.symbol, name: msft_info.company_name, price: msft.latest_price)


    expect(microsoft.symbol).to eq 'MSFT'
    expect(microsoft.name).to eq 'Microsoft Corporation'
  end

  it "creates another stock" do
    amzn = client.quote('AMZN')
    amzn_info = client.company('AMZN')
    amazon = Stock.create(symbol: amzn.symbol, name: amzn_info.company_name, price: amzn.latest_price)

    expect(amazon.symbol).to eq 'AMZN'
    expect(amazon.name).to eq 'Amazon.com Inc.'
  end
end
