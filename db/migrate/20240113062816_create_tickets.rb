class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :buyer_name
      t.integer :quantity
      t.float :total_price
      t.timestamps
    end
  end
end
