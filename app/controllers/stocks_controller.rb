class StocksController < ApplicationController

    def index
        client = IEX::Api::Client.new
        
        @stocks = Stock.all 
        @stocks.each do |stock|
            price = client.quote(stock.symbol)
            stock.update(price:price.latest_price)
        end
        
    end
end
