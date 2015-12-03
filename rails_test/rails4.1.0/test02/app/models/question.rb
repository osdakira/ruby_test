class Question < ActiveRecord::Base
  has_many :translations, class_name: "QuestionTranslation"
  has_many :answers
end
