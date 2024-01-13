class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.float :ticket_price
      t.integer :tickets_threshold

      t.timestamps
    end
  end
end
