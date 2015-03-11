class CreateUsersItems < ActiveRecord::Migration
  def change
    create_table :users_items do |t|
      t.references :user, index: true
      t.references :item, index: true

      t.timestamps null: false
    end
    add_foreign_key :users_items, :users
    add_foreign_key :users_items, :items
  end
end
