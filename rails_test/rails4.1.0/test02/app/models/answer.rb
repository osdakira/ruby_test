class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :translations, class_name: "AnswerTranslation"
end
