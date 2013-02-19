class Person
  def speak(words)
    puts words
  end
end

module Exclaimer
  def speak(words)
    super("#{words}!")
  end
end

class Person
  prepend Exclaimer
end

Person.new.speak("matz") #=> matz!

  # def f1(str: "foo", num: 424242)
  #   [str, num]
  # end

  # def test_f1
  #   assert_equal(["foo", 424242], f1)
  #   assert_equal(["bar", 424242], f1(str: "bar"))
  #   assert_equal(["foo", 111111], f1(num: 111111))
  #   assert_equal(["bar", 111111], f1(str: "bar", num: 111111))
  #   assert_equal(["bar", 111111], f1(num: 111111, str: "bar"))
  #   assert_raise(ArgumentError) { f1(str: "bar", check: true) }
  #   assert_raise(ArgumentError) { f1("string") }
  # end
