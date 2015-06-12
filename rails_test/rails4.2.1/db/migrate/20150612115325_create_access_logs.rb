class CreateAccessLogs < ActiveRecord::Migration
  def change
    create_table :access_logs do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :accessed_at

      t.timestamps null: false
    end
  end
end
