class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.integer :qty
      t.integer :total
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :item_status

      t.timestamps
    end
  end
end
