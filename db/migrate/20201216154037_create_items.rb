# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :item_name,            null: false
      t.text :text,                   null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :delivery_burden_id,  null: false
      t.integer :prefecture_id,       null: false
      t.integer :delivery_days_id,    null: false
      t.integer :price,               null: false
      t.timestamps
    end
  end
end
