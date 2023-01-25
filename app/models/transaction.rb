class Transaction < ApplicationRecord
    # def price_computation
    #     price = quantity * stock.price
    # end
 
    belongs_to :user

  
end
