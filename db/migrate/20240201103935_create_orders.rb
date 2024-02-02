class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :total
      t.references :restaurante, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true
      t.string :order_status

      t.timestamps
    end
  end
end
