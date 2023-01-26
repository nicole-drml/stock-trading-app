class TransactionsController < ApplicationController
    before_create :user_active?, :transaction_price_computation, :user_balance_sufficient?
    
    def new
        @transaction = Transaction.new
    end

    def create
        @transaction = Transaction.new(transaction_params)

        if @transaction.action == "buy"
            user.balance = user.balance - transaction.price
        else
            user.balance = user.balance + transaction.price
        end
    end

    private

    def transaction_params
        params.require(:transaction).permit(:user_id, :action, :stock_id, :quantity, :price )
    end

    def user_active?
        return false if user.status == "pending"
        return true
    end
  
    def transaction_price_computation
        transaction.price ||= transaction.quantity * stock.price
    end

    def user_balance_sufficient?
        return false if user.balance < transaction.price
        return true
    end

end
