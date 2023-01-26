require 'rails_helper'

RSpec.describe Transaction, type: :model do    

  context 'active user' do

    before do
      client = IEX::Api::Client.new
      aapl = client.quote('AAPL')
      aapl_info = client.company('AAPL')

      @stock = Stock.create(symbol: aapl.symbol, name: aapl_info.company_name, price: aapl.latest_price)
    end


    it "is able to buy when user is active" do
      user = User.create(first_name: 'Joe', last_name: 'Terns', email: 'joe@terns.com', password: 'password', status: 'active', balance: 1000)

      if user.status == "active"
        pending_transaction = Transaction.new(user_id: user.id, action: 'buy', stock_id: @stock.id, quantity: 1)
        pending_transaction.price = pending_transaction.quantity * stock.price
        initial_balance = user.balance 

        if user.balance > pending_transaction.price
          transaction = Transaction.create(user_id: user.id, action: 'buy', stock_id: @stock.id, quantity: 1)

          transaction.price = transaction.quantity * stock.price
          user.balance = user.balance - transaction.price
        end
      end

      expect(user.id).to_not be_nil 
      expect(transaction.id).to_not be_nil 
      expect(transaction.user_id).to eq user.id
    end

    it "is able to sell when user is active" do
      user = User.create(first_name: 'Joe', last_name: 'Terns', email: 'joe@terns.com', password: 'password', status: 'active', balance: 1000)

      if user.status == "active"
        pending_transaction = Transaction.new(user_id: user.id, action: 'sell', stock_id: @stock.id, quantity: 1)
        pending_transaction.price = pending_transaction.quantity * stock.price
        initial_balance = user.balance 

        if user.balance > pending_transaction.price
          transaction = Transaction.create(user_id: user.id, action: 'sell', stock_id: @stock.id, quantity: 1)

          transaction.price = transaction.quantity * stock.price
          user.balance = user.balance + transaction.price
        end
      end
     
      expect(user_id).to_not be_nil
      expect(transaction.id).to_not be_nil 
      expect(transaction.user_id).to eq user.id
    end

    it "is not able to buy when user is pending" do
      user = User.create(first_name: 'Joe', last_name: 'Terns', email: 'joe@terns.com', password: 'password', status: 'pending', balance: 1000)
      
      if user.status == "active"
        pending_transaction = Transaction.new(user_id: user.id, action: 'buy', stock_id: @stock.id, quantity: 1)
        pending_transaction.price = pending_transaction.quantity * stock.price
        initial_balance = user.balance 

        if user.balance > pending_transaction.price
          transaction = Transaction.create(user_id: user.id, action: 'buy', stock_id: @stock.id, quantity: 1)

          transaction.price = transaction.quantity * stock.price
          user.balance = user.balance - transaction.price
        end
      end
     
      expect(user_id).to_not be_nil
      expect(transaction.id).to be_nil 
    end

    it "is not able to sell when user is pending" do
      user = User.create(first_name: 'Joe', last_name: 'Terns', email: 'joe@terns.com', password: 'password', status: 'pending', balance: 1000)
      
      if user.status == "active"
        pending_transaction = Transaction.new(user_id: user.id, action: 'buy', stock_id: @stock.id, quantity: 1)
        pending_transaction.price = pending_transaction.quantity * stock.price
        initial_balance = user.balance 

        if user.balance > pending_transaction.price
          transaction = Transaction.create(user_id: user.id, action: 'sell', stock_id: @stock.id, quantity: 1)
          transaction.price = transaction.quantity * stock.price
          user.balance = user.balance + transaction.price
        end
      end
     
      expect(user_id).to_not be_nil
      expect(transaction.id).to be_nil 
    end
  end

  context 'user balance insufficient' do

    before do
      client = IEX::Api::Client.new
      aapl = client.quote('AAPL')
      aapl_info = client.company('AAPL')
      @stock = Stock.create(symbol: aapl.symbol, name: aapl_info.company_name, price: aapl.latest_price)
    end

    it "should be able to buy when balance is sufficient" do
      user = User.create(first_name: 'Joe', last_name: 'Terns', email: 'joe@terns.com', password: 'password', status: 'active', balance: 1000)
      if user.status == "active"
        pending_transaction = Transaction.new(user_id: user.id, action: 'buy', stock_id: @stock.id, quantity: 1)
        pending_transaction.price = pending_transaction.quantity * stock.price
        initial_balance = user.balance 
  
        if user.balance > pending_transaction.price
          transaction = Transaction.create(user_id: user.id, action: 'buy', stock_id: @stock.id, quantity: 1)
          transaction.price = transaction.quantity * stock.price
          user.balance = user.balance - transaction.price
        end
        
      end
  
      expect(user_id).to_not be_nil
      expect(transaction.id).to_not be_nil 
    end

    it "shouldn't be able to buy when balance is insufficient" do
      user = User.create(first_name: 'Joe', last_name: 'Terns', email: 'joe@terns.com', password: 'password', status: 'active', balance: 1000)
  
      client = IEX::Api::Client.new
      aapl = client.quote('AAPL')
      aapl_info = client.company('AAPL')
  
      @stock = Stock.create(symbol: aapl.symbol, name: aapl_info.company_name, price: aapl.latest_price)
  
      if user.status == "active"
  
        pending_transaction = Transaction.new(user_id: user.id, action: 'buy', stock_id: @stock.id, quantity: 100)
        pending_transaction.price = pending_transaction.quantity * stock.price
        initial_balance = user.balance 
  
        if user.balance > pending_transaction.price
          transaction = Transaction.create(user_id: user.id, action: 'buy', stock_id: @stock.id, quantity: 100)
          transaction.price = transaction.quantity * stock.price
          user.balance = user.balance - transaction.price
        end
        
      end
  
      expect(user_id).to_not be_nil
      expect(transaction.id).to be_nil 
    end
  end

  

end
