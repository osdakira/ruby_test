CONSTANT = "トップの定数だよ"

class Person
  CONSTANT = "内部の定数だよ"
  def top_level_constant
    ::CONSTANT
  end

  def my_class_constant
    CONSTANT
  end
end
