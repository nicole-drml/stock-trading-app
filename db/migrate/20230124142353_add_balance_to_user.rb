class AddBalanceToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :balance, :decimal, default: 0.00
  end
end
