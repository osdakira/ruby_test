class CreateActionLogs < ActiveRecord::Migration
  def change
    create_table :action_logs do |t|
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
