require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def setup
    Question.delete_all
    Answer.delete_all
    QuestionTranslation.delete_all
    AnswerTranslation.delete_all

    @q = Question.create
    @qt = @q.translations.create
    @a = @q.answers.create
    @at = @a.translations.create
  end

  test "valid test data" do
    assert_equal @q, Question.first
    assert_equal @a, Answer.first
    assert_equal @a.translations, [@at]
  end

  test "#to_a" do
    q_list = Question.includes(:translations, answers: :translations).to_a
    assert q_list.first.answers.first.translations.loaded?
  end

  test "#first" do
    q = Question.includes(:translations, answers: :translations).first
    assert q.answers.first.translations.loaded?
  end
end
