class CreateUserItems < ActiveRecord::Migration
  def change
    create_table :user_items do |t|
      t.references :user
      t.references :item
      t.integer :number

      t.timestamps
    end
    add_index :user_items, :user_id
    add_index :user_items, :item_id
  end
end
