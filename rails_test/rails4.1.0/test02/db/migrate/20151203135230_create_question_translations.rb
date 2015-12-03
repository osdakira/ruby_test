class CreateQuestionTranslations < ActiveRecord::Migration
  def change
    create_table :question_translations do |t|
      t.references :question, index: true

      t.timestamps
    end
  end
end
