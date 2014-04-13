require 'spec_helper'

describe "user_items/show" do
  before(:each) do
    @user_item = assign(:user_item, stub_model(UserItem,
      :user => nil,
      :item => nil,
      :number => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
