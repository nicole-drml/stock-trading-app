require 'rails_helper'

RSpec.describe Transaction, type: :model do    

  it "is able to buy when user is active" do
    user = User.create(first_name: 'Joe', last_name: 'Terns', email: 'joe@terns.com', password: 'password', status: 'active', balance: 1000)

    client = IEX::Api::Client.new
    aapl = client.quote('AAPL')
    aapl_info = client.company('AAPL')

    stock = Stock.create(symbol: aapl.symbol, name: aapl_info.company_name, price: aapl.latest_price)

    if user.status == "active"
      transaction = Transaction.create(user_id: user.id, action: 'buy', stock_id: stock.id, quantity: 1, price: stock.price)
      
      transaction.price = transaction.quantity * stock.price
      initial_balance = user.balance 
      new_balance = user.balance - transaction.price
      user.balance = new_balance

    end

    expect(user.balance).to eq (initial_balance - transaction.price)
  end


  it "is able to sell when user is active" do
    user = User.create(first_name: 'Joe', last_name: 'Terns', email: 'joe@terns.com', password: 'password', status: 'active', balance: 1000)

    client = IEX::Api::Client.new
    aapl = client.quote('AAPL')
    aapl_info = client.company('AAPL')

    stock = Stock.create(symbol: aapl.symbol, name: aapl_info.company_name, price: aapl.latest_price)

    if user.status == "active"
      transaction = Transaction.create(user_id: user.id, action: 'sell', stock_id: stock.id, quantity: 1, price: stock.price)
      
      transaction.price = transaction.quantity * stock.price
      initial_balance = user.balance 
      new_balance = user.balance + transaction.price
      user.balance = new_balance

    end

    expect(user.balance).to eq (initial_balance + transaction.price)
  end

  it "is shouldn't be able to sell when balance is insufficient" do
    user = User.create(first_name: 'Joe', last_name: 'Terns', email: 'joe@terns.com', password: 'password', status: 'active', balance: 1000)

    client = IEX::Api::Client.new
    aapl = client.quote('AAPL')
    aapl_info = client.company('AAPL')

    stock = Stock.create(symbol: aapl.symbol, name: aapl_info.company_name, price: aapl.latest_price)

    if user.status == "active"
      transaction = Transaction.create(user_id: user.id, action: 'sell', stock_id: stock.id, quantity: 100)
      
      transaction.price = transaction.quantity * stock.price
      initial_balance = user.balance 
      new_balance = user.balance + transaction.price
      user.balance = new_balance

    end

    expect(user.balance).to eq (initial_balance + transaction.price)
  end

  it "subtracts" do 
    old_balance = 100
    quantity = 2
    price = 10
    new_balance = old_balance - (quantity * price)

    expect(new_balance).to eq  80
  end

end
