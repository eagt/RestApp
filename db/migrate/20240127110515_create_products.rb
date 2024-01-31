class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :qty_measurement, precision: 10, scale: 1
      t.string :unit_measurement
      t.text :description
      t.string :product_type
      t.integer :buying_cost_pck
      t.integer :selling_cost_unit
      t.integer :buying_cost_unit
      t.integer :selling_cost_pck
      t.integer  :production_cost
      t.integer :qty_to_stock
      t.integer :qty_in_stock
      t.integer :current_stock_value
      t.string :created_by
      t.references :restaurante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
