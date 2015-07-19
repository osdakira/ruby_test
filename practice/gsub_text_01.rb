HREF_RE = /<a[^>]+>([^<]+)<\/a>/ix

def pick_url(text)
  text.gsub(HREF_RE) do |a_tag|
    $1
  end
end

class StringWrapper < String
  def gsub(*args, &block)
    to_str.gsub(*args, &block)
  end
end

require 'minitest/unit'
require 'minitest/autorun'
class ATest < MiniTest::Unit::TestCase
  def setup
    @url = 'http://example.com'
    @html = "<a href='#{@url}'>#{@url}</a>"
    @wrapped = StringWrapper.new(@html)
  end

  def test_gsub
    assert_equal @url, pick_url(@html)
  end

  def test_wrapped_gsub
    assert_equal @url, pick_url(@wrapped)
  end

  def test_wrapped_to_str_gsub
    assert_equal @url, pick_url(@wrapped.to_str)
  end
end
