class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.bigint :user_id, null: false
      t.string :action, null: false
      t.bigint :stock_id, null: false
      t.integer :quantity, null: false
      t.decimal :price

      t.timestamps
    end
  end
end
