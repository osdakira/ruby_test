class CreateAnswerTranslations < ActiveRecord::Migration
  def change
    create_table :answer_translations do |t|
      t.references :answer, index: true

      t.timestamps
    end
  end
end
