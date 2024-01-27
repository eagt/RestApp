class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :qty_measurement, precision: 10, scale: 0
      t.string :unit_measurement
      t.text :description
      t.decimal :buying_cost_pck, precision: 10, scale: 0
      t.decimal :buying_cost_unit, precision: 10, scale: 0
      t.decimal :selling_cost_pck, precision: 10, scale: 0
      t.decimal :selling_cost_unit, precision: 10, scale: 0
      t.decimal :production_cost, precision: 10, scale: 0
      t.decimal :qty_to_stock, precision: 10, scale: 0
      t.decimal :qty_in_stock, precision: 10, scale: 0
      t.string :current_stock_value, precision: 10, scale: 0
      t.string :created_by
      t.references :restaurante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
