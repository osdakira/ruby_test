class AddSexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bust, :integer
    add_column :users, :waist, :integer
    add_column :users, :hip, :integer
  end
end
