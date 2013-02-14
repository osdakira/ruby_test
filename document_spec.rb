require './document.rb'

describe Document do
  before :any do
    puts "any"
  end

  before :each do
    @text = "A bunch of words"
    @doc = Document.new( 'test', 'nobody', @text)
  end

  it 'a' do
    @doc.content.should == @text
  end

  it "b" do
    @doc.words.should include('A')
    @doc.words.should include('bunch')
    @doc.words.should include('of')
    @doc.words.should include('words')
  end

  it 'c' do
    @doc.word_count.should == 4
  end
end
