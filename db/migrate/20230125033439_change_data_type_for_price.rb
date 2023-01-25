class ChangeDataTypeForPrice < ActiveRecord::Migration[7.0]
  def change
    change_column(:users, :balance, :float)
    change_column(:stocks, :price, :float)
    change_column(:transactions, :price, :float)
  end
end
