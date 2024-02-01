class CreateMenus < ActiveRecord::Migration[7.1]
  def change
    create_table :menus do |t|
      t.references :restaurante, null: false, foreign_key: true
      t.string :week_day
      t.references :product, null: false, foreign_key: true
      t.string :menu_type

      t.timestamps
    end
  end
end
